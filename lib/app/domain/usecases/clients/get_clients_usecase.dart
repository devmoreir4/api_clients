part of '../../domain.dart';

abstract class GetClientsUseCase {
  Future<List<Client>> call();
}
