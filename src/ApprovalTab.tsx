import React from 'react';
import User from './User';

type Props = {
  user: User;
}

class ApprovalTab extends React.Component<Props> {
  render() {
    return (
      <h2>Approvals</h2>
    );
  }
}

export default ApprovalTab;
