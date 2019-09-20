import React from 'react';
import { Button, Col, Container, FormControl, FormControlProps, Row, Form } from 'react-bootstrap';
import User from "./User";
import Ledger from "./Ledger";

type Props = {
    user: User;
}

type Status = 'Ok' | 'Fail' | 'Unknown'

type State = {
    members: string[];
    name: string;
    status: Status;
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
            status: 'Unknown',
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

        this.setState({members: members, status: 'Unknown'});
    };

    handleNameChange = (event: React.FormEvent<FormControlProps & FormControl>) => {
        this.setState({name: event.currentTarget.value || '', status: 'Unknown'})
    };

    handleSubmit = (event: React.FormEvent<HTMLFormElement>) => {
        event.preventDefault();
        const user = this.props.user.name;
        const payload = {
            templateId: {
                moduleName: "Main",
                entityName: "AccountProposal"
            },
            argument: {
                pendingMembers:
                    this.state.members.filter((value, _1, _2) => value !== user),
                members: [user],
                name: this.state.name,
            }
        };
        console.log(payload);
        Ledger.fetch(this.props.user, 'command/create', payload).then(
            x => {
                console.log(x)
                this.setState({status: 'Ok'})},
            _ => this.setState({status: 'Fail'})
        )
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
                            <br/><br/>
                            {
                                (this.state.status === 'Ok') ?
                                    <div style={{color:"green", fontWeight: "bold"}}>Account Proposal created successfully</div> :
                                    (this.state.status === 'Fail') ?
                                        <div style={{color:"red", fontWeight: "bold"}}>Account Proposal creation fails</div> :
                                        <div/>
                            }
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
