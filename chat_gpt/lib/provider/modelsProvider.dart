import 'package:chat_gpt/api-model/apiModel.dart';
import 'package:chat_gpt/services/api-services.dart';
import 'package:flutter/material.dart';

class modelsProvider with ChangeNotifier{
  modelTypeClass modelObj = modelTypeClass();
  List<modelTypesModel>modelTypeList = [];
  List<modelTypesModel> get getModelList{
    return modelTypeList;
  }
  String currentValue =  'whisper-1';
  String get getCurrentValue{
    return currentValue;
  }
  void setCurrentModel (String newModel){
    currentValue = newModel;
    notifyListeners();
  }
  Future<List<modelTypesModel>> getAllModels ()async{
    modelTypeList = await modelObj.fetchModelTypes();
    return modelTypeList;
  }
}