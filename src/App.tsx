import React from 'react';
import logo from './logo.svg';
import './App.css';



class App extends React.Component {
  handleClick = () => {
    const body = {"%templates": [{"moduleName": "Simplified", "entityName": "Expense"}]};
    fetch('contracts/search', {
        body: JSON.stringify(body),
        headers: {
          'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJsZWRnZXJJZCI6InphbWxpdmUiLCJhcHBsaWNhdGlvbklkIjoiemFtbGl2ZSIsInBhcnR5IjoiQWxpY2UifQ.agRMcyhpDBE7rxs5dzlDQIdl6F9qBLAryt8sKvlj_ek',
          'Content-type': 'application/json'
        },
        method: 'post',
    })
    .then((response) => response.json())
    .then((data) => {
      alert('Success!\n' + JSON.stringify(data));
    })
    .catch((error) => {
      alert('Failure!\n' + error);
    });
  }

  render () {
    return (
      <div className="App">
        <header className="App-header">
          <img src={logo} className="App-logo" alt="logo" />
          <p>
            Edit <code>src/App.tsx</code> and save to reload.
          </p>
          <a
            className="App-link"
            href="https://reactjs.org"
            target="_blank"
            rel="noopener noreferrer"
          >
            Learn React
          </a>
          <button onClick={this.handleClick}>Click me!</button>
        </header>
      </div>
    );
  }
}

export default App;
