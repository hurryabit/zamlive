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

  handleDescriptionChange = (event: React.ChangeEvent<HTMLInputElement>) => {
    this.setState({name: event.currentTarget.value});
  }

  handleAmountChange = (event: React.ChangeEvent<HTMLInputElement>) => {
    this.setState({password: event.currentTarget.value});
  }

  handleSubmit = (event: React.FormEvent<HTMLFormElement>) => {
    event.preventDefault();
    let user: User = this.state;
    this.props.onSubmit(user);
  }

  render() {
    return (
      <form onSubmit={this.handleSubmit}>
        <label>
          User:
          <input type='text' name='username' value={this.state.name} onChange={this.handleDescriptionChange} />
        </label>
        <br />
        <label>
          Password:
          <input type='password' name='password' value={this.state.password} onChange={this.handleAmountChange} />
        </label>
        <br />
        <input type='submit' value='Submit' />
      </form>
    );
  }
}

export default ExpenseForm;
