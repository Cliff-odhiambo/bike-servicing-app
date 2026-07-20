import 'package:flutter/material.dart';

import 'app_bottom_navigation.dart';

class RiderScaffold extends StatelessWidget {
  final Widget body;
  final int currentIndex;
  final String? title;
  final List<Widget>? actions;
  final FloatingActionButton? floatingActionButton;

  const RiderScaffold({
    super.key,
    required this.body,
    required this.currentIndex,
    this.title,
    this.actions,
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: title == null
          ? null
          : AppBar(
              title: Text(title!),
              centerTitle: false,
              actions: actions,
            ),

      body: SafeArea(
        child: body,
      ),

      floatingActionButton: floatingActionButton,

      bottomNavigationBar: AppBottomNavigation(
        currentIndex: currentIndex,
      ),
    );
  }
}