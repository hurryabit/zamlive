import React from 'react';
import ListTab from './ListTab';
import ApprovalTab from './ApprovalTab';
import CreateTab from './CreateTab';
import User from './User';

type Props = {
  user: User;
}

type Mode = 'Accounts' | 'Create' | 'Approvals';

type State = {
  mode: Mode;
}

class Main extends React.Component<Props, State> {
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
    return <ListTab user={user} />;
  }

  renderCreate(user: User) {
    return <CreateTab user={user}/>;
  }

  renderApprovals(user: User) {
    return <ApprovalTab user={user} />;
  }

  render () {
    let user = this.props.user;
    let body;
    switch (this.state.mode) {
      case 'Accounts':
        body = this.renderAccounts(user);
        break;
      case 'Create':
        body = this.renderCreate(user);
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

export default Main;
