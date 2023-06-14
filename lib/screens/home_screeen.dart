import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:rest_api_test/controllers/home_cubit.dart';
import 'package:rest_api_test/controllers/home_state.dart';

import 'package:rest_api_test/widgets/current_widget.dart';
import 'package:rest_api_test/widgets/days_widget.dart';
import 'package:rest_api_test/widgets/search_wideits.dart';
import '../constant/colors.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => ApiCubit()..getData(),
        child: BlocConsumer<ApiCubit, HomeState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              body: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: AppColor.rainGradent,
                  ),
                ),
                child: Obx(
                  () => ApiCubit.get(context).loadData.value
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                                flex: 2,
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                        'images/ImagSerch.jpg',
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(25),
                                      bottomRight: Radius.circular(25),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(child: SearchBox()),
                                    ],
                                  ),
                                )),
                            Row(
                              children: [
                                Text(
                                  "Today : ${ApiCubit.get(context).myData!.list[0].dtTxt.year} / ${ApiCubit.get(context).myData!.list[0].dtTxt.month} / ${ApiCubit.get(context).myData!.list[0].dtTxt.day}  ${ApiCubit.get(context).myData!.list[0].dtTxt.hour} : ${ApiCubit.get(context).myData!.list[0].dtTxt.second}",
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                                flex: 3,
                                child: Center(
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                            color: Color.fromARGB(
                                                    255, 91, 207, 220)
                                                .withOpacity(.2),
                                            child: CurrentWeather(
                                                data: ApiCubit.get(context)
                                                    .myData)),
                                      ],
                                    ),
                                  ),
                                )),
                            Row(
                              children: [
                                Text(
                                  "5 Day Later : ",
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ],
                            ),
                            // const Spacer(),
                            Expanded(
                                flex: 2,
                                child: Container(
                                    color: Color.fromARGB(255, 91, 207, 220)
                                        .withOpacity(.2),
                                    child: DaysWeather(
                                        data: ApiCubit.get(context).myData))),
                            // const SizedBox(
                            //   height: 20.0,
                            // ),
                          ],
                        ),
                ),
              ),
            );
          },
        ));
  }
}
