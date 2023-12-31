import 'package:flutter/material.dart';
import 'package:flutter_application_1/utiles/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changedButton = false;

  final _formkey=GlobalKey<FormState>();

   movetohome(BuildContext context)async{
    if (_formkey.currentState!.validate()) {
      
    
      setState(() {
      changedButton = true;
    });
    await Future.delayed(Duration(seconds: 1));
    await Navigator.pushNamed(context, MyRoutes.homeRoutes);
    setState(() {
      changedButton = false;
    });
    }
   }
  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color.fromRGBO(255, 255, 255, 1),
      child: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Image.asset(
                "assets/images/hey.png",
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Welcome $name",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter Username",
                        labelText: "Username",
                      ),
                       validator: (value) {
                        if (value!.isEmpty) {
                          return "Username Cannot Be Empty";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        name = value;
                        setState(() {});
                      },
                     
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Enter Password",
                        labelText: "Password",
                      ),
                       validator: (value) {
                        if (value!.isEmpty) {
                          return "Password Cannot Be Empty";
                        }
                        else if(value.length<6){
                          return "Password length Should be 6";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Material(
                        color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(changedButton ? 50 : 8),
                      child: InkWell(
                        onTap: () => movetohome(context),
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          width: changedButton ? 50 : 150,
                          height: 40,
                          alignment: Alignment.center,
                          child:changedButton 
                          ? Icon(
                            Icons.done,
                            color: Colors.white,
                          )
                          :
                          Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          
                        ),
                      ),
                    ),
        
                    
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}






// ElevatedButton(
                    //   child: Text("Login"),
                    //   style: TextButton.styleFrom(minimumSize: Size(150, 40)),
                    //   onPressed: () {
                    //     Navigator.pushNamed(context, MyRoutes.homeRoutes);
                    //   },
                    // ),