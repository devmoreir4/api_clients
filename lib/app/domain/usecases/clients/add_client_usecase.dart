part of '../../domain.dart';

abstract class AddClientUseCase {
  Future<Client> call(Client client);
}
