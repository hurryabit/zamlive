export class ExpenseNotification {
  templateId: any = {};
  contractId: string = '';
  approver: string = '';
  description: string = '';
  payer: string = '';
  beneficiaries: string[] = [];
  amount: number = 0.0;

  static fromJson(obj: any): ExpenseNotification {
    let res: ExpenseNotification = new ExpenseNotification
    res.templateId = obj.templateId;
    res.contractId = obj.contractId;
    res.approver = obj.argument.approver;
    res.description = obj.argument.expense.description;
    res.payer = obj.argument.expense.payer;
    res.beneficiaries = obj.argument.expense.beneficiaries;
    res.amount = obj.argument.expense.amount;

    return res;
  }
}

export default ExpenseNotification;
