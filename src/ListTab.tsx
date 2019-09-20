import React from 'react';
import { Accordion, Card, Container, ListGroup, Row, Table } from 'react-bootstrap';
import Account from './Account';
import ExpenseForm from './ExpenseForm';
import Ledger from './Ledger';
import User from './User';

type Props = {
  user: User;
}

type Mode = 'List' | 'Details';

type State = {
  mode: Mode;
  accounts: Account[];
  selected: number | null;
  plain: string;
}

class ListTab extends React.Component<Props, State> {
  constructor(props: Props) {
    super(props);

    this.state = {
      mode: 'List',
      accounts: [],
      selected: null,
      plain: ''
    };
  }

  getAccount(): Account {
    const {accounts, selected} = this.state;
    if (selected === null) {
      throw new Error("Nodaccount selected");
    }
    return accounts[selected];
  }

  componentDidMount() {
    const payload = {"%templates": [{"moduleName": "Main", "entityName": "Account"}]};
    Ledger.fetch(this.props.user, 'contracts/search', payload)
    .then(({result}) => {
      let accounts: Account[] = [];
      for (let workflow of result) {
        for (let account of workflow.activeContracts) {
          accounts.push(Account.fromJson(account));
        }
      }
      this.setState({accounts, plain: JSON.stringify(result)});
    })
  }

  handleAddExpense = (description: string, amount: number) => {
    const account = this.getAccount();
    const payer = this.props.user.name;

    const payload = {
      templateId: account.templateId,
      contractId: account.contractId,
      choice: 'SubmitExpense',
      argument: { description, payer, amount }
    };
    Ledger.fetch(this.props.user, 'command/exercise', payload)
    .then(() => {
      alert('Expense successfully submitted');

      this.setState({mode: 'Details'});
    });
  };

  showList = () => {
    this.setState({mode: 'List', selected: null});
  }

  showDetails(index: number) {
    this.setState({mode: 'Details', selected: index});
  }

  renderList() {
    return (
      <Container>
        <Row className="justify-content-md-center">
          <h2>{this.state.accounts.length > 0 ? 'All Accounts' : 'No Accounts'}</h2>
        </Row>
        <Row className="justify-content-md-center">
          <ListGroup>
            {/* <ListGroup.Item>All Accounts</ListGroup.Item> */}
            {this.state.accounts.map((account, index) =>
              <ListGroup.Item onClick={() => this.showDetails(index)}>{account.name}</ListGroup.Item>
            )}
          </ListGroup>
        </Row>
      </Container>
    );
  }

  renderDetails() {
    const account = this.getAccount();
    return (
      <React.Fragment>
        <h1>Account {account.name}</h1>
        <Accordion defaultActiveKey="balance">
          <Card>
            <Accordion.Toggle as={Card.Header} eventKey="balance">
              Balances
            </Accordion.Toggle>
            <Accordion.Collapse eventKey="balance">
              <Card.Body>
                <Table>
                  <thead className='text-center'>
                    <tr>
                      <th scope='col'>Member</th>
                      <th>Balance</th>
                    </tr>
                  </thead>
                  <tbody>
                    {account.balance.map(([member, amount]) =>
                      <tr>
                        <td>{member}</td>
                        <td className='text-right'>{amount}</td>
                      </tr>
                    )}
                  </tbody>
                </Table>
              </Card.Body>
            </Accordion.Collapse>
          </Card>
          <Card>
              <Accordion.Toggle as={Card.Header} eventKey="add">
                Submit Expense
              </Accordion.Toggle>
            <Accordion.Collapse eventKey="add">
              <Card.Body>
                <ExpenseForm onSubmit={this.handleAddExpense} />
              </Card.Body>
            </Accordion.Collapse>
          </Card>
          <Card>
            <Accordion.Toggle as={Card.Header} eventKey='back' onClick={this.showList}>
              Back
            </Accordion.Toggle>
          </Card>
        </Accordion>
      </React.Fragment>
    );
  }

  render () {
    switch (this.state.mode) {
      case 'List':
        return this.renderList();
      case 'Details':
        return this.renderDetails();
    }
  }
}

export default ListTab;
