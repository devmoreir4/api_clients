part of '../../data.dart';

abstract class DeleteClientGateway {
  Future<void> call(int clientId);
}
