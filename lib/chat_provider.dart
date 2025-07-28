import 'package:flutter/foundation.dart';
import 'llm_service.dart';

class ChatProvider with ChangeNotifier {
  List<ChatMessage> _messages = [];

  List<ChatMessage> get messages => _messages;

  void addMessage(ChatMessage message) {
    _messages.add(message);
    notifyListeners();
  }

  Future<void> sendMessage(String text) async {
    final userMessage = ChatMessage(text: text, isUser: true);
    addMessage(userMessage);

    try {
      final response = await LLMService.getResponse(text);
      final aiMessage = ChatMessage(text: response, isUser: false);
      addMessage(aiMessage);
    } catch (e) {
      addMessage(ChatMessage(
        text: "Error: ${e.toString()}",
        isUser: false,
      ));
    }
  }
}

class ChatMessage {
  final String text;
  final bool isUser;

  ChatMessage({required this.text, required this.isUser});
}