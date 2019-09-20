import React from 'react';
import AccountsList from './AccountsList';
import ApprovalTab from './ApprovalTab';
import CreateTab from './CreateTab';
import './App.css';

type Props = {}

type Mode = 'Accounts' | 'Create' | 'Approvals';

type State = {
  mode: Mode;
}

class App extends React.Component<Props, State> {
  constructor(props: Props) {
    super(props);

    this.state = {
      mode: 'Accounts'
    }
  }

  setMode = (mode: Mode) => {
    this.setState({mode});
  }

  renderAccounts() {
    return <AccountsList payer='Martin' />;
  }

  renderCreate() {
    return <CreateTab />;
  }

  renderApprovals() {
    return <ApprovalTab />;
  }

  render () {
    let body;
    switch (this.state.mode) {
      case 'Accounts':
        body = this.renderAccounts();
        break;
      case 'Create':
        body = this.renderCreate();
        break;
      case 'Approvals':
        body = this.renderApprovals();
        break;
    }
    return (
      <div>
        <h1>ZAMLive</h1>
        <hr />
        <div>
          <button onClick={() => this.setMode('Accounts')}>Accounts</button>
          <button onClick={() => this.setMode('Create')}>Create Account</button>
          <button onClick={() => this.setMode('Approvals')}>Approvals</button>
        </div>
        <hr />
        {body}
      </div>
    );
  }
}

export default App;
