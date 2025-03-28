part of '../../infra.dart';

class GetClientsDAO implements GetClientsGateway {
  final Connection connection;

  GetClientsDAO({required this.connection});

  @override
  Future<List<Client>> call() async {
    try {
      final rows = await connection.query('SELECT * FROM clients');
      return rows.map(ClientDB.toEntity).toList();
    } finally {
      await connection.close();
    }
  }
}
