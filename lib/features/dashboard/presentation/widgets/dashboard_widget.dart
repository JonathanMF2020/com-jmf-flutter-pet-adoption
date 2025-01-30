import 'package:flutter/material.dart';
import 'package:petadoption/config/theme/app_theme.dart';

class DashboardWidget extends StatefulWidget {
  const DashboardWidget({super.key});

  @override
  State<DashboardWidget> createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          Center(
            child: Text(
              "For you",
              style: titleText(),
            ),
          ),
          GridView.count(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            primary: true,
            padding: const EdgeInsets.all(20),
            mainAxisSpacing: 20,
            crossAxisCount: 1,
            children: <Widget>[
              petContainer(),
              petContainer(),
              petContainer(),
              petContainer(),
            ],
          )
        ],
      ),
    );
  }

  Container petContainer() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            spreadRadius: 2,
            offset: Offset(0, 5), // Sombra hacia abajo
          ),
        ],
        color: Colors.grey.shade100,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          Image.asset("assets/images/dog.jpg"),
          const Text("Josue"),
          const Text("Age: 2 years"),
          const Text("Breed: Perrito"),
          const Text(
              "Description: Aiusdhfopiashudfhápsdpfouiaspdoufhiaspkjdfnbapsdjkfbaskjdfbgh")
        ],
      ),
    );
  }
}
