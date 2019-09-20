import React from 'react';
import { Accordion, Button, Card, Col, Container, Row, Table } from 'react-bootstrap';
import AccountProposal from './AccountProposal';
import ExpenseNotification from './ExpenseNotification';
import Ledger from './Ledger';
import User from './User';

type Props = {
  user: User;
}

type State = {
  accountApprovals: AccountProposal[];
  expensesToApprove: ExpenseNotification[];
}

class ApprovalTab extends React.Component<Props, State> {
  constructor(props: Props) {
    super(props);

    this.state = {
      accountApprovals: [],
      expensesToApprove: []
    };
  }

  handleApproveAccountProposal = (proposal: AccountProposal) => {
    const acceptingMember = this.props.user.name
    const payload = {
      templateId: proposal.templateId,
      contractId: proposal.contractId,
      choice: 'Accept',
      argument: { acceptingMember }
    };
    Ledger.fetch(this.props.user, 'command/exercise', payload)
    .then(() => {
      alert('Account proposal successfully approved')
      this.remount()
    })
  }

  handleApproveExpense = (expenseNotification: ExpenseNotification) => {
    const approver = this.props.user.name
    const payload = {
      templateId: expenseNotification.templateId,
      contractId: expenseNotification.contractId,
      choice: 'Sign',
      argument: { approver }
    };
    Ledger.fetch(this.props.user, 'command/exercise', payload)
    .then(() => {
      alert('Expense successfully approved')
      this.remount()
    })
  }

  remount() {
    // Fetch accounts to approve
    const fetchAccountProposals = {"%templates": [{"moduleName": "Main", "entityName": "AccountProposal"}]};
    Ledger.fetch(this.props.user, 'contracts/search', fetchAccountProposals)
    .then(({result}) => {
      let approvals: AccountProposal[] = [];
      for (let workflow of result) {
        for (let proposal of workflow.activeContracts) {
          let accountProposal: AccountProposal = AccountProposal.fromJson(proposal);
          if (accountProposal.pendingMembers.includes(this.props.user.name)) {
            approvals.push(accountProposal);
          }
        }
      }
      this.setState({accountApprovals: approvals});
    })

    // Fetch expenses to approve
    const fetchExpenses = {"%templates": [{"moduleName": "Main", "entityName": "ExpenseNotification"}]};
    Ledger.fetch(this.props.user, 'contracts/search', fetchExpenses)
    .then(({result}) => {
      let expenseNotifications: ExpenseNotification[] = [];
      for (let workflow of result) {
        for (let expenseToApprove of workflow.activeContracts) {
          let expenseNotification: ExpenseNotification = ExpenseNotification.fromJson(expenseToApprove);
          if (expenseNotification.approver === this.props.user.name) {
            expenseNotifications.push(expenseNotification);
          }
        }
      }
      this.setState({expensesToApprove: expenseNotifications});
    })
  }

  componentDidMount() {
    this.remount();
  }

  renderProposals() {
    return (
      <Container>
        <Row>
          <Col>
            <h1 className='text-center'>Pending Approvals</h1>
          </Col>
        </Row>
        <Row>
          <Col>
            <Accordion defaultActiveKey="expenses">
              <Card>
                <Accordion.Toggle as={Card.Header} eventKey="expenses">
                  Expense Approvals
                </Accordion.Toggle>
                <Accordion.Collapse eventKey="expenses">
                  <Card.Body>
                    <Container>
                      <Row>
                        <Col>
                          <Table>
                            <thead className='text-center'>
                              <tr>
                                <th scope='col'>Account</th>
                                <th scope='col'>Description</th>
                                <th scope='col'>Payer</th>
                                <th scope='col'>Amount</th>
                                <th></th>
                              </tr>
                            </thead>
                            <tbody>
                              {this.state.expensesToApprove.map((expenseNotification) =>
                                <tr>
                                  <td className='align-middle'>{expenseNotification.accountName}</td>
                                  <td className='align-middle'>{expenseNotification.description}</td>
                                  <td className='align-middle'>{expenseNotification.payer}</td>
                                  <td className='align-middle text-right'>{expenseNotification.amount}</td>
                                  <td>
                                    <Button
                                      className='btn-block'
                                      onClick={() => this.handleApproveExpense(expenseNotification)}
                                    >
                                      Approve
                                    </Button>
                                  </td>
                                </tr>)}
                            </tbody>
                          </Table>
                        </Col>
                      </Row>
                    </Container>
                  </Card.Body>
                </Accordion.Collapse>
              </Card>
              <Card>
                <Accordion.Toggle as={Card.Header} eventKey="accounts">
                  Account Approvals
                </Accordion.Toggle>
                <Accordion.Collapse eventKey="accounts">
                  <Card.Body>
                    <Container>
                      <Row>
                        <Col>
                          <ul>
                            {this.state.accountApprovals.map((proposal, index) =>
                              <li key={index}><button onClick={() => this.handleApproveAccountProposal(proposal)}>{proposal.name}</button></li>)}
                          </ul>
                        </Col>
                      </Row>
                    </Container>
                  </Card.Body>
                </Accordion.Collapse>
              </Card>
            </Accordion>
          </Col>
        </Row>
      </Container>
    )
  }

  render() {
    return this.renderProposals();
  }
}

export default ApprovalTab;
