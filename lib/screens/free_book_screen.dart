import 'package:bookstore_app/providers/books.dart';
import 'package:bookstore_app/screens/specific_search_screen.dart';
import 'package:bookstore_app/services/connectivity_status.dart';
import 'package:bookstore_app/widgets/books_grid.dart';
import 'package:bookstore_app/widgets/navbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FreeBookScreen extends StatefulWidget {
  static const routeName = '/Free';

  const FreeBookScreen({super.key});

  @override
  _SpecificSearchScreenState createState() => _SpecificSearchScreenState();
}

class _SpecificSearchScreenState extends State<FreeBookScreen> {
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    var connectivity = Provider.of<ConnectivityStatus>(context);
    if (connectivity != ConnectivityStatus.Offline) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> searchArgs = {
      'type': 'free-ebooks',
    };

    Provider.of<Books>(context, listen: false).setStartIndex();
    Provider.of<Books>(context, listen: false)
        .toggleTotalItemsCalculation(true);
    return Scaffold(
      backgroundColor: const Color(0xFF131E32),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: const NavBar(FreeBookScreen.routeName),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Material(
            elevation: 2,
            child: Container(
              height: 150,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/books_title.jpg"),
                      fit: BoxFit.cover,
                      colorFilter:
                          ColorFilter.mode(Colors.black87, BlendMode.overlay))),
              child: Container(
                color: Colors.black38,
                child: Padding(
                  padding: const EdgeInsets.only(right: 16.0, top: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const SizedBox(height: 2.0),
                            Text(
                              'Free Ebooks',
                              softWrap: true,
                              textAlign: TextAlign.end,
                              style: GoogleFonts.montserrat(
                                  textStyle: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          FutureBuilder(
            future: Provider.of<Books>(context, listen: false)
                .getSearchedBookByArgs(searchArgs),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else {
                Provider.of<Books>(context, listen: false)
                    .toggleTotalItemsCalculation(false);

                return const BooksGrid(
                    routeName: SpecificSearchScreen.routeName);
              }
            },
          ),
        ],
      ),
    );
  }
}
