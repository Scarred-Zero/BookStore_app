import 'package:bookstore_app/models/book.dart';
import 'package:bookstore_app/providers/bookshelf.dart';
import 'package:bookstore_app/services/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Bookmark extends StatefulWidget {
  final String bookId;
  final Book book;

  const Bookmark({super.key, required this.bookId, required this.book});

  @override
  _BookmarkState createState() => _BookmarkState();
}

class _BookmarkState extends State<Bookmark> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<Bookshelf>(context).checkExistingBook(widget.bookId),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        return IconButton(
          icon: Icon(
            snapshot.data == true ? Icons.favorite : Icons.favorite_border,
          ),
          color: const Color(0xFFFE9E3A),
          iconSize: 32,
          onPressed: snapshot.data == true
              ? () async {
                  await Provider.of<Bookshelf>(context, listen: false)
                      .removeSavedBook(widget.bookId);
                  setState(() {});
                }
              : () {
                  Provider.of<Bookshelf>(context, listen: false).addToBookShelf(
                    widget.book.id,
                    widget.book.title,
                    widget.book.thumbnailUrl,
                    Utils.listToString(widget.book.authors, '   '),
                  );
                },
        );
      },
    );
  }
}
