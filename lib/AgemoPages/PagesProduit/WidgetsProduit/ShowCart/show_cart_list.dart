import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../models/cart_model.dart';
import '../../../PageConnexion/WidgetsConnexion/styled_button.dart';
import '../../../couleurs.dart';
import '../../../dimensions_pages.dart';
import 'package:quickalert/quickalert.dart';

import '../../produit_screen.dart';
import 'show_cart_screen.dart';

class ShowCartList extends StatefulWidget {
  const ShowCartList({super.key});

  @override
  State<ShowCartList> createState() => _ShowCartListState();
}

class _ShowCartListState extends State<ShowCartList> {
  String showAlert(String message, Widget confirm){
    QuickAlert.show(
        context: context,
        title: 'succès',
        confirmBtnText: 'OK',
        confirmBtnColor: appbarColor,
        text: message,
        type: QuickAlertType.success
    );
    return message;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CartModel>(builder: (context, value, child) {
      return Column(
        children: [
          Container(
            //color: Colors.yellow,
            color: Colors.grey.shade50,
            width: displayWidth(context),
            height: MediaQuery.of(context).size.height /1.5,
            child: ListView.builder(
              itemCount: value.shopItems.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 1),
                  child: Card(
                    color: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 90,
                          height: 90,
                          decoration: BoxDecoration(color: Colors.white),
                          child: Container(
                            margin: EdgeInsets.all(3),
                            width: 90,
                            height: 90,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                value.shopItems[index][0],
                                width: 70,
                                height: 70,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width - 120,
                            height: 96,
                            //      decoration: BoxDecoration(color: Colors.pink),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        value.shopItems[index][2],
                                        style:TextStyle(fontSize: 15, fontFamily: 'LatoBold'),
                                      ),
                                    ),
                                    FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        '${value.shopItems[index][5]} CHF',
                                        style:TextStyle(fontSize: 15, fontFamily: 'LatoBold'),
                                      ),
                                    ),
                                    IconButton(
                                        icon: const Icon(
                                          Icons.cancel,
                                          size: 14,
                                        ),
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (ctx) => Center(
                                              child:AlertDialog(
                                                backgroundColor: Colors.white,
                                                title: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'Suppression produit!',
                                                      style:TextStyle(fontSize: 14, fontFamily: 'LatoBold'),
                                                    ),
                                                    SizedBox(
                                                      height: 8,
                                                    ),
                                                    Text(
                                                      'Souhaitez vous vraiment supprimer',
                                                      style:TextStyle(fontSize: 14, fontFamily: 'LatoRegular'),
                                                    ),
                                                    Text(
                                                      'ce produit de la liste?',
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
                                                            Provider.of<CartModel>(
                                                                context,
                                                                listen: false)
                                                                .removeItemFromCart(index);
                                                            Navigator.of(context).pop();
                                                            showAlert('Votre produit a bien été supprimé',const ShowCartScreen());
                                                          },
                                                          style: ElevatedButton.styleFrom(
                                                            shape: RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(8),
                                                            ),
                                                            primary: appbarColor,
                                                          ),
                                                          child: Text('OUI',
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
                                                            style:TextStyle(fontSize: 14, fontFamily: 'LatoBold', color: Colors.white),),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        }
                                    ),
                                  ],
                                ),

                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '${value.shopItems[index][7]} | ${value.shopItems[index][3].toString()}',
                                      style:TextStyle(fontSize: 14, fontFamily: 'LatoRegular'),
                                    ),
                                    Spacer(),
                                    ElevatedButton(
                                      onPressed:
                                      value.shopItems[index][4] <= 1
                                          ? null
                                          : () {
                                        setState(() {
                                          value.shopItems[index][4] --;
                                        });
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: appbarColor,
                                        fixedSize: const Size(5, 5),
                                        shape: const CircleBorder(),
                                      ),
                                      child: const Icon(
                                        Icons.remove,
                                        size: 15,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 2.0),
                                      child: Text(
                                        value.shopItems[index][4]
                                            .toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          value.shopItems[index][4] ++;
                                        });
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: appbarColor,
                                        fixedSize: const Size(5, 5),
                                        shape: const CircleBorder(),
                                      ),
                                      child: const Icon(
                                        Icons.add,
                                        size: 15,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                );
              },
            ),

          ),
          const SizedBox(height: 5,),
          Container(
            margin: const EdgeInsets.only(left: 5, right: 5, bottom: 10),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 14,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8)),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                const SizedBox(
                  width: 150,
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Code Promo',
                      hintStyle: TextStyle(fontSize: 16, fontFamily: 'LatoLight'),
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ElevatedButton(
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all<
                              RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                          ),
                          backgroundColor:
                          MaterialStateProperty.all(const Color.fromARGB(255, 229, 36, 36),)),
                      onPressed: () {},
                      child:  Text('Appliquer',
                          style:TextStyle(fontSize: 15, fontFamily: 'LatoBold',color: Colors.white),
                          textAlign: TextAlign.center)),
                )
              ],
            ),
          ),

          Column(
            children: [
              Container(
                  margin: const EdgeInsets.only(left: 20, right: 20,top: 4),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Montant total',
                            style:TextStyle(fontSize: 15, fontFamily: 'LatoBold'),
                          ),
                          const Spacer(),
                          Text('(${value.shopItems.length} produits)',
                            style:TextStyle(fontSize: 14, fontFamily: 'LatoRegular'),),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            ('${value.calculateTotal()} CHF'),
                            style:TextStyle(fontSize: 14, fontFamily: 'LatoBold'),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        width: 400,
                        height: 40,
                        child: StyledButton(
                          text: "Valider la commande",
                          onPressed: (){showAlert('Votre commande a bien été enregistrée !',ProduitScreen());},
                          color: const Color.fromARGB(255, 229, 36, 36),
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ],
      );
    });
  }
}
