import 'package:flutter/material.dart';

import 'NavigationBar.dart';

void main() => runApp(MasjidApp());

class MasjidApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Masjid App',
      home: Navigation_Bar(),
    );
  }
}

