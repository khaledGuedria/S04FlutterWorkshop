import 'package:flutter/material.dart';

class BookCar extends StatefulWidget {

  //var
  String _make;
  String _model;
  String _image;
  String _description;
  int _quantity;

  //constructor
  BookCar(this._image, this._make, this._model, this._description, this._quantity);

  @override
  _BookCarState createState() => _BookCarState();
}

class _BookCarState extends State<BookCar> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Car Booking"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(this.widget._image),
          SizedBox(
            height: 10,
          ),

          Text("Model :" + this.widget._make + " " + this.widget._model),
          SizedBox(
            height: 10,
          ),

          Text("Description : "),
          Text(this.widget._description),
          SizedBox(
            height: 10,
          ),

          Text("Quantity : " + this.widget._quantity.toString()),
          SizedBox(
            height: 10,
          ),

          Center(
            child: FlatButton(
              child: Text("Book this Car"),
              onPressed: () {
                setState(() {
                  widget._quantity--;
                });
              },
              ),
          )

      ],),
    );
  }
}