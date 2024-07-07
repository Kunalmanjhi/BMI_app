import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'yourBMI_Splash_screen.dart';

void main(){
  runApp(MyBmiApp());
}
class MyBmiApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'calculater BMI',
      theme: ThemeData(
        primarySwatch: Colors.indigo
      ),
      home:SplashScreenbmi(),
    );
  }
}
class MyBmiPage extends StatefulWidget{
  const MyBmiPage({Key? key}):super(key:key);
  @override
  State<StatefulWidget> createState() => _MyBmiPageState();
}
class _MyBmiPageState extends State<MyBmiPage>{
  var wtController = TextEditingController();
  var ftController= TextEditingController();
  var InController = TextEditingController();
  var result="";
  var bgColor= Colors.white;

  @override
  Widget build(BuildContext context) {
 return Scaffold(
   appBar: AppBar(
     title: Center(child: Text('BMI',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),)),
     backgroundColor: Color(0xfffcb69f)
   ),
   body: Container(
     decoration: BoxDecoration(
       gradient: LinearGradient(
         colors: [
           Color(0xffffecd2),Color(0xfffcb69f)
         ]
       )
     ),
     child: Center(
       child: Padding(
         padding: const EdgeInsets.all(21.0),
         child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
           children: [
             // Text('BMI', style: TextStyle(fontSize: 34,fontWeight: FontWeight.bold),),
             // SizedBox(height: 25,),
             Container(
               decoration: BoxDecoration(
                 border: Border.all(
                   width: 1,
                   color: Colors.black
                 ),
                 borderRadius: BorderRadius.circular(20)
               ),
               child: TextField(
                controller: wtController,
                 decoration: InputDecoration(
                   border: InputBorder.none,
                 label: Text('Enter Your Weight (In Kg)'),
                   prefixIcon: Icon(Icons.line_weight),
                 ),
                 keyboardType: TextInputType.number,
               ),
             ),
             SizedBox(height: 11,),
             Container(
               decoration: BoxDecoration(
                   border: Border.all(
                       width: 1,
                       color: Colors.black
                   ),
                   borderRadius: BorderRadius.circular(20)
               ),
               child: TextField(
                 controller: ftController,
                 decoration: InputDecoration(
                   border: InputBorder.none,
                   label: Text('Enter Your Height (In Feet)'),
                   prefixIcon: Icon(Icons.height),
                 ),
                 keyboardType: TextInputType.number,
               ),
             ),
             SizedBox(height: 11,),
             Container(
               decoration: BoxDecoration(
                   border: Border.all(
                       width: 1,
                       color: Colors.black
                   ),
                   borderRadius: BorderRadius.circular(20)
               ),
               child: TextField(
                 controller: InController,
                 decoration: InputDecoration(
                     border: InputBorder.none,
                   label: Text('Enter Your Height (In Inch)'),
                   prefixIcon: Icon(Icons.height)
                 ),
                 keyboardType: TextInputType.number,
               ),
             ),
             SizedBox(height: 20,),
             ElevatedButton(onPressed: () {
              var wt= wtController.text.toString();
              var ft = ftController.text.toString();
              var inch = InController.text.toString();
              if(wt!=""&& ft!="" && inch!=""){
                 var iwt= int.parse(wt);
                 var iFt=int.parse(ft);
                 var Iinch=int.parse(inch);
                 var tinch=(iFt*12) + Iinch;
                  var tcm=tinch*2.54;
                  var tm =tcm/100;
                  var bmi= iwt/(tm*tm);
                  var msg="";
                  if(bmi>25){
                    msg= "You're OverWeight!!";
                    bgColor= Colors.orange.shade200;
                  }else if(bmi<18){
                    msg="You're UnderWeight!!";
                    bgColor=Colors.red.shade200;
                  }else{
                    msg="You're Healthy!!";
                    bgColor=Colors.green.shade200;
                  }
                  setState(() {
                    result = "$msg \nYour BMI is: ${bmi.toStringAsFixed(2)}";
                  });
              }else{
                setState(() {
                  result= "Please fill all the require Blanks!";
                });
              }
               },
              child: Text('Calculate')),
             SizedBox(height: 11,),
             Text(result, style: TextStyle(fontSize: 20),)
           ],
         ),
       ),
     ),
   ),
 );
  }
}

