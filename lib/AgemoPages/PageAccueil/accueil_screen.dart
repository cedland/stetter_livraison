import 'package:agemo/AgemoPages/PageBulletin/WidgetsBulletin/bulletin_list.dart';
import 'package:agemo/AgemoPages/dimensions_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/bulletin_model.dart';

import '../../models/client_model.dart';
import '../../models/produit_model.dart';
import '../app_bar.dart';
import 'WidgetsAccueil/drawerScreen.dart';


class AccueilScreen extends StatefulWidget {
  AccueilScreen({Key? key}) : super(key: key);
  final List<BulletinMod> _registeredBulletins = BulletinMod.bulletins();
  final List<ProduitMod> _registeredProduits = ProduitMod.produits();
  final List<ClientMod> _registeredclients = ClientMod.clients();

  @override
  State<AccueilScreen> createState() => _AccueilScreenState();
}
class _AccueilScreenState extends State<AccueilScreen> {

  List<BulletinMod> _foundActivity = [];
  @override
  initState() {
    _foundActivity = widget._registeredBulletins;
    super.initState();
  }
  void _runFilter(String enteredKeyword) {
    List<BulletinMod> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = widget._registeredBulletins;
    } else {
      results = widget._registeredBulletins.where((user) => user.numeroBul.toString().toLowerCase().contains(enteredKeyword.toLowerCase())).toList();
      // we use the toLowerCase() method to make it case-insensitive
    }
    setState(() {
      _foundActivity = results;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "BULLETINS DE LIVRAISON", function: CustomAppBarFunction.drawer),
      backgroundColor: Colors.grey.shade50,
      drawer:DrawerScreen(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 8),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 6),
                  width: displayWidth(context) *0.95,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Icon(CupertinoIcons.search, color: Color.fromARGB(150, 124, 125, 129)),
                        SizedBox(
                          height: 50,
                          width:  displayWidth(context) *0.75,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                            ),
                            child: TextFormField(
                              onChanged: (value) => _runFilter(value),
                              decoration: InputDecoration(
                                hintText: 'No Bulletin ou référence client',
                                hintStyle: TextStyle(fontSize: 14, fontFamily: 'LatoLight',color: const Color.fromARGB(150, 124, 125, 129),),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 9.0, vertical: 8),
                  child:
                  Text(
                    "Aujourd'hui",
                    style:TextStyle(fontSize: 14, fontFamily: 'LatoBold'),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 75,
                      padding: const EdgeInsets.all(16.0),
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color.fromARGB(
                            255, 194, 189, 189),),
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            widget._registeredBulletins.length.toString(),
                            style:TextStyle(fontSize: 14, fontFamily: 'LatoBold'),
                          ),
                          Text("Total",style:TextStyle(fontSize: 12, fontFamily: 'LatoBold'),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 75,
                      padding: const EdgeInsets.all(16.0),
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color.fromARGB(
                            255, 194, 189, 189),),
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            widget._registeredBulletins.length.toString(),
                            style:TextStyle(fontSize: 14, fontFamily: 'LatoBold',color: Colors.green),
                          ),
                          Text("Livré",style:TextStyle(fontSize: 12, fontFamily: 'LatoBold',color: Colors.green),
                          ),
                        ],
                      ),
                    ),
                    /*Container(
                      width: 75,
                      padding: const EdgeInsets.all(16.0),
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color.fromARGB(
                            255, 194, 189, 189),),
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            widget._registeredBulletins.length.toString(),
                            style:TextStyle(fontSize: 14, fontFamily: 'LatoBold',color: Colors.orange),
                          ),
                          Text("En att.",style:TextStyle(fontSize: 13, fontFamily: 'LatoBold',color: Colors.orange),
                          ),
                        ],
                      ),
                    ),*/
                    Container(
                      width: 75,
                      padding: const EdgeInsets.all(16.0),
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color.fromARGB(
                            255, 194, 189, 189),),
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            widget._registeredBulletins.length.toString(),
                            style:TextStyle(fontSize: 14, fontFamily: 'LatoBold',color:Colors.orange),
                          ),
                          Text("En att.",style:TextStyle(fontSize: 12, fontFamily: 'LatoBold',color: Colors.orange,),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 75,
                      padding: const EdgeInsets.all(16.0),
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color.fromARGB(
                            255, 194, 189, 189),),
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            widget._registeredBulletins.length.toString(),
                            style:TextStyle(fontSize: 14, fontFamily: 'LatoBold',color: const Color.fromARGB(255, 229, 36, 36),),
                          ),
                          Text("Abs",style:TextStyle(fontSize: 12, fontFamily: 'LatoBold',color: const Color.fromARGB(255, 229, 36, 36),),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5,),
                Expanded(
                  child: _foundActivity.isNotEmpty
                      ? Column(
                    children: [
                      Expanded(child: BulletinsList(widget._registeredBulletins, widget._registeredProduits, widget._registeredclients)),
                    ],
                  )
                      : Padding(
                    padding: const EdgeInsets.only(left: 10,top: 15,),
                    child: Column(
                      children:  [
                        Expanded(
                            child: Text(
                              'Aucun bulletin trouvé',
                              style:TextStyle(fontSize: 16, fontFamily: 'LatoBold',color: const Color.fromARGB(255, 229, 36, 36)),
                            )),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

