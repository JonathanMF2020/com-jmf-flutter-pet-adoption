import 'package:flutter/material.dart';
import 'package:petadoption/config/colors/app_colors.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'PetAdoption',
    appBarTheme: appBarTheme(),
  );
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    color: Colors.white,
    elevation: 0,
    centerTitle: true,
    iconTheme: IconThemeData(color: Color(0XFF8B8B8B)),
    titleTextStyle: TextStyle(color: Color(0XFF8B8B8B), fontSize: 18),
  );
}

TextStyle titleText() {
  return const TextStyle(
    fontSize: 24, // Tamaño de la fuente
    fontWeight: FontWeight.bold, // Grosor de la fuente
    color: Colors.black, // Color del texto
    letterSpacing: 1.2, // Espaciado entre letras
    fontFamily: 'Roboto', // Fuente personalizada (si usas una)
  );
}

TextStyle subtitleText() {
  return const TextStyle(
    fontSize: 18, // Tamaño de la fuente
    fontWeight: FontWeight.normal, // Grosor de la fuente
    color: Colors.black, // Color del texto
    letterSpacing: 1.2, // Espaciado entre letras
    fontFamily: 'Roboto', // Fuente personalizada (si usas una)
  );
}

TextStyle normalText() {
  return const TextStyle(
    fontSize: 13, // Tamaño de la fuente
    fontWeight: FontWeight.normal, // Grosor de la fuente
    color: Colors.black, // Color del texto
    letterSpacing: 1.2, // Espaciado entre letras
    fontFamily: 'Roboto', // Fuente personalizada (si usas una)
  );
}

TextStyle normalTextMinum() {
  return const TextStyle(
    fontSize: 9, // Tamaño de la fuente
    fontWeight: FontWeight.normal, // Grosor de la fuente
    color: Colors.black, // Color del texto
    letterSpacing: 1.2, // Espaciado entre letras
    fontFamily: 'Roboto', // Fuente personalizada (si usas una)
  );
}

TextStyle normalBoldText() {
  return const TextStyle(
    fontSize: 10, // Tamaño de la fuente
    fontWeight: FontWeight.bold, // Grosor de la fuente
    color: Colors.black, // Color del texto
    letterSpacing: 1.2, // Espaciado entre letras
    fontFamily: 'Roboto', // Fuente personalizada (si usas una)
  );
}

TextStyle miniTextCategory() {
  return const TextStyle(
    fontSize: 10, // Tamaño de la fuente
    fontWeight: FontWeight.bold, // Grosor de la fuente
    color: Colors.white, // Color del texto
    letterSpacing: 1.2, // Espaciado entre letras
    fontFamily: 'Roboto', // Fuente personalizada (si usas una)
  );
}

TextStyle normalBoldWhiteText() {
  return const TextStyle(
    fontSize: 10, // Tamaño de la fuente
    fontWeight: FontWeight.bold, // Grosor de la fuente
    color: Colors.white, // Color del texto
    letterSpacing: 1.2, // Espaciado entre letras
    fontFamily: 'Roboto', // Fuente personalizada (si usas una)
  );
}

TextStyle normalColorUnderLineText() {
  return const TextStyle(
    fontSize: 13, // Tamaño de la fuente
    fontWeight: FontWeight.normal, // Grosor de la fuente
    color: Colors.blueAccent, // Color del texto
    letterSpacing: 1.2, // Espaciado entre letras
    fontFamily: 'Roboto',
    decoration: TextDecoration.underline, // Fuente personalizada (si usas una)
  );
}

ButtonStyle primaryButton = ElevatedButton.styleFrom(
  backgroundColor: AppColors.secondary, // Color de fondo
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(16.0), // Bordes redondeados
  ),
  padding: const EdgeInsets.symmetric(
      vertical: 16.0, horizontal: 24.0), // Espaciado interno
  textStyle: const TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.bold, // Negrita
  ),
);

ButtonStyle secondaryButton = ElevatedButton.styleFrom(
  backgroundColor: AppColors.accent, // Color de fondo
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(16.0), // Bordes redondeados
  ),
  padding: const EdgeInsets.symmetric(
      vertical: 16.0, horizontal: 24.0), // Espaciado interno
  textStyle: const TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.bold, // Negrita
  ),
);

InputDecoration customInputDecoration({
  required String hintText,
  String? labelText,
  Widget? prefixIcon,
  Widget? suffixIcon,
}) {
  return InputDecoration(
    hintText: hintText,
    labelText: labelText,
    prefixIcon: prefixIcon,
    suffixIcon: suffixIcon,
    filled: true,
    fillColor: Colors.grey[100], // Fondo claro del TextFormField
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.0), // Bordes redondeados
      borderSide: BorderSide(color: Colors.grey[300]!),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.0),
      borderSide: BorderSide(color: Colors.grey[300]!),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.0),
      borderSide: const BorderSide(
          color: Colors.blueAccent, width: 2.0), // Borde azul al enfocarse
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.0),
      borderSide: const BorderSide(
          color: Colors.redAccent, width: 2.0), // Borde rojo para errores
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.0),
      borderSide: const BorderSide(color: Colors.redAccent, width: 2.0),
    ),
    hintStyle: TextStyle(color: Colors.grey[500]), // Color del placeholder
    labelStyle: const TextStyle(color: Colors.blueGrey, fontSize: 16.0),
    contentPadding: const EdgeInsets.symmetric(
        vertical: 16.0, horizontal: 12.0), // Espaciado interno
  );
}
