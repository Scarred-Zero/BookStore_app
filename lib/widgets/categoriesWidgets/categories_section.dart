import 'package:bookstore_app/models/category.dart';
import 'package:bookstore_app/providers/categories.dart';
import 'package:bookstore_app/widgets/categoriesWidgets/category_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<Categories>(context);
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.16,
            width: MediaQuery.of(context).size.width * 0.95,
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              scrollDirection: Axis.horizontal,
              itemCount: categories.categoriesList.length,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: 15.0,
                crossAxisSpacing: 15.0,
                childAspectRatio: .85,
              ),
              itemBuilder: (context, i) =>
                  CategoryItem(categories.categoriesList[i]),
            ),
          ),
        ],
      ),
    );
  }
}

class FreesiteSection extends StatelessWidget {
  List<SiteCategories> freebooksiteslist = [
    SiteCategories(
        name: 'Baen Free Library',
        url: 'https://www.baen.com',
        logoUrl: 'https://www.baen.com/images/logo.png'),
    SiteCategories(
        name: 'Libby',
        url: 'https://www.overdrive.com/apps/libby',
        logoUrl:
            'https://infosoup.info/wp-content/uploads/2022/01/libby-logo.png'),
    SiteCategories(
        name: 'Romance e-books',
        url: 'https://www.smashwords.com/shelves/home/1235/free/any',
        logoUrl: 'https://www.smashwords.com/static/img/favicon.ico'),
    SiteCategories(
        name: 'Open Culture',
        url: 'http://www.openculture.com',
        logoUrl:
            'https://cdn.icon-icons.com/icons2/2699/PNG/512/openculture_logo_icon_170890.png'),
    SiteCategories(
        name: 'Forgotten Books',
        url: 'https://www.forgottenbooks.com',
        logoUrl:
            'https://icon-library.com/images/book-icon-transparent/book-icon-transparent-27.jpg'),
    SiteCategories(
        name: 'Openlibrary.org',
        url: 'https://openlibrary.org/',
        logoUrl:
            'https://openlibrary.org/static/images/openlibrary-128x128.png'),
    SiteCategories(
        name: 'ManyBooks.net',
        url: 'https://manybooks.net/',
        logoUrl: 'https://manybooks.net/themes/custom/mnybks/favicon.ico'),
    SiteCategories(
        name: 'Gutenberg.org',
        url: 'https://www.gutenberg.org/',
        logoUrl: 'https://www.gutenberg.org/gutenberg/pg-logo-129x80.png'),
    SiteCategories(
        name: 'Feedbooks.com',
        url: 'https://www.feedbooks.com/',
        logoUrl: 'https://www.feedbooks.com/favicon.ico'),
    SiteCategories(
        name: 'Free-ebooks.net',
        url: 'https://www.free-ebooks.net/',
        logoUrl: 'https://www.free-ebooks.net/favicon-16x16.png?v=2b0OeXpMNw'),
    SiteCategories(
        name: 'Ebooks.com',
        url: 'https://www.ebooks.com/en-sg/',
        logoUrl: 'https://www.ebooks.com/icon-128x128.png'),
    SiteCategories(
        name: 'OnlineProgrammingBooks',
        url: 'https://www.oreilly.com/',
        logoUrl: 'https://www.oreilly.com/favicon.ico'),
    SiteCategories(
        name: 'Tutorialspoint for programming',
        url: 'https://www.tutorialspoint.com/',
        logoUrl: 'https://www.tutorialspoint.com/images/favicon-16x16.png'),
  ];

  FreesiteSection({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.55,
            width: MediaQuery.of(context).size.width * 0.95,
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              scrollDirection: Axis.vertical,
              itemCount: freebooksiteslist.length,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 15.0,
                crossAxisSpacing: 15.0,
                childAspectRatio: .90,
              ),
              itemBuilder: (context, i) => FreeItem(freebooksiteslist[i]),
            ),
          ),
        ],
      ),
    );
  }
}
