import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddCar extends StatefulWidget {
//constructor
  AddCar();

  @override
  _AddCarState createState() => _AddCarState();
}

class _AddCarState extends State<AddCar> {
//var
  String _make;
  String _model;
  String _description;
  int _quantity;

  GlobalKey<FormState> _keyForm = new GlobalKey<FormState>(); 

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Car"),
      ),
      body: Form(
        key: _keyForm,
        child: ListView(
          children: [
            Image.asset("Assets/car-shadow.png"),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Make"),
              validator: (String value) {
                if(value.isEmpty){
                  return "Make cannot be empty";
                }else
                return null;
              },    
              onSaved: (String newValue) {
                _make = newValue;
              },
              
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Model"),
                  validator: (String value) {
                if(value.isEmpty){
                  return "Model cannot be empty";
                }else
                return null;
              },
                  onSaved: (String newValue) {
                _model = newValue;
              },
              
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              maxLines: 4,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Description"),
                  validator: (String value) {
                if(value.isEmpty){
                  return "Description cannot be empty";
                }else
                return null;
              },
                  onSaved: (String newValue) {
                _description = newValue;
              },
              
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Quantity"),
                  validator: (String value) {
                if(value.isEmpty || int.parse(value) <  0){
                  return "Quantity cannot be empty or negative";
                }else
                return null;
              },
                  onSaved: (String newValue) {
                _quantity = int.parse(newValue);
              },
              
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  child: Text("Add"),
                  onPressed: (){
                    if(!_keyForm.currentState.validate())
                    return;
                    _keyForm.currentState.save();
                    showDialog(
                      context: context, 
                      builder: (BuildContext context) {
                         return AlertDialog(
                           title: Text("Car Information"),
                           content: Text("Make : " + _make + 
                           "\n Model : " + _model +
                           "\n Description : " + _description +
                           "\n Quantity : " + _quantity.toString()),
                         );
                      },
                      );
                  },
                ),
                RaisedButton( 
                  child: Text("Cancel"),
                  onPressed: () {
                    _keyForm.currentState.reset();
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
