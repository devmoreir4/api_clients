import 'package:test/test.dart';

import 'dart:async';

import 'package:api_clients/app/data/data.dart';
import 'package:api_clients/app/domain/domain.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mock.dart';

void main() {
  late DeleteClientService service;
  late MockDeleteClientGateway mockDeleteClientGateway;
  late MockGetClientByIdUseCase mockGetClientByIdUseCase;

  setUpAll(() {
    mockDeleteClientGateway = MockDeleteClientGateway();
    mockGetClientByIdUseCase = MockGetClientByIdUseCase();
    service = DeleteClientService(
      deleteClientGateway: mockDeleteClientGateway,
      getClientByIdUseCase: mockGetClientByIdUseCase,
    );
  });
  group('DeleteClientService', () {
    test('deve deletar um cliente', () async {
      when(() => mockGetClientByIdUseCase.call(any()))
          .thenAnswer((_) async => clientMock);
      when(() => mockDeleteClientGateway.call(any()))
          .thenAnswer((_) async => Completer<void>().complete());
      await service.call(1);

      verify(() => mockDeleteClientGateway.call(1)).called(1);
    });

    test(
        'deve retornar um ClientNotFoundException quando não encontrar um cliente',
        () async {
      when(() => mockGetClientByIdUseCase.call(any()))
          .thenThrow(ClientNotFoundException());
      expect(() => service.call(1), throwsA(isA<ClientNotFoundException>()));
    });
  });
}
