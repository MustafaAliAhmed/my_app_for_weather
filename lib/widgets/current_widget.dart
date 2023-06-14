import 'dart:core';
import 'package:flutter/material.dart';

import '../models/data_model.dart';

class CurrentWeather extends StatefulWidget {
  const CurrentWeather({super.key, this.data});
  final DataApi? data;
  @override
  State<CurrentWeather> createState() => _CurrentWeatherState();
}

class _CurrentWeatherState extends State<CurrentWeather> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.data!.city.country,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                '\\  ${widget.data!.city.name}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
          Image.network(
            "https://openweathermap.org/img/wn/${widget.data!.list[0].weather[0].icon}@2x.png",
            width: 120,
            height: 120,
          ),
          Text(
            "Humidity  % ${widget.data!.list[0].main.humidity}",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            "${(widget.data!.list[0].main.temp - 273.15).toStringAsFixed(2)} C",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w500,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "MinTemp :${(widget.data!.list[0].main.tempMin - 273.15).toStringAsFixed(2)}",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                "MaxTemp :${(widget.data!.list[0].main.tempMax - 273.15).toStringAsFixed(2)}",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
