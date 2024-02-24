import 'package:bookstore_app/models/savedBook.dart';
import 'package:bookstore_app/providers/bookshelf.dart';
import 'package:bookstore_app/screens/book_detail_screen.dart';
import 'package:bookstore_app/services/book_search_utils.dart';
import 'package:bookstore_app/services/utils.dart';
import 'package:bookstore_app/widgets/network_sensititve.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SavedBookItem extends StatefulWidget {
  final SavedBook savedBook;

  const SavedBookItem(this.savedBook, {super.key});

  @override
  _SavedBookItemState createState() => _SavedBookItemState();
}

class _SavedBookItemState extends State<SavedBookItem> {
  var searchedBook;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Future.delayed(Duration.zero).then((_) async {
      searchedBook = await BookSearchUtils.fetchBookById(widget.savedBook.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        showModalBottomSheet(
            elevation: 18.0,
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return FutureBuilder(
                future: BookSearchUtils.fetchBookById(widget.savedBook.id),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  return snapshot.connectionState == ConnectionState.waiting
                      ? const LinearProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                              Color(0xFF131E32)),
                          backgroundColor: Color(0xFFFE9E3A),
                        )
                      : BookDetailBottomSheet(searchedBook);
                },
              );
            });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
        child: Dismissible(
          key: ValueKey(widget.savedBook.id),
          background: Container(
            alignment: AlignmentDirectional.centerEnd,
            color: Colors.grey[100],
            child: const Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: Icon(
                Icons.delete,
                color: Color(0xFFFE9E3A),
              ),
            ),
          ),
          direction: DismissDirection.endToStart,
          onDismissed: (direction) async {
            await Provider.of<Bookshelf>(context, listen: false)
                .removeSavedBook(widget.savedBook.id);
          },
          child: Container(
            decoration: const BoxDecoration(
                border:
                    Border(bottom: BorderSide(width: 1, color: Colors.grey))),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                      width: MediaQuery.of(context).size.height * 0.07,
                      height: MediaQuery.of(context).size.height * 0.10,
                      child: Card(
                          elevation: 8,
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(4.0)),
                            child: NetworkSensitive(
                              offlineChild: const Center(
                                  child: Text(
                                'NO INTERNET CONNECTION',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 8.0),
                              )),
                              child: Image.network(
                                widget.savedBook.imageUrl,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ))),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0, right: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            widget.savedBook.authors,
                            style: const TextStyle(
                                color: Color(0xFFFE9E3A), fontSize: 10),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            Utils.trimString(widget.savedBook.title, 50),
                            style: GoogleFonts.montserrat(
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.grey)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
