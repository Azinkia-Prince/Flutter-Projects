import 'package:flutter/material.dart';
import 'package:flutter_weather_bg_null_safety/bg/weather_bg.dart';
import 'package:flutter_weather_bg_null_safety/flutter_weather_bg.dart';
import 'package:weather_api/api%20integration/helper/weatherHelper.dart';
import 'package:weather_api/api%20integration/model/weatherModel.dart';
import 'package:weather_api/components/functions.dart';
import 'package:intl/intl.dart';

class background extends StatelessWidget {
  background({super.key, required this.searchText});
  var searchText;
  weatherClass weatherObj = weatherClass();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: weatherObj.fetchWeather(searchText,context),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          WeatherModel? weatherData = snapshot.data;
          return Stack(
            alignment: Alignment.topCenter,
            children: [
              WeatherBg(
                  weatherType: WeatherType.heavyRainy,
                  width: MediaQuery.of(context).size.width,
                  height: 300),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.all(10),
                    height: 70,
                    width: 180,
                    decoration: BoxDecoration(
                        color:
                            Color.fromARGB(255, 176, 235, 250).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(7)),
                    child: Column(
                      children: [
                        customText(weatherData!.location!.name.toString(),
                            fontWd: FontWeight.bold,
                            fontSz: 20,
                            color: Colors.white),
                            SizedBox(height: 7,),
                        
                        customText(
                              DateFormat('EEEE, MMMM d, y').format(DateTime.parse(
                                  weatherData!.current!.lastUpdated
                                      .toString())),
                              color: Colors.white,fontSz: 15,fontWd: FontWeight.bold),
                        
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 330,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.network('https:' +
                            weatherData.current!.condition!.icon.toString()),
                        Container(
                          width: 100,
                          height: 80,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  customText(
                                      weatherData!.current!.tempC!
                                          .round()
                                          .toString(),
                                      fontSz: 40,
                                      fontWd: FontWeight.bold,
                                      color: Colors.redAccent),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 25, left: 3),
                                    child: customText('O',
                                        color: Colors.redAccent,
                                        fontWd: FontWeight.bold,
                                        fontSz: 10),
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 12),
                                child: customText(
                                    weatherData!.current!.condition!.text
                                        .toString(),
                                    fontSz: 12,
                                    color: Colors.redAccent),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
                    width: 330,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blueGrey.withOpacity(0.3)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            customText("Feels Like"),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: customText(weatherData!.current!.feelslikeC!.round().toString()),
                            ),
                            customText('Humidity'),
                            Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: customText(weatherData!.current!.humidity!.toString()+' %'),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            customText("Wind"),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: customText(weatherData!.current!.windKph.toString()+' Km/H'),
                            ),
                            customText('Visibility'),
                            Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: customText(weatherData!.current!.visKm!.toString()+' Km')
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],

              ),

            ],
          );
        }
        else if (snapshot.hasError){
          print('Location Not Found');
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
