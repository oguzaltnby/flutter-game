import 'dart:math';
import 'package:flutter/material.dart';
import 'package:mob_uyg_proje/sonuc.dart';

class oyun extends StatefulWidget {
  const oyun({super.key});

  @override
  State<oyun> createState() => _oyunState();
}

class _oyunState extends State<oyun> {
  int puan = 0;
  int rastgeleSayi = 0;
  List a = [];

  initState() {
    super.initState();
    //getData();
    for (var i = 0; i < 25; i++) {
      int sayi = Random().nextInt(25);
      if (a.indexOf(sayi) == -1) {
        a.add(sayi);
      } else {
        i--;
      }
    }
    rastgeleSayi = Random().nextInt(25);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 24, 24, 24),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color.fromARGB(255, 79, 66, 69),
          shadowColor: Color(0x000),
          leading: Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Row(
              children: [
                Text(
                  puan.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ],
            ),
          ),
          title: Center(child: Text("Oyun")),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 25),
              child: Row(
                children: [
                  Icon(Icons.schedule_rounded),
                  TweenAnimationBuilder<Duration>(
                      duration: Duration(minutes: 1),
                      tween: Tween(
                          begin: Duration(minutes: 1), end: Duration.zero),
                      onEnd: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => sonuc(puan))));
                        print('Timer ended');
                      },
                      builder: (BuildContext context, Duration value,
                          Widget? child) {
                        final minutes = value.inMinutes;
                        final seconds = value.inSeconds % 60;
                        return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Text('$minutes:$seconds',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25)));
                      }),
                ],
              ),
            ),
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(50.0),
            ),
          ),
        ),
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Sayı: ",
                  style: TextStyle(
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
                Text(
                  "$rastgeleSayi",
                  style: TextStyle(
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                      fontSize: 30),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
              height: 400,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5, childAspectRatio: 1 / 1),
                itemCount: 25,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (rastgeleSayi == a[index]) {
                            rastgeleSayi = Random().nextInt(25);
                            puan++;
                            a.clear();
                            for (var i = 0; i < 25; i++) {
                              int sayi = Random().nextInt(25);
                              if (a.indexOf(sayi) == -1) {
                                a.add(sayi);
                              } else {
                                i--;
                              }
                            }
                          }
                        });
                      },
                      child: Text(
                        a[index].toString(),
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white),
                    ),
                  );
                }),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: FloatingActionButton(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.replay_outlined,
                color: Colors.black,
              ),
              onPressed: () {
                setState(() {
                  a.clear();
                  for (var i = 0; i < 25; i++) {
                    int sayi = Random().nextInt(25);
                    if (a.indexOf(sayi) == -1) {
                      a.add(sayi);
                    } else {
                      i--;
                    }
                  }
                  rastgeleSayi = Random().nextInt(25);
                });
              },
            ),
          ),
        ]));
  }
}
