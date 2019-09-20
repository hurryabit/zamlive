import React from 'react';
import AccountProposal from './AccountProposal';
import Ledger from './Ledger';
import User from './User';

type Props = {
  user: User;
}

type Mode = 'List' | 'Details'

type State = {
  mode: Mode;
  approvals: AccountProposal[];
  plain: string;
}

class ApprovalTab extends React.Component<Props, State> {
  constructor(props: Props) {
    super(props);

    this.state = {
      mode: 'List',
      approvals: [],
      plain: ''
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

  remount() {
    const payload = {"%templates": [{"moduleName": "Main", "entityName": "AccountProposal"}]};
    Ledger.fetch(this.props.user, 'contracts/search', payload)
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
      this.setState({approvals, plain: JSON.stringify(result)});
    })

  }

  componentDidMount() {
    this.remount();
  }

  renderProposals() {
    return (
      <div>
        <h2>Approvals</h2>
        <ul>
          {this.state.approvals.map((proposal, index) =>
            <li key={index}><button onClick={() => this.handleApproveAccountProposal(proposal)}>{proposal.name}</button></li>)}
        </ul>
      </div>
    )
  }

  render() {
    return this.renderProposals();
  }
}

export default ApprovalTab;
