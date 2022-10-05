import 'package:flutter/material.dart';
import 'package:skct_chats/pages/ChatPage.dart';
import 'package:skct_chats/pages/ContactListPage.dart';
import 'package:skct_chats/provider/UserProvider.dart';


class ContactHomePage extends StatefulWidget {
  const ContactHomePage({Key? key}) : super(key: key);

  @override
  State<ContactHomePage> createState() => _ContactHomePageState();
}

class _ContactHomePageState extends State<ContactHomePage> {

  final List<String> depList = ["ADMINISTRATION","CIVIL", "CSE", "ECE","EEE", "ICE", "IT", "L&D","MBA","MECH","S&H","PHY EDU"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 25, 15, 75),
        child: Column(
          children: [
            Container(
              height: 80,
              child: Row(
                children: const [
                  Expanded(
                      child:Padding(
                        padding: EdgeInsets.fromLTRB(5, 0, 5, 1),
                        child: Center(
                          child: Text("Sri Krishna College of Technology",
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 15.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                        ),
                      ) )
                ],
              ),
            ),
            const SizedBox(
              width: 200.0,
              height: 3.0,
              child: Divider(
                color: Colors.grey,
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(8, 10, 8,10),
              child: Text("DEPARTMENTS",
                  style: TextStyle(
                      fontSize: 16.0,
                      letterSpacing: 0.5,
                      color: Colors.black)),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0,0,0,5),
              child: SizedBox(
                width: 200.0,
                height: 5.0,
                child: Divider(
                  color: Colors.grey,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: depList.length,
                itemBuilder: (context,index) => Card(
                  elevation: 6,
                  margin: const EdgeInsets.fromLTRB(15, 10, 15,10),
                  child: ListTile(
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.blue.shade200, width: 0.5),
                          borderRadius: BorderRadius.circular(5)),
                      tileColor: Colors.blue.shade400,
                      textColor: Colors.white,
                      iconColor: Colors.white,
                      title: Center(
                        child: Text(depList[index].toString(),
                          style: const TextStyle(
                              fontFamily: 'SFProDisplay',
                              fontWeight: FontWeight.bold,
                              color: Colors.white),),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ContactListPage(destination: depList[index].toString())),

                        );
                      }
                  ),
                ),
              ),
            ) ,
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){


          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>  ChatPage(room: UserProvider().roomProvider())),

          );
        },
        backgroundColor: Colors.lightGreen,
        child: const Icon(Icons.chat),
      ),
    );
  }

}
