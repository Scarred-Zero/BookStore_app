import 'package:bookstore_app/providers/books.dart';
import 'package:bookstore_app/providers/bookshelf.dart';
import 'package:bookstore_app/providers/categories.dart';
import 'package:bookstore_app/providers/nyt.dart';
import 'package:bookstore_app/screens/bookshelf_screen.dart';
import 'package:bookstore_app/screens/freebookscreen.dart';
import 'package:bookstore_app/screens/home_screen.dart';
import 'package:bookstore_app/screens/onboarding.dart';
import 'package:bookstore_app/screens/paidscreen.dart';
import 'package:bookstore_app/screens/search_screen.dart';
import 'package:bookstore_app/screens/specific_search_screen.dart';
import 'package:bookstore_app/screens/splashscreen.dart';
import 'package:bookstore_app/services/connectivity_service.dart';
import 'package:bookstore_app/services/connectivity_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  // ENTRY POINT OF A FLUTTER APPLICATION
  runApp(const BookStoreApp());
}

class BookStoreApp extends StatelessWidget {
  const BookStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    // FORCES THE APPLICATION TO REMAIN PORTRAIT
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    // PROVIDERS TO MANAGE THE STAE OF THE LISTED BELOW
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => Books(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => NYT(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => Bookshelf(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => Categories(),
        ),
        StreamProvider<ConnectivityStatus?>(
          create: (BuildContext context) =>
              ConnectivityService().connectionStatusController.stream,
          initialData: ConnectivityStatus.Cellular,
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // THIS SCREEN IS DISPLAYED FIRST ONCE THE APPLICATION LOADS COMPLETELY
        initialRoute: SplashScreen.routeName,
        // USING OF NAMED ROUTE FOR NAVIGATING BETWEEN SCREENS
        routes: {
          SearchScreen.routeName: (context) => const SearchScreen(),
          BookShelfScreen.routeName: (context) => const BookShelfScreen(),
          SpecificSearchScreen.routeName: (context) =>
              const SpecificSearchScreen(),
          PaidBookScreen.routeName: (context) => const PaidBookScreen(),
          FreeBookScreen.routeName: (context) => const FreeBookScreen(),
          onBoardingScreen.routeName: (context) => const onBoardingScreen(),
          HomeScreen.routeName: (context) => const HomeScreen(),
          SplashScreen.routeName: (context) => const SplashScreen(),
        },
      ),
    );
  }
}
