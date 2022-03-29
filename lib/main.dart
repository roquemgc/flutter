import 'package:flutter/material.dart';
import 'package:bank_app/model/checking_account.dart';
import 'package:bank_app/model/savings_account.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  CheckingAccount checkingAccount = CheckingAccount(500);
  SavingAccount savingAccount = SavingAccount(100, '25');

  int checkingAccountBalance = 500;
  int savingAccountBalance = 100;

  void addValueToCheckingAccount(int addedValueToBalance) {
    try {

      if (addedValueToBalance > 8000) throw 'Não pode ser mais de 8000';

      checkingAccount.setBalance(checkingAccountBalance + addedValueToBalance);

      setState(() {
        checkingAccountBalance += addedValueToBalance;
      });
    } on Exception catch(e) {
      print(e);
    }
  }
  void addValueToSavingAccount(int addedValueToBalance) {
    try {

      if (addedValueToBalance < 50) throw 'Não pode ser menos de 50';

      savingAccount.setBalance(savingAccountBalance + addedValueToBalance);

      setState(() {
        savingAccountBalance += addedValueToBalance;
      });
    } on Exception catch(e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {

    TextEditingController checkingAccountBalanceController = TextEditingController();
    TextEditingController savingAccountBalanceController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Conta corrente: $checkingAccountBalance',
            ),
            TextField(
              controller: checkingAccountBalanceController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: () { addValueToCheckingAccount(int.parse(checkingAccountBalanceController.text)); },
              child: const Text('Adicionar Conta Corrente'),
            ),
            Text(
              'Conta poupança: $savingAccountBalance',
            ),
            TextField(
              controller: savingAccountBalanceController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: () { addValueToSavingAccount(int.parse(savingAccountBalanceController.text)); },
              child: const Text('Adicionar Conta Poupança'),
            ),
          ],
        ),
      ),
    );
  }
}
