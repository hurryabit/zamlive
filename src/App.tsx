import React from 'react';
import AccountsList from './AccountsList';
import ApprovalTab from './ApprovalTab';
import CreateTab from './CreateTab';
import User from './User';
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

  renderAccounts(user: User) {
    return <AccountsList user={user} />;
  }

  renderCreate() {
    return <CreateTab />;
  }

  renderApprovals(user: User) {
    return <ApprovalTab user={user} />;
  }

  render () {
    let user = {
      name: 'Martin',
      password: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJsZWRnZXJJZCI6InphbWxpdmUiLCJhcHBsaWNhdGlvbklkIjoiemFtbGl2ZSIsInBhcnR5IjoiTWFydGluIn0.uYdP2MNhOcw-zYF-_tOxZygqQldhRBgX0rCTfUgZ4A4'
    }
    let body;
    switch (this.state.mode) {
      case 'Accounts':
        body = this.renderAccounts(user);
        break;
      case 'Create':
        body = this.renderCreate();
        break;
      case 'Approvals':
        body = this.renderApprovals(user);
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
