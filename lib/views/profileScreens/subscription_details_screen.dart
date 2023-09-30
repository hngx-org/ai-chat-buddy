import 'package:flutter/material.dart';

class SubscriptionDetailsScreen extends StatefulWidget {
  const SubscriptionDetailsScreen({super.key});

  @override
  State<SubscriptionDetailsScreen> createState() =>
      SubscriptionDetailsScreenState();
}

class SubscriptionDetailsScreenState extends State<SubscriptionDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text('Subscription'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.deepPurple.shade800,
                Colors.blue.shade900,
              ],
            ),
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.deepPurple.shade800,
              Colors.blue.shade900,
            ],
          ),
        ),
      ),
    );
  }
}
