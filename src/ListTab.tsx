import React from 'react';
import Account from './Account';
import ExpenseForm from './ExpenseForm';
import Ledger from './Ledger';
import User from './User';

type Props = {
  user: User;
}

type Mode = 'List' | 'Details' | 'Add';

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
  }

  showList() {
    this.setState({mode: 'List', selected: null});
  }

  showDetails(index: number) {
    this.setState({mode: 'Details', selected: index});
  }

  showAdd() {
    this.setState({mode: 'Add'});
  }

  renderList() {
    return (
      <div>
        <h2>Accounts</h2>
        <ul>
          {this.state.accounts.map((account, index) => <li key={index}><button onClick={() => this.showDetails(index)}>{account.name}</button></li>)}
        </ul>
      </div>
    );
  }

  renderDetails() {
    const account = this.getAccount();
    return (
      <div>
        <button onClick={() => this.showList()}>Back</button>
        <h2>Account {account.name}</h2>
        <ul>
          {account.balance.map(([member, amount]) => <li key={member}>{member}: {amount}</li>)}
        </ul>
        <button onClick={() => this.showAdd()}>Add expense</button>
      </div>
    );
  }

  renderAdd() {
    const account = this.getAccount();
    return (
      <div>
        <button onClick={() => this.showList()}>Back</button>
        <h2>Add expense to {account.name}</h2>
        <ExpenseForm onSubmit={this.handleAddExpense} />
      </div>
    );
  }

  render () {
    switch (this.state.mode) {
      case 'List':
        return this.renderList();
      case 'Details':
        return this.renderDetails();
      case 'Add':
        return this.renderAdd();
    }
  }
}

export default ListTab;
