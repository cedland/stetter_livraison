import 'package:agemo/models/produit_model.dart';
import 'package:flutter/material.dart';

class TapBar extends StatefulWidget {
  const TapBar(this.descriptionproduits, {super.key});
  final ProduitMod descriptionproduits;

  @override
  State<TapBar> createState() => _TapBarState();
}

class _TapBarState extends State<TapBar> with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
          children:[
            TabBar(
              controller: tabController,
              tabs: [
                Tab(child: Text('Informations',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                ),),
                Tab(child: Text('Ingrédients',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                ),),
              ],
              labelColor: Colors.black,
            ),
            Expanded(child: TabBarView(
              controller: tabController,
              children:  [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 5),
                  child: Text("À conserver au congélateur à au moins -18 °C. Une fois décongelé ne pas resurgeler et consommer sans attendre.",
                    style: TextStyle(fontSize: 12, fontFamily: 'LatoRegular',)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 5),
                  child: Text(widget.descriptionproduits.description,
                    style:TextStyle(fontSize: 12, fontFamily: 'LatoRegular',),),
                ),
              ],

            ))
          ]
      ),
    );
  }
}