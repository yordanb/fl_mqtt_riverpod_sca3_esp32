//kode ke-1
/*
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

final mqttMessageProvider = StateProvider<String>((ref) => '');

final mqttProvider = StateNotifierProvider<MqttNotifier, bool>((ref) {
  return MqttNotifier();
});

class MqttNotifier extends StateNotifier<bool> {
  late MqttServerClient client;

  MqttNotifier() : super(false) {
    _connect();
  }

  void _connect() async {
    client = MqttServerClient('209.182.237.240', 'flutter_client');
    client.keepAlivePeriod = 5;
    client.onConnected = () {
      state = true;
    };
    client.onDisconnected = () {
      state = false;
    };

    try {
      await client.connect();
    } catch (e) {
      state = false;
    }
  }

  void publishMessage(String topic, String message) {
    final builder = MqttClientPayloadBuilder();
    builder.addString(message);
    client.publishMessage(topic, MqttQos.atLeastOnce, builder.payload!);
  }

  void disconnect() {
    client.disconnect();
  }
}
*/

//kode ke-2
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

final mqttMessageProvider = StateProvider<String>(
  (ref) => '',
); // Untuk menyimpan pesan dari /InEsp32

final mqttProvider = StateNotifierProvider<MqttNotifier, bool>((ref) {
  return MqttNotifier(ref);
});

class MqttNotifier extends StateNotifier<bool> {
  late MqttServerClient client;
  final Ref ref;

  MqttNotifier(this.ref) : super(false) {
    _connect();
  }

  void _connect() async {
    client = MqttServerClient('209.182.237.240', 'flutter_client');
    client.keepAlivePeriod = 5;
    client.onConnected = () {
      state = true;
      _subscribeToTopic(); // Subscribe ke topik setelah koneksi berhasil
    };
    client.onDisconnected = () {
      state = false;
    };

    try {
      await client.connect();
    } catch (e) {
      state = false;
      print("Error connecting to MQTT broker: $e");
    }
  }

  // Fungsi untuk melakukan subscribe ke topik
  void _subscribeToTopic() {
    client.subscribe('/InEsp32', MqttQos.atLeastOnce); // Subscribe ke /InEsp32
    client.onSubscribed = (topic) {
      print('Subscribed to topic: $topic');
    };

    // Menangani pesan yang diterima dari broker MQTT
    client.updates!.listen((List<MqttReceivedMessage<MqttMessage>> messages) {
      final MqttPublishMessage payload =
          messages[0].payload as MqttPublishMessage;
      final messageStr = MqttPublishPayload.bytesToStringAsString(
        payload.payload.message,
      );

      // Perbarui mqttMessageProvider dengan pesan yang diterima
      ref.read(mqttMessageProvider.notifier).state = messageStr;
    });
  }

  // Fungsi untuk publish pesan
  void publishMessage(String topic, String message) {
    final builder = MqttClientPayloadBuilder();
    builder.addString(message);
    client.publishMessage(topic, MqttQos.atLeastOnce, builder.payload!);
  }

  // Fungsi untuk disconnect dari broker
  void disconnect() {
    client.disconnect();
  }
}
