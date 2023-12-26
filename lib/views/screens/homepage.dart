import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../contoller/provider/weather_provider.dart';
import '../../models/weather_model.dart';
import '../../utils/helpers.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late Future<WeatherModel?> weatherdata;

  @override
  void initState() {
    super.initState();
    weatherdata = APIHelper.apiHelper.fetchweather();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: FutureBuilder(
        future: Provider.of<WeatherProvider>(context)
            .Weatherdata(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("ERROR : ${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            WeatherModel? weatherdata = snapshot.data;
            return (weatherdata == null)
                ? const Center(
              child: Text("No Data avilable"),
            )
                : Center(
              child: Text(
                "${weatherdata.name}",
                style: const TextStyle(
                  fontSize: 30,
                ),
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
