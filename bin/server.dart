import 'package:api_clients/server/server.dart';

void main() {
  Server.bootstrap()
      .then((server) => print('Server listening on port ${server.port}'))
      .catchError(print);
}