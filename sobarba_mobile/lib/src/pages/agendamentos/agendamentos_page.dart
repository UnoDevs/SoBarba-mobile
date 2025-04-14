
import 'package:flutter/material.dart';
import 'package:sobarba_mobile/src/pages/agendamentos/widgets/card_table_widget.dart';
import 'package:sobarba_mobile/src/pages/utils/widgets/drawer_widget.dart';
import 'package:sobarba_mobile/src/pages/utils/widgets/gradient_decoration.dart';

class AgendamentosPage extends StatefulWidget {
  @override
  State<AgendamentosPage> createState() {
    return _AgendamentosPageState();
  }
}

class _AgendamentosPageState extends State<AgendamentosPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        title: Text("Agendamentos"),
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              Padding(
                padding: EdgeInsets.all(15),
                child: Container(
                  decoration: GradientDecoration.changeOnlyBorderRadius(BorderRadius.all(Radius.circular(40))),
                  child: Column(
                    children: [
                      SizedBox(
                        child: Align(
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 15, bottom: 30, left: 20),
                                child: Text(
                                  "Agendamentos",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontSize: 30,
                                  ),
                                ),
                              ),
                              SizedBox(width: 40),
                              SizedBox(
                                height: 20,
                                child: OutlinedButton(
                                  style: ButtonStyle(
                                    side: WidgetStatePropertyAll(BorderSide.none),
                                    foregroundColor: WidgetStatePropertyAll(Color.fromARGB(255, 255, 255, 255)),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pushReplacementNamed('/agendamentos/cadastro');
                                  },
                                  child: Row(
                                    spacing: 5,
                                    children: [
                                      Icon(Icons.add_circle_rounded, color: Color.fromARGB(255, 255, 255, 255),),
                                      Text("Add")
                                    ],
                                  ),
                                )
                              ),
                            ],
                          )
                        )
                      ),
                      Container(
                        padding: EdgeInsets.all(15),
                        child: CardTableWidget()
                      ),
                      // Container(
                      //   padding: EdgeInsets.all(15),
                      //   child: CardTableWidget()
                      // ),
                      // Container(
                      //   padding: EdgeInsets.all(15),
                      //   child: CardTableWidget()
                      // ),
                      // Container(
                      //   padding: EdgeInsets.all(15),
                      //   child: CardTableWidget()
                      // ),
                      // Container(
                      //   padding: EdgeInsets.all(15),
                      //   child: CardTableWidget()
                      // ),
                      // Container(
                      //   padding: EdgeInsets.all(15),
                      //   child: CardTableWidget()
                      // ),
                    ],
                  ),
                )
              )
            ]
          )
        ]
      ),
    );
  }
}
