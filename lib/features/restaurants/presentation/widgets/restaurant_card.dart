import 'package:flutter/material.dart';
import 'package:my_tour_guide/features/restaurants/domain/entities/restaurant.dart';

class RestaurantCard extends StatelessWidget {
  final Restaurant restaurant;

  RestaurantCard({
    @required this.restaurant,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        onTap: () {},
        title: Text(
          restaurant.name,
        ),
        subtitle: Text(
          restaurant.location.address,
        ),
        trailing: Icon(
          Icons.restaurant_menu,
        ),
      ),
    );
  }
}