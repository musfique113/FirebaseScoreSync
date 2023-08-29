import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:livescore_firebase/match_list_screen.dart';

class LiveScoreFirebase extends StatelessWidget {
  const LiveScoreFirebase({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Live Score App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
        fontFamily: "Poppins",
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Match List'),
        centerTitle: true,
      ),
      body: const MatchList(),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     // FirebaseFirestore.instance
      //     //     .collection('livedata)
      //     //     .doc('1_ban_vs_ind')
      //     //     .update({'match_name': "Bangladesh VS India", 'score_team_b': 7});
      //         },
      //   child: Icon(Icons.add),
      // ),
    );
  }
}
