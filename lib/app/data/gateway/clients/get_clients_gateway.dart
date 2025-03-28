part of '../../data.dart';

abstract class GetClientsGateway {
  Future<List<Client>> call();
}
