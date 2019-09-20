import React from 'react';
import { Button, Col, Container, Form, FormControl, FormControlProps, Row } from 'react-bootstrap';

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

  handleDescriptionChange = (event: React.FormEvent<FormControlProps & FormControl>) => {
    this.setState({description: event.currentTarget.value || ''});
  }

  handleAmountChange = (event: React.FormEvent<FormControlProps & FormControl>) => {
    this.setState({amount: event.currentTarget.value || ''});
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
      <Container>
        <Row>
          <Col></Col>
          <Col>
            <Form onSubmit={this.handleSubmit}>
              <Form.Group>
                <Form.Label>Description</Form.Label>
                <Form.Control
                  type='text'
                  value={this.state.description}
                  onChange={this.handleDescriptionChange}
                />
              </Form.Group>
              <Form.Group>
                <Form.Label>Amount</Form.Label>
                <Form.Control
                  type='text'
                  value={this.state.amount}
                  onChange={this.handleAmountChange}
                />
              </Form.Group>
              <Button type="submit" className='btn-block'>Submit</Button>
            </Form>
          </Col>
          <Col></Col>
        </Row>
      </Container>
    );
  }
}

export default ExpenseForm;
