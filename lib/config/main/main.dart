part of '../config.dart';

final controllers = <Controller>[
  ClientsController(
    getClientsUseCase: getIt(),
    addClientUseCase: getIt(),
    getClientByIdUseCase: getIt(),
    deleteClientUseCase: getIt(),
    updateClientUseCase: getIt(),
  )
];
