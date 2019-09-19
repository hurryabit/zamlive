import React from 'react';
import AccountsView from './AccountsView';
import './App.css';

class App extends React.Component {
  render () {
    return (
      <div>
        <h1>ZAMLive</h1>
        <hr />
        <AccountsView />
      </div>
    );
  }
}

export default App;
