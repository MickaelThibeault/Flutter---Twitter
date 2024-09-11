
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const BottomAppBar(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('Fil', style: TextStyle(fontSize: 16, color: Colors.black)),
            Text('Notifications', style: TextStyle(fontSize: 16, color: Colors.black)),
            Text('Messages', style: TextStyle(fontSize: 16, color: Colors.black)),
            Text('Moi', style: TextStyle(fontSize: 16, color: Colors.black)),
          ],
        ),
      ),
    );
  }
}