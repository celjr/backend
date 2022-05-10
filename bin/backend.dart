import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;

import 'apis/login_api.dart';
import 'apis/noticia_api.dart';
import 'infra/custom_server.dart';
import 'utils/custom_env.dart';

void main() async {
  var cascadeHandler =
      Cascade().add(LoginApi().handler).add(NoticiaApi().handler).handler;

  var handler =
      Pipeline().addMiddleware(logRequests()).addHandler(cascadeHandler);

  await CustomServer().initialize(
      handler: handler,
      address: await CustomEnv.get<String>(key: 'server_address'),
      port: await CustomEnv.get<int>(key: 'server_port'));
}
