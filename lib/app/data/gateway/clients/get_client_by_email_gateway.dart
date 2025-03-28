part of '../../data.dart';

abstract class GetClientByEmailGateway {
  Future<Client?> call(String email);
}
