import 'dart:async';
import 'package:bookstore_app/providers/nyt.dart';
import 'package:bookstore_app/screens/admin/admin_panel_screen.dart';
import 'package:bookstore_app/widgets/app_title.dart';
import 'package:bookstore_app/widgets/categoriesWidgets/categories_section.dart';
import 'package:bookstore_app/widgets/navbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  const HomeScreen({super.key});

  // String get currentRoute => AdminPanelScreen.routeName;
  String get currentRoute => AdminPanelScreen.routeName;
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  // Called when this State object changes.
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    getBooksData();
  }

  Future<void> getBooksData() async {
    await Provider.of<NYT>(context, listen: false).getCategoryList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 51, 64, 82),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: const NavBar(HomeScreen.routeName),
      body: RefreshIndicator(
        color: const Color(0xFF3A95FE),
        backgroundColor: Colors.white,
        displacement: 80,
        onRefresh: () async {
          await getBooksData();
        },
        child: Column(
          children: <Widget>[
            const AppTitle(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 8.0),
                  child: Text('Categories',
                      style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFFFCF9F7)))),
                ),
              ],
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(child: const CategoriesSection()),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(top: 20, left: 22.0, bottom: 8.0),
                  child: Text('Free Book Sites',
                      style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFFFCF9F7)))),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(child: FreesiteSection()),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
