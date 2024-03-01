import 'dart:math';
import 'package:bookstore_app/providers/books.dart';
import 'package:bookstore_app/screens/admin_panel_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdminPanel extends StatefulWidget {
  final String currentRoute;

  const AdminPanel(this.currentRoute, {super.key});

  @override
  _AdminPanelState createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
  bool openDashboard = true;
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
            color: const Color.fromARGB(255, 0, 3, 10),
            elevation: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                if (openDashboard)
                  AdminPanelButton('assets/images/user.png', 'Admin',
                      AdminPanelScreen.routeName, widget.currentRoute),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AdminPanelButton extends StatelessWidget {
  final String icon;
  final String label;
  final String route;
  final String currentRoute;

  const AdminPanelButton(this.icon, this.label, this.route, this.currentRoute,
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
                width: 20,
                height: 20,
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
                      fontSize: 10,
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
