import 'package:flutter/material.dart';

void customSnackBar(context, String url) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(backgroundColor:Colors.red,content: Text("Cannot launch $url",style: const TextStyle(color: Colors.white),)),);
}