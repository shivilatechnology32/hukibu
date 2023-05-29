// ignore_for_file: depend_on_referenced_packages, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:intl/intl.dart' as intl;

class NotesDetails extends StatelessWidget {
  final data;
  const NotesDetails({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "${data['title']}".text.make(),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          "${data['description']}".text.medium.size(16).make().p12(),
          10.heightBox,
          intl.DateFormat.yMMMd()
              .format(data['date'].toDate())
              .text
              .medium
              .color(Colors.blueGrey)
              .make()
        ],
      )),
    );
  }
}
