import 'package:first_mission/shared/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget defaultFlatBotton({
  Function function,
  String text,
  bool toUpper = true,
  double radius = 5.0,
  Color background = defaultColor,
}){
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(radius),
      color: background,
    ),
    width: double.infinity,
    height: 50.0,
    child: FlatButton(
        onPressed: function,
        child: Text(toUpper? text.toUpperCase() : text,style: TextStyle(color:Colors.white),)
    ),
  );
}
void navigate(context , widget){
  Navigator.push(context, MaterialPageRoute(builder: (context)=> widget));
}

void finishNavigate(context , widget){
  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => widget), (Route<dynamic> route) => false);
}

Widget defaultCaptionText(String text)=>
  Text(text,style: TextStyle(fontSize: 20 ,fontWeight: FontWeight.w300));

Widget defaultHeadText(String text)=>
    Text(text,style: TextStyle(fontSize: 30.0,),);

Widget detailsText(String text)=>
  Text(text,style: TextStyle(fontSize: 15.0),);


Widget defaultImageLogo(String imageSourse)=>
Image(image: AssetImage(imageSourse),color: Colors.white ,height: 20.0,);

Widget defaultTextForm({
  @required TextEditingController controller,
   String title,
  String hint,
  @required TextInputType type,
  bool obscureText = false,
}) =>
   Container(
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5.0),
      color: Colors.white,
    ),
    padding: EdgeInsetsDirectional.only(
      start: 10.0,
      end: 10.0,
      top: 10.0,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(title != null ) detailsText(title),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
            border: InputBorder.none,
          ),
          keyboardType: type,
        )
      ],
    ),
  );

void buildProgress({
  context,
  text,
}) =>
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Row(
          children: [
            CircularProgressIndicator(),
            SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Text(
                text,
              ),
            ),
          ],
        ),
      ),
    );

