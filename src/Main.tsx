import React from 'react';
import { Tab, Tabs } from 'react-bootstrap';
import ListTab from './ListTab';
import ApprovalTab from './ApprovalTab';
import CreateTab from './CreateTab';
import User from './User';

type Props = {
  user: User;
}

class Main extends React.Component<Props> {
  render () {
    let user = this.props.user;
    return (
      <Tabs defaultActiveKey='list' id='main'>
        <Tab eventKey='list' title='List Accounts'>
          <ListTab user={user} />
        </Tab>
        <Tab eventKey='create' title='Create Account'>
          <CreateTab user={user} />
        </Tab>
        <Tab eventKey='approve' title='Approvals'>
          <ApprovalTab user={user} />
        </Tab>
      </Tabs>
    );
  }
}

export default Main;
