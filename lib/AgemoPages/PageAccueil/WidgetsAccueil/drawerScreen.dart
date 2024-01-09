import 'package:agemo/AgemoPages/PageClient/client_screen.dart';
import 'package:agemo/AgemoPages/PageConnexion/Connexion_screen.dart';
import 'package:agemo/AgemoPages/PagesProduit/produit_screen.dart';
import 'package:agemo/AgemoPages/couleurs.dart';
import 'package:flutter/material.dart';
import '../../PageBulletin/WidgetsBulletin/update_bulletin_screen.dart';
import '../../PageBulletin/bulletin_screen.dart';
import '../../PageConnexion/WidgetsConnexion/styled_button.dart';
import '../../dimensions_pages.dart';
class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});



  @override
  Widget build(BuildContext context) {
    void _deconnexion(){
      showDialog(
        context: context,
        builder: (ctx) => Center(
          child: AlertDialog(
            backgroundColor: Colors.white,
            title:  Text("Voulez-vous vous déconnecter?", style: TextStyle(fontSize: 14, fontFamily: 'LatoBold',),textAlign: TextAlign.center,),
            actions: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ConnexionScreen()),
                      );
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
                    child: Text("OUI", style: TextStyle(fontSize: 14, fontFamily: 'LatoBold',color: Colors.white)),
                  ),
                  const SizedBox(width: 20,),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            // Change your radius here
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        backgroundColor:
                        MaterialStateProperty.all(Colors.black)),
                    child:  Text("NON", style: TextStyle(fontSize: 14, fontFamily: 'LatoBold',color: Colors.white),),
                  ),

                ],
              ),
            ],
          ),
        ),
      );
    }
    return Container(
      width: MediaQuery.of(context).size.width * 0.55,
      color: const Color.fromARGB(255, 250, 250, 250),
      child: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/logo_app.png'),
                    SizedBox(height: 12,),
                    Text('Norman Ledoux',style: TextStyle(fontSize: 16, fontFamily: 'LatoRegular',),)
                  ],
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListTile(
                  title:  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text('Clients',style: TextStyle(fontSize: 15, fontFamily: 'LatoBold',)),
                  ),

                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ClientScreen()),
                    );
                  },
                ),
                const SizedBox(height: 8,),
                ListTile(
                  title: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text('Bulletins',style: TextStyle(fontSize: 15, fontFamily: 'LatoBold',)),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BulletinScreen()),
                    );
                  },
                ),
                const SizedBox(height: 8,),
                ListTile(
                  title:  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text('Produits',style: TextStyle(fontSize: 15, fontFamily: 'LatoBold',),),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProduitScreen()),
                    );
                  },
                ),
                const SizedBox(height: 8,),
                ListTile(
                  title:  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text('Mise à  jour',style: TextStyle(fontSize: 15, fontFamily: 'LatoBold',)),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => UpdateBulletinScreen()),
                    );
                  },
                ),
                const SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: StyledButton(
                    text: "DECONNEXION",
                    onPressed: _deconnexion,
                    color: const Color.fromARGB(255, 229, 36, 36),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
