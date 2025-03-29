part of '../../data.dart';

abstract class UpdateClientGateway {
  Future<Client> call(Client client);
}
