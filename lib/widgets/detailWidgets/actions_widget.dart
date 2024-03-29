import 'package:bookstore_app/models/book.dart';
import 'package:bookstore_app/services/utils.dart';
import 'package:flutter/material.dart';

class ActionsWidget extends StatelessWidget {
  final Book book;
  const ActionsWidget(this.book, {super.key});

  @override
  Widget build(BuildContext context) {
    String availability;
    IconData icon;
    if (book.accessViewStatus == 'SAMPLE') {
      availability = 'SAMPLE';
      icon = Icons.description;
    } else if (book.accessViewStatus == 'FULL_PUBLIC_DOMAIN') {
      availability = 'READ';
      icon = Icons.book;
    } else {
      availability = 'PAID';
      icon = Icons.attach_money;
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        ActionButton(
          icon: Icons.chrome_reader_mode,
          label: 'PREVIEW',
          onPressed: () async {
            await Utils.launchURL(book.previewLink);
          },
        ),
        const SizedBox(width: 5.0),
        ActionButton(
          label: book.saleability != 'FOR_SALE'
              ? 'N/A'
              : '${book.amount} ${book.currencyCode}',
          onPressed: book.saleability != 'FOR_SALE'
              ? () {}
              : () async {
                  await Utils.launchURL(book.buyLink);
                },
          icon: Icons.shop,
        ),
        const SizedBox(width: 5.0),
        ActionButton(
          label: availability,
          icon: icon,
          onPressed: book.accessViewStatus != 'FULL_PUBLIC_DOMAIN' &&
                  book.accessViewStatus != 'SAMPLE'
              ? () {}
              : () async {
                  await Utils.launchURL(book.webReaderLink);
                },
        ),
      ],
    );
  }
}

class ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const ActionButton(
      {super.key, required this.icon, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFFE9E3A), // Background color
      ),
      label: Text(
        label,
        style: const TextStyle(fontSize: 10.0),
      ),
      onPressed: onPressed,
      icon: Icon(
        icon,
        size: 16.0,
      ),
    );
  }
}
