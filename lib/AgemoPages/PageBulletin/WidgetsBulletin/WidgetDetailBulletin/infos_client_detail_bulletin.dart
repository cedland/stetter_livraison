import 'package:flutter/material.dart';

import '../../../../../models/bulletin_model.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import '../../../couleurs.dart';

class InfosClientDetailBulletin extends StatefulWidget {
  const InfosClientDetailBulletin(this.bulldestination, {super.key});

  final BulletinMod bulldestination;

  @override
  State<InfosClientDetailBulletin> createState() => _InfosClientDetailBulletinState();
}

class _InfosClientDetailBulletinState extends State<InfosClientDetailBulletin> {
  String statut = '';

  @override
  void initState() {
    statut = widget.bulldestination.statutlivraison;
    super.initState();
  }

  void _showDecline() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: Center(
                  child: Text(
                    "Changer de statut",
                    style: TextStyle(fontSize: 16, fontFamily: 'LatoBold'),
                  )),
              content:
              Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                Text(
                  "sélectionner une option.",
                  style: TextStyle(fontSize: 14, fontFamily: 'LatoRegular'),
                ),
                const SizedBox(height: 10,),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Center(
                    child: DropdownButton2<String>(
                      value: statut,
                      underline: Container(),
                      items: <String>[
                        'En attente',
                        'absent',
                        'Livré',
                      ].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Center(
                            child: Text(
                              value,
                              style: TextStyle(fontSize: 13, fontFamily: 'LatoRegular'),
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? Value) {
                        setState(() {
                          statut = Value!;
                        });
                      },
                    ),
                  ),
                ),
              ]),
              actions: <Widget>[
                // usually buttons at the bottom of the dialog
                TextButton(
                  child: Text(
                    "Fermer",
                    style: TextStyle(fontSize: 16, fontFamily: 'LatoBold',color: const Color.fromARGB(255, 229, 36, 36),),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 180,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
        child: Column(
          children: [
            Container(
                width: double.infinity,
                height: 70,
                decoration: const BoxDecoration(color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15,),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Information client',
                        style:TextStyle(fontSize: 14, fontFamily: 'LatoBold'),
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          '${widget.bulldestination.nomClient} - ${widget.bulldestination.codeCommande.toString()}',
                          style:TextStyle(fontSize: 14, fontFamily: 'LatoRegular'),
                        ),
                      ),
                    ],
                  ),
                )),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(color: Colors.white),
              child: Divider(
                color: Colors.grey[300],
                indent: 10,
                endIndent: 10,
                thickness: 1,
              ),
            ),
            Container(
              width: double.infinity,
              height: 90,
              decoration: const BoxDecoration(color: Colors.white),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            'Nb produits',
                            style:TextStyle(fontSize: 14, fontFamily: 'LatoBold'),
                          ),
                        ),
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            widget.bulldestination.qteBul.toString(),
                            style:TextStyle(fontSize: 14, fontFamily: 'LatoRegular'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: VerticalDivider(
                      color: Colors.grey[300],
                      width: 80,
                      indent: 15,
                      endIndent: 15,
                      thickness: 1,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 6.0),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            'Statut',
                            style:TextStyle(fontSize: 14, fontFamily: 'LatoBold'),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: widget.bulldestination.statut
                              ? Colors.green
                              : const Color.fromARGB(255, 229, 36, 36),
                        ),
                        onPressed: _showDecline,
                        child: Center(
                          child: widget.bulldestination.statut
                              ? FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              'Livré',
                              style:TextStyle(fontSize: 14, fontFamily: 'LatoRegular'),
                              textAlign: TextAlign.center,
                            ),
                          )
                              : FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              'En attente',
                              style:TextStyle(fontSize: 14, fontFamily: 'LatoRegular'),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: VerticalDivider(
                      color: Colors.grey[300],
                      width: 80,
                      indent: 15,
                      endIndent: 15,
                      thickness: 1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                         FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            'Total',
                            style:TextStyle(fontSize: 14, fontFamily: 'LatoBold'),
                          ),
                        ),
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            '${widget.bulldestination.totalBul.toString()} CHF',
                            style:TextStyle(fontSize: 14, fontFamily: 'LatoRegular'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
