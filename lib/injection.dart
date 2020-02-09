import 'package:injectable/injectable.dart';

import 'package:my_tour_guide/injection.iconfig.dart';

@injectableInit
void setupInjection(String environment) => $initGetIt(environment: environment);