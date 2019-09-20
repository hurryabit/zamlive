import React from 'react';
import { Button, Col, Container, FormControl, FormControlProps, Row, Form } from 'react-bootstrap';
import User from "./User";
import Ledger from "./Ledger";

type Props = {
    user: User;
}

type State = {
    name: string;
    members: string[];
}

class CreateTab extends React.Component<Props, State> {

    private users = [
        "Andreas",
        "Bernhard",
        "Darko",
        "Georg",
        "Gerolf",
        "Helena",
        "Jussi",
        "Luciano",
        "Marcin",
        "Martin",
        "Matthias",
        "Moritz",
        "Ognjen",
        "Oliver",
        "Ramona",
        "Ratko",
        "Remy",
        "Robert",
        "Robin",
        "Simon",
        "Soren",
        "Stefano",
        "Thomas",
    ];

    constructor(props: Props) {
        super(props);

        this.state = {
            members: [this.props.user.name],
            name: '',
        };
    }

    handleMembersUpdate = (event: React.ChangeEvent<HTMLSelectElement>) => {
        const options = event.target.options;
        const length = options.length;
        const user = this.props.user.name;
        var members = [];
        for (let i = 0; i < length; i++) {
            if (options[i].selected || options[i].value === user)
                members.push(options[i].value);
        }

        this.setState({members});
    };

    handleNameChange = (event: React.FormEvent<FormControlProps & FormControl>) => {
        this.setState({name: event.currentTarget.value || ''})
    };

    handleSubmit = (event: React.FormEvent<HTMLFormElement>) => {
        event.preventDefault();
        const user = this.props.user.name;
        const pendingMembers = this.state.members.filter((value, _1, _2) => value !== user);

        if (pendingMembers.length === 0) {
            alert('You must specify at least one other member than yourself.');
            return;
        }

        const payload = {
            templateId: {
                moduleName: "Main",
                entityName: "AccountProposal"
            },
            argument: {
                pendingMembers: pendingMembers,
                members: [user],
                name: this.state.name,
            }
        };
        console.log(payload);
        Ledger.fetch(this.props.user, 'command/create', payload)
        .then(() => {
            alert('Account proposal successfully created');
        });
    };


    render() {
        return (
            <Container>
                <Row>
                    <Col>
                        <h1 className='text-center'>Create Account</h1>
                    </Col>
                </Row>
                <Row>
                    <Col>
                    </Col>
                    <Col>
                        <Form onSubmit={this.handleSubmit}>
                            <Form.Group>
                                <Form.Label>Account Name</Form.Label>
                                <Form.Control
                                    type='text'
                                    value={this.state.name}
                                    onChange={this.handleNameChange}
                                />
                            </Form.Group>
                            <Form.Group>
                                <Form.Label>Members</Form.Label>
                                <select
                                    className="form-control"
                                    multiple
                                    value={this.state.members}
                                    onChange={this.handleMembersUpdate}
                                >
                                    {this.users.map((user) =>
                                        <option key={user} value={user}>{user}</option>
                                    )}
                                </select>
                            </Form.Group>
                            <Button type="submit" className='btn-block'>Submit</Button>
                        </Form>
                    </Col>
                    <Col>
                    </Col>
                </Row>
            </Container>
        );
    }
}

export default CreateTab;
