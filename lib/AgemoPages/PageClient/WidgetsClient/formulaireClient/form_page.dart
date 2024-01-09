import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import '../../../app_bar.dart';
import '../../../dimensions_pages.dart';
import '../animation/fade_in_animation_controller.dart';
import 'custom_date.dart';
import 'custom_form_field.dart';
import 'custom_form_field_required.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  int currentStep = 0;
  final civiliteController =TextEditingController();
  final nomClientController =TextEditingController();
  final prenomClientController = TextEditingController();


  final rueController = TextEditingController();
  final complementController = TextEditingController();
  final numeroController = TextEditingController();
  final caseController = TextEditingController();
  final porteController = TextEditingController();
  final localiteController = TextEditingController();
  final npaController = TextEditingController();
  final statController = TextEditingController();



  final mailController = TextEditingController();
  final phoneController = TextEditingController();
  final mobileController = TextEditingController();

  final _formkey1 = GlobalKey<FormState>();
  final _formkey2 = GlobalKey<FormState>();
  final _formkey3 = GlobalKey<FormState>();
  String? gender;



  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FadeInAnimationController());
    controller.startLoginAnimation();
    var mediaquery = MediaQuery.of(context);
    String showAlert(String title, String message, QuickAlertType alert) {
      QuickAlert.show(
          context: context,
          title: title,
          confirmBtnText: 'OK',
          confirmBtnColor: const Color.fromARGB(255, 229, 36, 36),
          text: message,
          type: alert);
      return message;
    }

    return Scaffold(
      appBar: CustomAppBar(title: "Création client", function: CustomAppBarFunction.back,),
      backgroundColor: Colors.grey.shade50,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15.0, bottom: 5),
            child: Center(
              child: Text(
                "Nouveau client",
                style:TextStyle(fontSize: 25, fontFamily: 'LatoBold'),
                textAlign: TextAlign.start,
              ),
            ),
          ),
          Expanded(
            child: Container(
                padding:
                const EdgeInsets.symmetric(horizontal:6),
                child: Theme(
                  data: ThemeData(
                    canvasColor: Colors.grey[100],
                    colorScheme: Theme.of(context).colorScheme.copyWith(
                      primary: const Color.fromARGB(255, 229, 36, 36),
                      background: Colors.red,
                      secondary: Colors.green,
                    ),
                  ),
                  child: Container(
                    width: double.infinity,
                    child: Stepper(
                      type: StepperType.vertical,
                      controlsBuilder: (context, _) {
                        return Row(
                          children: <Widget>[
                            Container(
                              color: const Color.fromARGB(255, 229, 36, 36),
                              child: TextButton(
                                onPressed: () {
                                  bool isLastStep =
                                  (currentStep == getSteps().length - 1);
                                  if (isLastStep) {
                                    //Navigator.pop(context);
                                    //showAlert('Le client a été créé !');
                                    if (_formkey1.currentState!.validate() &&
                                        _formkey2.currentState!.validate() &&
                                        _formkey3.currentState!.validate()) {
                                      Navigator.pop(context);
                                      showAlert('succès', 'Le client a été créé !',
                                          QuickAlertType.success);
                                    } else {
                                      showAlert(
                                          "Echec !",
                                          "Veuillez remplir les  champs requis",
                                          QuickAlertType.error);
                                    }
                                  } else {
                                    setState(() {
                                      currentStep += 1;
                                    });
                                  }
                                },
                                child: const Text(
                                  'CONTINUER',
                                  style:TextStyle(fontSize: 14, fontFamily: 'LatoBold',color: Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(width: 20,),
                            Container(
                              color:Colors.black,
                              child: TextButton(
                                onPressed: () { Navigator.pop(context);},
                                child: const Text(
                                  'ANNULER',
                                  style:TextStyle(fontSize: 16, fontFamily: 'LatoBold',color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                      currentStep: currentStep,
                      onStepCancel: () => currentStep == 0
                          ? null
                          : setState(() {
                        currentStep -= 1;
                      }),
                      onStepTapped: (step) => setState(() {
                        currentStep = step;
                      }),
                      steps: getSteps(),
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }

  List<Step> getSteps() {
    return <Step>[
      Step(
        state: currentStep > 0 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 0,
        title: Text(
          "Information générale",
          style:TextStyle(fontSize: 16, fontFamily: 'LatoBold'),
        ),
        content: Form(
          key: _formkey1,
          child: Column(
            children: [
              Container(
                height: 60,
                width: 360,
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: const Color.fromARGB(150, 124, 125, 129),
                    ),

                    borderRadius: BorderRadius.circular(8)
                ),
                // width: MediaQuery.of(context).size.width,
                //color: Colors.red,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text("Civilité :",style: TextStyle(fontSize: 15, fontFamily: 'LatoRegular',color: const Color.fromARGB(150, 124, 125, 129),),),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Radio(value: "Mme", groupValue: gender, onChanged: (value){
                              setState(() {
                                gender = value;
                              });
                            },fillColor:
                            MaterialStateColor.resolveWith((states) => Colors.red),),
                            Text("Mme",style: TextStyle(fontSize: 15, fontFamily: 'LatoRegular'))
                          ],
                        ),
                        Row(
                          children: [
                            Radio(value: "Mr", groupValue: gender, onChanged: (value){
                              setState(() {
                                gender = value;
                              });
                            },fillColor:
                            MaterialStateColor.resolveWith((states) => Colors.red),),
                            Text("Mr",style: TextStyle(fontSize: 15, fontFamily: 'LatoRegular'))
                          ],
                        )

                      ],
                    )

                  ],
                ),
              ),
              SizedBox(height: 6,),

              CustomFormFieldRequired(
                hintText: "Nom :",
                controller: nomClientController,
                label: "nom client",
                messag: "le nom du client",
                keyboard: TextInputType.text,
              ),
              CustomFormField(
                hintText: "Prénom :",
                controller: prenomClientController,
                label: "Code client",
                messag: "le prénom du client",
                keyboard: TextInputType.text,
              ),
            ],
          ),
        ),
      ),
      Step(
        state: currentStep > 1 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 1,
        title: Text(
          "Adresse :",
          style:TextStyle(fontSize: 16, fontFamily: 'LatoBold'),
        ),
        content: Form(
          key: _formkey2,
          child: Column(
            children: [
              CustomFormFieldRequired(
                hintText: "Rue :",
                controller: rueController,
                label: "Rue  ",
                messag: "la rue",
                keyboard: TextInputType.text,),
              CustomFormField(
                hintText: "Complément d'adresse :",
                controller: complementController,
                label: "Complément d'adresse ",
                messag: "le complément d'adresse",

                keyboard: TextInputType.text,),
              CustomFormField(
                hintText: "Numéro :",
                controller:numeroController,
                label: "Numéro",
                messag: "le numéro",
                keyboard: TextInputType.number,),
              CustomFormField(
                hintText: "Case postale :",
                controller: caseController,
                label: "Case postale",
                messag: "la case postale",
                keyboard: TextInputType.number,),
              CustomFormField(
                hintText: "Code porte :",
                controller: porteController,
                label: "Code porte",
                messag: "le code porte",
                keyboard: TextInputType.number,),
              CustomFormFieldRequired(
                hintText: "Localité :",
                controller: localiteController,
                label: "Localité  ",
                messag: "la localité",
                keyboard: TextInputType.text,),
              CustomFormFieldRequired(
                hintText: "NPA :",
                controller: npaController,
                label: "NPA",
                messag: "NPA",
                keyboard: TextInputType.number,),
              CustomFormFieldRequired(
                hintText: "Code statistique :",
                controller: statController,
                label: "Code statistique  ",
                messag: "le Code statistique",
                keyboard: TextInputType.text,),
            ],
          ),
        ),
      ),
      Step(
        state: currentStep > 2 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 2,
        title: Text(
          "Contact",
          style:TextStyle(fontSize: 16, fontFamily: 'LatoBold'),
        ),
        content: Form(
          key: _formkey3,
          child: Column(
            children: [
              CustomFormFieldRequired(
                hintText: "Email :",
                controller: mailController,
                label: " Email  ",
                messag: "l'adresse email",
                keyboard: TextInputType.emailAddress,),
              CustomFormField(
                hintText: "Téléphone :",
                controller: phoneController,
                label: "Téléphone ",
                messag: "le numéro de téléphone ",
                keyboard: TextInputType.phone,),
              CustomFormFieldRequired(
                hintText: "Mobile :",
                controller: mobileController,
                label: " Numero Mobile  ",
                messag: "le numero du mobile",
                keyboard: TextInputType.phone,),
            ],
          ),
        ),
      ),
    ];
  }
}
