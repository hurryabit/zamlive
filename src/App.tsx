import React from 'react';
import LoginScreen from './LoginScreen';
import Main from './Main';
import User from './User';
import 'bootstrap/dist/css/bootstrap.css';
import './App.css';

type Props = {}

type State = {
  user: User | null;
}

class App extends React.Component<Props, State> {
  constructor(props: Props) {
    super(props);

    this.state = {
      user: null
    }
  }

  handleLogin = (user: User) => {
    this.setState({user});
  }

  render() {
    const user = this.state.user;
    if (user) {
      return (
        <Main user={user} />
      );
    } else {
      return <LoginScreen onSubmit={this.handleLogin} />;
    }
  }
}

export default App;
