/*
//kode ke-1
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/mqtt_provider.dart';

class DashboardPage extends ConsumerStatefulWidget {
  const DashboardPage({super.key});

  @override
  ConsumerState<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends ConsumerState<DashboardPage> {
  final TextEditingController _timerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final isConnected = ref.watch(mqttProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Indikator Koneksi MQTT
            Row(
              children: [
                Text('Status: ${isConnected ? "Terhubung" : "Terputus"}'),
                const SizedBox(width: 10),
                Icon(
                  Icons.circle,
                  color: isConnected ? Colors.green : Colors.red,
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Input Durasi Timer + Tombol Set
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _timerController,
                    decoration: const InputDecoration(
                      labelText: 'Durasi Timer (detik)',
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    final mqtt = ref.read(mqttProvider.notifier);
                    mqtt.publishMessage(
                      '/OutEsp32',
                      'timer1=${_timerController.text}',
                    );
                    _timerController.clear(); // Kosongkan input setelah set
                  },
                  child: const Text('Set'),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Tombol Start, Stop, Pause
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    ref
                        .read(mqttProvider.notifier)
                        .publishMessage('/OutEsp32', 'start');
                  },
                  child: const Text('Start'),
                ),
                ElevatedButton(
                  onPressed: () {
                    ref
                        .read(mqttProvider.notifier)
                        .publishMessage('/OutEsp32', 'stop');
                  },
                  child: const Text('Stop'),
                ),
                ElevatedButton(
                  onPressed: () {
                    ref
                        .read(mqttProvider.notifier)
                        .publishMessage('/OutEsp32', 'pause');
                  },
                  child: const Text('Pause'),
                ),
              ],
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                context.go('/profile'); // Simulasi login langsung ke dashboard
              },
              child: const Text('Profil'),
            ),
          ],
        ),
      ),
    );
  }
}
*/

/*
//kode ke-2
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/mqtt_provider.dart';

class DashboardPage extends ConsumerStatefulWidget {
  const DashboardPage({super.key});

  @override
  ConsumerState<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends ConsumerState<DashboardPage> {
  final TextEditingController _timerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Mendapatkan status koneksi MQTT dan pesan yang diterima dari /InEsp32
    final isConnected = ref.watch(mqttProvider);
    final mqttMessage = ref.watch(mqttMessageProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Indikator Koneksi MQTT
            Row(
              children: [
                Text('Status: ${isConnected ? "Terhubung" : "Terputus"}'),
                const SizedBox(width: 10),
                Icon(
                  Icons.circle,
                  color: isConnected ? Colors.green : Colors.red,
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Input Durasi Timer + Tombol Set
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _timerController,
                    decoration: const InputDecoration(
                      labelText: 'Durasi Timer (detik)',
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    final mqtt = ref.read(mqttProvider.notifier);
                    mqtt.publishMessage(
                      '/OutEsp32',
                      'timer1=${_timerController.text}',
                    );
                    _timerController.clear(); // Kosongkan input setelah set
                  },
                  child: const Text('Set'),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Tombol Start, Stop, Pause
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    ref
                        .read(mqttProvider.notifier)
                        .publishMessage('/OutEsp32', 'start');
                  },
                  child: const Text('Start'),
                ),
                ElevatedButton(
                  onPressed: () {
                    ref
                        .read(mqttProvider.notifier)
                        .publishMessage('/OutEsp32', 'stop');
                  },
                  child: const Text('Stop'),
                ),
                ElevatedButton(
                  onPressed: () {
                    ref
                        .read(mqttProvider.notifier)
                        .publishMessage('/OutEsp32', 'pause');
                  },
                  child: const Text('Pause'),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Menampilkan Durasi yang Diterima dari /InEsp32
            if (mqttMessage.isNotEmpty)
              Text(
                'Durasi berjalan: $mqttMessage detik',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            const SizedBox(height: 40),

            // Tombol Profil
            ElevatedButton(
              onPressed: () {
                context.go('/profile'); // Navigasi ke halaman profil
              },
              child: const Text('Profil'),
            ),
          ],
        ),
      ),
    );
  }
}
*/

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/mqtt_provider.dart';

class DashboardPage extends ConsumerStatefulWidget {
  const DashboardPage({super.key});

  @override
  ConsumerState<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends ConsumerState<DashboardPage> {
  final TextEditingController _timerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final isConnected = ref.watch(mqttProvider);
    final mqttMessage = ref.watch(mqttMessageProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Indikator Koneksi MQTT
            Row(
              children: [
                Text('Status: ${isConnected ? "Terhubung" : "Terputus"}'),
                const SizedBox(width: 10),
                Icon(
                  Icons.circle,
                  color: isConnected ? Colors.green : Colors.red,
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Input Durasi Timer + Tombol Set
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _timerController,
                    decoration: const InputDecoration(
                      labelText: 'Durasi Timer (detik)',
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    final mqtt = ref.read(mqttProvider.notifier);
                    mqtt.publishMessage(
                      '/OutEsp32',
                      'timer1=${_timerController.text}',
                    );
                    _timerController.clear(); // Kosongkan input setelah set
                  },
                  child: const Text('Set'),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Tombol Start, Stop, Pause
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    ref
                        .read(mqttProvider.notifier)
                        .publishMessage('/OutEsp32', 'start');
                  },
                  child: const Text('Start'),
                ),
                ElevatedButton(
                  onPressed: () {
                    ref
                        .read(mqttProvider.notifier)
                        .publishMessage('/OutEsp32', 'stop');
                  },
                  child: const Text('Stop'),
                ),
                ElevatedButton(
                  onPressed: () {
                    ref
                        .read(mqttProvider.notifier)
                        .publishMessage('/OutEsp32', 'pause');
                  },
                  child: const Text('Pause'),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Menampilkan Durasi yang Diterima dari /InEsp32
            if (mqttMessage.isNotEmpty)
              Text(
                'Durasi berjalan: $mqttMessage detik',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            const SizedBox(height: 40),

            // Tombol Profil
            ElevatedButton(
              onPressed: () {
                context.go('/profile'); // Navigasi ke halaman profil
              },
              child: const Text('Profil'),
            ),
          ],
        ),
      ),
    );
  }
}
