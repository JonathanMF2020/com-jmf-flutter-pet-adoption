import 'package:flutter/material.dart';

BottomNavigationBar customNavigationBar(int currentIndex) {
  return BottomNavigationBar(
    backgroundColor: Colors.blueAccent,
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.grey.shade400,
    currentIndex: currentIndex,
    onTap: (index) {},
    items: const [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'For you',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'Profile',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.pets),
        label: 'Pets',
      ),
    ],
  );
}
