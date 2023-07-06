import 'package:flutter/material.dart';
import 'package:flutter_weather_bg_null_safety/flutter_weather_bg.dart';
import 'package:intl/intl.dart';
import 'package:weather_api/api%20integration/helper/weatherHelper.dart';
import 'package:weather_api/api%20integration/model/weatherModel.dart';
import 'package:weather_api/components/functions.dart';

class hourlyUpdate extends StatelessWidget {
  hourlyUpdate({super.key,required this.searchText});
  final String searchText;
  weatherClass weatherObj = weatherClass();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      child: FutureBuilder(
        future: weatherObj.fetchWeather(searchText,context),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            WeatherModel? weatherHourlyUpdate = snapshot.data;
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: weatherHourlyUpdate!.forecast!.forecastday![0].hour!.length,
              itemBuilder: (context, index) {
                return Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  color: Color.fromARGB(255, 65, 65, 64),
                  elevation: 5,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    width: 80,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            customText(weatherHourlyUpdate.forecast!.forecastday![0].hour![index].tempC!.round().toString(),color: Colors.white,fontSz: 13,fontWd: FontWeight.bold),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10,left: 2),
                              child: customText('O',fontSz: 7,color: Colors.white),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5,bottom: 7),
                          child: CircleAvatar(
                            backgroundColor: Color.fromARGB(255, 41, 85, 128),
                            radius: 18,
                            child: Image.network('https:'+weatherHourlyUpdate.forecast!.forecastday ![0].hour ![index].condition!.icon.toString(),width: 25,),
                          ),
                        ),
                        customText(DateFormat('h:mm a').format(DateTime.parse(weatherHourlyUpdate.forecast!.forecastday![0].hour![index].time.toString())),color: Colors.white,fontSz: 10),
                        
                              
                      ],
                    ),
                  ),
                );
              },
            );
          }
          return Center(child: CircularProgressIndicator(),);
        },
      ),
    );
  }
}