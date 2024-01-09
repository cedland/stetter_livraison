import 'package:agemo/AgemoPages/PageBulletin/WidgetsBulletin/WidgetDetailBulletin/map_screen.dart';

import 'package:flutter/material.dart';
import '../../../../../models/bulletin_model.dart';
import '../../../couleurs.dart';
import 'package:url_launcher/url_launcher.dart';

class DestinationDetailBulletin extends StatelessWidget {
  const DestinationDetailBulletin(this.bulldestination, {Key? key}) : super(key: key);
  final BulletinMod bulldestination;


  @override
  Widget build(BuildContext context) {
    const String _url = 'https://www.google.com/maps/place/Av.+Mon-Repos+113,+1005+Lausanne,+Switzerland/@46.5185687,6.6399148,17z/data=!4m5!3m4!1s0x478c2e4aed46190b:0xcadf43e5341b149d!8m2!3d46.5185087!4d6.6418004?entry=ttu';

    void _launchURL() async {
      if (!await launch(_url)) throw 'Could not launch $_url';
    }
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0,top: 10),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Destination livraison',
                style:TextStyle(fontSize: 14, fontFamily: 'LatoBold'),
              ),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  bulldestination.destination,
                  style:TextStyle(fontSize: 14, fontFamily: 'LatoRegular'),
                ),
              ),
            ],
          ),
          const Spacer(),
          Container(
              margin: EdgeInsets.symmetric(vertical: 6),
              width: 40,
              height: 40,
              padding: const EdgeInsets.all(1),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color:  appbarColor
              ),
              child: IconButton(
                onPressed: _launchURL,
                icon: Icon(Icons.language),
                iconSize: 20,
                color: Colors.white,
              )),
        ],
      ),
    );
  }
}
