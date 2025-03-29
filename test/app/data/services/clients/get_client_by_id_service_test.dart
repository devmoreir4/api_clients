import 'package:test/test.dart';

import 'package:api_clients/app/data/data.dart';
import 'package:api_clients/app/domain/domain.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mock.dart';

void main() {
  late GetClientByIdService service;
  late MockGetClientByIdGateway mockGetClientByIdGateway;

  setUpAll(() {
    mockGetClientByIdGateway = MockGetClientByIdGateway();
    service =
        GetClientByIdService(getClientByIdGateway: mockGetClientByIdGateway);
  });
  group('GetClientByIdService', () {
    test('deve retornar um cliente', () async {
      when(() => mockGetClientByIdGateway.call(any()))
          .thenAnswer((_) async => clientMock);
      final result = await service.call(1);

      expect(result, isA<Client>());
    });

    test(
        'deve retornar um ClientNotFoundException quando não encontrar um cliente',
        () async {
      when(() => mockGetClientByIdGateway.call(any()))
          .thenAnswer((_) async => null);

      expect(() => service.call(1), throwsA(isA<ClientNotFoundException>()));
    });
  });
}
