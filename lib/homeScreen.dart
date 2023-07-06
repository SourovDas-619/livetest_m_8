import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Contact> contacts = [
    Contact('Mithun Das', 'sourov01866@gmail.com', '01703473949'),
    Contact('Sourov Sarker', 'sourov15-12504@diu.edu.bd', '01630150120'),
    Contact('Riyad Hossain', 'riyad15-12367@diu.edu.bd', '01830241698'),
    Contact('Samsu Kopa', 'samsu777@gmail.com', '01523666999'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: const Text(
          'Contact List',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: contacts.length,
              itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(8.0),
              color: Colors.black12,
              child: ListTile(
                title: Text('${contacts[index].name}'),
                onTap: (){
                  showBottomSheet(index);
                },
              ),
            );
          }),
        ),
      ),
    );
  }
  void showBottomSheet(int indexId){
    showModalBottomSheet(context: context, builder: (context){
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          height: 230,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text('Contacts Detais',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                const SizedBox(height: 10),
                Text('Name : '+contacts[indexId].name,style: const TextStyle(fontSize: 16),),
                const SizedBox(height: 10),
                Text('Email : '+contacts[indexId].email,style: const TextStyle(fontSize: 16),),
                const SizedBox(height: 10),
                Text('PhoneNumber : '+contacts[indexId].phoneNumber,style: const TextStyle(fontSize: 16),),
                const SizedBox(height: 10),

              ],
            ),
          ),
        ),
      );
    });

  }
}

class Contact {
  String name;
  String email;
  String phoneNumber;

  Contact(this.name, this.email, this.phoneNumber);
}
