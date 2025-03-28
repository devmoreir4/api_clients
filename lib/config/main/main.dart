part of '../config.dart';

final controllers = <Controller>[
  ClientsController(
    getClientsUseCase: GetClientsService(
      getClientsGateway: GetClientsDAO(
        connection: FakeDB(),
      ),
    ),
  ),
];
