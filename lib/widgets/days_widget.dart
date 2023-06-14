import 'package:flutter/material.dart';
import 'package:rest_api_test/models/data_model.dart';

class DaysWeather extends StatefulWidget {
  const DaysWeather({
    Key? key,
    this.data,
  }) : super(key: key);
  final DataApi? data;

  @override
  State<DaysWeather> createState() => _DaysWeatherState();
}

class _DaysWeatherState extends State<DaysWeather> {
  var position = [0, 8, 16, 24, 32];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return item(widget.data, position[index]);
      },
    );
  }

  Widget item(DataApi? data, int index) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Container(
            color: Color.fromARGB(255, 67, 58, 227),
            child: Column(
              children: [
                Text(
                  data!.list[index].dtTxt.day.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Image.network(
                  "https://openweathermap.org/img/wn/${data!.list[index].weather[0].icon}@2x.png",
                  width: 120,
                  height: 120,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "${(data.list[index].main.temp - 273.15).toStringAsFixed(2)} C",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
