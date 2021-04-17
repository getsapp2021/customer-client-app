import 'package:flutter/material.dart';

class GReminderBox  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListTile(

          title: Text("Haircut at John’s Salon"),
          leading: Image.asset(
            "assets/images/brands/nike.png",
            width: 40,
          ),
          subtitle: Text("03 Jan 2021  |  12:00 PM"),
          trailing: Icon(Icons.arrow_forward_ios,size: 20,),
        ),
      ),
    );
  }
}
