import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:my_tour_guide/features/restaurants/presentation/blocs/restaurant_bloc.dart';
import 'package:my_tour_guide/features/restaurants/presentation/blocs/restaurant_bloc_events.dart';
import 'package:my_tour_guide/features/restaurants/presentation/blocs/restaurant_bloc_states.dart';
import 'package:my_tour_guide/features/restaurants/presentation/widgets/restaurant_card.dart';
import 'package:my_tour_guide/injection.iconfig.dart';
import 'package:my_tour_guide/routes.dart';

class RestaurantsPage extends StatefulWidget {
  @override
  RestaurantsPageState createState() => RestaurantsPageState();
}

class RestaurantsPageState extends State<RestaurantsPage> {
  RestaurantBloc restaurantBloc;

  RestaurantsPageState() {
    restaurantBloc = getIt<RestaurantBloc>();
  }

  @override
  void initState() {
    super.initState();
    restaurantBloc.add(GetRestaurants());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => restaurantBloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'My Tour Guide',
          ),
        ),
        body: BlocBuilder<RestaurantBloc, RestaurantState>(
          bloc: restaurantBloc,
          builder: (context, state) {
            if (state is RestaurantLoadedState) {
              return ListView.builder(
                itemCount: state.restaurants.length,
                itemBuilder: (context, index) => RestaurantCard(
                  restaurant: state.restaurants[index],
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            sailor('/camera');
          },
          child: Icon(
            Icons.photo_camera,
          ),
        ),
      ),
    );
  }
}