import React from 'react';
import { Button, Container, Form, FormControl, FormControlProps, Row } from 'react-bootstrap';
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

  handleUsernameChange = (event: React.FormEvent<FormControlProps & FormControl>) => {
    this.setState({name: event.currentTarget.value || ''});
  }

  handlePasswordChange = (event: React.FormEvent<FormControlProps & FormControl>) => {
    this.setState({password: event.currentTarget.value || ''});
  }

  handleSubmit = (event: React.FormEvent<HTMLFormElement>) => {
    event.preventDefault();
    let user: User = this.state;
    this.props.onSubmit(user);
  }

  render() {
    return (
      <Container>
        <Row className="justify-content-md-center">
          <h1>ZAMLive</h1>
        </Row>
        <Row className="justify-content-md-center">
          <Form onSubmit={this.handleSubmit}>
            <Form.Group>
              <Form.Label>User Name</Form.Label>
              <Form.Control
                type="text"
                name="username"
                placeholder="User Name"
                value={this.state.name}
                onChange={this.handleUsernameChange}
              />
            </Form.Group>
            <Form.Group>
              <Form.Label>Password</Form.Label>
              <Form.Control
                type="password"
                name="password"
                placeholder="Password"
                value={this.state.password}
                onChange={this.handlePasswordChange}
              />
            </Form.Group>
            <Button type="submit" className="btn btn-primary">Log In</Button>
          </Form>
        </Row>
      </Container>
    );
  }
}

export default ExpenseForm;
