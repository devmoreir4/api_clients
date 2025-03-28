part of '../../data.dart';

abstract class AddClientGateway {
  Future<Client> call(Client client);
}
