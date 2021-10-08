import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PostBottomNavigation extends StatelessWidget {
  final int index;
  final BuildContext context;
  final Function(int) onTap;
  PostBottomNavigation({key, required this.index, required this.context, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        backgroundColor: Colors.black.withOpacity(0.5),
        currentIndex: this.index,
        onTap: this.onTap,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.new_label_sharp), label: 'Noticias'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favoritos')
        ],
      );
  }
}
