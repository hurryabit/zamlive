import React from 'react';
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
          if (expenseNotification.approver == this.props.user.name) {
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
      <div>
        <h2>Approvals</h2>
        <h4>Accounts</h4>
        <ul>
          {this.state.accountApprovals.map((proposal, index) =>
            <li key={index}><button onClick={() => this.handleApproveAccountProposal(proposal)}>{proposal.name}</button></li>)}
        </ul>
        <h4>Expenses</h4>
        <table>
          <tr><th>Amount</th><th>Payer</th><th>Purpose</th></tr>
          {this.state.expensesToApprove.map((expenseNotification, index) =>
            <tr><td>{expenseNotification.amount}</td><td>{expenseNotification.payer}</td><td><button onClick={() => this.handleApproveExpense(expenseNotification)}>{expenseNotification.description}</button></td></tr>)}
        </table>
      </div>
    )
  }

  render() {
    return this.renderProposals();
  }
}

export default ApprovalTab;
