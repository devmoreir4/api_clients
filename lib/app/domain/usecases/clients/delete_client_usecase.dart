part of '../../domain.dart';

abstract class DeleteClientUseCase {
  Future<void> call(int clientId);
}
