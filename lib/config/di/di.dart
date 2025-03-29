part of '../config.dart';

GetIt getIt = GetIt.instance;

abstract class Inject {
  void call(GetIt getIt);
}

final injects = <Inject>[
  ClientsInject(),
];

abstract class ApiDI {
  static void init() {
    getIt.registerSingleton<Connection>(PostgreSQL());
    for (final inject in injects) {
      inject(getIt);
    }
  }
}
