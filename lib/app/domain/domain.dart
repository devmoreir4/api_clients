library domain;

part './usecases/clients/get_clients_usecase.dart';
part './usecases/clients/add_client_usecase.dart';
part './usecases/clients/get_client_by_id_usecase.dart';
part './usecases/clients/delete_client_usecase.dart';
part './usecases/clients/update_client_usecase.dart';

part './exception/client_with_this_email_already_exists_exception.dart';
part './exception/client_not_found_exception.dart';

part 'entities/clients/client.dart';
