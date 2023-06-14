import 'package:flutter/material.dart';

import 'package:rest_api_test/controllers/home_cubit.dart';

class SearchBox extends StatefulWidget {
  @override
  State<SearchBox> createState() => _searchBoxState();
}

class _searchBoxState extends State<SearchBox> {
  final _searchControler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    ApiCubit.get(context).myData!.city.name,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 54, 52, 120),
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                ],
              ),
              Row(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: TextField(
                        controller: _searchControler,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.black),
                        decoration: const InputDecoration(
                          fillColor: Color.fromARGB(98, 255, 255, 255),
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            bottomLeft: Radius.circular(30),
                          )),
                        ),
                        onSubmitted: (value) {},
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      ApiCubit.get(context).city = _searchControler.text;
                      ApiCubit.get(context).getData();
                    },
                    child: Container(
                      height: 50,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 44, 123, 213),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                        child: Text(
                          "Search",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
