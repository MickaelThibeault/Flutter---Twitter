import 'package:flutter/material.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {

  @override
  Size get preferredSize => const Size.fromHeight(80.0);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color(0xFF58B0F0),
        padding: const EdgeInsets.symmetric(vertical: 25.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(icon: const Icon(Icons.create_outlined), iconSize: 30, color: Colors.white, onPressed: () {  }),
              const Text("Accueil", style: TextStyle(color: Colors.white, fontSize: 16)),
              IconButton(icon: const Icon(Icons.search), iconSize: 30, color: Colors.white, onPressed: () {  }),
            ],
          ),
        )
    );
  }
}