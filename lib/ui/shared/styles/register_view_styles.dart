import 'package:flutter/material.dart';

const registerTextStyle = TextStyle(
    fontSize: 55, color: Color(0xffe74c3c), fontWeight: FontWeight.w600);

const inputDecorationStyle = InputDecoration(
    labelText: "Username",
    labelStyle: TextStyle(color: Color(0xffe74c3c)),
    contentPadding: EdgeInsets.symmetric(horizontal: 22, vertical: 16),
    border:
        OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xffe74c3c), width: 1),
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xffe74c3c), width: 2),
        borderRadius: BorderRadius.all(Radius.circular(10))));
