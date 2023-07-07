import 'package:chat_gpt/constants/colors.dart';
import 'package:flutter/material.dart';
import '../constants/dummy-data.dart';

class dropDown extends StatefulWidget {
  @override
  State<dropDown> createState() => _dropDownState();
}

class _dropDownState extends State<dropDown> {
  
  static List<String> modelList = [
    'Model 1',
    'Model 2',
    'Model 3',
  ];
  String currentValue = modelList.first;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton(
        dropdownColor: scaffoldClr,
        focusColor: Colors.transparent,
        items: modelList.map((item) => DropdownMenuItem(child: Text(item),value: item,)).toList(),
        value: currentValue,
        onChanged: (val) => setState(() {
          currentValue = val.toString();
        }),
      ),
    );
  }
}
