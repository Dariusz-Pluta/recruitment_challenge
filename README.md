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


 * WeatherAPi: https://openweathermap.org/
 - injectable
 - equatable
 - dartz
 - get_it
 - flutter_bloc
 --------------------------
 - intl
 - intl_utils
 --------------------------
 - retrofit
 - dio
 --------------------------
 - geolocator
 - geocoding
 --------------------------
 - cached_network_image
 - flutter_svg
 - flutter_switch
 --------------------------
 - hive
 - hive_flutter
 - path_provider
 --------------------------
 - hive_generator
 - retrofit_generator
 - injectable_generator
 - build_runner