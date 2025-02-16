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
      child: Column(
        children: [
          Expanded(
            child: PageView(
              scrollDirection: Axis.vertical,
              physics: const ClampingScrollPhysics(),
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 8, right: 8),
                  child: Column(
                    children: [
                      Text(
                        "Tomy",
                        style: titleText(),
                      ),
                      Container(
                          margin: const EdgeInsets.only(left: 8, right: 8),
                          child: Image.asset("assets/images/conejo.jpg")),
                      const SizedBox(height: 30.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          createTag("Alegre"),
                          createTag("Energico"),
                          //createTag("Alegre"),
                          //createTag("Alegre")
                        ],
                      ),
                      const SizedBox(height: 30.0),
                      Card(
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Description: ",
                                  style: subtitleText(),
                                ),
                              ),
                              Text(
                                "El conejo es un mamífero herbívoro de la especie Oryctolagus cuniculus. Se caracteriza por tener un pelaje espeso, orejas largas, patas traseras fuertes y una cola cort",
                                style: normalText(),
                              ),
                              const SizedBox(height: 10.0),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2 -
                                            20,
                                    child: Text(
                                      "Age: 2 years",
                                      style: normalBoldText(),
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2 -
                                            20,
                                    child: Text(
                                      "Animal Type: Rabbit",
                                      style: normalBoldText(),
                                      textAlign: TextAlign.start,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 10.0),
                              SizedBox(
                                width: MediaQuery.of(context).size.width - 16,
                                child: Text(
                                  "Breed: Narna",
                                  style: normalBoldText(),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 8, right: 8),
                  child: Column(
                    children: [
                      Text(
                        "Tomy",
                        style: titleText(),
                      ),
                      Container(
                          margin: const EdgeInsets.only(left: 8, right: 8),
                          child: Image.asset("assets/images/conejo.jpg")),
                      const SizedBox(height: 30.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          createTag("Alegre"),
                          createTag("Energico"),
                          //createTag("Alegre"),
                          //createTag("Alegre")
                        ],
                      ),
                      const SizedBox(height: 30.0),
                      Card(
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Description: ",
                                  style: subtitleText(),
                                ),
                              ),
                              Text(
                                "El conejo es un mamífero herbívoro de la especie Oryctolagus cuniculus. Se caracteriza por tener un pelaje espeso, orejas largas, patas traseras fuertes y una cola cort",
                                style: normalText(),
                              ),
                              const SizedBox(height: 10.0),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2 -
                                            20,
                                    child: Text(
                                      "Age: 2 years",
                                      style: normalBoldText(),
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2 -
                                            20,
                                    child: Text(
                                      "Animal Type: Rabbit",
                                      style: normalBoldText(),
                                      textAlign: TextAlign.start,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 10.0),
                              SizedBox(
                                width: MediaQuery.of(context).size.width - 16,
                                child: Text(
                                  "Breed: Narna",
                                  style: normalBoldText(),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 8, right: 8),
                  child: Column(
                    children: [
                      Text(
                        "Tomy",
                        style: titleText(),
                      ),
                      Container(
                          margin: const EdgeInsets.only(left: 8, right: 8),
                          child: Image.asset("assets/images/conejo.jpg")),
                      const SizedBox(height: 30.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          createTag("Alegre"),
                          createTag("Energico"),
                          //createTag("Alegre"),
                          //createTag("Alegre")
                        ],
                      ),
                      const SizedBox(height: 30.0),
                      Card(
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Description: ",
                                  style: subtitleText(),
                                ),
                              ),
                              Text(
                                "El conejo es un mamífero herbívoro de la especie Oryctolagus cuniculus. Se caracteriza por tener un pelaje espeso, orejas largas, patas traseras fuertes y una cola cort",
                                style: normalText(),
                              ),
                              const SizedBox(height: 10.0),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2 -
                                            20,
                                    child: Text(
                                      "Age: 2 years",
                                      style: normalBoldText(),
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2 -
                                            20,
                                    child: Text(
                                      "Animal Type: Rabbit",
                                      style: normalBoldText(),
                                      textAlign: TextAlign.start,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 10.0),
                              SizedBox(
                                width: MediaQuery.of(context).size.width - 16,
                                child: Text(
                                  "Breed: Narna",
                                  style: normalBoldText(),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 8, right: 8),
                  child: Column(
                    children: [
                      Text(
                        "Tomy",
                        style: titleText(),
                      ),
                      Container(
                          margin: const EdgeInsets.only(left: 8, right: 8),
                          child: Image.asset("assets/images/conejo.jpg")),
                      const SizedBox(height: 30.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          createTag("Alegre"),
                          createTag("Energico"),
                          //createTag("Alegre"),
                          //createTag("Alegre")
                        ],
                      ),
                      const SizedBox(height: 30.0),
                      Card(
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Description: ",
                                  style: subtitleText(),
                                ),
                              ),
                              Text(
                                "El conejo es un mamífero herbívoro de la especie Oryctolagus cuniculus. Se caracteriza por tener un pelaje espeso, orejas largas, patas traseras fuertes y una cola cort",
                                style: normalText(),
                              ),
                              const SizedBox(height: 10.0),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2 -
                                            20,
                                    child: Text(
                                      "Age: 2 years",
                                      style: normalBoldText(),
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2 -
                                            20,
                                    child: Text(
                                      "Animal Type: Rabbit",
                                      style: normalBoldText(),
                                      textAlign: TextAlign.start,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 10.0),
                              SizedBox(
                                width: MediaQuery.of(context).size.width - 16,
                                child: Text(
                                  "Breed: Narna",
                                  style: normalBoldText(),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container petContainer(String url) {
    return Container(
      margin: const EdgeInsets.only(left: 8, right: 8, top: 20),
      height: MediaQuery.of(context).size.height / 2,
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
      child: Container(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Image.asset(
                url,
                height: 200,
              ),
            ),
            const Text("Josue"),
            const Text("Age: 2 years"),
            const Text("Breed: Perrito"),
            const Text(
                "Description: Aiusdhfopiashudfhápsdpfouiaspdoufhiaspkjdfnbapsdjkfbaskjdfbgh"),
            Container(
              margin: const EdgeInsets.only(top: 8, bottom: 8),
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 3,
                  separatorBuilder: (_, __) => const Divider(),
                  itemBuilder: (context, int index) {
                    return createTag("Amable");
                  }),
            ),
            Container(
              margin: const EdgeInsets.only(top: 8, bottom: 8),
              child: ElevatedButton(
                style: primaryButton,
                onPressed: () {},
                child: const Text(
                  "Login",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container createTag(String tag) {
    return Container(
      padding: const EdgeInsets.only(top: 8, bottom: 8, left: 20, right: 20),
      alignment: Alignment.center,
      color: Colors.blue,
      child: Text(
        tag,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
