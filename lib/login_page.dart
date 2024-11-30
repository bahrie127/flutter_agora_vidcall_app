import 'package:flutter/material.dart';
import 'package:flutter_agora_vidcall_app/data/agora_datasource.dart';
import 'package:flutter_agora_vidcall_app/video_call_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final channelController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          const SizedBox(height: 120),
          const Center(
            child: Text(
              'Login to Call',
              style: TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Channel Name',
              ),
              controller: channelController,
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(20),
            child: ElevatedButton(
              onPressed: () async {
                final dataToken =
                    await AgoraDatasource().getToken(channelController.text);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => VideoCallPage(
                              channel: channelController.text,
                              token: dataToken.token,
                              uid: dataToken.uid,
                            )));
              },
              child: const Text('Call Now'),
            ),
          ),
        ],
      ),
    );
  }
}
