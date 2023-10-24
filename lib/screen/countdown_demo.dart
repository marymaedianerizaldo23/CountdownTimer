import 'package:flutter/material.dart';
import 'dart:async';

class CountdownTimerDemo extends StatefulWidget {
  const CountdownTimerDemo({super.key});

  @override
  State<CountdownTimerDemo> createState() => _CountdownTimerDemoState();
}

class _CountdownTimerDemoState extends State<CountdownTimerDemo> {
Timer? countdownTimer;
  Duration myDuration = const Duration(days: 5);
  @override
  void initState() {
    super.initState();
  }
  /// Timer related methods ///
  // Step 3
  void startTimer() {
    countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }
  // Step 4
  void stopTimer() {
    setState(() => countdownTimer!.cancel());
  }
  // Step 5
  void resetTimer() {
    stopTimer();
    setState(() => myDuration = const Duration(days: 5));
  }
  // Step 6
  void setCountDown() {
    final reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final days = strDigits(myDuration.inDays);
    // Step 7
    final hours = strDigits(myDuration.inHours.remainder(24));
    final minutes = strDigits(myDuration.inMinutes.remainder(60));
    final seconds = strDigits(myDuration.inSeconds.remainder(60));

    
    return Scaffold(
      appBar:AppBar(backgroundColor: Colors.cyan),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            // Step 8
            Text(
              '$hours:$minutes:$seconds',
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 50),
            ),
            const SizedBox(height: 20),
            // Step 9
            const Text(
              'Launching Soon!',
              style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 27, 1, 84),
                    fontSize: 20),
            ),
              Text(
                '$days:$hours:$minutes:$seconds',
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 50),
              ),
              const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: startTimer,
                  child: const Text(
                    'Start',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
                // Step 10
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    if (countdownTimer == null || countdownTimer!.isActive) {
                      stopTimer();
                    }
                  },
                  child: const Text(
                    'Stop',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                // Step 11
                ElevatedButton(
                    onPressed: () {
                      resetTimer();
                    },
                    child: const Text(
                      'Reset',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    )
                  ),
              ],
            ),
           const SizedBox(height: 40),
            // Step 9
            const Text(
              'Resend OTP',
              style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 27, 1, 84),
                    fontSize: 20),
            ),
            Text('$seconds',
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 50),
                ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                ElevatedButton(
                  onPressed: startTimer,
                  child: const Text(
                    'Send OTP',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
              ]
            )
          ],
        ),
        
      ),
    );
  }
}
  
 