import 'dart:async';

import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  Timer timer;
  String cityName;

  @override
  void deactivate() {
    super.deactivate();
    if (timer != null) {
      timer.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back_ios, size: 50.0),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  decoration: kTextFieldInputDecoration,
                  style: TextStyle(color: Colors.black),
                  onChanged: (typedCityName) {
                    cityName = typedCityName;
                    if (timer != null) {
                      timer.cancel();
                    }
                    if (typedCityName.length < 3) {
                      return;
                    }

                    timer = Timer(
                      Duration(milliseconds: 1500),
                      () async {
                        Map<String, dynamic> weatherData =
                            await WeatherModel().getCityWeather(typedCityName);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  LocationScreen(locationWeather: weatherData),
                            ));
                      },
                    );
                  },
                ),
              ),
              FlatButton(
                onPressed: () => Navigator.pop(context, cityName),
                child: Text('Get Weather', style: kButtonTextStyle),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
