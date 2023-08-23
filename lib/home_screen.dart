import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<void> getDataFromFirebase() async {
    CollectionReference collectionReference = firebaseFirestore.collection("livedata");
   final DocumentReference documentReference = collectionReference.doc("ban_vs_ind_day_01");
   final data = await documentReference.get();
   print(data.data());
  }

  @override
  void initState() {
    // TODO: implement initState
    getDataFromFirebase();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Live data sync"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 54,),
          Text("Match Name",style: Theme.of(context).textTheme.headlineLarge,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text("12",style: Theme.of(context).textTheme.titleMedium ,),
                  SizedBox(height: 24,),
                  Text("Team Name",style: Theme.of(context).textTheme.titleMedium ,),
                ],
              ),
              Text("VS"),
              Column(
                children: [
                  Text("12",style: Theme.of(context).textTheme.titleMedium ,),
                  SizedBox(height: 24,),
                  Text("Team Name",style: Theme.of(context).textTheme.titleMedium ,),
                ],
              ),
            ],
          ),
          Center(
              child: TextButton(
            child: Text('Push'),
            onPressed: () {
              print("Presed");
            },
          )),
        ],
      ),
    );
  }
}
