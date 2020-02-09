import 'package:sailor/sailor.dart';

import 'package:my_tour_guide/features/map/presentation/pages/map.dart';
import 'package:my_tour_guide/features/restaurants/presentation/pages/restaurants.dart';
import 'package:my_tour_guide/features/camera/presentation/pages/camera.dart';

final sailor = Sailor();

void setupRoutes() {
  sailor.addRoutes(
    [
      SailorRoute(
        name: '/map',
        builder: (context, args, params) => MapPage(),
      ),
      SailorRoute(
        name: '/restaurants',
        builder: (context, args, params) => RestaurantsPage(),
      ),
      SailorRoute(
        name: '/camera',
        builder: (context, args, params) => CameraPage(),
      ),
    ],
  );
}