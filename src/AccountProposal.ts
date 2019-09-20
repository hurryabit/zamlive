import User from './User';

export class AccountProposal {
  templateId: any = {};
  contractId: string = '';
  pendingMembers: User[] = [];
  members: User[] = [];
  name: string = '';

  static fromJson(obj: any): AccountProposal {
    let res: AccountProposal = new AccountProposal();
    res.templateId = obj.templateId;
    res.contractId = obj.contractId;
    res.pendingMembers = obj.pendingMembers;
    res.members = obj.members;
    res.name = obj.name;

    return res;
  }


}
