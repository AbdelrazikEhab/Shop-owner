import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shop1/widdget/transaction_list%20view.dart';
import 'package:shop1/widdget/new_transaction.dart';
import 'package:shop1/widdget/chart.dart';
import 'package:shop1/widdget/char_bar.dart';

import 'models/transaction.dart';


void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fast Shop',
      theme: ThemeData(
        primarySwatch: Colors.purple
      ),
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends  StatefulWidget{

  @override
  _Myhomepage createState()=>_Myhomepage();
}

  class _Myhomepage extends State<MyHomePage>{
final  List<transaction>_userTransaction=[];
  List<transaction>get _recentTransactions{
    return _userTransaction.where((tx){
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addnewTransaction(String txtitle,double txamount)
  {
    final newtxt=transaction(
        DateTime.now().toString(),
        txtitle ,
        txamount,
        DateTime.now());
    setState(() {
      _userTransaction.add(newtxt);
    });
  }



void _Addnewtranaction(BuildContext con)
{
  showModalBottomSheet(context: con, builder:(con)  {
    return GestureDetector(
      onTap: (){},
      child: NewTransaction(_addnewTransaction),
    behavior: HitTestBehavior.opaque,
    );
  });
}

void _deleteTransaction(String id)
{
setState(() {
   _userTransaction.removeWhere((element) {
return element.id==id;

   });
});

}

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text('Fast Shop'),
        actions: <Widget>[
          IconButton(onPressed: (){_Addnewtranaction(context);}, icon: Icon(Icons.add,color: Colors.white,))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>
      [
        chart(_recentTransactions),

      Transactionlist(_userTransaction,_deleteTransaction),

        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child:
        Icon(Icons.shopping_cart,),
        backgroundColor: Colors.purple
        ,
        onPressed:(){_Addnewtranaction(context);} ,

      ),
    );
  }



}

//
// Column(children: transactions.map((tx){
//return Card(child: Text(tx.title),);

//
// }).toString(),)