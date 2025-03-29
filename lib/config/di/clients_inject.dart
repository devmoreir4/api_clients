part of '../config.dart';

class ClientsInject implements Inject {
  @override
  void call(GetIt getIt) {
    // GetClients
    getIt.registerSingleton<GetClientsGateway>(
        GetClientsDAO(connection: getIt()));
    getIt.registerSingleton<GetClientsUseCase>(
        GetClientsService(getClientsGateway: getIt()));

    // GetClientsById
    getIt.registerSingleton<GetClientByIdGateway>(GetClientByIdDAO(getIt()));
    getIt.registerSingleton<GetClientByIdUseCase>(
        GetClientByIdService(getClientByIdGateway: getIt()));

    // GetClientByEmail
    getIt.registerSingleton<GetClientByEmailGateway>(
        GetClientByEmailDAO(getIt()));

    // DeleteClient
    getIt.registerSingleton<DeleteClientGateway>(DeleteClientDAO(getIt()));
    getIt.registerSingleton<DeleteClientUseCase>(DeleteClientService(
        deleteClientGateway: getIt(), getClientByIdUseCase: getIt()));

    // UpdateClient
    getIt.registerSingleton<UpdateClientGateway>(UpdateClientDAO(getIt()));
    getIt.registerSingleton<UpdateClientUseCase>(UpdateClientService(
        updateClientGateway: getIt(), getClientByIdUseCase: getIt()));

    // AddClient
    getIt.registerSingleton<AddClientGateway>(AddClientDAO(getIt()));
    getIt.registerSingleton<AddClientUseCase>(AddClientService(
        addClientGateway: getIt(), getClientByEmailGateway: getIt()));
  }
}
