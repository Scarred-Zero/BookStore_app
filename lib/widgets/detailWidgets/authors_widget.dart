import 'package:bookstore_app/models/book.dart';
import 'package:bookstore_app/services/utils.dart';
import 'package:flutter/material.dart';

class AuthorsWidget extends StatelessWidget {
  final Book book;

  const AuthorsWidget(this.book, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        Utils.listToString(book.authors, '   '),
        textAlign: TextAlign.center,
        style: const TextStyle(color: Color(0xFFFE9E3A), fontSize: 12.0),
        softWrap: true,
      ),
    );
  }
}
