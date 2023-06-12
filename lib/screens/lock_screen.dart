// ignore_for_file: avoid_print, unnecessary_this

import 'package:flutter/material.dart';

class LockScreen extends StatefulWidget {
  const LockScreen({super.key});

  @override
  State<LockScreen> createState() => _LockScreenState();
}

class _LockScreenState extends State<LockScreen> with WidgetsBindingObserver {
  bool screenOn = true;

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.paused: // screen off/navigate away
        // this.screenOn = false;
        this.screenOn = false;
        break;
      case AppLifecycleState.resumed: // screen on/navigate to
        this.screenOn = true;
        break;
      case AppLifecycleState.inactive: // screen off/navigate away
        this.screenOn = false;
        break;
      case AppLifecycleState.detached:
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen of or on"),
      ),
      body: Center(
        child: screenOn ? const Text("Screen on") : const Text("Screen of"),
      ),
    );
  }
}
