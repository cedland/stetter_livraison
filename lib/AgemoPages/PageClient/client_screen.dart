import 'package:agemo/AgemoPages/PageClient/WidgetsClient/client_list.dart';
import 'package:agemo/AgemoPages/dimensions_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../models/client_model.dart';
import '../app_bar.dart';
import '../couleurs.dart';
import 'WidgetsClient/formulaireClient/form_page.dart';

class ClientScreen extends StatefulWidget {
  ClientScreen({super.key});
  final List<ClientMod> _registeredClients= ClientMod.clients();
  @override
  State<ClientScreen> createState() => _ClientScreenState();
}

class _ClientScreenState extends State<ClientScreen> {
  List<ClientMod> _foundActivity = [];
  @override
  initState() {
    _foundActivity = widget._registeredClients;
    super.initState();
  }
  void _runFilter(String enteredKeyword) {
    List<ClientMod> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = widget._registeredClients;
    } else {
      results = widget._registeredClients.where((user) => user.nomClient.toLowerCase().contains(enteredKeyword.toLowerCase())).toList();
      // we use the toLowerCase() method to make it case-insensitive
    }
    setState(() {
      _foundActivity = results;
    });
  }
  void createClient(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const FormPage()),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:CustomAppBar(title: "Liste des clients", function: CustomAppBarFunction.back,additionalIcon: Icons.add,additionalFunction: createClient),
      backgroundColor: Colors.grey.shade50,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 8),
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
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Icon(CupertinoIcons.search, color: const Color.fromARGB(150, 124, 125, 129),),
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
                                hintText: 'Nom du client',
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

                Expanded(
                  child: _foundActivity.isNotEmpty
                      ? Column(
                    children: [
                      Expanded(child: ClientList(widget._registeredClients)),
                    ],
                  )
                      : Padding(
                    padding: const EdgeInsets.only(left: 10,top: 15,),
                    child: Column(
                      children:  [
                        Expanded(
                            child: Text(
                              'Aucun client trouvé',
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
