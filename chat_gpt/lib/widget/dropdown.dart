import 'package:chat_gpt/api-model/apiModel.dart';
import 'package:chat_gpt/constants/colors.dart';
import 'package:chat_gpt/provider/modelsProvider.dart';
import 'package:chat_gpt/services/api-services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import '../constants/dummy-data.dart';

class dropDown extends StatefulWidget {
  @override
  State<dropDown> createState() => _dropDownState();
}

class _dropDownState extends State<dropDown> {
  modelTypeClass modelObj = modelTypeClass();
  String? currentValue;
  @override
  Widget build(BuildContext context) {
    final ModelsProvider = Provider.of<modelsProvider>(context,listen: false);
    currentValue = ModelsProvider.getCurrentValue;
    return FutureBuilder(
      future: ModelsProvider.getAllModels(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<modelTypesModel> modelList = snapshot.data ?? [];
          return DropdownButtonHideUnderline(
            child: DropdownButton(
              alignment: Alignment.center,
              dropdownColor: scaffoldClr,
              focusColor: Colors.transparent,
              items: modelList
                  .map((item) => DropdownMenuItem(
                        child: Text(item.id.toString(),),
                        value: item.id.toString(),
                      ))
                  .toList(),
              value: currentValue,
              onChanged: (val){
                setState(() {
                  currentValue=val.toString();
                });
                ModelsProvider.setCurrentModel(val.toString());
              },
            ),
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}
