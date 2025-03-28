import 'package:api_clients/config/config.dart';
import 'package:api_clients/server/server.dart';

void main() {
  Server.bootstrap(controllers)
      .then((server) => print('Server listening on port ${server.port}'))
      .catchError(print);
}
