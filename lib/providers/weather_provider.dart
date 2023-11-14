import 'package:hooks_riverpod/hooks_riverpod.dart';

enum City {
  stockholm,
  paris,
  tokyo,
}

typedef CityWeather = String;
const unKnownWeather = 'not found';
//
Future<CityWeather> getWeather(City city) {
  return Future.delayed(
    const Duration(seconds: 1),
    () =>
        {
          City.stockholm: 'Sunny',
          City.paris: 'Rainy',
          City.tokyo: 'Windy',
        }[city] ??
        'not found!',
  );
}

//Ui writes to and and reads from this
final currentCityProvider = StateProvider<City?>(
  (ref) => null,
);

//UI reads this one
final weatherProvider = FutureProvider<CityWeather?>((ref) {
  final city = ref.watch(currentCityProvider);
  if (city != null) {
    return getWeather(city);
  } else {
    return unKnownWeather;
  }
});
