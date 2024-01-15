## Search for your favorite movies and series!

Discover the world of top entertainment with our app, where you can easily find and explore top-rated and most popular series and movies. Whether you're a movie buff or a TV series fanatic, our app has got you covered.

## Installation guide
• Android: tap [here](https://github.com/nicolas-ferrada/movies_and_series/releases/latest/) to download the lastest APK file, then you can install it on your Android device.

• iOS: application is available for iOS, but cannot be installed since is not uploaded to the App Store.

## Technologies
#### Main:
• Flutter as the SDK.

• Dart as the programming language.
#### Secondary:
• BLoC as the architectural pattern and state management solution.

• The Movie Database API as the data source.

## API Key
The API Key is not stored on the repository. You need to create an '.env' file on the root of the application and write: 'APIKEY='.

## Missing implementations
Only one BloC have been tested with the corresponding unit testing, but every single BLoC would need to be tested at least by the following parameters:

• Check initialization state.

• Check the expected state output from a triggered event.

• Modifying state does not throw exceptions.

• BLoC correctly handles multiple incoming events.

#### Other critital components to test are the repositories and data providers.
