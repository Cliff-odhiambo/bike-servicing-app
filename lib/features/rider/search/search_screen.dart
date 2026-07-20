import 'package:flutter/material.dart';

import '../../../shared/widgets/rider_scaffold.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const RiderScaffold(
      currentIndex: 1,
      title: "Search",

      body: Center(
        child: Text(
          "Search Screen",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}