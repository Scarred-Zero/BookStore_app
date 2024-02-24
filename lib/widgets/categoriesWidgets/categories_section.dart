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
        name: 'FullBooks.com',
        url: 'http://www.fullbooks.com',
        logoUrl:
            'https://www.freeiconspng.com/uploads/book-icon-black-good-galleries--24.jpg'),
    SiteCategories(
        name: 'Classic Bookshelf',
        url: 'http://www.classicbookshelf.com',
        logoUrl: 'https://example.com/classic_bookshelf_logo.png'),
    SiteCategories(
        name: 'Literature Project',
        url: 'http://www.literatureproject.com',
        logoUrl: 'https://example.com/literature_project_logo.png'),
    SiteCategories(
        name: 'BookBoon',
        url: 'http://bookboon.com',
        logoUrl: 'https://example.com/bookboon_logo.png'),
    SiteCategories(
        name: 'E-Books Directory',
        url: 'http://www.e-booksdirectory.com',
        logoUrl: 'https://example.com/e-books_directory_logo.png'),
    SiteCategories(
        name: 'The Library of Congress',
        url: 'https://www.loc.gov',
        logoUrl: 'https://example.com/library_of_congress_logo.png'),
    SiteCategories(
        name: 'OnlineProgrammingBooks',
        url: 'http://www.onlineprogrammingbooks.com',
        logoUrl: 'https://example.com/online_programming_books_logo.png'),
    SiteCategories(
        name: 'Learn Library',
        url: 'https://learnlibrary.com',
        logoUrl: 'https://example.com/learn_library_logo.png'),
    SiteCategories(
        name: 'ManyBooks.net',
        url: 'http://manybooks.net',
        logoUrl: 'https://example.com/manybooks_net_logo.png'),
    SiteCategories(
        name: 'FreeBookSpot',
        url: 'http://www.freebookspot.es',
        logoUrl: 'https://example.com/freebookspot_logo.png')
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
                childAspectRatio: .85,
              ),
              itemBuilder: (context, i) => FreeItem(freebooksiteslist[i]),
            ),
          ),
        ],
      ),
    );
  }
}
