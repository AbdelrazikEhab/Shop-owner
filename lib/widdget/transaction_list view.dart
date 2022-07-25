import 'dart:developer';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shop1/models/transaction.dart';

class Transactionlist extends StatelessWidget {

  final List<transaction>transactions;
  final Function deletedx;

  Transactionlist(this.transactions,this.deletedx);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 482,
      child:
      transactions.isEmpty?Column(children: <Widget>[
        Text(
          'No Transactions Added yet!',
        style: TextStyle(color: Colors.purple,fontSize: 20,fontWeight:FontWeight.bold),
        ),
         SizedBox(
           height: 10,
         ),
         Container(
           height: 200,
            child:Image(image:AssetImage('assets/images/rr.png'),fit: BoxFit.cover,),
            )
      ],
      ) :
      ListView.builder(
     itemBuilder: (ctx, index)
     {
       return Card(
         margin: EdgeInsets.symmetric(vertical: 8,horizontal: 5),
        child: ListTile(
          leading:CircleAvatar(
         radius: 30,
         child:Padding(
           padding: EdgeInsets.all(10),
        child: FittedBox(
          child:
          Text('\$${transactions[index].amount}'
          ),
         ),
       ),
       ),

           title: Text(transactions[index].title,
             style: Theme.of(context).textTheme.titleLarge,),
         subtitle: Text(DateFormat.yMMMd().format(transactions[index].date)
         ),
          trailing:  IconButton(icon: Icon(Icons.delete),
            color: Colors.red,
            onPressed:()=>deletedx(transactions[index].id),),
         ),

       );
     },
        itemCount: transactions.length,
        ),
      );
  }
}

