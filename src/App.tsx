import React from 'react';
import logo from './logo.svg';
import './App.css';

type AppProps = {}

type AppState = {
  result: string;
}

class App extends React.Component<AppProps, AppState> {
  constructor(props: AppProps) {
    super(props);

    this.state = {
      result: ''
    };
  }

  componentDidMount() {
    const body = {"%templates": [{"moduleName": "Simplified", "entityName": "Expense"}]};
    fetch('contracts/search', {
        body: JSON.stringify(body),
        headers: {
          'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJsZWRnZXJJZCI6InphbWxpdmUiLCJhcHBsaWNhdGlvbklkIjoiemFtbGl2ZSIsInBhcnR5IjoiQWxpY2UifQ.agRMcyhpDBE7rxs5dzlDQIdl6F9qBLAryt8sKvlj_ek',
          'Content-type': 'application/json'
        },
        method: 'post',
    })
    .then((response) => {
      if (!response.ok) {
        throw new Error(response.statusText);
      }
      return response.json()
    })
    .then(({result}) => {
      this.setState({result: JSON.stringify(result)});
    })
    .catch((error) => {
      alert('Failure!\n' + error);
    });
  }

  render () {
    return (
      <p>{this.state.result}</p>
    );
  }
}

export default App;
