import 'package:coffee_shop/data/local/coffee_model.dart';
import 'package:flutter/material.dart';

class CoffeeConceptDetailPage extends StatelessWidget {
  final Coffee coffee;

  const CoffeeConceptDetailPage({Key? key, required this.coffee})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(
          color: Colors.black,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Hero(
            tag: "text_${coffee.name}",
            child: Material(
              type: MaterialType.card,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.3),
                child: Text(
                  coffee.name,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22),
                ),
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          SizedBox(
            height: size.height * 0.4,
            child: Stack(
              children: [
                Positioned.fill(
                    left: 0,
                    child: Hero(
                        tag: coffee.image,
                        child: Image.asset(
                          coffee.image,
                          fit: BoxFit.fitHeight,
                        )))
              ],
            ),
          ),
          Positioned(
              left: size.width * 0.05,
              bottom: 0,
              child: TweenAnimationBuilder(
                duration: Duration(milliseconds: 500),
                tween: Tween(begin: 1.0, end: 0.0),
                builder: (context, value, child) {
                  return Transform.translate(
                      offset: Offset(-100 * value, 150 * value),
                      child:child);
                },
                child: Text(
                  coffee.price.toString() + " \$",
                  style: TextStyle(fontWeight: FontWeight.w900,fontSize: 50),
                ),
              ))
        ],
      ),
    );
  }
}
