import 'dart:convert';

List<chatModel> chatModelFromJson(String str) => List<chatModel>.from(json.decode(str).map((x) => chatModel.fromJson(x)));

String chatModelToJson(List<chatModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class chatModel {
    int index;
    Message message;
    String finishReason;

    chatModel({
        required this.index,
        required this.message,
        required this.finishReason,
    });

    factory chatModel.fromJson(Map<String, dynamic> json) => chatModel(
        index: json["index"],
        message: Message.fromJson(json["message"]),
        finishReason: json["finish_reason"],
    );

    Map<String, dynamic> toJson() => {
        "index": index,
        "message": message.toJson(),
        "finish_reason": finishReason,
    };
}

class Message {
    String role;
    String content;

    Message({
        required this.role,
        required this.content,
    });

    factory Message.fromJson(Map<String, dynamic> json) => Message(
        role: json["role"],
        content: json["content"],
    );

    Map<String, dynamic> toJson() => {
        "role": role,
        "content": content,
    };
}
