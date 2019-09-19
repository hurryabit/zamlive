import React from 'react';

type Props = {
  onSubmit: (description: string, amount: number) => void;
}

type State = {
  description: string;
  amount: string;
}

class ExpenseForm extends React.Component<Props, State> {
  constructor(props: Props) {
    super(props);
    this.state = {
      description: '',
      amount: ''
    };
  }

  handleDescriptionChange = (event: React.ChangeEvent<HTMLInputElement>) => {
    this.setState({description: event.currentTarget.value});
  }

  handleAmountChange = (event: React.ChangeEvent<HTMLInputElement>) => {
    this.setState({amount: event.currentTarget.value});
  }

  handleSubmit = (event: React.FormEvent<HTMLFormElement>) => {
    event.preventDefault();

    const amount = Number.parseFloat(this.state.amount);
    if (isNaN(amount)) {
      alert(this.state.amount + ' is not a number');
      return;
    }
    this.props.onSubmit(this.state.description, amount);
  }

  render() {
    return (
      <form onSubmit={this.handleSubmit}>
        <label>
          Description:
          <input type='text' value={this.state.description} onChange={this.handleDescriptionChange} />
        </label>
        <br />
        <label>
          Amount:
          <input type='text' value={this.state.amount} onChange={this.handleAmountChange} />
        </label>
        <br />
        <input type='submit' value='Submit' />
      </form>
    );
  }
}

export default ExpenseForm;
