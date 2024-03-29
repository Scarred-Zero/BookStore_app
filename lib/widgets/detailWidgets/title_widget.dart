import 'package:bookstore_app/models/book.dart';
import 'package:bookstore_app/services/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleWidget extends StatelessWidget {
  final Book book;

  const TitleWidget(this.book, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          FittedBox(
            child: Text(
              Utils.trimString(book.title, 50),
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22.0,
                      color: Colors.grey)),
            ),
          ),
          Text(
            Utils.trimString(book.subtitle, 40),
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
                textStyle: const TextStyle(fontSize: 12.0, color: Colors.grey)),
          ),
        ],
      ),
    );
  }
}
