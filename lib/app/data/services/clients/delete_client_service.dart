part of '../../data.dart';

class DeleteClientService implements DeleteClientUseCase {
  final DeleteClientGateway deleteClientGateway;
  final GetClientByIdUseCase getClientByIdUseCase;

  DeleteClientService({
    required this.deleteClientGateway,
    required this.getClientByIdUseCase,
  });
  @override
  Future<void> call(int clientId) async {
    await getClientByIdUseCase(clientId);
    await deleteClientGateway(clientId);
  }
}
