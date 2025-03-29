part of '../../infra.dart';

class GetClientByIdDAO implements GetClientByIdGateway {
  final Connection connection;

  GetClientByIdDAO(this.connection);

  @override
  Future<Client?> call(int clientId) async {
    try {
      final rows = await connection.query(
        'SELECT * FROM clients WHERE id=@id',
        {'id': clientId},
      );

      if (rows.isEmpty) return null;

      return rows.map(ClientDB.toEntity).first;
    } finally {
      await connection.close();
    }
  }
}
