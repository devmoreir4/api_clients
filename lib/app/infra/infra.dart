library infra;

import 'package:api_clients/app/data/data.dart';
import 'package:api_clients/app/domain/domain.dart';
import 'package:api_clients/config/config.dart';

import 'package:postgres/postgres.dart';

part './dao/clients/get_clients_dao.dart';
part './dao/clients/get_client_by_email_dao.dart';
part './dao/clients/add_client_dao.dart';
part './dao/clients/get_client_by_id_dao.dart';
part './dao/clients/delete_client_dao.dart';
part './dao/clients/update_client_dao.dart';

part './connection/connection.dart';
part './connection/fake/fake_db.dart';
part './connection/postgres/postgres.dart';

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
