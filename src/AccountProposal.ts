export class AccountProposal {
  templateId: any = {};
  contractId: string = '';
  name: string = '';
  pendingMembers: string[] = [];
  members: string[] = [];

  static fromJson(obj: any): AccountProposal {
    let res: AccountProposal = new AccountProposal();
    res.templateId = obj.templateId;
    res.contractId = obj.contractId;
    res.pendingMembers = obj.argument.pendingMembers;
    res.members = obj.argument.members;
    res.name = obj.argument.name;

    return res;
  }
}

export default AccountProposal;
