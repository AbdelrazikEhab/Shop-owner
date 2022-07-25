import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addxt;
NewTransaction(this.addxt);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleControlre=TextEditingController();

  final AmountControlre=TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Card(
      elevation: 5,
      child:Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,

          children: <Widget>[
            TextField(decoration: InputDecoration(labelText:'Title' ),
              // onChanged: (val){titleinout =val;},
              controller: titleControlre,
            ),
            TextField(decoration: InputDecoration(labelText:'Amount' ),
              // onChanged: (val){inoutamount =val;},
              controller: AmountControlre,
            ),
            FlatButton(
              child: Text('Add Transaction'),
              textColor: Colors.purple,
              onPressed:()
              {
                widget.addxt(titleControlre.text,double.parse(AmountControlre.text));
              },
            ),

          ],),),);   }
}


