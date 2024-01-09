import 'package:agemo/AgemoPages/PageClient/WidgetsClient/client_item.dart';
import 'package:flutter/material.dart';

import '../../../../models/client_model.dart';

class ClientList extends StatelessWidget {
  const ClientList(this.clientsList,{super.key});
  final List<ClientMod> clientsList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: ListView.builder(itemCount: clientsList.length,
          itemBuilder: (context, index) => ClientItem(clientsList[index])),
    );
  }
}
