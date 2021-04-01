import 'package:flutter/material.dart';
import 'package:customer/src/ui/views/widgets/gets_common_widgets.dart';

class DebugScreen extends StatefulWidget {
  @override
  _DebugScreenState createState() => _DebugScreenState();
}

class _DebugScreenState extends State<DebugScreen> {
  int seconds = 10;
  bool isExpired = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GCountDownTimer(
              secondsRemaining: seconds,
              whenTimeExpires: () {
                print("Expired");
                setState(() {
                  isExpired = true;
                });
              },
              countDownTimerStyle: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),

            Text("$isExpired"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: isExpired ? () {
          setState(() {
            seconds += 10;
            isExpired = false;
          });
        } : null,
      ),
    );
  }
}
