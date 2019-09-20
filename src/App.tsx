import React from 'react';
import Main from './Main';
import User from './User';
import './App.css';

class App extends React.Component {
  render() {
    let user: User = {
      name: 'Martin',
      password: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJsZWRnZXJJZCI6InphbWxpdmUiLCJhcHBsaWNhdGlvbklkIjoiemFtbGl2ZSIsInBhcnR5IjoiTWFydGluIn0.uYdP2MNhOcw-zYF-_tOxZygqQldhRBgX0rCTfUgZ4A4'
    }

    return (
      <Main user={user} />
    );
  }
}

export default App;
