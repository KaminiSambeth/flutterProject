
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  // This widget is the root of your application.
 Color gradientStart = Colors.deepPurple[700]; //Change start gradient color here
  Color gradientEnd = Colors.purple[500];
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController _acontroller = TextEditingController();
  final TextEditingController _hcontroller = TextEditingController();
  final TextEditingController _wcontroller = TextEditingController();
  double a = 0.0, w = 0.0, h = 0.0, bmr = 0.0;
  double calories=0.0;
  List<String> _locations =['Male','Female'];
  List<String> _activity=['Sedentary(Little or no exercise)',
                          'Lightly active (light exercise 1-3 days a week)',
                          'Moderately active (moderate exercise 3-5 days a week)',
                          'Very active (hard exersice 6-7 days a week)',
                          'Super active(very hard exercise and a physical job)',];
  String _selectedlocation;
    String _selectedactivity;

  @override
  Widget build(BuildContext context) {
   
    return MaterialApp(
    debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
         resizeToAvoidBottomPadding: false,
         backgroundColor: Colors.amber,
        appBar: AppBar  (
          title: Text('BMR Application'),
        ),
        body: Column (
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
        new DropdownButton( 
           hint: Text ("GENDER"),
           style:TextStyle(
              fontSize:30.0,
              color:Colors.black),
           value:_selectedlocation,
           onChanged: (dynamic newValue){
             setState(() {
              _selectedlocation =newValue; 
             });
           },
           items:_locations.map((location){
             return DropdownMenuItem(
               child: new Text(location),
               value: location,
             );
           }).toList(),
         ),

            Padding(
              padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
              child: TextField(
                style:TextStyle(
              fontSize:25.0,
              color:Colors.black),
                decoration: InputDecoration(
                  labelText: "Age",  
                ),
                keyboardType: TextInputType.numberWithOptions(),
                controller: _acontroller,
              ),
            ),
            
            Padding(
              padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
              child: TextField(
              style:TextStyle(
              fontSize:25.0,
              color:Colors.black),
                decoration: InputDecoration(
                  labelText: "Height(cm)",
                ),
                keyboardType: TextInputType.numberWithOptions(),
                controller: _hcontroller,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
              child: TextField(
              style:TextStyle(
              fontSize:25.0,
              color:Colors.black),
                decoration: InputDecoration(
                  labelText: "Weight(kg)",
                ),
                keyboardType: TextInputType.numberWithOptions(),
                controller: _wcontroller,
              ),
            ),
           
           DropdownButton(  
            hint: Text ("Activity Level"),
             style:TextStyle(
              fontSize:15.0,
              color:Colors.black),
           value:_selectedactivity,
           icon:Icon(
              Icons.arrow_drop_down,
              color: Color.fromRGBO(0, 120, 180, 5),
              ),
              iconSize: 35,
              elevation: 25,
              underline: Container(
                height: 5,
                color: Colors.black,
              ),
           onChanged: (dynamic newValue){
             setState(() {
              _selectedactivity =newValue; 
             });
           },
           items:_activity.map((location){
             return DropdownMenuItem(
               child: new Text(location),
               value: location,
             );
           }).toList(),
         ),

            MaterialButton(shape:
             RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)
            ),
            minWidth: 200,
            height: 35,
            child: Text('Claclulate BMR'),
            color:Color.fromRGBO(0, 150, 170, 1),
            textColor: Colors.black,
            elevation: 5,
            onPressed: _onPress,
            ),
            
            Padding(
              padding: EdgeInsets.fromLTRB(40, 30, 40, 30),
              child:Text('You have a BMR of $bmr and the daily calorie needs based on activity level is $calories',
              style:TextStyle(
              fontSize:20.0,
              color:Colors.black),
                ),
            ),
               
                 ] ),

                ),
            );
    // TODO: implement build
    
  }


  void _onPress() {
    setState(() {
      a = double.parse(_acontroller.text);
      h = double.parse(_hcontroller.text);
      w = double.parse(_wcontroller.text);

      bmr= (10 *w) + (6.25 * h) - ( 5 * a);

           if (_selectedlocation == 'Female') {
        bmr = bmr - 161;
      } else if (_selectedlocation == 'Male') {
        bmr = bmr + 5;
      }
            
          if (_selectedactivity == 'Sedentary(Little or no exercise)') {
        calories = bmr * 1.2;
      } else if (_selectedactivity ==
          'Lightly active (light exercise 1 - 3 days a week)') {
        calories = bmr * 1.375;
      }else if(_selectedactivity==
          'Moderately active (moderate exercise 3-5 days a week)'){
        calories=bmr *1.55;
      }else if (_selectedactivity ==
          'Very active(hard exercise 6-7 days a week)') {
        calories = bmr * 1.725;
      } else {
        calories = bmr * 1.9;
      }
      calories=calories.roundToDouble();
    });
          }
      
}

