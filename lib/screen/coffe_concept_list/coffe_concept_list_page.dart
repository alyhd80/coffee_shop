import 'package:coffee_shop/data/local/coffee_model.dart';
import 'package:flutter/material.dart';

const _duration = Duration(milliseconds: 300);

class CoffeConceptList extends StatefulWidget {
  const CoffeConceptList({Key? key}) : super(key: key);

  @override
  State<CoffeConceptList> createState() => _CoffeConceptListState();
}

class _CoffeConceptListState extends State<CoffeConceptList> {
  final _pageTextController = PageController();
  double _textPage = 0.0;
  final _pageCoffeController = PageController(
    viewportFraction: 0.35,
  );

  double _currentPage = 0.0;

  void _coffeeScrollListener() {
    setState(() {
      _currentPage = _pageCoffeController.page!;
    });
  }

  void _textScrollListener() {
    _textPage = _currentPage;
  }

  @override
  void initState() {
    // TODO: implement initState
    _pageCoffeController.addListener(_coffeeScrollListener);
    _pageCoffeController.addListener(_textScrollListener);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageCoffeController.removeListener(_coffeeScrollListener);
    _pageCoffeController.removeListener(_textScrollListener);

    _pageCoffeController.dispose();
    _pageTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Positioned(
              left: 20,
              right: 20,
              bottom: -size.height * 0.22,
              height: size.height * 0.3,
              child: DecoratedBox(
                  decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                BoxShadow(
                    color: Colors.brown,
                    blurRadius: 90,
                    offset: Offset.zero,
                    spreadRadius: 45),
              ]))),
          Transform.scale(
            scale: 1.6,
            alignment: Alignment.bottomCenter,
            child: PageView.builder(
                controller: _pageCoffeController,
                itemCount: dataList().coffeeList.length + 1,
                scrollDirection: Axis.vertical,
                onPageChanged: (value) {
                  print(value);
                  print(dataList().coffeeList.length);

                  if (value < dataList().coffeeList.length) {
                    _pageTextController.animateToPage(value,
                        duration: _duration, curve: Curves.easeOut);
                  }
                },
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return SizedBox.shrink();
                  }
                  final coffee = dataList().coffeeList[index - 1];
                  final result = _currentPage - index + 1;
                  final value = -0.4 * result + 1;
                  final opacity = value.clamp(0.0, 1.0);
                  return Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Transform(
                        alignment: Alignment.bottomCenter,
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.001)
                          ..translate(
                              0.0, size.height / 2.6 * (1 - value).abs())
                          ..scale(value),
                        child: Opacity(
                            opacity: opacity,
                            child: Image.asset(
                              coffee.image,
                              fit: BoxFit.fitHeight,
                            ))),
                  );
                }),
          ),
          Positioned(
            right: 0,
            left: 0,
            top: 0,
            child: Column(
              children: [
                if (int.parse(_currentPage.toStringAsFixed(0)) <
                    dataList().coffeeList.length)
                  Container(
                    height: size.height * 0.035,
                    alignment: Alignment.centerLeft,
                    child: PageView.builder(
                        controller: _pageTextController,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: dataList().coffeeList.length,
                        itemBuilder: (context, index) {
                          final opacity =
                              (1 - (index - _textPage).abs()).clamp(0.0, 1.0);
                          return Opacity(
                              opacity: opacity,
                              child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: size.width * 0.2),
                                  child: FittedBox(
                                      child: Text(
                                    dataList().coffeeList[index].name,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black),
                                  ))));
                        }),
                  ),
                if (int.parse(_currentPage.toStringAsFixed(0)) <
                    dataList().coffeeList.length)
                  Container(
                    height: size.height * 0.03,
                    child: FittedBox(
                      child: AnimatedSwitcher(
                        duration: _duration,
                        child: Text(
                          dataList()
                                  .coffeeList[int.parse(
                                      _currentPage.toStringAsFixed(0))]
                                  .price
                                  .toStringAsFixed(2) +
                              " \$",
                          key: Key((_currentPage.toStringAsFixed(0))),
                        ),
                      ),
                    ),
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
