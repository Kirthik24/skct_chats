import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:skct_chats/pages/PersonContactDetails.dart';
import '../model/ContactClass.dart';

class ContactListPage extends StatefulWidget {
  final String destination;

  const ContactListPage({Key? key, required this.destination}) : super(key: key);


  @override
  State<ContactListPage> createState() => _ContactListPageState();
}

class _ContactListPageState extends State<ContactListPage> {



  late Future<List<ContactClass>> contactsFuture;

  @override
  void initState(){
    super.initState();

    contactsFuture = getContacts(context,widget.destination);
  }



  Future<List<ContactClass>> getContacts(BuildContext context,String dept) async{
    final assetBundle = DefaultAssetBundle.of(context);
    final String address = 'assets/data.json';
    final data = await assetBundle.loadString(address);

    final body = json.decode(data);

    final List<ContactClass> li = body.map<ContactClass>(ContactClass.fromJson).toList();
    final List<ContactClass> reqLi;
    reqLi = [];
    ContactClass item;
    for(item in li){
      if(item.department == dept){
        reqLi.add(item);
      }
    }

    return reqLi;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Contacts List'),
      centerTitle: true,
    ),
    body: Center(
        child: FutureBuilder<List<ContactClass>>(
          future:  contactsFuture,
          builder: (context, snapshot){
            if(snapshot.hasData){
              final contacts = snapshot.data!;
              return buildContacts(contacts);
            }else{
              return Text('assets/${widget.destination}.json');
            }
          },
        )
    ),
  );

  Widget buildContacts(List<ContactClass> contacts) => ListView.builder(
    itemCount: contacts.length,
    itemBuilder: (context, index) {
      final thiscontact = contacts[index];

      return Card(
        child: ListTile(
          title: Text(thiscontact.name),
          subtitle: Text(thiscontact.des),
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute
              (builder: (context) => PersonContactDetails(contact: thiscontact),
            ));
          },
        ),
      );

    },
  );

}
