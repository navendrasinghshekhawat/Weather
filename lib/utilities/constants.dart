import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

//colors
Color hot = Colors.deepOrangeAccent;
Color cold = Colors.lightBlueAccent;
//font colors
Color hotWeatherFont = Colors.orange.shade800;
Color coldWeatherFont = Colors.blueAccent.shade700;


//appbar
TextStyle kAppBarTextStyle = TextStyle(fontSize: 40, color: Colors.blueGrey[700], fontWeight: FontWeight.bold);

//temperature style
TextStyle kTemperatureStyle = TextStyle(
  fontSize: 100,
  color: coldWeatherFont,
  fontWeight: FontWeight.bold,
);
BoxDecoration kTemperatureBoxDecoration =BoxDecoration(
  color: hot,
  shape: BoxShape.rectangle,
  borderRadius: BorderRadius.all(Radius.circular(8.0)),
);


//weather icon style
TextStyle kWeatherIconStyle = TextStyle(
fontSize: 100,
);
BoxDecoration kWeatherIconBoxDecoration = BoxDecoration(
  color: cold,
  shape: BoxShape.rectangle,
  borderRadius: BorderRadius.all(Radius.circular(8.0)),
);


//weather message style
TextStyle kWeatherMessage = TextStyle(
  fontSize: 100,
  color: coldWeatherFont,
  fontWeight: FontWeight.bold,
);

BoxDecoration kWeatherMessageBoxDecoration = BoxDecoration(
  color: cold,
  shape: BoxShape.rectangle,
  borderRadius: BorderRadius.all(Radius.circular(8.0)),
);


//textfield style
InputDecoration kTextFieldInputDecoration = InputDecoration(
    filled: true,
    fillColor: Colors.cyan[400],
    hintText: "Search City",
    hintStyle: TextStyle(
        color: Colors.blue.shade900, fontSize: 28),
    border: const OutlineInputBorder(
        borderRadius:
        BorderRadius.all(Radius.circular(8)),
    borderSide: BorderSide(color: Colors.cyan,width: 0)
    ));


//search icon style
Icon kSearchIcon = Icon(
  Icons.search,
  size: 55,
  color: Colors.blue.shade900,
);

ButtonStyle kSearchIconButtonStyle = ButtonStyle(
  backgroundColor: MaterialStateProperty.all(Colors.cyan[400]),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
      )
  )
);


//location icon style
Icon kLocationIcon =Icon(
  Icons.my_location,
  size: 55,
  color: Colors.blue.shade900,
);

ButtonStyle kLocationIconButtonStyle =ButtonStyle(
  backgroundColor: MaterialStateProperty.all(Colors.cyan[400]),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        )
    )
);