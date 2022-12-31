import 'package:api_last_demo/view/weather_screen.dart';
import 'package:flutter/material.dart';

class CityScreen extends StatelessWidget {
 final cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search City"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder()
            ),
            controller: cityController,
          ),

          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (_)=> WeatherScreen(cityController.text) ));
          }, child: Text("Search Weather"))
        ],),
      ),
    );
  }
}