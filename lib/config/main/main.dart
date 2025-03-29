part of '../config.dart';

final connection = PostgreSQL();

final controllers = <Controller>[
  ClientsController(
    getClientsUseCase: GetClientsService(
      getClientsGateway: GetClientsDAO(
        connection: connection,
      ),
    ),
    addClientUseCase: AddClientService(
      addClientGateway: AddClientDAO(connection),
      getClientByEmailGateway: GetClientByEmailDAO(connection),
    ),
  ),
];
