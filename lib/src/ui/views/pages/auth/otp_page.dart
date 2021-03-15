import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class OtpPage extends StatefulWidget {
  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_left),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          "Please enter the otp sent to:".text.make(),
          "+91 9999999999".text.bold.make(),
          SizedBox(height: 25),
          TextField(),
          SizedBox(height: 50),
          "Haven't receive it yet?".text.make(),
          "Request new code in 00:00".text.make(),
        ],
      ),
    );
  }
}
