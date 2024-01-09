class ClientMod {
  ClientMod(this.codeClient,this.nomClient,this.adresseClient,this.adresseLivraisonClient,this.npnClient,this.villeClient,this.adresseElectroniqueClient,this.numeroTelClient,this.localiteClient,this.actif);

  final int  codeClient;
  final String nomClient;
  final String adresseClient;
  final String adresseLivraisonClient;
  final int npnClient;
  final String villeClient;
  final String adresseElectroniqueClient;
  final int numeroTelClient;
  final String localiteClient;
  final bool actif;



  static List<ClientMod> clients() {
    return [
      ClientMod(10001,'Norman Ledoux','Chemin de la Fauvette,Lausanne 1012','Chemin de la Fauvette,Lausanne 2014',1280,'paris','cedlandosseng@gmail.com',664692935,'Aigurande',true),
      ClientMod(10002,'Osseng Cedrick','Chemin de la Fauvette,Lausanne 1257','Chemin de la Fauvette,Lausanne 1252',1364,'douala','cedlandosseng@yahoo.com',764692935,'Éguzon-Chantôme',false),
      ClientMod(10003,'ronaldo Christiano','Chemin de la Fauvette,Lausanne 1014','Chemin de la Fauvette,Lausanne 1085',2280,'yaounde','cedlandosseng4@gmail.com',67892935,'La Motte-Feuilly',false),
      ClientMod(10004,'Mbappe Kylian','Chemin de la Fauvette,Lausanne 1019','Chemin de la Fauvette,Lausanne 3542',1680,'nante','cedlandosseng6@gmail.com',894692935,'Moulins-sur-Céphons',true),
      ClientMod(10005,'Lionel Messi','Chemin de la Fauvette,Lausanne 1542','Chemin de la Fauvette,Lausanne 2578',1288,'montpellier','cedlandosseng7@gmail.com',687692935,'Neuvy-Saint-Sépulchre',true),
      ClientMod(10006,'Samuel Etoo','Chemin de la Fauvette,Lausanne 1597','Chemin de la Fauvette,Lausanne 2579',1286,'chisinau','cedlandosseng4@gmail.com',664645935,'Nuret-le-Ferron',true),
      ClientMod(10007,'Mohamed Salah','Chemin de la Fauvette,Lausanne 1684','Chemin de la Fauvette,Lausanne 4589',1285,'New-york','cedlandosseng5@gmail.com',689692935,'Palluau-sur-Indre',false),
      ClientMod(10008,'Norman Ledoux','Chemin de la Fauvette,Lausanne 1012','Chemin de la Fauvette,Lausanne 2014',1280,'paris','cedlandosseng@gmail.com',664692935,'Aigurande',true),
      ClientMod(10009,'Osseng Cedrick','Chemin de la Fauvette,Lausanne 1257','Chemin de la Fauvette,Lausanne 1252',1364,'douala','cedlandosseng@yahoo.com',764692935,'Éguzon-Chantôme',false),
      ClientMod(10010,'ronaldo Christiano','Chemin de la Fauvette,Lausanne 1014','Chemin de la Fauvette,Lausanne 1085',2280,'yaounde','cedlandosseng4@gmail.com',67892935,'La Motte-Feuilly',false),
      ClientMod(10011,'Mbappe Kylian','Chemin de la Fauvette,Lausanne 1019','Chemin de la Fauvette,Lausanne 3542',1680,'nante','cedlandosseng6@gmail.com',894692935,'Moulins-sur-Céphons',true),
      ClientMod(10012,'Lionel Messi','Chemin de la Fauvette,Lausanne 1542','Chemin de la Fauvette,Lausanne 2578',1288,'montpellier','cedlandosseng7@gmail.com',687692935,'Neuvy-Saint-Sépulchre',true),
      ClientMod(10013,'Samuel Etoo','Chemin de la Fauvette,Lausanne 1597','Chemin de la Fauvette,Lausanne 2579',1286,'chisinau','cedlandosseng4@gmail.com',664645935,'Nuret-le-Ferron',true),
      ClientMod(10014,'Mohamed Salah','Chemin de la Fauvette,Lausanne 1684','Chemin de la Fauvette,Lausanne 4589',1285,'New-york','cedlandosseng5@gmail.com',689692935,'Palluau-sur-Indre',false),
      ClientMod(10015,'Samuel Etoo','Chemin de la Fauvette,Lausanne 1597','Chemin de la Fauvette,Lausanne 2579',1286,'chisinau','cedlandosseng4@gmail.com',664645935,'Nuret-le-Ferron',true),
      ClientMod(10016,'Mohamed Salah','Chemin de la Fauvette,Lausanne 1684','Chemin de la Fauvette,Lausanne 4589',1285,'New-york','cedlandosseng5@gmail.com',689692935,'Palluau-sur-Indre',false),
    ];
  }
}

