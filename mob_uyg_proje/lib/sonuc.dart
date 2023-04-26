import 'package:flutter/material.dart';
import 'package:mob_uyg_proje/ssoyun.dart';

class sonuc extends StatelessWidget {
  int puan;
  sonuc(this.puan);
  var yildiz1 = Icon(
    Icons.star,
    color: Colors.yellow,
    size: 90,
  );
  var yildiz2 = Icon(
    Icons.star,
    color: Colors.yellow,
    size: 120,
  );
  var yildiz3 = Icon(
    Icons.star,
    color: Colors.yellow,
    size: 90,
  );

  /*final Shader linearGradient = LinearGradient(
    colors: <Color>[
      Color.fromARGB(255, 255, 0, 166),
      Color.fromARGB(255, 131, 0, 207)
    ],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));*/

  @override
  Widget build(BuildContext context) {
    if (puan < 12) {
      yildiz3 = Icon(
        Icons.star,
        color: Colors.grey,
        size: 90,
      );
    }
    if (puan < 7) {
      yildiz2 = Icon(
        Icons.star,
        color: Colors.grey,
        size: 120,
      );
      yildiz3 = Icon(
        Icons.star,
        color: Colors.grey,
        size: 90,
      );
    }
    if (puan < 3) {
      yildiz1 = Icon(
        Icons.star,
        color: Colors.grey,
        size: 90,
      );
      yildiz2 = Icon(
        Icons.star,
        color: Colors.grey,
        size: 120,
      );
      yildiz3 = Icon(
        Icons.star,
        color: Colors.grey,
        size: 90,
      );
    }

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 47, 47, 47),
      body: Column(
        children: [
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 300,
                    child: Stack(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 350,
                              height: 200,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Spacer(
                                        flex: 2,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Toplam Skor",
                                                style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 0, 0, 0),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                puan.toString(),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w900,
                                                    fontSize: 70,
                                                    foreground: Paint()
                                                      ..shader = LinearGradient(
                                                        colors: <Color>[
                                                          Colors.pinkAccent,
                                                          Colors
                                                              .deepPurpleAccent,
                                                          Colors.red
                                                          //add more color here.
                                                        ],
                                                      ).createShader(
                                                          Rect.fromLTWH(
                                                              0.0,
                                                              0.0,
                                                              200.0,
                                                              100.0))),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Spacer(
                                        flex: 1,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                            top: -5,
                            left: 25,
                            child: Row(
                              children: [yildiz1, yildiz2, yildiz3],
                            )),
                        Positioned(
                          left: 30,
                          bottom: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Stack(
                                  alignment: AlignmentDirectional.topCenter,
                                  children: [
                                    SizedBox(
                                      width: 257,
                                      height: 60,
                                      child: Card(
                                        color: Color.fromARGB(255, 0, 152, 5),
                                        shadowColor:
                                            Color.fromARGB(0, 255, 255, 255),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 250,
                                      height: 50,
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                Color.fromARGB(255, 0, 198, 7),
                                            shadowColor: Color.fromARGB(
                                                0, 255, 255, 255),
                                          ),
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: ((context) =>
                                                        oyun())));
                                          },
                                          child: Text(
                                            "Yeniden Dene",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 25),
                                          )),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
          Spacer(
            flex: 1,
          ),
          Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }
}
