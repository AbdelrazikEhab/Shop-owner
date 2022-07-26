import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop1/widdget/char_bar.dart';

class charbar extends StatelessWidget{
  final String label;
  final double spendingAmount;
  final double spendingTotal;


  charbar(this.label, this.spendingAmount, this.spendingTotal);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
return Column(children: <Widget>[
  Text('\$${spendingAmount.toStringAsFixed(0)}'),
  SizedBox(height:4,),
  Container(
    height: 60,
    width: 10,
    child: Stack(children: <Widget>[
      Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey,width: 1.0),
          color: Color.fromRGBO(220, 220, 220, 1),
          borderRadius:BorderRadius.circular(10) ,
    ),

      ),
      FractionallySizedBox(heightFactor: spendingTotal,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
        ),
      ),
      )


    ],),
  ),
  SizedBox(height: 4,),
  Text(label),

],);

  }
  
  
  
  
}