/*
{
  "agreementText": "",
  "key": {
    "_1": [
      "Martin",
      "Oliver",
      "Remy"
    ],
    "_2": "TSG40"
  },
  "contractId": "#2:1",
  "templateId": {
    "packageId": "f345299983336528ce1e7b44cf50bba4aca6f834a94edf73030c600d10a21c5d",
    "moduleName": "Main",
    "entityName": "Account"
  },
  "witnessParties": [
    "Martin"
  ],
  "argument": {
    "balance": {
      "textMap": {
        "Martin": "0.0",
        "Oliver": "0.0",
        "Remy": "0.0"
      }
    },
    "name": "TSG40"
  }
}
*/

export class Account {
  templateId: any = {};
  contractId: string = '';
  key: any = {};
  name: string = '';
  balance: [string, number][] = [];

  static fromJson(obj: any): Account {
    let res: Account = new Account();
    res.templateId = obj.templateId;
    res.contractId = obj.contractId;
    res.key = obj.key;
    res.name = obj.argument.name;

    const textMap = obj.argument.balance.textMap;
    for (let member in textMap) {
      res.balance.push([member, textMap[member]]);
    }

    return res;
  }
}

export default Account;
