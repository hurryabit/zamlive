import React from 'react';
import User from "./User";

type Props = {
    user: User;
}

class CreateTab extends React.Component<Props> {

    private users = ["Martin", "Oliver", "Remy", "Jussi"];

    render() {
        return (
            <div>
                <h2>Create Account</h2>
                <select multiple={true}>
                    {(this.users).filter((user, _1, _2) => user !== this.props.user.name).map((user) => <option value ={user}>{user}</option>)}
                </select>
            </div>
        );
    }
}

export default CreateTab;
