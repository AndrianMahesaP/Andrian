import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://pfdnscqyvvszqqsoyloq.supabase.co',
    anonKey: 'sb_publishable_Us0QVnKiDrXalgMQ-oo4KA_9_fQA_CB',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            // contoh cek koneksi Supabase
            final supabase = Supabase.instance.client;
            final res = await supabase.from('users').select().limit(1);

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Supabase OK: ${res.length} data')),
            );
          },
          child: const Text('Tes Koneksi Supabase'),
        ),
      ),
    );
  }
}
