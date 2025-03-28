library infra;

import 'package:api_clients/app/data/data.dart';
import 'package:api_clients/app/domain/domain.dart';

part './dao/clients/get_clients_dao.dart';
part './connection/connection.dart';

class ClientDB {
  ClientDB._();

  static Client toEntity(Map<String, dynamic> row) {
    return Client(
        id: row['id'],
        name: row['name'],
        email: row['email'],
        phone: row['phone']);
  }
}
