
import 'dart:math';

class Coffee{
  final String name;
  final String image;
  final double price;

  Coffee({required this.name, required this.image, required this.price, });
}

Random random=Random();

class dataList{
  List<Coffee> coffeeList=[
    Coffee(name: "lab lab cofe 1", image: "assets/images/1.png", price: 24.5),
    Coffee(name: "lab lab cofe 2", image: "assets/images/2.png", price: 41.5),
    Coffee(name: "lab lab cofe 3", image: "assets/images/3.png", price: 18.3),
    Coffee(name: "lab lab cofe 4", image: "assets/images/4.png", price: 15.8),
    Coffee(name: "lab lab cofe 5", image: "assets/images/5.png", price: 19.6),
    Coffee(name: "lab lab cofe 6", image: "assets/images/6.png", price: 173.6),
    Coffee(name: "lab lab cofe 7", image: "assets/images/7.png", price: 143.3),
    Coffee(name: "lab lab cofe 8", image: "assets/images/8.png", price:52.1),
    Coffee(name: "lab lab cofe 9", image: "assets/images/9.png", price: 19.7),
    Coffee(name: "lab lab cofe 10", image: "assets/images/10.png", price: 47.2),
    Coffee(name: "lab lab cafe 11", image: "assets/images/11.png", price: 16.3),
    Coffee(name: "lab lab cafe 12", image: "assets/images/12.png", price: 12.7),

  ];
}
