import 'package:flutter/material.dart';

import '../widgets/task_aap_bar.dart';

class CancelScreen extends StatefulWidget {
  const CancelScreen({super.key});

  @override
  State<CancelScreen> createState() => _CancelScreenState();
}

class _CancelScreenState extends State<CancelScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TMApp_bar(),
    );
  }
}
