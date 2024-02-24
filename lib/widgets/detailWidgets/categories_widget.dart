import 'package:bookstore_app/models/book.dart';
import 'package:bookstore_app/services/utils.dart';
import 'package:flutter/material.dart';

class CategoriesWidget extends StatelessWidget {
  final Book book;

  const CategoriesWidget(this.book, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: book.categories.isNotEmpty
          ? Container(
              padding: const EdgeInsets.all(3.0),
              color: const Color(0xFFFFFF69),
              child: Text(
                Utils.trimString(
                    Utils.listToString(book.categories, '   '), 40),
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Color(0xFFFE9E3A),
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500),
                softWrap: true,
              ),
            )
          : Container(),
    );
  }
}
