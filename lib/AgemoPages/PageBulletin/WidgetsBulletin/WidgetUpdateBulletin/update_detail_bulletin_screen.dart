import 'package:agemo/AgemoPages/PageBulletin/WidgetsBulletin/WidgetDetailBulletin/destination_detail_bulletin.dart';
import 'package:flutter/material.dart';

import '../../../../../models/bulletin_model.dart';
import '../../../../../models/produit_model.dart';
import '../../../PageConnexion/WidgetsConnexion/styled_button.dart';
import '../../../app_bar.dart';
import '../../../couleurs.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class UpdateDetailBulletin extends StatefulWidget {
  UpdateDetailBulletin(this.bulletin, this.produit, {Key? key}) : super(key: key);
  final BulletinMod bulletin;
  final ProduitMod produit;

  @override
  State<UpdateDetailBulletin> createState() => _UpdateDetailBulletinState();
}

class _UpdateDetailBulletinState extends State<UpdateDetailBulletin> {
  String dropdownvalue = '';

  @override
  void initState() {
    dropdownvalue = widget.bulletin.statutlivraison;
    super.initState();
  }

  var items = [
    'Livré',
    'En attente',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Mise à jour", function: CustomAppBarFunction.back),
      backgroundColor: Colors.grey.shade50,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'No BL',
                    style:TextStyle(fontSize: 15, fontFamily: 'LatoBold'),
                  ),
                  Text(widget.bulletin.numeroBul.toString(),
                    style:TextStyle(fontSize: 14, fontFamily: 'LatoRegular'),),
                ],
              ),
              DestinationDetailBulletin(widget.bulletin),
              Container(
                width: MediaQuery.of(context).size.width ,
                //color: Colors.yellow,
                height: 80,
                child: Card(
                    color: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Statut bulletin',
                          style:TextStyle(fontSize: 14, fontFamily: 'LatoRegular'),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Container(
                              width: 300,
                              decoration: const BoxDecoration(color: Colors.white),
                              child: DropdownButton2(
                                value: dropdownvalue,
                                underline: const SizedBox(),
                                isExpanded: true,
                                items: items.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 14,
                                          height: 14,
                                          padding: const EdgeInsets.all(3),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(20),
                                              color: dropdownvalue == 'Livré'? Colors.green: const Color.fromARGB(255, 229, 36, 36),),
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Text(
                                          items,
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownvalue = newValue!;
                                  });

                                },
                              ),
                            ),
                          ),
                        )
                      ],
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Container(
                  width: double.infinity,
                  height: 250,
                  child: Card(
                    color: Colors.white,
                    elevation: 0,
                    //shadowColor: Colors.blueGrey,
                    //elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 12, bottom: 12, right: 12, left: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Commentaire livreur',
                            style:TextStyle(fontSize: 14, fontFamily: 'LatoLight'),),
                          const TextField(
                            maxLines: 7, //or null
                            decoration: InputDecoration.collapsed(border: InputBorder.none, hintText: ''),),
                        ],
                      ),
                    ),
                  ),

                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                child:StyledButton(
                  text: "Mettre à jour",
                  onPressed:(){},
                  color: const Color.fromARGB(255, 229, 36, 36),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
