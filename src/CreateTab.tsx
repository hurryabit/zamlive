import React from 'react';
import User from "./User";

type Props = {
    user: User;
}

type State = {
    members: string[];
    name: string;
}

class CreateTab extends React.Component<Props, State> {

    private users = ["martin", "oliver", "remy", "jussi"];

    constructor(props: Props) {
        super(props);

        this.state = {
            members: [this.props.user.name],
            name: "My Awesome Group"
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

        this.setState({members: members});
    };

    handleNameChange = (event: React.ChangeEvent<HTMLInputElement>) => {
        this.setState({name: event.target.value})
    };

    handleSubmit = (event: React.FormEvent<HTMLFormElement>) => {
        event.preventDefault();
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
                        {this.users.map((user) => <option key={user} value={user}>{user}</option>)}
                    </select>
                </label>
                <br/>
                <input type='submit' value='Submit' />
            </form>
        );
    }
}

export default CreateTab;
