import 'package:test/test.dart';

import 'package:api_clients/app/data/data.dart';
import 'package:api_clients/app/domain/domain.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mock.dart';

void main() {
  late UpdateClientService service;
  late MockUpdateClientGateway mockUpdateClientGateway;
  late MockGetClientByIdUseCase mockGetClientByIdUseCase;

  setUpAll(() {
    mockGetClientByIdUseCase = MockGetClientByIdUseCase();
    mockUpdateClientGateway = MockUpdateClientGateway();
    service = UpdateClientService(
      updateClientGateway: mockUpdateClientGateway,
      getClientByIdUseCase: mockGetClientByIdUseCase,
    );
  });
  group('UpdateClientService', () {
    test('deve atualizar um cliente', () async {
      when(() => mockGetClientByIdUseCase.call(any()))
          .thenAnswer((_) async => clientMock);
      when(() => mockUpdateClientGateway.call(clientMock))
          .thenAnswer((_) async => clientMock);
      final client = await service.call(clientMock);

      expect(client, isA<Client>());
    });

    test(
        'deve retornar um ClientNotFoundException quando não encontrar um cliente',
        () async {
      when(() => mockGetClientByIdUseCase.call(any()))
          .thenThrow(ClientNotFoundException());
      when(() => mockUpdateClientGateway.call(clientMock))
          .thenAnswer((_) async => clientMock);

      expect(() => service.call(clientMock),
          throwsA(isA<ClientNotFoundException>()));
    });
  });
}
