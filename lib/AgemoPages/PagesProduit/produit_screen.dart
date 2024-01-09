import 'package:agemo/AgemoPages/PagesProduit/WidgetsProduit/produits_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../models/produit_model.dart';
import '../app_bar.dart';
import '../couleurs.dart';
import '../dimensions_pages.dart';
import 'WidgetsProduit/list_categorie.dart';

class ProduitScreen extends StatefulWidget {
  ProduitScreen({super.key});
  final List<ProduitMod> _registeredProduits = ProduitMod.produits();
  @override
  State<ProduitScreen> createState() => _ProduitScreenState();
}

class _ProduitScreenState extends State<ProduitScreen> {
  List<ProduitMod> _foundActivity = [];
  @override
  initState() {
    _foundActivity = widget._registeredProduits;
    super.initState();
  }
  void _runFilter(String enteredKeyword) {
    List<ProduitMod> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = widget._registeredProduits;
    } else {
      results = widget._registeredProduits.where((user) => user.nomProduit.toLowerCase().contains(enteredKeyword.toLowerCase())).toList();
      // we use the toLowerCase() method to make it case-insensitive
    }
    setState(() {
      _foundActivity = results;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "LISTE DES PRODUITS", function: CustomAppBarFunction.back),
      backgroundColor: Colors.grey.shade50,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 7),
        child: Stack(
          children: [
            Column(
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
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      children: [
                        Icon(CupertinoIcons.search, color: const Color.fromARGB(150, 124, 125, 129),),
                        SizedBox(
                          height: 50,
                          width:  displayWidth(context) *0.78,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                            ),
                            child: TextFormField(
                              onChanged: (value) => _runFilter(value),
                              decoration: InputDecoration(
                                hintText: 'Nom du produit',
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
                const SizedBox(height: 15,),
                Container(
                  width: displayWidth(context)*0.94,
                  height: displayHeight(context)*0.15,
                  decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(8)),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Catégories',
                        style:TextStyle(fontSize: 14, fontFamily: 'LatoBold'),),
                        Expanded(child: Column(
                          children: [
                            Expanded(child: ListCategorie()),
                          ],
                        ))
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 15,),
                /*const Expanded(child: Column(
                  children: [
                    Expanded(child: ListCategorie()),
                  ],
                )),*/
                Expanded(
                  child: _foundActivity.isNotEmpty
                      ? Column(
                    children: [
                      Expanded(child: ProduitsList(widget._registeredProduits)),
                    ],
                  )
                      : Padding(
                    padding: const EdgeInsets.only(left: 10,top: 15,),
                    child: Column(
                      children:  [
                        Expanded(
                            child: Text(
                              'Aucun produit trouvé',
                              style:TextStyle(fontSize: 16, fontFamily: 'LatoBold',color: const Color.fromARGB(255, 229, 36, 36)),),
                            ),
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
