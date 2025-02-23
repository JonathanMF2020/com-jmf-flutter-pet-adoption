import 'package:flutter/material.dart';
import 'package:petadoption/config/colors/app_colors.dart';
import 'package:petadoption/config/theme/app_theme.dart';

BottomAppBar customNavigationBar(int currentIndex) {
  return BottomAppBar(
    height: 90,
    shape: const CircularNotchedRectangle(),
    child: Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          containerIcon(0, Icons.home_filled, "Home", currentIndex),
          containerIcon(1, Icons.favorite_border, "Favorites", currentIndex),
          containerIcon(
              2, Icons.calendar_month_outlined, "Calendar", currentIndex),
          containerIcon(3, Icons.person_outlined, "My profile", currentIndex),
        ],
      ),
    ),
  );
}

GestureDetector containerIcon(
    int id, IconData icon, String text, int currentIndex) {
  if (currentIndex == id) {
    return GestureDetector(
      onTap: () => getLogic(id),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), color: AppColors.primary),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 20,
            ),
            Text(
              text,
              style: normalBoldWhiteTextfONT(12),
            )
          ],
        ),
      ),
    );
  }

  return GestureDetector(
    onTap: () => getLogic(id),
    child: Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: AppColors.back2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.black,
            size: 20,
          ),
        ],
      ),
    ),
  );
}

void getLogic(id) {
  switch (id) {
    case 0:
      // do something
      break;
    case 1:
      // do something else
      break;
  }
}
