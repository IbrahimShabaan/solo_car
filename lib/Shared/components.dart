import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';

import 'constants.dart';


class AppButtons {
  static Widget customElevatedButton({
    Color? color,
    Color? hoverColor,
    Color? textColor,
    double width = 250,
    double height = 47,
    double elevation = 5,
    required String text,
    double fontSize = 16,
    double borderRadius = 12,
    required Function()? onPressed,
    FontWeight fontWeight = FontWeight.normal,
  }) =>
      ElevatedButton(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.black,

            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
        ),
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          side: BorderSide(width: 1.0, color: Colors.yellow,),
          elevation: elevation,
          onPrimary: hoverColor,
          primary: color,
          minimumSize: Size(width, height),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          ),

        ),
      );

  static Widget customTextButton({
    required String text,
    double? fontSize = 12,
    Color color = Colors.red,
    Color? hoverColor,
    double width = 40,
    double height = 49,
    required Function() onPressed,
    EdgeInsetsGeometry? padding,
    TextDecoration? decoration,
  }) =>
      TextButton(
        style: TextButton.styleFrom(
          primary: hoverColor,
          minimumSize: Size(width, height),
          padding: padding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            color: color,
            decoration: decoration,
          ),
        ),
        onPressed: onPressed,
      );

  static Widget customButtonBack(
      context,
      ) =>
      IconButton(
        icon: Icon(Icons.arrow_back_ios_new, size: 20,color: Colors.yellow,),
        onPressed: () => Navigator.pop(context),
      );

  static Widget customDropDownButtonFormField({
    String? value,
    double? itemHeight,
    TextStyle? hintStyle,
    Widget? hint,
    String? hintText = 'Select',
    Widget? disabledHint,
    double menuMaxHeight = 200,
    double? fontSize,
    required Function(Object?)? onChanged,
    required List<String> items,
    String? Function(dynamic)? validator,
    EdgeInsetsGeometry? contentPadding =
    const EdgeInsets.symmetric(horizontal: 10),
    EdgeInsetsGeometry? margin =
    const EdgeInsets.only(left: 20, right: 20, top: 5),
  }) =>
      Container(
        margin: margin,
        child: DropdownButtonFormField(
          focusColor: ConstColors.kPrimaryColor,
          itemHeight: itemHeight,
          menuMaxHeight: menuMaxHeight,
          disabledHint: disabledHint,
          value: value,
          onChanged: onChanged,
          validator: validator,
          hint: hint,
          iconEnabledColor: Colors.black,
          iconDisabledColor: Colors.grey,
          decoration: InputDecoration(
           filled: true,
            fillColor: Colors.yellow,
            hintStyle: hintStyle,
            hintText: hintText,
            contentPadding: contentPadding,
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black, width: 0.5),
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black, width: 0.5),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
              BorderSide(color: Colors.black, width: 0.1),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          items: items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,

              child: Text(
                item,

                style: TextStyle(
                  fontSize: fontSize,

                ),
              ),
            );
          }).toList(),
        ),
      );


}

class AppItems {
  static Widget customAppLogo() => Image(
    width: 160.sp,
    height: 75.sp,
    fit: BoxFit.fill,
    image: AssetImage(ConstIcons.appLogo),
  );

  static Widget customText(
      String text, {
        int? maxLines,
        bool? softWrap,
        double? fontSize,
        Color? fontColor,
        FontWeight? fontWeight,
        TextOverflow? overflow,
        TextAlign? textAlign,
      }) =>
      Text(
        text,
        overflow: overflow,
        textAlign: textAlign,
        maxLines: maxLines,
        softWrap: softWrap,
        style: TextStyle(
          fontSize: fontSize,
          color: fontColor,
          fontWeight: fontWeight,
        ),
      );

  static Widget customTextField({
    String? hintText,

    String? initialValue,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
    TextEditingController? controller,
    bool obscureText = false,

    bool enabled = true,
    bool readOnly = false,
    int maxLines = 1,
    double borderWidth = .5,
    double? hintFontSize,
    Color? hintColor,


    Function()? onTap,
    void Function(String)? onFieldSubmitted,
  }) => SizedBox(width:350,
      child: TextFormField(
        onTap: onTap,

        readOnly: readOnly,
        onFieldSubmitted: onFieldSubmitted,
        keyboardType: keyboardType,
        validator: validator,
        controller: controller,
        obscureText: obscureText,
        cursorColor: ConstColors.kPrimaryColor,
        maxLines: maxLines,
        enabled: enabled,
        initialValue: initialValue,

        decoration: InputDecoration(
          hintText: hintText,
          fillColor: Colors.yellow,
          filled: true,
          hintStyle: TextStyle(
            fontSize: hintFontSize,
            color: hintColor,
          ),
          contentPadding: const EdgeInsets.all(10),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: Colors.yellow,
              width: borderWidth,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: Colors.yellow,
              width: borderWidth,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: ConstColors.kPrimaryColor,
              width: borderWidth,
            ),
          ),
        ),
      ),);


  static Widget customIndicator() {
    return CircularProgressIndicator(
      backgroundColor: Colors.black,
      color: Colors.yellow,
    );
  }

  static customSnackBar(
      BuildContext context, {
        required String msg,
      }) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: AppItems.customText(msg, fontSize: 12.sp)),
      );
}

void navigateTo(context, widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);

void navigateAndFinish(
    context,
    widget,
    ) =>
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => widget),
          (route) {
        return false;
      },
    );
////////////////////////////////////////////////////////////////////

