import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rest_api_test/models/data_model.dart';
import '../constant/api_key.dart';
import 'home_state.dart';

class ApiCubit extends Cubit<HomeState> {
  ApiCubit() : super(HomeInitialState());

  static ApiCubit get(context) => BlocProvider.of(context);

  DataApi? myData;
  var loadData = false.obs;
  String city = "Sanaa";

  getHomes(String searchCity) async {
    city = searchCity;
    String apiUrl =
        "https://api.openweathermap.org/data/2.5/forecast?q=$city&exclude=hourly,daily&appid=${ApiKey.key}";
    var url = Uri.parse(apiUrl);
    //var responses;
    var client = http.Client();
    try {
      var responses = await client.get(url);
      emit(GetServiceWeather());
      return responses;
    } catch (e) {
      return http.Response('Error', 408);
    }
  }

  // checkConnectInternet() async {
  //   final connectivityResult = await (Connectivity().checkConnectivity());
  //   if (connectivityResult == ConnectivityResult.none) {
  //     return false;
  //   } else {
  //     return true;
  //   }
  // }

  getData() async {
    loadData.value = true;
    var response = await getHomes(city);

    if (response.statusCode == 200) {
      myData = dataApiFromJson(response.body);
      emit(SearchCityWeather());
    }
    loadData.value = false;
  }
}
