import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_api/api%20integration/helper/weatherHelper.dart';
import 'package:weather_api/api%20integration/model/weatherModel.dart';
import 'package:weather_api/components/functions.dart';

class dailyUpdate extends StatelessWidget {
  dailyUpdate({super.key, required this.searchText});
  String searchText;
  weatherClass weatherObj = weatherClass();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: weatherObj.fetchWeather(searchText,context),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          WeatherModel? dailyUpdate = snapshot.data;
          return ListView.builder(
            shrinkWrap: true,
              itemCount: dailyUpdate!.forecast!.forecastday!.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: Color.fromARGB(255, 65, 65, 64),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 50,
                          child: Image.network(
                            'https:' +
                                dailyUpdate!.forecast!.forecastday![index].day!
                                    .condition!.icon
                                    .toString(),
                            width: 50,
                          ),
                        ),
                        Container(
                          width: 85,
                          child: customText(
                              DateFormat('EEE, MMMM d').format(DateTime.parse(
                                  dailyUpdate.forecast!.forecastday![index].date
                                      .toString())),
                              color: Colors.white),
                        ),
                        Container(
                          width: 120,
                          child: customText(
                              dailyUpdate.forecast!.forecastday![index].day!
                                  .condition!.text
                                  .toString(),
                              color: Colors.white),
                        ),
                        Container(
                          width: 60,
                          child: customText(
                              dailyUpdate.forecast!.forecastday![index].day!
                                      .maxtempC!
                                      .round()
                                      .toString() +
                                  ' / ' +
                                  dailyUpdate.forecast!.forecastday![index].day!
                                      .mintempC!
                                      .round()
                                      .toString(),
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                );
              });
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
