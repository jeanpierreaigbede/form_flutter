import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: FormPage(),
    );
  }
}


class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
     /* appBar:AppBar(
        backgroundColor: Colors.white,
        title: Text('Form State'),
        centerTitle: true,
      ) ,*/
      body:Center(
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 25),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                    'Inscrivez - vous',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(height: 20,),
                // Nom et Prenoms
                TextFormField(
                  controller: nameController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Votre nom et prenoms",
                    labelText: "Nom",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  validator: (value){
                    if(value == null || value ==""){
                      return "Veuillez rentrer votre nom et prenom";
                    }
                    else{
                      return null;
                    }

                  },
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: "Votre Email",
                      labelText: "Email",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),

                  ),
                  validator: (value){
                    if(value == null || value == ""){
                      return "Veuillez rentrer votre email";
                    }else{
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 20,),
                // Email
                TextFormField(
                  obscureText: true,

                  controller: passwordController,
                  decoration: InputDecoration(
                    hintText: "Votre mot de passe",
                    labelText: "Mot de pass",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),

                  ),
                  validator: (value){
                    if(value == null || value ==""){
                      return "Veuillez rentrer votre mot de passe";
                    }
                    else{
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 20,),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green
                  ),
                    onPressed: (){
                    if(formKey.currentState!.validate()){
                      print("Le nom :${nameController.text}");
                      print("L'email :${emailController.text}");
                      print("Le mot de passse :${passwordController.text}");

                    }
                    },
                    child:const  Text(
                  "S'inscrire",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),))
              ],
            ),
          )
        ),
      ) ,

    );
  }
}

