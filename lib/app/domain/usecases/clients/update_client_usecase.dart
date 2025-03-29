part of '../../domain.dart';

abstract class UpdateClientUseCase {
  Future<Client> call(Client client);
}
