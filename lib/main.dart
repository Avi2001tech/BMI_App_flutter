import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var wtController = TextEditingController();
  var htController = TextEditingController();
  var inController = TextEditingController();
  var result ="";
  var bgcolor = Colors.blue.shade50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("BMI Calculator",style: TextStyle(fontFamily: 'heading', fontSize: 31),),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:Card(
            shadowColor: Colors.black,
            elevation: 12,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0),bottomRight: Radius.circular(30.0))
            ),
            borderOnForeground: true,
            child: Padding(
              padding: const EdgeInsets.all(11.0),
              child: Container(
                width: 300,
                height: 450,
                color: bgcolor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("BMI",style: TextStyle(fontSize: 34,fontWeight: FontWeight.w500,fontFamily: 'Courier',color: Colors.blue.shade800
                    ),),

                    SizedBox(height: 15,),

                    TextField(
                      controller: wtController,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        label: Text("Enter your Weight (in Wts)"),
                        prefixIcon: Icon(Icons.line_weight_rounded),
                      ),
                      keyboardType: TextInputType.number,
                    ),

                    TextField(
                      cursorColor: Colors.black,
                      controller: htController,
                      decoration: InputDecoration(
                        label: Text("Enter your Height (in fts)"),
                        prefixIcon: Icon(Icons.height_rounded),
                      ),
                      keyboardType: TextInputType.number,
                    ),

                    TextField(
                      cursorColor: Colors.black,
                      controller: inController,
                      decoration: InputDecoration(
                        label: Text("Enter your inches(in inch)"),
                        prefixIcon: Icon(Icons.height_outlined),
                      ),
                      keyboardType: TextInputType.number,
                    ),

                    SizedBox(height: 19,),

                    ElevatedButton(onPressed: (){
                      var wt = wtController.text.toString();
                      var ht = htController.text.toString();
                      var inch = inController.text.toString();

                      if(wt!="" && ht!="" && inch!=""){
                        var iwt = int.parse(wt);
                        var iht = int.parse(ht);
                        var iInch = int.parse(inch);

                        var tInch = (iht*12) + iInch;
                        var tCM = (tInch*2.54);
                        var tM = tCM/100;

                        var bmi = iwt/(tM *tM);

                        var msg ="";
                        if(bmi>=25){
                          msg = "You are overweight !!";
                          bgcolor = Colors.red.shade100;
                        }
                        else if(bmi<=18){
                          msg ="You are UnderWeight";
                          bgcolor=Colors.green.shade50;
                        }
                        else{
                          msg ="You are healthy";
                          bgcolor=Colors.yellow.shade50;
                        }
                        setState(() {
                          result ="$msg\nYour BMI is ${bmi.toStringAsFixed(4)}";
                        });
                      }
                      else{
                        setState(() {
                          result="please fill all the required fields !";
                        });
                      }

                    }, child: Text("Calculate")),

                    SizedBox(height: 15,),

                    Padding(
                      padding: const EdgeInsets.all(11.0),
                      child: Text(result,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,fontFamily: 'Courier'),),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      )
    );
  }
}
