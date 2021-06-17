import 'dart:async';
import 'package:flutter/material.dart';
import 'package:perguntas/componets/avatarInfo.dart';
import 'package:perguntas/componets/barBotton.dart';
import 'package:perguntas/componets/containerHalf.dart';
import 'package:perguntas/componets/dialog.dart';
import 'package:perguntas/componets/load.dart';
import 'package:perguntas/componets/scrollHorizontCard.dart';
import 'package:perguntas/formateNumber.dart';
import 'package:perguntas/model/modelCountry.dart';

class IndexApp extends StatefulWidget {
  // const IndexApp({ Key? key }) : super(key: key);
  @override
  _IndexAppState createState() => _IndexAppState();
}

class _IndexAppState extends State<IndexApp> {
  var modelCoutry = ModelCountry();
  final List x = [];
  Widget coutry = AvatarInfo(
    load: true,
    img: 'assets/img/br.png',
    title: 'BRASIL',
    data: [],
  );
  Widget regions = PreLoad();

  loadCautry(val) {
    setState(() {
      coutry = val;
    });
  }

  loadregion(val) {
    setState(() {
      regions = val;
    });
  }

  @override
  void initState() {
    createCountry();
    creatRegions();
    /*   Timer(Duration(seconds: 5), () {
    }); */
    super.initState();
  }

  var f = FormateNumber();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BarBotton(),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              coutry,
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text('Regiões',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 10.0,
                ),
                child: regions,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future createCountry() async {
    await modelCoutry.getCountry();

    List<Widget> containers = [];
    containers.add(ContainerHalf(
      title: 'Doentes',
      data: [
        {'title': 'Total', 'value': f.format(modelCoutry.confirmados[0].total)},
        {'title': 'Novos', 'value': f.format(modelCoutry.confirmados[0].novos)},
        {
          'title': 'Recuperados',
          'value': f.format(modelCoutry.confirmados[0].recuperados),
        },
      ],
    ));
    containers.add(ContainerHalf(
      title: 'Mortos',
      data: [
        {'title': 'Total', 'value': f.format(modelCoutry.obitos[0].total)},
        {'title': 'Novos', 'value': f.format(modelCoutry.obitos[0].novos)},
      ],
    ));
    loadCautry(AvatarInfo(
      img: 'assets/img/br.png',
      title: 'BRASIL',
      data: containers,
    ));
  }

  double calcScreen() {
    double total = MediaQuery.of(context).size.width;
    return total >= 360 ? total - 20 : total - 100.0;
  }

  Widget listaData(data) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 300.0,
          width: calcScreen(),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.grey[850],
                    elevation: 30.0,
                    shadowColor: Colors.white30,
                    child: Container(
                      height: 80.0,
                      width: double.infinity,
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(bottom: 8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        /*  Padding(
                                           padding: const EdgeInsets.only(right: 10.0),
                                           child: Icon(
                                             Icons.coronavirus,
                                             color: Colors.white70,
                                             size: 24.0,
                                           ),
                                         ), */
                                        Text(
                                          '${data[index]['name']}:',
                                          style: TextStyle(
                                            color: Colors.blueGrey,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(right: 8.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Casos: ',
                                          style: TextStyle(
                                            color: Colors.white70,
                                            fontSize: 18.0,
                                          ),
                                        ),
                                        Text(
                                          f.format(data[index]['totalCasos']),
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 18.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        Text(
                                          'Mortes: ',
                                          style: TextStyle(
                                            color: Colors.white70,
                                            fontSize: 18.0,
                                          ),
                                        ),
                                        Text(
                                          f.format(data[index]['totalObitos']),
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 18.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                  /* ListTile(
                     title: Text('${data[index]['name']}'),
                     subtitle: Text('OK'),
                   ); 
                   */
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  void openDialog({title, body}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialogs(
          title: title,
          body: listaData(body),
        );
      },
    );
  }

  Future creatRegions() async {
    await modelCoutry.getRegion();
    Map sul = calcCovid(modelCoutry.totalSul());
    Map suldeste = calcCovid(modelCoutry.totalSuldeste());
    Map centroOeste = calcCovid(modelCoutry.totalCentroOeste());
    Map nordeste = calcCovid(modelCoutry.totalNordeste());
    Map norte = calcCovid(modelCoutry.totalNorte());
    List containers = [];

    containers.add(GestureDetector(
      onTap: () => {
        openDialog(
          title: 'Sul',
          body: modelCoutry.totalSul(),
        ),
      },
      child: ContainerHalf(
        margin: 0.0,
        title: 'Sul',
        data: [
          {'title': 'Casos', 'value': sul['totalCasos']},
          {'title': 'Mortos', 'value': sul['totalObitos']},
        ],
      ),
    ));
    containers.add(GestureDetector(
        onTap: () => {
              openDialog(
                title: 'Suldeste',
                body: modelCoutry.totalSuldeste(),
              ),
            },
        child: ContainerHalf(
          margin: 0.0,
          title: 'Suldeste',
          data: [
            {'title': 'Casos', 'value': suldeste['totalCasos']},
            {'title': 'Mortos', 'value': suldeste['totalObitos']},
          ],
        )));
    containers.add(GestureDetector(
        onTap: () => {
              openDialog(
                title: 'Centro-Oeste',
                body: modelCoutry.totalCentroOeste(),
              ),
            },
        child: ContainerHalf(
          margin: 0.0,
          title: 'Centro-Oeste',
          data: [
            {'title': 'Casos', 'value': centroOeste['totalCasos']},
            {'title': 'Mortos', 'value': centroOeste['totalObitos']},
          ],
        )));
    containers.add(GestureDetector(
        onTap: () => {
              openDialog(
                title: 'Nordeste',
                body: modelCoutry.totalNordeste(),
              ),
            },
        child: ContainerHalf(
          margin: 0.0,
          title: 'Nordeste',
          data: [
            {'title': 'Casos', 'value': nordeste['totalCasos']},
            {'title': 'Mortos', 'value': nordeste['totalObitos']},
          ],
        )));
    containers.add(GestureDetector(
        onTap: () => {
              openDialog(
                title: 'Nordeste',
                body: modelCoutry.totalNorte(),
              ),
            },
        child: ContainerHalf(
          margin: 0.0,
          title: 'Norte',
          data: [
            {'title': 'Casos', 'value': norte['totalCasos']},
            {'title': 'Mortos', 'value': norte['totalObitos']},
          ],
        )));

    loadregion(
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ScrollHorizontCard(
            body: containers,
          )
        ],
      ),
    );
  }

  Map calcCovid(List val) {
    int casos = 0;
    int mortos = 0;
    val.forEach((element) {
      casos += element['totalCasos'];
      mortos += element['totalObitos'];
    });
    return {
      'totalCasos': f.format(casos),
      'totalObitos': f.format(mortos),
    };
  }
}
