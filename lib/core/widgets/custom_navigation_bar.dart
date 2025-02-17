import 'package:flutter/material.dart';
import 'package:petadoption/config/colors/app_colors.dart';

BottomNavigationBar customNavigationBar(int currentIndex) {
  return BottomNavigationBar(
    backgroundColor: AppColors.primary,
    selectedItemColor: AppColors.accent,
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
