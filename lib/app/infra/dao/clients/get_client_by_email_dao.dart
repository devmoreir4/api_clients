part of '../../infra.dart';

class GetClientByEmailDAO implements GetClientByEmailGateway {
  final Connection connection;

  GetClientByEmailDAO(this.connection);

  @override
  Future<Client?> call(String email) async {
    try {
      final rows = await connection
          .query('SELECT * FROM clients WHERE email=@email', {'email': email});

      if (rows.isEmpty) return null;
      return rows.map(ClientDB.toEntity).first;
    } finally {
      await connection.close();
    }
  }
}
