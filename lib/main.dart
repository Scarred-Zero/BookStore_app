import 'package:bookstore_app/providers/books.dart';
import 'package:bookstore_app/providers/bookshelf.dart';
import 'package:bookstore_app/providers/categories.dart';
import 'package:bookstore_app/providers/nyt.dart';
import 'package:bookstore_app/controllers/menu_app_controller.dart';
import 'package:bookstore_app/screens/admin/admin_panel_screen.dart';
import 'package:bookstore_app/screens/wish_list_screen.dart';
import 'package:bookstore_app/screens/free_book_screen.dart';
import 'package:bookstore_app/screens/home_screen.dart';
import 'package:bookstore_app/screens/product_list_screen.dart';
import 'package:bookstore_app/screens/onboarding.dart';
import 'package:bookstore_app/screens/paid_screen.dart';
import 'package:bookstore_app/screens/search_screen.dart';
import 'package:bookstore_app/screens/specific_search_screen.dart';
import 'package:bookstore_app/screens/splashscreen.dart';
import 'package:bookstore_app/constants.dart';
import 'package:google_fonts/google_fonts.dart';
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
    // PROVIDERS TO MANAGE THE STATE OF THE LISTED BELOW
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
        ChangeNotifierProvider(
          create: (BuildContext context) => MenuAppController(),
        ),
        StreamProvider<ConnectivityStatus?>(
          create: (BuildContext context) =>
              ConnectivityService().connectionStatusController.stream,
          initialData: ConnectivityStatus.Cellular,
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: bgColor,
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
              .apply(bodyColor: Colors.white),
          canvasColor: secondaryColor,
        ),
        // THIS SCREEN IS DISPLAYED FIRST ONCE THE APPLICATION LOADS COMPLETELY
        initialRoute: SplashScreen.routeName,
        // USING OF NAMED ROUTE FOR NAVIGATING BETWEEN SCREENS
        routes: {
          SearchScreen.routeName: (context) => const SearchScreen(),
          WishListScreen.routeName: (context) => const WishListScreen(),
          SpecificSearchScreen.routeName: (context) =>
              const SpecificSearchScreen(),
          ProductListScreen.routeName: (context) => const ProductListScreen(),
          PaidBookScreen.routeName: (context) => const PaidBookScreen(),
          FreeBookScreen.routeName: (context) => const FreeBookScreen(),
          AdminPanelScreen.routeName: (context) => const AdminPanelScreen(),
          // AdminPanelScreen.routeName: (context) => const AdminPanelScreen(),
          OnBoardingScreen.routeName: (context) => const OnBoardingScreen(),
          HomeScreen.routeName: (context) => const HomeScreen(),
          SplashScreen.routeName: (context) => const SplashScreen(),
        },
      ),
    );
  }
}
