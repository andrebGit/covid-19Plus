import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:perguntas/model/country.dart';
import 'package:perguntas/model/modelRegion.dart';

class ModelCountry {
  var _confirmados = [];
  var _obitos = [];
  var _sudeste = [];
  var _nordeste = [];
  var _sul = [];
  var _centroOeste = [];
  var _norte = [];

  Future getCountry() async {
    var url = Uri.https('xx9p7hp1p7.execute-api.us-east-1.amazonaws.com',
        '/prod/PortalGeralApi');
    var resp = await http.get(url);
    if (resp.statusCode == 200) {
      var respJson = json.decode(resp.body);
      List<dynamic> confirm = [
        respJson['confirmados'],
      ];
      List<dynamic> obitosArr = [
        respJson['obitos'],
      ];
      _confirmados = confirm.map((e) => Confirmados.fromJson(e)).toList();
      _obitos = obitosArr.map((e) => Obitos.fromJson(e)).toList();
    } else {
      throw Exception('Erro ao carregar os dados');
    }
  }

  List get confirmados {
    return _confirmados;
  }

  List get obitos {
    return _obitos;
  }

  Future getRegion() async {
    var url = Uri.https('xx9p7hp1p7.execute-api.us-east-1.amazonaws.com',
        '/prod/PortalRegiaoUf');
    var resp = await http.get(url);
    if (resp.statusCode == 200) {
      var respHttp = jsonDecode(resp.body);
      // return respHttp;
      List<dynamic> sudesteArr = [
        respHttp['Sudeste'],
      ];
      List<dynamic> nordesteArr = [
        respHttp['Nordeste'],
      ];
      List<dynamic> sulArr = [
        respHttp['Sul'],
      ];
      List<dynamic> centroOesteArr = [
        respHttp['Centro-Oeste'],
      ];
      List<dynamic> norteArr = [
        respHttp['Norte'],
      ];
      // print(suldoesteArr[0]['SP']);
      _sudeste = sudesteArr.map((e) => Sudeste.fromJson(e)).toList();
      _nordeste = nordesteArr.map((e) => Nordeste.fromJson(e)).toList();
      _sul = sulArr.map((e) => Sul.fromJson(e)).toList();
      _centroOeste =
          centroOesteArr.map((e) => CentroOeste.fromJson(e)).toList();
      _norte = norteArr.map((e) => Norte.fromJson(e)).toList();
    } else {
      throw Exception('Erro ao carregar os dados');
    }
  }

  List get sudeste {
    return _sudeste;
  }

  List get nordeste {
    return _nordeste;
  }

  List get sul {
    return _sul;
  }

  List get centroOeste {
    return _centroOeste;
  }

  List get norte {
    return _norte;
  }

  List calcAll(Map data) {
    List<Map> totalCaosObto = data.entries.map((e) {
      int index = e.value['semana'].length - 1;
      return {
        'title': '',
        'name': e.key,
        'totalCasos': e.value['semana'][index]['casosAcumulado'],
        'totalObitos': e.value['semana'][index]['obitosAcumulado'],
      };
    }).toList();

    return totalCaosObto;
  }

  List<dynamic> totalSul() {
    var arr = this.sul[0];
    return calcAll(arr.toJson());
  }

  List<dynamic> totalSuldeste() {
    var arr = this.sudeste[0];
    return calcAll(arr.toJson());
  }

  List<dynamic> totalNordeste() {
    var arr = this.nordeste[0];
    return calcAll(arr.toJson());
  }

  List<dynamic> totalCentroOeste() {
    var arr = this.centroOeste[0];
    return calcAll(arr.toJson());
  }

  List<dynamic> totalNorte() {
    var arr = this.norte[0];
    return calcAll(arr.toJson());
  }
}
