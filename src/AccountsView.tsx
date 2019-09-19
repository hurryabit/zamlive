import React from 'react';
import logo from './logo.svg';
import './App.css';

type AppProps = {}

type AppState = {
  result: string;
}

class AccountsView extends React.Component<AppProps, AppState> {
  constructor(props: AppProps) {
    super(props);

    this.state = {
      result: ''
    };
  }

  componentDidMount() {
    const body = {"%templates": [{"moduleName": "Main", "entityName": "Account"}]};
    fetch('contracts/search', {
        body: JSON.stringify(body),
        headers: {
          'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJsZWRnZXJJZCI6InphbWxpdmUiLCJhcHBsaWNhdGlvbklkIjoiemFtbGl2ZSIsInBhcnR5IjoiTWFydGluIn0.uYdP2MNhOcw-zYF-_tOxZygqQldhRBgX0rCTfUgZ4A4',
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

export default AccountsView;
