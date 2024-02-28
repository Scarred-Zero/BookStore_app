import 'package:bookstore_app/constants.dart';
import 'package:bookstore_app/widget_tree.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class AdminPanelScreen extends StatelessWidget {
  static const routeName = '/admin-panel-screen';

  const AdminPanelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Admin Panel',
      theme: ThemeData(
          scaffoldBackgroundColor: Constants.purpleDark,
          primarySwatch: Colors.blue,
          canvasColor: Constants.purpleLight),
      home: const WidgetTree(),
    );
  }
}
