import 'dart:math';
import 'package:bookstore_app/providers/books.dart';
import 'package:bookstore_app/screens/bookshelf_screen.dart';
import 'package:bookstore_app/screens/freebookscreen.dart';
import 'package:bookstore_app/screens/home_screen.dart';
import 'package:bookstore_app/screens/paidscreen.dart';
import 'package:bookstore_app/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NavBar extends StatefulWidget {
  final String currentRoute;

  const NavBar(this.currentRoute, {super.key});

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  bool openNav = true;

  @override
  Widget build(BuildContext context) {
    final height = min(MediaQuery.of(context).size.height * 0.2, 75.0);
    final width = min(MediaQuery.of(context).size.width * 0.9, 250.0);
    return SizedBox(
      height: height,
      // width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Card(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            color: Color.fromARGB(255, 67, 91, 139),
            elevation: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                if (openNav)
                  NavbarButton('assets/images/bookmark.png', 'Bookmark',
                      BookShelfScreen.routeName, widget.currentRoute),
                if (openNav)
                  NavbarButton('assets/images/estate.png', 'Home',
                      HomeScreen.routeName, widget.currentRoute),
                if (openNav)
                  NavbarButton('assets/images/loupe.png', 'Search',
                      SearchScreen.routeName, widget.currentRoute),
                if (openNav)
                  NavbarButton('assets/images/paid.png', 'Paid',
                      PaidBookScreen.routeName, widget.currentRoute),
                if (openNav)
                  NavbarButton('assets/images/free.png', 'Free',
                      FreeBookScreen.routeName, widget.currentRoute),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NavbarButton extends StatelessWidget {
  final String icon;
  final String label;
  final String route;
  final String currentRoute;

  const NavbarButton(this.icon, this.label, this.route, this.currentRoute,
      {super.key});

  @override
  Widget build(BuildContext context) {
    final books = Provider.of<Books>(context, listen: false);
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: SizedBox(
                width: 25,
                height: 25,
                child: Image.asset(
                  icon,
                  scale: 1.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text(
                label,
                style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 245, 249, 253)),
                ),
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        if (currentRoute == route) return;
        Navigator.of(context).pushReplacementNamed(route);
        books.setFirstLoad(true);
      },
    );
  }
}
