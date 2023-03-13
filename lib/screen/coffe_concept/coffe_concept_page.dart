import 'package:coffee_shop/data/local/coffee_model.dart';
import 'package:coffee_shop/screen/coffe_list/coffe_list_page.dart';
import 'package:flutter/material.dart';

class CoffeeConceptHome extends StatelessWidget {
  CoffeeConceptHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.of(context).push(PageRouteBuilder(
              transitionDuration: Duration(milliseconds: 650),
              pageBuilder: (context, animation, _) {
                return FadeTransition(
                  opacity: animation,
                  child: CoffeList(),
                );
              }));
        },
        child: Stack(
          children: [
            SizedBox.expand(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0XFFA89276), Colors.white]),
                ),
              ),
            ),
            Positioned(
                height: size.height * 0.6,
                left: 0,
                right: 0,
                top: size.height * 0.15,
                child: Hero(
                  tag: dataList().coffeeList[6].image,
                  child: Image.asset(
                    dataList().coffeeList[6].image,
                    fit: BoxFit.fitHeight,
                  ),
                )),
            Positioned(
              height: size.height * 0.7,
              left: 0,
              right: 0,
              bottom: 0,
              child: Hero(
                  tag: dataList().coffeeList[7].image,
                  child: Image.asset(
                    dataList().coffeeList[7].image,
                    fit: BoxFit.fitHeight,
                  )),
            ),
            Positioned(
                height: size.height,
                left: 0,
                right: 0,
                bottom: -size.height * 0.8,
                child: Hero(
                  tag: dataList().coffeeList[8].image,
                  child: Image.asset(
                    dataList().coffeeList[8].image,
                    fit: BoxFit.fitHeight,
                  ),
                )),
            Center(
              child: Container(
                  margin: EdgeInsets.only(top: size.height * 0.2),
                  height: size.height * 0.1,
                  child: FittedBox(
                      child: Text(
                    "alys cafe",
                    style: TextStyle(color: Colors.white),
                  ))),
            )
          ],
        ),
      ),
    );
  }
}
