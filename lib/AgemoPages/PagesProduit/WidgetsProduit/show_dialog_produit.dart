import 'package:flutter/material.dart';
class ShowDialogProduit extends StatelessWidget {
  const ShowDialogProduit(this.text1,this.text2,this.text3,this.text4,this.message,this.couleur,{super.key});
  final String text1;
  final String text2;
  final String text3;
  final String text4;
  final String message;
  final Color couleur;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AlertDialog(
        backgroundColor: Colors.white,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            Text(
              text1,
              style: const TextStyle(
                fontSize: 14,
                fontFamily: 'LatoBold',
              ),
            ),
            const SizedBox(height: 8,),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                text2,
                style: const TextStyle(
                  fontSize: 12,
                  fontFamily: 'LatoRegular',
                ),
              ),
            ),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                text3,
                style: const TextStyle(
                  fontSize: 12,
                  fontFamily: 'LatoRegular',
                ),
              ),
            ),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                text4,
                style: const TextStyle(
                  fontSize: 12,
                  fontFamily: 'LatoRegular',
                ),
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                  color: couleur,
                  child: Text(message,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontFamily: 'LatoBold',
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
