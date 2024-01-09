import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

import '../../../couleurs.dart';
import '../../bulletin_screen.dart';

class ShowDialog extends StatelessWidget {
  const ShowDialog(this.text1, this.text2, this.text3, {super.key});

  final String text1;
  final String text2;
  final String text3;

  @override
  Widget build(BuildContext context) {
    String showAlert(String message,) {
      QuickAlert.show(
          context: context,
          title: 'succès',
          confirmBtnText: 'OK',
          confirmBtnColor: const Color.fromARGB(255, 229, 36, 36),
          text: message,
          type: QuickAlertType.success);
      return message;
    }
    return Center(
      child: AlertDialog(
        backgroundColor: Colors.white,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              text1,
              style:TextStyle(fontSize: 14, fontFamily: 'LatoBold'),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              text2,
              style:TextStyle(fontSize: 14, fontFamily: 'LatoRegular'),
            ),
            Text(
              text3,
              style:TextStyle(fontSize: 14, fontFamily: 'LatoRegular'),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    showAlert('Votre produit a bien été supprimé !');
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    primary: appbarColor,
                  ),
                  child:  Text('OUI',
                      style:TextStyle(fontSize: 14, fontFamily: 'LatoBold',color: Colors.white),),
                ),
                const SizedBox(width: 20,),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    primary: Colors.black,
                  ),
                  child: Text('NON',
                      style:TextStyle(fontSize: 14, fontFamily: 'LatoBold',color: Colors.white)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
