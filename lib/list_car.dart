import 'package:flutter/material.dart';
import 'package:my_app/book_car.dart';

class ListCar extends StatelessWidget{
  //var
  List<Car> cars = [
          Car("BMW"," Serie 3","Assets/bmw-serie3.jpg", description: "Manhart 5.5L 730hp", quantity: 100),
          Car("Cherry","Tiggo 7","Assets/chery-tiggo7.jpg", description: "3a2ed b7awl elleh", quantity: 12),
          Car("KIA","Sportage","Assets/kia-sportage.jpg", description: "AKA SUV", quantity: 8),
          Car("Peugeot","208","Assets/peugeot-208.jpg", description: "GTI Edition - stage 1 290 hp", quantity: 19),
        ];

  //Constructor
  ListCar();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("Car Agency"),
        ),
        body: ListView.builder (
          itemBuilder: (BuildContext context, int index) {
          return CarView(cars[index]._make, cars[index]._model, cars[index]._image, description: cars[index].description, quantity: cars[index].quantity);
          },
          itemCount: cars.length,
          ),
        );
  }

}

//..
class CarView extends StatelessWidget {  
  //var
  String _make;
  String _model;
  String _image;
  String description;
  int quantity;

  CarView(this._make, this._model, this._image, {this.description, this.quantity});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card (
      child: InkWell(
          onTap: () {
            print(_make + " " + _model);
            Navigator.push(context, MaterialPageRoute(
              builder: (BuildContext context) {
                return BookCar(_image, _make, _model, description, quantity);
              },
            ));

          },//BookCar("Assets/bmw-serie3.jpg", "BMW", "Serie 3", "This car is already taken.", 30)
          child: Row (
          children: [

            Image.asset(this._image, width: 170,),
            Container(
                child: Column(
                children: [
                    Text(this._make),
                    Text(this._model),
              ],
              ),
            margin: EdgeInsets.fromLTRB(50, 0, 0, 0),
            )


        ],
        ),
      ),
      );

  }

}
//..
class Car {
//var
  String _make;
  String _model;
  String _image;
  String description;
  int quantity;

  Car(this._make, this._model, this._image, {this.description, this.quantity});


}