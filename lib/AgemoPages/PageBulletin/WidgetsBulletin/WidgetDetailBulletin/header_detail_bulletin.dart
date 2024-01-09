
import 'package:flutter/material.dart';

import '../../../../../models/bulletin_model.dart';
import '../../../couleurs.dart';
class HeaderDetailBulletin extends StatelessWidget {
  const HeaderDetailBulletin(this.bullhead, {Key? key}) : super(key: key);
  final BulletinMod bullhead;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('No BL',
                style:TextStyle(fontSize: 15, fontFamily: 'LatoBold'),),
              Text(bullhead.numeroBul.toString(),
                style:TextStyle(fontSize: 15, fontFamily: 'LatoRegular'),),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Date RDV',
                style:TextStyle(fontSize: 14, fontFamily: 'LatoBold'),),
              Text(bullhead.date,
                style:TextStyle(fontSize: 15, fontFamily: 'LatoRegular'),),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Heure RDV',
                style:TextStyle(fontSize: 14, fontFamily: 'LatoBold'),),
              Text(bullhead.heure,
                style:TextStyle(fontSize: 15, fontFamily: 'LatoRegular'),),
            ],
          ),
        ],
      ),
    );
  }
}