import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shop1/models/transaction.dart';
import 'package:shop1/widdget/char_bar.dart';

// ignore: camel_case_types
class chart extends StatelessWidget
{
late final List<transaction>recentTransactions;
chart(this.recentTransactions);
  List<Map<String,Object>>get groupedTransactionValues{
    return List.generate(7, (index) {
    final weekDay= DateTime.now().subtract(Duration(days: index));
    var totalsum =0.0;
    for(var i=0;i<recentTransactions.length;i++)
      {
        if(recentTransactions[i].date.day==weekDay.day
            &&recentTransactions[i].date.month==weekDay.month
        &&recentTransactions[i].date.year==weekDay.year){

          totalsum+=recentTransactions[i].amount;
        }

      }
    print(DateFormat.E().format(weekDay));

    return {'day':DateFormat.E().format(weekDay).substring(0,1)
      ,'amount':totalsum};
    });
  }
double get totalspending{
    return groupedTransactionValues.fold(0.0,(sum, item){
      return sum + (item['amount']as double);
    });
}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
return Card(
  elevation: 6,
  margin: EdgeInsets.all(20),
  child: Container(
    padding: EdgeInsets.all(10),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: groupedTransactionValues.map((data){
      return Flexible(
        fit: FlexFit.tight,
        child: charbar(
        data['day']as String,
          data['amount']as double,
        totalspending == 0 ? 0 : (data["amount"] as double) / totalspending,
      ),
      );
    }).toList(),



),
  ),

);

  }


}