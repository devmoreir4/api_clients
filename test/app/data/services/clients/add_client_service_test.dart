import 'package:test/test.dart';

import 'package:api_clients/app/data/data.dart';
import 'package:api_clients/app/domain/domain.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mock.dart';

class FakeClient extends Fake implements Client {}

void main() {
  late AddClientService service;
  late MockAddClientGateway mockAddClientGateway;
  late MockGetClientByEmailGateway getClientByEmailGateway;

  setUpAll(() {
    mockAddClientGateway = MockAddClientGateway();
    getClientByEmailGateway = MockGetClientByEmailGateway();
    service = AddClientService(
      addClientGateway: mockAddClientGateway,
      getClientByEmailGateway: getClientByEmailGateway,
    );

    registerFallbackValue(FakeClient());
  });

  group('AddClientService', () {
    test('deve adicionar um cliente', () async {
      when(() => getClientByEmailGateway.call(any()))
          .thenAnswer((_) async => null);
      when(() => mockAddClientGateway.call(any()))
          .thenAnswer((_) async => clientMock);
      final result = await service
          .call(Client(id: 0, name: 'name', email: 'email', phone: 'phone'));

      expect(result, isA<Client>());
    });

    test(
        'deve retornar ClientWithThisEmailAlreadyExistsException quando tentar cadastrar um cliente com o mesmo email',
        () async {
      when(() => getClientByEmailGateway.call(any()))
          .thenAnswer((_) async => clientMock);

      expect(
          () => service.call(Client(
              id: 0, name: 'name', email: 'email', phone: 'phone')),
          throwsA(isA<ClientWithThisEmailAlreadyExistsException>()));
    });
  });
}
