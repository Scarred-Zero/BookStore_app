import 'package:bookstore_app/models/book.dart';
import 'package:bookstore_app/services/utils.dart';
import 'package:flutter/material.dart';

class MetadataWidget extends StatelessWidget {
  final Book book;

  const MetadataWidget(this.book, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Publisher',
                style: TextStyle(
                  color: Color(0xFFFE9E3A),
                ),
              ),
              Text(
                Utils.trimString(book.publisher, 20),
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                softWrap: true,
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Pages',
                style: TextStyle(
                  color: Color(0xFFFE9E3A),
                ),
              ),
              Text(
                book.pageCount == null ? '---' : book.pageCount.toString(),
                style:
                    const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Rating',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFFE9E3A),
                ),
              ),
              Text(
                book.averageRating,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Published',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFFE9E3A),
                ),
              ),
              Text(
                book.publishedDate,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
