part of '../config.dart';

final connection = PostgreSQL();

final getClientByIdUseCase = GetClientByIdService(
  getClientByIdGateway: GetClientByIdDAO(connection),
);

final getClientsUseCase = GetClientsService(
  getClientsGateway: GetClientsDAO(connection: connection),
);

final addClientUseCase = AddClientService(
  addClientGateway: AddClientDAO(connection),
  getClientByEmailGateway: GetClientByEmailDAO(connection),
);

final deleteClientUseCase = DeleteClientService(
  deleteClientGateway: DeleteClientDAO(connection),
  getClientByIdUseCase: getClientByIdUseCase,
);

final updateClientUseCase = UpdateClientService(
  updateClientGateway: UpdateClientDAO(connection),
  getClientByIdUseCase: getClientByIdUseCase,
);

final controllers = <Controller>[
  ClientsController(
    getClientsUseCase: getClientsUseCase,
    addClientUseCase: addClientUseCase,
    getClientByIdUseCase: getClientByIdUseCase,
    deleteClientUseCase: deleteClientUseCase,
    updateClientUseCase: updateClientUseCase,
  )
];
