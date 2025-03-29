part of '../../domain.dart';

abstract class GetClientByIdUseCase {
  Future<Client> call(int clientId);
}
