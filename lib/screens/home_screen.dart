import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int totalSeconds = 1500;
  int userSeconds = 1500;
  late Timer? timer;
  int cycle = 0;
  int round = 0;
  bool isRunning = false;

  void onRest() {
    setState(() {
      totalSeconds = 7;
    });
    timer = Timer.periodic(const Duration(seconds: 1), onTickRest);
  }

  void onTickRest(Timer timer) {
    if (totalSeconds == 0) {
      setState(() {
        cycle = cycle + 1;
        if (cycle == 4) {
          cycle = 0;
          round = round + 1;
        }
        isRunning = false;
        totalSeconds = userSeconds;
        timer.cancel();
        return;
      });
    } else {
      setState(() {
        totalSeconds = totalSeconds - 1;
      });
    }
  }

  void onTick(Timer timer) {
    //시간이 다 되면 휴식 타이머 시작
    if (totalSeconds == 0) {
      timer.cancel();
      onRest();
    }
    //시간이 아직 안 됐으면 그냥 계속 타이머 돌리기
    else {
      setState(() {
        totalSeconds = totalSeconds - 1;
      });
    }
  }

  void onStartPressed() {
    timer = Timer.periodic(const Duration(seconds: 1), onTick);
    setState(() {
      isRunning = true;
    });
  }

  void onPausePressed() {
    timer!.cancel();
    setState(() {
      isRunning = false;
    });
  }

  void onStopPressed() {
    timer!.cancel();
    setState(() {
      isRunning = false;
      setState(() {
        totalSeconds = userSeconds;
      });
    });
  }

  void minutes15() {
    userSeconds = 4;
    setState(() {
      totalSeconds = userSeconds;
    });
  }

  void minutes20() {
    userSeconds = 1200;
    setState(() {
      totalSeconds = userSeconds;
    });
  }

  void minutes25() {
    userSeconds = 1500;
    setState(() {
      totalSeconds = userSeconds;
    });
  }

  void minutes30() {
    userSeconds = 1800;
    setState(() {
      totalSeconds = userSeconds;
    });
  }

  void minutes35() {
    userSeconds = 2100;
    setState(() {
      totalSeconds = userSeconds;
    });
  }

  String format(int seconds) {
    var duration = Duration(seconds: seconds);
    return duration.toString().split(".").first.substring(2, 7);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Column(
          children: [
            Flexible(
              flex: 1,
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      format(totalSeconds),
                      style: TextStyle(
                        color: Theme.of(context).cardColor,
                        fontSize: 89,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 3,
              child: Center(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: minutes15,
                          child: Text(
                            '15',
                            style: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .color,
                                fontWeight: FontWeight.w600,
                                fontSize: 30),
                          ),
                        ),
                        TextButton(
                          onPressed: minutes20,
                          child: Text(
                            '20',
                            style: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .color,
                                fontWeight: FontWeight.w600,
                                fontSize: 30),
                          ),
                        ),
                        TextButton(
                          onPressed: minutes25,
                          child: Text(
                            '25',
                            style: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .color,
                                fontWeight: FontWeight.w600,
                                fontSize: 30),
                          ),
                        ),
                        TextButton(
                          onPressed: minutes30,
                          child: Text(
                            '30',
                            style: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .color,
                                fontWeight: FontWeight.w600,
                                fontSize: 30),
                          ),
                        ),
                        TextButton(
                          onPressed: minutes35,
                          child: Text(
                            '35',
                            style: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .color,
                                fontWeight: FontWeight.w600,
                                fontSize: 30),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          iconSize: 120,
                          color: Theme.of(context).cardColor,
                          onPressed:
                              isRunning ? onPausePressed : onStartPressed,
                          icon: Icon(isRunning
                              ? Icons.pause_circle_outline
                              : Icons.play_circle_outline),
                        ),
                        IconButton(
                          iconSize: 120,
                          color: Theme.of(context).cardColor,
                          onPressed: onStopPressed,
                          icon: const Icon(Icons.stop_circle_outlined),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Cycle',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Theme.of(context)
                                          .textTheme
                                          .displayLarge!
                                          .color),
                                ),
                                Text(
                                  '$cycle',
                                  style: TextStyle(
                                      fontSize: 60,
                                      fontWeight: FontWeight.w600,
                                      color: Theme.of(context)
                                          .textTheme
                                          .displayLarge!
                                          .color),
                                ),
                              ],
                            ),
                            const SizedBox(width: 170),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Round',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Theme.of(context)
                                          .textTheme
                                          .displayLarge!
                                          .color),
                                ),
                                Text(
                                  '$round',
                                  style: TextStyle(
                                      fontSize: 60,
                                      fontWeight: FontWeight.w600,
                                      color: Theme.of(context)
                                          .textTheme
                                          .displayLarge!
                                          .color),
                                ),
                              ],
                            ),
                          ],
                        )),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
