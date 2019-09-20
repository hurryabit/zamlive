import React from 'react';
import User from './User';

type Props = {
  onSubmit: (user: User) => void;
}

type State = {
  name: string;
  password: string;
}

class ExpenseForm extends React.Component<Props, State> {
  constructor(props: Props) {
    super(props);
    this.state = {
      name: '',
      password: ''
    };
  }

  handleUsernameChange = (event: React.ChangeEvent<HTMLInputElement>) => {
    this.setState({name: event.currentTarget.value});
  }

  handlePasswordChange = (event: React.ChangeEvent<HTMLInputElement>) => {
    this.setState({password: event.currentTarget.value});
  }

  handleSubmit = (event: React.FormEvent<HTMLFormElement>) => {
    event.preventDefault();
    let user: User = this.state;
    this.props.onSubmit(user);
  }

  render() {
    return (
      <div className="container">
        <div className="row justify-content-md-center">
          <h1>ZAMLive</h1>
        </div>
        <div className="row justify-content-md-center">
          <form onSubmit={this.handleSubmit}>
            <div className="form-group">
              <label>
                User name
                <input
                  type="text"
                  className="form-control"
                  name="username"
                  placeholder="Enter user name"
                  value={this.state.name}
                  onChange={this.handleUsernameChange}
                />
              </label>
            </div>
            <div className="form-group">
              <label>
                Password
                <input
                  type="password"
                  className="form-control"
                  name="password"
                  placeholder="Password"
                  value={this.state.password}
                  onChange={this.handlePasswordChange}
                />
              </label>
            </div>
            <button type="submit" className="btn btn-primary">Submit</button>
          </form>
        </div>
      </div>
    );
  }
}

export default ExpenseForm;
