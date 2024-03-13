/*
author : Aiden Lowe
*/

class WeatherData {
  final double temperature;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int humidity;
  final double windSpeed;
  final int windDeg;
  final double? rain1h;
  final int clouds;
  final String mainWeather;
  final String description;
  final String iconCode;

  WeatherData({
    required this.temperature,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
    required this.windSpeed,
    required this.windDeg,
    required this.rain1h,
    required this.clouds,
    required this.mainWeather,
    required this.description,
    required this.iconCode,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      temperature: json['main']['temp'].toDouble(),
      feelsLike: json['main']['feels_like'].toDouble(),
      tempMin: json['main']['temp_min'].toDouble(),
      tempMax: json['main']['temp_max'].toDouble(),
      pressure: json['main']['pressure'],
      humidity: json['main']['humidity'],
      windSpeed: json['wind']['speed'].toDouble(),
      windDeg: json['wind']['deg'],
      rain1h: json['rain'] != null && json['rain']['1h'] != null
          ? json['rain']['1h'].toDouble()
          : null,
      clouds: json['clouds']['all'],
      mainWeather: json['weather'][0]['main'],
      description: json['weather'][0]['description'],
      iconCode: json['weather'][0]['icon'],
    );
  }
}
/*
  Column buildColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextField(
          controller: _controller,
          decoration: const InputDecoration(hintText: 'Enter Title'),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              //remove api key, put in secret
              _futureAlbum = fetchWeatherData("apiKey", 44.34, 10.99);
            });
          },
          child: const Text('Create Data'),
        ),
      ],
    );
  }

---

weatherData =
        fetchWeatherData("", 44.34, 10.99);
    /*String? secretKey =
        Platform.environment['WEATHER_API_KEY']; //this is the problem??
    if (secretKey != null) {
      print('GitHub secret value: $secretKey');
      // Now you can use the secretKey in your code
    } else {
      print('GitHub secret not found');
    }*/
*/

