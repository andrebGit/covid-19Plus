import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

class WhoWeAre extends StatelessWidget {
  //const WhoWeAre({ Key? key }) : super(key: key);
  final Object stlAll = TextStyle(
    color: Colors.grey,
    fontSize: 14,
  );
  final Object stlEmail = TextStyle(
    color: Colors.red,
    fontSize: 14,
  );

  // const WhoWeAre({Key key, this.stlAll) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450.0,
      width: MediaQuery.of(context).size.width - 100,
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Row(
            children: [
              Image(
                width: 50,
                image: AssetImage('assets/img/logo.png'),
              ),
              Text(
                'COVID-19 Plus',
                style: Theme.of(context).textTheme.headline6,
              ),
            ],
          ),
          Text(
            'Versão Beta 0.2',
            style: stlAll,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'COVID-19 Plus é uma vesão Beta, para informar os casos de Covid-19',
              style: stlAll,
            ),
          ),
          Text(
            'Gostou do aplicativo, deseja pagar um café?\nEntre em contato',
            style: stlAll,
          ),
          Text(
            'E-mail:',
            style: Theme.of(context).textTheme.headline6,
          ),
          TextButton(
            onPressed: () => openEmail('andreb@rede.ulbra.br'),
            child: Text(
              'andreb@rede.ulbra.br',
              style: stlEmail,
            ),
          ),
          TextButton(
            onPressed: () => openEmail('aldisseia@gmailcom'),
            child: Text(
              'aldisseia@gmail.com',
              style: stlEmail,
            ),
          ),
          TextButton(
            onPressed: () => openUrl(),
            child: Text('Nosso facebook'),
          ),
        ],
      ),
    );
  }

  openUrl() async {
    const url = 'https://www.facebook.com/4lastpg';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Erro ao chamar $url';
    }
  }

  openEmail(mail) async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: mail,
      query: 'subject=app COVID-19 plus&body=Digite aqui a sua mensagem: ',
    );
    String url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Erro ao chamar $url');
    }
  }
}
