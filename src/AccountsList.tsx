import React from 'react';
import {Account} from './Account';
import ExpenseForm from './ExpenseForm';
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

class AccountsList extends React.Component<Props, State> {
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
    const body = {"%templates": [{"moduleName": "Main", "entityName": "Account"}]};
    fetch('contracts/search', {
        body: JSON.stringify(body),
        headers: {
          'Authorization': 'Bearer ' + this.props.user.password,
          'Content-type': 'application/json'
        },
        method: 'post',
    })
    .then((response) => {
      if (!response.ok) {
        throw new Error(response.statusText);
      }
      return response.json()
    })
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

    const body = {
      templateId: account.templateId,
      contractId: account.contractId,
      choice: 'SubmitExpense',
      argument: { description, payer, amount }
    };
    fetch('command/exercise', {
        body: JSON.stringify(body),
        headers: {
          'Authorization': 'Bearer ' + this.props.user.password,
          'Content-type': 'application/json'
        },
        method: 'post',
    })
    .then((response) => {
      if (!response.ok) {
        throw new Error(response.statusText + '\n' + JSON.stringify(response));
      }
      return response.json()
    })
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

export default AccountsList;
