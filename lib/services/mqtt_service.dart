import 'package:mqtt_client/mqtt_client.dart';
import 'package:uuid/uuid.dart';

class MqttService {
  late MqttClient client;
  late MqttConnectMessage connMess;
  late Function(String topic, String message) onMessageReceived;

  Future<bool> connect() async {
    final clientId = Uuid().v4(); // Membuat clientId unik menggunakan UUID
    client = MqttClient('tcp://209.182.237.240:1883', clientId);

    client.logging(on: true);

    connMess = MqttConnectMessage()
        .withClientIdentifier(clientId)
        .startClean()
        .withWillQos(MqttQos.atMostOnce);

    try {
      await client.connect();
      if (client.connectionStatus!.state == MqttConnectionState.connected) {
        print('Koneksi berhasil');
        subscribe('example/topic'); // Example usage of subscribe
        return true;
      } else {
        print('Koneksi gagal: ${client.connectionStatus}');
        return false;
      }
    } catch (e) {
      print('Error saat koneksi: $e');
      return false;
    }
  }

  void subscribe(String topic) {
    // Add logic to subscribe to the given topic
    print('Subscribed to topic: $topic');
  }
}
