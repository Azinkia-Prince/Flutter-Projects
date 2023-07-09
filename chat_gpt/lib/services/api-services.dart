import 'dart:convert';
import 'package:chat_gpt/api-model/apiModel.dart';
import 'package:chat_gpt/api-model/chatModel.dart';
import 'package:http/http.dart';

class modelTypeClass {
  Future<List<modelTypesModel>> fetchModelTypes() async {
    Response response = await get(Uri.parse('https://api.openai.com/v1/models'),
        headers: {
          'Authorization':
              'Bearer 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'
        });
    Map<String, dynamic> bodyJson = jsonDecode(response.body);
    List<dynamic> data = bodyJson['data'];
    List<modelTypesModel> dataList =
        data.map((e) => modelTypesModel.fromJson(e)).toList();
    print(dataList);
    return dataList;
  }

  Future<List<chatModel>?> sendChat(String msg,{String? modelId}) async {
    Response response =
        await post(Uri.parse('https://api.openai.com/v1/chat/completions'),
            headers: {
              'Authorization':
                  'Bearer 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',
              'Content-Type': 'application/json'
            },
            body: jsonEncode({
              "model": "gpt-3.5-turbo",
              "messages": [
                {"role": "system", "content": "You are a helpful assistant."},
                {"role": "user", "content": msg.toString()}
              ]
            }));
    Map<String, dynamic> chatJson = jsonDecode(response.body);
    List<dynamic> data = chatJson['choices'];
    List<chatModel> chatList = data.map((e) => chatModel.fromJson(e)).toList();
    print(chatList);
    return chatList;
  }
}
