import React from 'react';
import AccountsList from './AccountsList';
import './App.css';

class App extends React.Component {
  render () {
    return (
      <div>
        <h1>ZAMLive</h1>
        <hr />
        <AccountsList payer='Martin'/>
      </div>
    );
  }
}

export default App;
