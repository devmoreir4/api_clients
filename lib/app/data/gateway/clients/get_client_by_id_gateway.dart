part of '../../data.dart';

abstract class GetClientByIdGateway {
  Future<Client?> call(int clientId);
}
