part of '../../data.dart';

class GetClientByIdService implements GetClientByIdUseCase {
  final GetClientByIdGateway getClientByIdGateway;

  GetClientByIdService({required this.getClientByIdGateway});
  @override
  Future<Client> call(int clientId) async {
    final client = await getClientByIdGateway(clientId);
    if (client == null) {
      throw ClientNotFoundException();
    }
    return client;
  }
}
