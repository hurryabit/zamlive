export class ExpenseNotification {
  templateId: any = {};
  contractId: string = '';
  approver: string = '';
  description: string = '';
  payer: string = '';
  beneficiaries: string[] = [];
  amount: number = 0.0;
  accountName: string = '';

  static fromJson(obj: any): ExpenseNotification {
    let res: ExpenseNotification = new ExpenseNotification()
    res.templateId = obj.templateId;
    res.contractId = obj.contractId;
    res.approver = obj.argument.approver;
    console.log(obj.argument.expense)
    res.description = obj.argument.expense.description;
    res.payer = obj.argument.expense.payer;
    res.beneficiaries = obj.argument.expense.beneficiaries;
    res.amount = obj.argument.expense.amount;
    res.accountName = obj.argument.expense.account._2;

    return res;
  }
}

export default ExpenseNotification;
