import User from './User';

class Ledger {
  static fetch(user: User, method: string, payload: any): Promise<any> {
    const result = fetch(method, {
        body: JSON.stringify(payload),
        headers: {
          'Authorization': 'Bearer ' + user.password,
          'Content-type': 'application/json'
        },
        method: 'post',
    })
    .then((response) => {
      if (!response.ok) {
        throw new Error(response.statusText);
      }
      return response.json()
    });
    return result;
  }

}

export default Ledger;
