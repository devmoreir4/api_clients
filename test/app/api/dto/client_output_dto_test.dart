import 'package:api_clients/app/api/api.dart';
import 'package:api_clients/app/domain/domain.dart';
import 'package:test/test.dart';

void main() {
  test('deve retornar uma lista de ClientOutputDTO', () async {
    final result = ClientOutputDTO.toCollectionDTO([
      Client(id: 1, name: 'name', email: 'email', phone: 'phone'),
    ]);

    expect(result, isA<List<ClientOutputDTO>>());
  });
}
