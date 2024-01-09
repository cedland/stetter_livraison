
import 'package:flutter/material.dart';

import '../../../couleurs.dart';
class DetailCommande extends StatelessWidget {
  const DetailCommande({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        child: Row(
          
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Détail commande',
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'PoppinsSemiBold',
              ),
            ),
            Container(
                margin: EdgeInsets.all(3),
                width: 40,
                height: 40,
                padding: const EdgeInsets.all(1),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: appbarColor,
                ),
                child: IconButton(onPressed: (){}, icon: const Icon(Icons.add),iconSize: 20,color: Colors.white,)
            ),
          ],
        ),
      ),
    );
  }
}
