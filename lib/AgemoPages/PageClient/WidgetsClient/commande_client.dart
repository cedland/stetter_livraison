import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:quickalert/quickalert.dart';
import '../../PageConnexion/WidgetsConnexion/styled_button.dart';
import '../../app_bar.dart';
import 'ajout_produit_client.dart';

class CommandeClient extends StatefulWidget {
  const CommandeClient(this.nomClient, {super.key});

  final String nomClient;

  @override
  State<CommandeClient> createState() => _CommandeClientState();
}

class _CommandeClientState extends State<CommandeClient> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController dateInput = TextEditingController();
  TextEditingController heureInputstart = TextEditingController();
  TextEditingController heureInputend = TextEditingController();
  int heureInputstartMin = 0;
  int heureInputstartEnd = 0;
  int differenceHeure = 0;
  String? selectedValue;

  var items = [
    '2106-ROMONT-29.06.2023',
    '1765-LAUSANNE-30.07.2023',
    '1968-MOUDON-31.08.2023',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Commande client", function: CustomAppBarFunction.back),
      backgroundColor: Colors.grey.shade50,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.nomClient,
                  style:TextStyle(fontSize: 22, fontFamily: 'LatoBold'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 55,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.black26, width: 1)),
                    child: DropdownButton2(
                      value: selectedValue,
                      style: TextStyle(fontFamily: 'LatoRegular',color:Colors.black45,fontSize: 14),
                      underline: const SizedBox(),
                      hint: Center(
                          child: Text(
                        "Choisir tournée",
                        style: TextStyle(fontSize: 14, fontFamily: 'LatoLight'),
                      )),
                      isExpanded: true,
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Center(
                            child: Text(
                              items,style: TextStyle(fontSize: 14, fontFamily: 'LatoLight'),
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedValue = newValue!;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 15,),
                const Row(
                    children: <Widget>[
                      Expanded(
                          child: Divider(color: Colors.black38,indent: 10,endIndent: 10)
                      ),

                      Text("Dépannage",style:TextStyle(fontFamily: 'LatoRegular',fontSize: 16),),

                      Expanded(
                          child: Divider(color: Colors.black38,indent: 10,endIndent: 10,)
                      ),
                    ]
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: TextFormField(
                    controller: dateInput,
                    decoration: InputDecoration(
                      labelText: 'Choisisser la date de livraison',
                      labelStyle:  TextStyle(fontSize: 14, fontFamily: 'LatoLight'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      prefixIcon: Icon(
                        Icons.event_note,
                      ),
                      fillColor: Colors.white,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Sélectionner une date';
                      }
                      return null;
                    },
                    readOnly: true,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        locale: const Locale("fr", "FR"),
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2030),
                        builder: (context, child) {
                          return Theme(
                            data: Theme.of(context).copyWith(
                              colorScheme: ColorScheme.light(
                                primary: const Color.fromARGB(255, 229, 36, 36), // <-- SEE HERE
                                onPrimary: Colors.white, // <-- SEE HERE
                                onSurface: Colors.grey, // <-- SEE HERE
                              ),
                            ),
                            child: child!,
                          );
                        },
                      );
                      if (pickedDate != null) {
                        String formattedDate =
                        DateFormat('dd/MM/yyyy').format(pickedDate);
                        setState(() {
                          dateInput.text = formattedDate;
                        });
                      }
                    },
                  ),
                ),
                const SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16)),
                  height: 50,
                  child:  StyledButton(
                    text: "Liste des produits",
                    onPressed: (){
                      if (dateInput.text.isNotEmpty || selectedValue != null) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => AjoutProduitClient(),
                          ),
                        );
                      }
                    },
                    color: const Color.fromARGB(255, 229, 36, 36),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
