import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:quickalert/quickalert.dart';
import '../../PagesProduit/produit_screen.dart';
import '../../couleurs.dart';
import '../client_screen.dart';
import 'ajout_produit_client.dart';

class HeureLivraison extends StatefulWidget {
  const HeureLivraison({super.key});

  @override
  State<HeureLivraison> createState() => _HeureLivraisonState();
}

class _HeureLivraisonState extends State<HeureLivraison> {

  TextEditingController dateInput = TextEditingController();
  TextEditingController heureInputstart = TextEditingController();
  TextEditingController heureInputend = TextEditingController();
  int heureInputstartMin = 0;
  int heureInputstartEnd = 0;
  int differenceHeure = 0;

  String showAlert(String message){
    QuickAlert.show(
        context: context,
        title: 'succès',
        confirmBtnText: 'OK',
        confirmBtnColor: appbarColor,
        text: message,
        type: QuickAlertType.success,
      onConfirmBtnTap: (){
          Navigator.of(context).pop();
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>ClientScreen()),
        );
      },

    );
    return message;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Heure livraison',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'PoppinsBold',
            fontSize: 16,
          ),
        ),
        centerTitle: true,
        backgroundColor: appbarColor,
      ),
      body: Container(
        color: Colors.grey.shade50,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                  child:
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                          child: Divider(color: Colors.black38,indent: 10,endIndent: 10)
                      ),

                      Text("Créneau livraison", style:TextStyle(fontSize: 16, fontFamily: 'LatoRegular'),),

                      Expanded(
                          child: Divider(color: Colors.black38,indent: 10,endIndent: 10,)
                      ),
                    ]
                ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width/2.3,
                         //decoration: BoxDecoration(color: Colors.red),
                        child: TextFormField(
                          controller: heureInputstart,
                          decoration: InputDecoration(
                            labelText: "début",
                            labelStyle: const TextStyle(
                                fontFamily: 'PoppinsRegular', fontSize: 14),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: appbarColor,
                              ),
                            ),
                            prefixIcon: Icon(
                              Icons.query_builder_outlined,
                              color: appbarColor,
                            ),
                            fillColor: Colors.white,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Sélectionnez une heure';
                            }
                            return null;
                          },
                          readOnly: true,
                          onTap: () async {
                            var time = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                              builder: (context, child) {
                                return Localizations.override(
                                  context: context,
                                  locale: const Locale("fr", "FR"),
                                  child: Theme(
                                    data: Theme.of(context).copyWith(
                                      colorScheme: ColorScheme.light(
                                        primary: appbarColor, // <-- SEE HERE
                                        onPrimary: Colors.white, // <-- SEE HERE
                                        onSurface: Colors.grey, // <-- SEE HERE
                                      ),
                                      textButtonTheme: TextButtonThemeData(
                                        style: TextButton.styleFrom(
                                          primary:
                                          appbarColor, // button text color
                                        ),
                                      ),
                                    ),
                                    child: child!,
                                  ),
                                );
                              },
                            );
                            if (time != null) {
                              setState(() {
                                if (time.hour < 10 && time.minute < 10) {
                                  heureInputstart.text =
                                  "0${time.hour}h:0${time.minute}min";
                                  heureInputstartMin =
                                      time.hour * 60 + time.minute;
                                }
                                if (time.hour < 10 && time.minute >= 10) {
                                  heureInputstart.text =
                                  "0${time.hour}h:${time.minute}min";
                                  heureInputstartMin =
                                      time.hour * 60 + time.minute;
                                }
                                if (time.hour >= 10 && time.minute >= 10) {
                                  heureInputstart.text =
                                  "${time.hour}h:${time.minute}min";
                                  heureInputstartMin =
                                      time.hour * 60 + time.minute;
                                }
                                if (time.hour >= 10 && time.minute < 10) {
                                  heureInputstart.text =
                                  "${time.hour}h:0${time.minute}min";
                                  heureInputstartMin =
                                      time.hour * 60 + time.minute;
                                }
                              });
                            }
                          },
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width/2.3,
                        //decoration: BoxDecoration(color: Colors.blue),
                        child: TextFormField(
                          controller: heureInputend,
                          decoration: InputDecoration(
                            labelText: "Fin",
                            labelStyle: const TextStyle(
                                fontFamily: 'PoppinsRegular', fontSize: 14),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: appbarColor,
                              ),
                            ),
                            prefixIcon: Icon(
                              Icons.query_builder_outlined,
                              color: appbarColor,
                            ),
                            fillColor: Colors.white,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Sélectionnez une heure';
                            }
                            return null;
                          },
                          readOnly: true,
                          onTap: () async {
                            var time = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                              builder: (context, child) {
                                return Localizations.override(
                                  context: context,
                                  locale: const Locale("fr", "FR"),
                                  child: Theme(
                                    data: Theme.of(context).copyWith(
                                      colorScheme: ColorScheme.light(
                                        primary: appbarColor, // <-- SEE HERE
                                        onPrimary: Colors.white, // <-- SEE HERE
                                        onSurface: Colors.grey, // <-- SEE HERE
                                      ),
                                      textButtonTheme: TextButtonThemeData(
                                        style: TextButton.styleFrom(
                                          primary:
                                          appbarColor, // button text color
                                        ),
                                      ),
                                    ),
                                    child: child!,
                                  ),
                                );
                              },
                            );
                            if (time != null) {
                              setState(() {
                                if (time.minute < 10) {
                                  heureInputend.text =
                                  "${time.hour}h: 0${time.minute}min";
                                  heureInputstartEnd =
                                      time.hour * 60 + time.minute;
                                  differenceHeure =
                                      heureInputstartEnd - heureInputstartMin;
                                } else {
                                  heureInputend.text =
                                  "${time.hour}h:${time.minute}min";
                                  heureInputstartEnd =
                                      time.hour * 60 + time.minute;
                                  differenceHeure =
                                      heureInputstartEnd - heureInputstartMin;
                                }
                              });
                              setState(() {
                                if (time.hour < 10 && time.minute < 10) {
                                  heureInputend.text =
                                  "0${time.hour}h:0${time.minute}min";
                                  heureInputstartEnd =
                                      time.hour * 60 + time.minute;
                                  differenceHeure =
                                      heureInputstartEnd - heureInputstartMin;
                                }
                                if (time.hour < 10 && time.minute >= 10) {
                                  heureInputend.text =
                                  "0${time.hour}h:${time.minute}min";
                                  heureInputstartEnd =
                                      time.hour * 60 + time.minute;
                                  differenceHeure =
                                      heureInputstartEnd - heureInputstartMin;
                                }
                                if (time.hour >= 10 && time.minute >= 10) {
                                  heureInputend.text =
                                  "${time.hour}h:${time.minute}min";
                                  heureInputstartEnd =
                                      time.hour * 60 + time.minute;
                                  differenceHeure =
                                      heureInputstartEnd - heureInputstartMin;
                                }
                                if (time.hour >= 10 && time.minute < 10) {
                                  heureInputend.text =
                                  "${time.hour}h:0${time.minute}min";
                                  heureInputstartEnd =
                                      time.hour * 60 + time.minute;
                                  differenceHeure =
                                      heureInputstartEnd - heureInputstartMin;
                                }
                              });
                            }
                          },
                        ),
                      ),
                    ],
                  )
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                  child:
                  Row(
                      children: <Widget>[
                        Expanded(
                            child: Divider(color: Colors.black38,indent: 10,endIndent: 10)
                        ),

                        Text("Remarques livraison",style:TextStyle(fontSize: 16, fontFamily: 'LatoRegular'),),

                        Expanded(
                            child: Divider(color: Colors.black38,indent: 10,endIndent: 10,)
                        ),
                      ]
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Container(
                    width: double.infinity,
                    height: 250,
                    child: Card(
                      color: Colors.white,
                      //shadowColor: Colors.blueGrey,
                      //elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.only(top: 12, bottom: 12, right: 12, left: 25),
                        child: TextField(
                          maxLines: 8, //or null
                          decoration: InputDecoration.collapsed(border: InputBorder.none, hintText: ''),),
                      ),
                    ),

                  ),
                ),
                const SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16)),
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      if (differenceHeure < 0) {
                          showDialog(
                            context: context,
                            builder: (ctx) => Center(
                              child: AlertDialog(
                                backgroundColor: Colors.white,
                                title: const Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Choix d'heure incorrect!",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'PoppinsBold'),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "l'heure de début doit être ",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'PoppinsRegular'),
                                    ),
                                    Text(
                                      "supérieure à l'heure finale",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'PoppinsRegular'),
                                    )
                                  ],
                                ),
                                actions: <Widget>[
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    style: ButtonStyle(
                                        shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                            // Change your radius here
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                        ),
                                        backgroundColor:
                                        MaterialStateProperty.all(
                                            appbarColor)),
                                    child: const Text(
                                      "Ok",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'PoppinsMedium',
                                          color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }
                      else{
                        showAlert('Votre commande a bien été enregistrée !');
                      }
                    },
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            // Change your radius here
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        backgroundColor:
                        MaterialStateProperty.all(appbarColor)),
                    child: const Text(
                      'VALIDER COMMANDE',
                      style:TextStyle(fontSize: 16, fontFamily: 'LatoRegular')
                    ),
                  ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
