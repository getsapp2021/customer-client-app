import 'package:flutter/material.dart';

class Category {
  Category({this.title, this.image});
  final String title;
  final String image;

}

 List<Category> choices =  <Category>[
   Category(title: 'Fashion and Apparel', image : "assets/images/stores/fashion.png", ),
   Category(title: 'Electronics', image : "assets/images/stores/electronics.png"),
   Category(title: 'Grocery', image : "assets/images/stores/grocery.png"),
   Category(title: 'Books', image : "assets/images/stores/books.png"),
   Category(title: 'Sports', image : "assets/images/stores/sports.png"),
   Category(title: 'Home and Garden', image : "assets/images/stores/home_and_garden.png"),
   Category(title: 'Beauty & \nHealth', image : "assets/images/stores/beauty_and_health.png"),
   Category(title: 'View All',image : "assets/images/stores/view_all.png"),
];

List<Category> allChoices =  <Category>[
  Category(title: 'Fashion and Apparel', image : "assets/images/stores/fashion.png", ),
  Category(title: 'Electronics', image : "assets/images/stores/electronics.png"),
  Category(title: 'Grocery', image : "assets/images/stores/grocery.png"),
  Category(title: 'Books', image : "assets/images/stores/books.png"),
  Category(title: 'Sports', image : "assets/images/stores/sports.png"),
  Category(title: 'Home and Garden', image : "assets/images/stores/home_and_garden.png"),
  Category(title: 'Beauty & \nHealth', image : "assets/images/stores/beauty_and_health.png"),
  Category(title: 'Footwear', image : "assets/images/stores/footwear.png"),
  Category(title: 'Toys & \nGames', image : "assets/images/stores/toys.png"),
  Category(title: 'Sweets', image : "assets/images/stores/sweets.png"),
  Category(title: 'Automotive', image : "assets/images/stores/automotive.png"),
  Category(title: 'Baby & \nToddler', image : "assets/images/stores/baby_and_toddler.png"),
  Category(title: 'Gifting', image : "assets/images/stores/gifting.png"),
  Category(title: 'Entertainment \n& Arts', image : "assets/images/stores/entertainment_and_arts.png"),
  Category(title: 'Watches & \nJewellery', image : "assets/images/stores/watches_and_jewellery.png"),
  Category(title: 'Office & \nProfessional', image : "assets/images/stores/office_and_professional.png"),
  Category(title: 'Nursery & \nGarden', image : "assets/images/stores/nursery_and_garden.png"),
  Category(title: 'Luggage & \nTravel', image : "assets/images/stores/luggage_and_travel.png"),
  Category(title: 'Gym Equipment', image : "assets/images/stores/gym_equipment.png"),
  Category(title: 'Others',image : "assets/images/stores/view_all.png"),
];