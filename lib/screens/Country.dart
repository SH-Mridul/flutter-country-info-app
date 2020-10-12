import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class Country extends StatelessWidget{
  final Map country;
  Country(this.country);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var gridView = GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:2) ,
        children: <Widget> [

           FlipCard(
             direction: FlipDirection.VERTICAL,
             front:  CountryCard('Capital'), 
             back: CountryValueCard(country['capital']),
             ),

          FlipCard(
             direction: FlipDirection.VERTICAL,
             front:  CountryCard('Population'), 
             back: CountryValueCard(country['population'].toString()),
             ),


          FlipCard(
             direction: FlipDirection.VERTICAL,
             front:  CountryCard('Flag'), 
             back: Card(
               color: Colors.white,
                elevation: 10,
                child: Center(
                  child: SvgPicture.network(country['flag'],width: 200,),
                ),
               ),
             ),

          FlipCard(
             direction: FlipDirection.VERTICAL,
             front:  CountryCard('Currency'), 
             back: CountryValueCard(country['currencies'][0]['name']),
             ),


          FlipCard(
             direction: FlipDirection.VERTICAL,
             front:  CountryCard('Show on Map'), 
             back: CountryValueCard('Mridul'),
             ),
          
        ],
       );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(country['name']),
      ),

      body: Container(
        padding: EdgeInsets.all(10),
        child: gridView,
      ),
    );
  }
}




class  CountryCard extends StatelessWidget {
  final String title;
  CountryCard(this.title);

  @override
  Widget build(BuildContext context){

      return Card(
            elevation: 10,
            child: Center(child :Text(title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
          );

  }
  
}



class  CountryValueCard extends StatelessWidget {
  final String value;
  CountryValueCard(this.value);

  @override
  Widget build(BuildContext context){

      return  Card(
               color: Colors.tealAccent,
                elevation: 10,
                child: Center(
                  child: Text(value,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                ),
            );

  }
  
}

