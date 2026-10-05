import 'package:flutter/material.dart';

void main() => runApp(const SightLineApp());

class SightLineApp extends StatelessWidget {
  const SightLineApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SightLine',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SightLine')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Semantics(
                header: true,
                child: Text(
                  'Welcome to SightLine',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Hear descriptions of your surroundings. '
                'Camera capture and spoken descriptions are coming soon.',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 32),
              const FilledButton(
                onPressed: null,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Text('Describe surroundings — coming soon'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
