import 'package:flutter/material.dart';

import '../../../../models/produit_model.dart';

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
                Tab(child: Text('Informations', style: TextStyle(fontSize: 14, fontFamily: 'LatoBold',)),),
                Tab(child: Text('Ingrédients', style: TextStyle(fontSize: 14, fontFamily: 'LatoBold',)),),
              ],
              labelColor: Colors.black,
            ),
            Expanded(child: TabBarView(
              controller: tabController,
              children:  [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("À conserver au congélateur à au moins -18 °C. Une fois décongelé ne pas resurgeler et consommer sans attendre.",
                        style: TextStyle(fontSize: 12, fontFamily: 'LatoRegular',)
                    ),
                    Text(widget.descriptionproduits.description, style: TextStyle(fontSize: 12, fontFamily: 'LatoRegular',))
                  ],
                )
              ],

            ))
          ]
      ),
    );
  }
}