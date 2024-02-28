import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime firstDay = DateTime(2023, 10, 14);

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

    return Scaffold(
      backgroundColor: Colors.red[100],
      body: SafeArea(
        top: true,
        bottom: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _DDay(
              firstDay: firstDay,
            ),
            _CoupleImage(
              onHeartPressed: onHeartPressed,
            ),
          ],
        ),
      ),
    );
  }

  void onHeartPressed(){
    print('Click');

  }
}

class _DDay extends StatelessWidget {
  final DateTime firstDay;

  _DDay({
    //required this.onHeartPressed,
    required this.firstDay,
});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final now = DateTime.now();

    return Column(
      children: [
        const SizedBox(height: 36.0),
        Text(
          //'2023.10.14',
          '${firstDay.year}.${firstDay.month}.${firstDay.day}',
          style: textTheme.bodyText1,
        ),
        const SizedBox(height: 10.0),
        Text(
          //'D+136',
          'D+${DateTime(now.year, now.month, now.day).difference(firstDay).inDays}',
          style: textTheme.headline1,
        ),
        const SizedBox(height: 100.0),
        Text(
          'B & N',
          style: textTheme.headline1,
        ),
      ],
    );
  }
}

class _CoupleImage extends StatelessWidget {
  final GestureTapCallback onHeartPressed;

  _CoupleImage({
  required this.onHeartPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       IconButton(
        iconSize: 50.0,
        onPressed: onHeartPressed,
        icon: Icon(
          Icons.favorite_rounded,
          color: Colors.red,
       ),
      ),
        const SizedBox(height: 50.0),
        Image.asset(
          'asset/image/turtle_1.png',

          height: MediaQuery.of(context).size.height / 3,
        ),
      ]
    );
  }
}