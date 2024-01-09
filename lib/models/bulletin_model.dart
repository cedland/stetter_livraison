import 'package:intl/intl.dart';

import 'produit_model.dart';
class BulletinMod {
    const BulletinMod(this.nomClient,this.numeroBul,this.codeCommande,this.statut,this.statutlivraison,this.date,this.heure,this.adresse,this.destination,this.product,this.modifBul,this.qteBul,this.totalBul);
  final String nomClient;
  final int numeroBul;
  final int codeCommande;
  final bool statut;
  final String statutlivraison;
  final String date;
  final String heure;
  final String adresse;
  final String destination;
  final List<ProduitMod> product;
  final bool modifBul;
  final int qteBul;
  final int totalBul;
  static List<BulletinMod> bulletins() {
    return [
      BulletinMod('Jacques Stettier', 2850759, 01666, false, 'En attente', DateFormat('dd.MM.yyyy').format(DateTime.now()),DateFormat.Hms().format(DateTime.now()),'Chemin de la Fauvette,Lausanne 1012','Chemin de la Fauvette,Lausanne',[ProduitMod('assets/images/1.jpg',12,'pots vanille/fraise',67011,1,8.20,"is simply dummy text",'52'),],false,15,240),
      BulletinMod('Jerome Stettier', 2850748, 57896, true,'Livré', DateFormat('dd.MM.yyyy').format(DateTime.now()),DateFormat.Hms().format(DateTime.now()),'Chemin de la Fauvette,Lausanne 1017','Chemin de la Fauvette,Lausanne 102',[ProduitMod('assets/images/2.jpg',12,'pots vanille/fraise',67011,1,8.20,"is simply dummy text",'52'),],true,14,510),
      BulletinMod('Laure Stettier', 2850747, 55315, true, 'Livré',DateFormat('dd.MM.yyyy').format(DateTime.now()),DateFormat.Hms().format(DateTime.now()),'Chemin de la Fauvette,Lausanne 1053','Chemin de la Fauvette,Lausanne 120',[ProduitMod('assets/images/3.jpg',12,'pots vanille/fraise',67011,1,8.20,"is simply dummy text",'52'),],true,12,246),
      BulletinMod('Michel Tenon', 2850745, 54284, true, 'Livré',DateFormat('dd.MM.yyyy').format(DateTime.now()),DateFormat.Hms().format(DateTime.now()),'Chemin de la Fauvette,Lausanne 2052','Chemin de la Fauvette,Lausanne 100',[ProduitMod('assets/images/4.jpg',12,'pots vanille/fraise',67011,1,8.20,"is simply dummy text",'52'),],false,16,489),
      BulletinMod('David Marchal', 2850744, 31566, true, 'Livré',DateFormat('dd.MM.yyyy').format(DateTime.now()),DateFormat.Hms().format(DateTime.now()),'Chemin de la Fauvette,Lausanne 2025','Chemin de la Fauvette,Lausanne 124',[ProduitMod('assets/images/5.jpg',12,'pots vanille/fraise',67011,1,8.20,"is simply dummy text",'52'),],true,30,3456),
      BulletinMod('Denise Estelle', 2850742, 41333, true, 'Livré',DateFormat('dd.MM.yyyy').format(DateTime.now()),DateFormat.Hms().format(DateTime.now()),'Chemin de la Fauvette,Lausanne 1010','Chemin de la Fauvette,Lausanne 108',[ProduitMod('assets/images/6.jpg',12,'pots vanille/fraise',67011,1,8.20,"is simply dummy text",'52'),],false,10,4872),
      BulletinMod('Norman Ledoux', 2850741, 57779, true, 'Livré',DateFormat('dd.MM.yyyy').format(DateTime.now()),DateFormat.Hms().format(DateTime.now()),'Chemin de la Fauvette,Lausanne 1346','Chemin de la Fauvette,Lausanne 129',[ProduitMod('assets/images/7.jpg',12,'pots vanille/fraise',67011,1,8.20,"is simply dummy text",'52'),],true,14,75421),
      BulletinMod('Norman Ledoux', 2850741, 57779, true, 'Livré',DateFormat('dd.MM.yyyy').format(DateTime.now()),DateFormat.Hms().format(DateTime.now()),'Chemin de la Fauvette,Lausanne 1346','Chemin de la Fauvette,Lausanne 129',[ProduitMod('assets/images/8.jpg',12,'pots vanille/fraise',67011,1,8.20,"is simply dummy text",'52'),],true,14,75421),
      BulletinMod('Jacques Stettier', 2850759, 01666, false, 'En attente', DateFormat('dd.MM.yyyy').format(DateTime.now()),DateFormat.Hms().format(DateTime.now()),'Chemin de la Fauvette,Lausanne 1012','Chemin de la Fauvette,Lausanne',[ProduitMod('assets/images/9.jpg',12,'pots vanille/fraise',67011,1,8.20,"is simply dummy text",'52'),],false,15,240),
      BulletinMod('Jerome Stettier', 2850748, 57896, true,'Livré', DateFormat('dd.MM.yyyy').format(DateTime.now()),DateFormat.Hms().format(DateTime.now()),'Chemin de la Fauvette,Lausanne 1017','Chemin de la Fauvette,Lausanne 102',[ProduitMod('assets/images/10.jpg',12,'pots vanille/fraise',67011,1,8.20,"is simply dummy text",'52'),],true,14,510),
      BulletinMod('Laure Stettier', 2850747, 55315, true, 'Livré',DateFormat('dd.MM.yyyy').format(DateTime.now()),DateFormat.Hms().format(DateTime.now()),'Chemin de la Fauvette,Lausanne 1053','Chemin de la Fauvette,Lausanne 120',[ProduitMod('assets/images/1.jpg',12,'pots vanille/fraise',67011,1,8.20,"is simply dummy text",'52'),],true,12,246),
      BulletinMod('Michel Tenon', 2850745, 54284, true, 'Livré',DateFormat('dd.MM.yyyy').format(DateTime.now()),DateFormat.Hms().format(DateTime.now()),'Chemin de la Fauvette,Lausanne 2052','Chemin de la Fauvette,Lausanne 100',[ProduitMod('assets/images/2.jpg',12,'pots vanille/fraise',67011,1,8.20,"is simply dummy text",'52'),],false,16,489),
      BulletinMod('David Marchal', 2850744, 31566, true, 'Livré',DateFormat('dd.MM.yyyy').format(DateTime.now()),DateFormat.Hms().format(DateTime.now()),'Chemin de la Fauvette,Lausanne 2025','Chemin de la Fauvette,Lausanne 124',[ProduitMod('assets/images/5.jpg',12,'pots vanille/fraise',67011,1,8.20,"is simply dummy text",'52'),],true,30,3456),
      BulletinMod('Denise Estelle', 2850742, 41333, true, 'Livré',DateFormat('dd.MM.yyyy').format(DateTime.now()),DateFormat.Hms().format(DateTime.now()),'Chemin de la Fauvette,Lausanne 1010','Chemin de la Fauvette,Lausanne 108',[ProduitMod('assets/images/2.jpg',12,'pots vanille/fraise',67011,1,8.20,"is simply dummy text",'52'),],false,10,4872),
      BulletinMod('Norman Ledoux', 2850741, 57779, true, 'Livré',DateFormat('dd.MM.yyyy').format(DateTime.now()),DateFormat.Hms().format(DateTime.now()),'Chemin de la Fauvette,Lausanne 1346','Chemin de la Fauvette,Lausanne 129',[ProduitMod('assets/images/10.jpg',12,'pots vanille/fraise',67011,1,8.20,"is simply dummy text",'52'),],true,14,75421),
      BulletinMod('Norman Ledoux', 2850741, 57779, true, 'Livré',DateFormat('dd.MM.yyyy').format(DateTime.now()),DateFormat.Hms().format(DateTime.now()),'Chemin de la Fauvette,Lausanne 1346','Chemin de la Fauvette,Lausanne 129',[ProduitMod('assets/images/9.jpg',12,'pots vanille/fraise',67011,1,8.20,"is simply dummy text",'52'),],true,14,75421),
      ];
  }
}

