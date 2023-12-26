class WeatherModel {
  String name;

  WeatherModel({
    required this.name,
  });

  factory WeatherModel.frommap({required Map data}) {
    return WeatherModel(
      name: data['name'],
    );
  }
}

int i = 0;