import 'package:flutter/material.dart';

import '../../couleurs.dart';

class InfosClient extends StatelessWidget {
  const InfosClient(this.iconeInfos, this.textInfos, this.clientInfos,
      {super.key});

  final IconData iconeInfos;
  final String textInfos;
  final String clientInfos;

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 2),
        child: Card(
          elevation: 0,
          child: ListTile(
            leading: Icon(iconeInfos),
            title: Text(textInfos,style:TextStyle(fontSize: 16, fontFamily: 'LatoBold')),
            subtitle: Text(clientInfos,style:TextStyle(fontSize: 14, fontFamily: 'LatoRegular'),
          ),
        ),
      ),
      ),
    );
  }
}
