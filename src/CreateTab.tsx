import React from 'react';
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

    private users = ["Martin", "Oliver", "Remy", "Jussi"];

    constructor(props: Props) {
        super(props);

        this.state = {
            members: [this.props.user.name],
            name: "My Awesome Group",
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

    handleNameChange = (event: React.ChangeEvent<HTMLInputElement>) => {
        this.setState({name: event.target.value, status: 'Unknown'})
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
            <form onSubmit={this.handleSubmit}>
                <h2>Create Account</h2>
                <label>Group Name
                    <input type='text' value={this.state.name}
                           onChange={this.handleNameChange}/>
                </label>
                <br/>
                <label>Group Members
                    <select multiple={true} value={this.state.members}
                            onChange={this.handleMembersUpdate}>
                        {this.users.map((user) => <option key={user}
                                                          value={user}>{user}</option>)}
                    </select>
                </label>
                <br/>
                <input type='submit' value='Submit'/>
                <br/><br/>
                {
                    (this.state.status === 'Ok') ?
                        <div style={{color:"green", fontWeight: "bold"}}>Account Proposal created successfully</div> :
                        (this.state.status === 'Fail') ?
                            <div style={{color:"red", fontWeight: "bold"}}>Account Proposal creation fails</div> :
                            <div/>
                }
            </form>
        );
    }
}

export default CreateTab;
