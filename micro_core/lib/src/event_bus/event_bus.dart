import 'dart:async';
import 'dart:developer';

class EventBus {
  static final EventBus _instance = EventBus._internal();

  factory EventBus() {
    return _instance;
  }

  EventBus._internal();

  final _controller = StreamController<Payload>.broadcast();

  static void emit(Payload payload) {
    log('Sent by: ${payload.sentBy}');
    log('Value: ${payload.value}');
    _instance._controller.sink.add(payload);
  }

  static get listen => _instance._controller.stream.listen;
}

class Payload {
  final String sentBy;
  final String type;
  final dynamic value;

  Payload({
    required this.sentBy,
    required this.type,
    this.value,
  });
}
