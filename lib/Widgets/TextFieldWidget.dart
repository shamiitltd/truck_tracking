import 'package:flutter/material.dart';

class myTextField extends StatelessWidget {
  const myTextField(
      {Key? key,
      required this.thecontroller,
      required this.thehintText,
      required this.theicon,
      required this.theWidth,
      required this.theHeight,
      required this.themarginHorizontal,
      required this.themarginVertical,
      required this.thesuffixIcon,
      required this.obsecureText,
      required this.thecontentPaddingHorizontal,
      required this.thecontentPaddingVertical,
      required this.themaxLength})
      : super(key: key);
  final thecontroller;
  final thehintText;
  final theicon;
  final theWidth;
  final theHeight;
  final themarginHorizontal;
  final themarginVertical;
  final thesuffixIcon;
  final obsecureText;
  final thecontentPaddingHorizontal;
  final thecontentPaddingVertical;
  final themaxLength;
  //keyboardType: TextInputType.number,
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: themarginHorizontal, vertical: themarginVertical),
      height: theHeight,
      width: theWidth,
      child: TextField(
          maxLength: themaxLength,
          controller: thecontroller,
          obscureText: obsecureText!,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                  horizontal: thecontentPaddingHorizontal,
                  vertical: thecontentPaddingVertical),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              hintText: thehintText,
              hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
              prefixIcon: theicon,
              suffixIcon: thesuffixIcon)),
    );
  }
}

class myTextField2 extends StatelessWidget {
  const myTextField2(
      {Key? key,
      required this.thecontroller,
      required this.thehintText,
      required this.theicon,
      required this.theWidth,
      required this.theHeight,
      required this.themarginHorizontal,
      required this.themarginVertical,
      required this.thesuffixIcon,
      required this.obsecureText,
      required this.thecontentPaddingHorizontal,
      required this.thecontentPaddingVertical,
      required this.themaxLength})
      : super(key: key);
  final thecontroller;
  final thehintText;
  final theicon;
  final theWidth;
  final theHeight;
  final themarginHorizontal;
  final themarginVertical;
  final thesuffixIcon;
  final obsecureText;
  final thecontentPaddingHorizontal;
  final thecontentPaddingVertical;
  final themaxLength;
  //keyboardType: TextInputType.number,
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: themarginHorizontal, vertical: themarginVertical),
      height: theHeight,
      width: theWidth,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white.withOpacity(0.4)),
      child: TextField(
          maxLength: themaxLength,
          controller: thecontroller,
          obscureText: obsecureText!,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                  horizontal: thecontentPaddingHorizontal,
                  vertical: thecontentPaddingVertical),
              border: InputBorder.none,
              hintText: thehintText,
              hintStyle: TextStyle(color: Colors.black.withOpacity(0.4)),
              prefixIcon: theicon,
              suffixIcon: thesuffixIcon)),
    );
  }
}
