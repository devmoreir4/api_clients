part of '../../data.dart';

class UpdateClientService implements UpdateClientUseCase {
  final UpdateClientGateway updateClientGateway;
  final GetClientByIdUseCase getClientByIdUseCase;

  UpdateClientService({
    required this.updateClientGateway,
    required this.getClientByIdUseCase,
  });
  @override
  Future<Client> call(Client client) async {
    await getClientByIdUseCase(client.id);
    return await updateClientGateway(client);
  }
}
