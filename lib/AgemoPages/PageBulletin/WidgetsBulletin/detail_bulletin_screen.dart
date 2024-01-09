import 'package:agemo/AgemoPages/PageBulletin/WidgetsBulletin/WidgetDetailBulletin/header_detail_bulletin.dart';
import 'package:agemo/AgemoPages/PageBulletin/WidgetsBulletin/WidgetDetailBulletin/infos_client_detail_bulletin.dart';
import 'package:agemo/AgemoPages/PageBulletin/WidgetsBulletin/WidgetDetailBulletin/produit_list.dart';
import 'package:agemo/AgemoPages/couleurs.dart';
import 'package:flutter/material.dart';
import '../../../../../models/bulletin_model.dart';
import '../../../../../models/produit_model.dart';
import '../../../models/client_model.dart';
import '../../PageClient/WidgetsClient/profil_client.dart';
import '../../app_bar.dart';
import 'WidgetDetailBulletin/ajout_produit_bulletin.dart';
import 'WidgetDetailBulletin/destination_detail_bulletin.dart';

class DetailBulletinScreen extends StatefulWidget {
  DetailBulletinScreen(this.bulletin, this.produit ,this.clientMod, {Key? key})
      : super(key: key);
  final BulletinMod bulletin;
  final ProduitMod produit;
  final ClientMod clientMod;

  @override
  State<DetailBulletinScreen> createState() => _DetailBulletinScreenState();
}

class _DetailBulletinScreenState extends State<DetailBulletinScreen> {
  /*void _showDialogdelete() {
    showDialog(
        context: context,
        builder: (context) {
          return const ShowDialog(
              'Suppression produit',
              'Souhaitez vous vraiment supprimer',
              'ce produit du bulletin ?',
              );
        });
    showAlert('Votre commande a bien été enregistrée !',BulletinScreen());
  }*/
  void _showDialogajout() {
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: AlertDialog(
              backgroundColor: Colors.white,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Ajout produit !',
                    style:TextStyle(fontSize: 16, fontFamily: 'LatoBold'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Souhaitez vous vraiment ajouter',
                    style:TextStyle(fontSize: 16, fontFamily: 'LatoRegular'),
                  ),
                  Text(
                    'les produits dans cette commande ?',
                    style:TextStyle(fontSize: 16, fontFamily: 'LatoRegular'),
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
                        onPressed:(){
                          Navigator.of(context).pop();
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AjoutProduitBulletin()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          primary: appbarColor,
                        ),
                        child: Text('OUI',
                          style:TextStyle(fontSize: 16, fontFamily: 'LatoBold',color: Colors.white),),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
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
                          style:TextStyle(fontSize: 16, fontFamily: 'LatoBold',color: Colors.white),),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
  void profil(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProfilClient(widget.clientMod)),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Détail bulletin", function: CustomAppBarFunction.back,additionalIcon:  Icons.account_circle_sharp,additionalFunction:profil,),
      backgroundColor: Colors.grey.shade50,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              HeaderDetailBulletin(widget.bulletin),
              DestinationDetailBulletin(widget.bulletin),
              InfosClientDetailBulletin(widget.bulletin),
              Padding(
                padding: const EdgeInsets.only(left: 4),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Détail commande',
                        style:TextStyle(fontSize: 16, fontFamily: 'LatoBold'),
                      ),
                      Container(
                          margin: EdgeInsets.all(3),
                          width: 40,
                          height: 40,
                          padding: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color:  appbarColor
                          ),
                          child: IconButton(
                            onPressed: _showDialogajout,
                            icon: const Icon(Icons.add),
                            iconSize: 20,
                            color: Colors.white,
                          )),
                    ],
                  ),
                ),
              ),
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 500,
                  child: ProduitList(widget.produit)),
            ],
          ),
        ),
      ),
    );
  }
}
