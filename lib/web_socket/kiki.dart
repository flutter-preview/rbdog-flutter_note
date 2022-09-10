import 'dart:convert';
import 'package:web_socket_channel/web_socket_channel.dart';

class Message {
  final String from;
  final List<String> to;
  final String body;
  Message({
    required this.from,
    required this.to,
    required this.body,
  });

  Message.fromJson(Map<String, dynamic> json)
      : from = json['from'],
        to = [...json['to']],
        body = json['body'];

  Map<String, dynamic> toJson() => {
        'from': from,
        'to': to,
        'body': body,
      };
}

class WebSocketMessager {
  final String url;
  final String clientId;
  WebSocketMessager({
    required this.url,
    required this.clientId,
  });

  WebSocketChannel? _channel;

  connect() {
    final urlString = '$url?id=$clientId';
    _channel = WebSocketChannel.connect(
      Uri.parse(urlString),
    );
  }

  Future<void> disConnect() async {
    await _channel?.sink.close();
    _channel = null;
  }

  receiveMessage(void Function(Message message) onReceive) {
    _channel?.stream.listen((event) {
      final json = jsonDecode(event);
      final message = Message.fromJson(json);
      onReceive.call(message);
    });
  }

  sendMessage(Message message) {
    final json = jsonEncode(message);
    _channel?.sink.add(json);
  }
}
