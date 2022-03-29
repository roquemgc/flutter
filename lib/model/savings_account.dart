import 'package:bank_app/model/account.dart';

class SavingAccount extends Account {
  String incomeOfTheLastMonth = '';

  SavingAccount(int balance, String incomeOfTheLastMonth): super (balance);

  String getIncomeOfTheLastMonth() {
    return incomeOfTheLastMonth;
  }

  void setIncomeOfTheLastMonth(String incomeOfTheLastMonth) {
    this.incomeOfTheLastMonth = incomeOfTheLastMonth;
  }
}
