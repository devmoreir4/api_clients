part of '../../data.dart';

class AddClientService implements AddClientUseCase {
  final AddClientGateway addClientGateway;
  final GetClientByEmailGateway getClientByEmailGateway;

  AddClientService({required this.addClientGateway, required this.getClientByEmailGateway});
  @override
  Future<Client> call(Client client) async {
    final foundClient = await getClientByEmailGateway(client.email);
    if (foundClient != null) {
      throw ClientWithThisEmailAlreadyExistsException();
    }
    return addClientGateway(client);
  }
}
