import 'package:agemo/AgemoPages/PageClient/WidgetsClient/custom_shape.dart';
import 'package:agemo/AgemoPages/PageClient/WidgetsClient/infos_client.dart';
import 'package:flutter/material.dart';

import '../../../../models/client_model.dart';
import '../../app_bar.dart';
import '../../couleurs.dart';
import 'client_settings.dart';


class ProfilClient extends StatelessWidget {
  const ProfilClient(this.clientMod, {super.key});

  final ClientMod clientMod;

  @override
  Widget build(BuildContext context) {
    Widget content = const Scaffold(
      appBar: CustomAppBar(
        title: "Profil",
        function: CustomAppBarFunction.back,
      ),
      body: Text("No people found"),
    );
    content = SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(10),
            ),
            margin: const EdgeInsets.symmetric(vertical: 15,horizontal: 12),
            padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 8),
            child: Stack(
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            width: 300,
                            child: Text('${clientMod.nomClient}',
                              style:TextStyle(fontSize: 18, fontFamily: 'LatoBold'),)
                        ),
                        Text(
                          clientMod.adresseElectroniqueClient,
                          style:TextStyle(fontSize: 14, fontFamily: 'LatoRegular'),

                        ),
                        //const SizedBox(height: 20),
                        Text(
                          clientMod.numeroTelClient.toString(),
                          style:TextStyle(fontSize: 14, fontFamily: 'LatoRegular'),
                        ),
                        Container(
                          width: 350,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              '${clientMod.adresseClient} ${clientMod.villeClient} ${clientMod.npnClient} ${clientMod.localiteClient}',
                              style:TextStyle(fontSize: 14, fontFamily: 'LatoRegular'),
                            ),
                          ),
                        )
                      ]
                          .map((widget) => Padding(
                        padding:
                        const EdgeInsets.symmetric(vertical: 5),
                        child: widget,
                      ))
                          .toList(),
                    ),
                  ],
                ),
              ],
            ),
          ),
          InfosClient(Icons.house_outlined,'Adresse:',clientMod.adresseClient),
          InfosClient(Icons.holiday_village_outlined,'Ville:',clientMod.villeClient),
          InfosClient(Icons.pin_drop_outlined,'Localité:',clientMod.localiteClient),
          InfosClient(Icons.store_mall_directory_outlined,'Code postal:',clientMod.npnClient.toString()),
          InfosClient(Icons.phone_android_outlined,'Téléphone:',clientMod.numeroTelClient.toString()),
          InfosClient(Icons.mail_outline,'Adresse mail:',clientMod.adresseElectroniqueClient),
        ],
      ),
    );
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: CustomAppBar(
        title: "Profil",
        function: CustomAppBarFunction.back,
      ),
      body: content,
    );
  }
}
