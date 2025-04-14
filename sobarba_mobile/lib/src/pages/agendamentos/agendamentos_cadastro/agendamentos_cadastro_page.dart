
import 'package:flutter/material.dart';
import 'package:sobarba_mobile/src/pages/utils/widgets/drawer_widget.dart';
import 'package:sobarba_mobile/src/pages/utils/widgets/gradient_decoration.dart';

class AgendamentosCadastroPage extends StatelessWidget {
  const AgendamentosCadastroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        title: Text("Agendamentos"),
      ),
      body: Stack(
        children: [
          Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Card(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                            child: Column(
                              children: [
                                Text(
                                  "Cadastro de Agendamento",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 42),
                                    fontSize: 30,
                                  ),
                                ),
                                Card(
                                  color: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                  child: Container(
                                    decoration: GradientDecoration.changeOnlyBorderRadius(BorderRadius.all(Radius.circular(20))),
                                    child: Padding(
                                      padding: EdgeInsets.all(15), 
                                      child: Column(
                                        spacing: 10,
                                        children: [
                                          TextField(
                                            onChanged: (text) {
                                            
                                            },
                                            style: TextStyle(
                                              color: Color.fromARGB(255, 0, 0, 42)
                                            ),
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Color.fromARGB(255,255, 255, 255),
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                                borderRadius: BorderRadius.all(Radius.circular(50.0))
                                              ),
                                              labelText: "Nome Cliente",
                                              labelStyle: TextStyle(
                                                color: Color.fromARGB(255,184, 184, 214)
                                              ),
                                            ),
                                          ),
                                          TextField(
                                            onChanged: (text) {
                                            
                                            },
                                            style: TextStyle(
                                              color: Color.fromARGB(255, 0, 0, 42)
                                            ),
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Color.fromARGB(255,255, 255, 255),
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                                borderRadius: BorderRadius.all(Radius.circular(50.0))
                                              ),
                                              labelText: "Serviço",
                                              labelStyle: TextStyle(
                                                color: Color.fromARGB(255,184, 184, 214)
                                              ),
                                            ),
                                          ),
                                          TextField(
                                            onChanged: (text) {
                                            
                                            },
                                            style: TextStyle(
                                              color: Color.fromARGB(255, 0, 0, 42)
                                            ),
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Color.fromARGB(255,255, 255, 255),
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                                borderRadius: BorderRadius.all(Radius.circular(50.0))
                                              ),
                                              labelText: "Data",
                                              labelStyle: TextStyle(
                                                color: Color.fromARGB(255,184, 184, 214)
                                              ),
                                            ),
                                          ),
                                          TextField(
                                            onChanged: (text) {
                                            
                                            },
                                            style: TextStyle(
                                              color: Color.fromARGB(255, 0, 0, 42)
                                            ),
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Color.fromARGB(255,255, 255, 255),
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                                borderRadius: BorderRadius.all(Radius.circular(50.0))
                                              ),
                                              labelText: "Horario",
                                              labelStyle: TextStyle(
                                                color: Color.fromARGB(255,184, 184, 214)
                                              ),
                                            ),
                                          ),
                                          TextField(
                                            textAlign: TextAlign.justify,
                                            onChanged: (text) {
                                            
                                            },
                                            style: TextStyle(
                                              color: Color.fromARGB(255, 0, 0, 42),
                                            ),
                                            maxLines: 10,
                                            decoration: InputDecoration(
                                              alignLabelWithHint: true,
                                              filled: true,
                                              fillColor: Color.fromARGB(255,255, 255, 255),
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                                borderRadius: BorderRadius.all(Radius.circular(25.0))
                                              ),
                                              labelText: "Descrição",
                                              labelStyle: TextStyle(
                                                color: Color.fromARGB(255,184, 184, 214)
                                              ),
                                            ),
                                          ),
                                          Container(
                                            child: Row(
                                              spacing: 70,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                ElevatedButton(
                                                  style: ButtonStyle(
                                                    side: WidgetStatePropertyAll(BorderSide.none),
                                                    foregroundColor: WidgetStatePropertyAll(Color.fromARGB(255, 0, 0, 42),),
                                                  ),
                                                  onPressed: () {
                                                    Navigator.of(context).pushReplacementNamed('/agendamentos');
                                                  },
                                                  child: Text("Voltar")
                                                ),
                                                ElevatedButton(
                                                  style: ButtonStyle(
                                                    side: WidgetStatePropertyAll(BorderSide.none),
                                                    foregroundColor: WidgetStatePropertyAll(Color.fromARGB(255, 0, 0, 42),),
                                                  ),
                                                  onPressed: () {
                                                    Navigator.of(context).pushReplacementNamed('/agendamentos');
                                                  },
                                                  child: Text("Salvar")
                                                ),
                                              ],
                                            ),
                                          )
                                          
                                        ]
                                      )
                                    )
                                  ) 
                                )
                              ],
                            ) 
                          ) 
                        ) 
                      ),
                    ), 
                  )
                ],
              ),
            )
          )
        ],
      ),
    );
  }
}