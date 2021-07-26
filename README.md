# recruitment_challenge (Weather App)

Project created for recruitment process.
Unfortunatelly whole project is made without any commit.

## Description

HomePage is a PageView with 3 views:

 - home - showing weather info in current location
 - cities - showing list of all available cities to weather check. List has search feature added. On city pressed WeatherInfo page is shown, where You can add/remove city from favorites.
 - favorites - showing list of dissmissible cities marked as favorite. Favorite list is stored locally using Hive. On swipe we can delete city from favorites. On pressed WeatherInfo page is shown with same features like above.

## Features

 - polish/english language support [ready to be extended]
 - global feature to change weather info units [metric/imperial]
 - dynamic search feature
 - add/remove city from favorites
 - favorites stored locally

 ### Stack


 - <a href="https://openweathermap.org">WeatherAPi</a>
 --------------------------
 - <a href="https://pub.dev/packages/injectable">injetable</a>
 - <a href="https://pub.dev/packages/equatable">equatable</a>
 - <a href="https://pub.dev/packages/dartz">dartz</a>
 - <a href="https://pub.dev/packages/get_it">get_it</a>
 - <a href="https://pub.dev/packages/flutter_bloc">flutter_bloc</a>
 --------------------------
 - <a href="https://pub.dev/packages/intl">intl</a>
 - <a href="https://pub.dev/packages/intl_utils">intl_utils</a>
 --------------------------
 - <a href="https://pub.dev/packages/retrofit">retrofit</a>
 - <a href="https://pub.dev/packages/dio">dio</a>
 --------------------------
 - <a href="https://pub.dev/packages/geolocator">geolocator</a>
 - <a href="https://pub.dev/packages/geocoding">geocoding</a>
 --------------------------
 - <a href="https://pub.dev/packages/cached_network_image">cached_network_image</a>
 - <a href="https://pub.dev/packages/flutter_svg">flutter_svg</a>
 - <a href="https://pub.dev/packages/flutter_switch">flutter_switch</a>
 --------------------------
 - <a href="https://pub.dev/packages/hive">hive</a>
 - <a href="https://pub.dev/packages/hive_flutter">hive_flutter</a>
 - <a href="https://pub.dev/packages/path_provider">path_provider</a>
 --------------------------
 - <a href="https://pub.dev/packages/hive_generator">hive_generator</a>
 - <a href="https://pub.dev/packages/retrofit_generator">retrofit_generator</a>
 - <a href="https://pub.dev/packages/injectable_generator">injectable_generator</a>
 - <a href="https://pub.dev/packages/build_runner">build_runner</a>
 --------------------------