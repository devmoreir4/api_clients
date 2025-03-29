library api;

import 'package:api_clients/app/domain/domain.dart';

part 'controllers/controller.dart';
part "controllers/clients/clients_controller.dart";

part 'handlers/handler.dart';
part 'handlers/clients/get_clients_handler.dart';
part 'handlers/clients/add_client_handler.dart';
part 'handlers/clients/get_client_by_id_handler.dart';
part 'handlers/clients/update_client_handler.dart';
part 'handlers/clients/delete_client_handler.dart';

part 'messages/message_error.dart';

part 'dto/client_output_dto.dart';
part 'dto/client_input_dto.dart';
