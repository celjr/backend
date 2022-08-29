import 'package:shelf/shelf.dart';
import 'apis/login_api.dart';
import 'apis/noticia_api.dart';
import 'infra/custom_server.dart';
import 'infra/dependency_injector/injects.dart';
import 'infra/middleware_interception.dart';
import 'utils/custom_env.dart';
import 'package:mysql1/mysql1.dart';

void main() async {
  var settings = ConnectionSettings(
    host: 'localhost',
    port: await CustomEnv.get<int>(key: 'db_port'),
    user: 'dart_user',
    password: 'dart_pass',
    db: await CustomEnv.get<String>(key: 'db_schema'),
  );
  var conexao = await MySqlConnection.connect(settings);

  var result = await conexao.query('SELECT * FROM usuarios');
  print(result);

  final _di = Injects.initialize();

  var cascadeHandler = Cascade()
      .add(_di.get<LoginApi>().getHandler())
      .add(_di.get<NoticiaApi>().getHandler(isSecurity: true))
      .handler;

  var handler = Pipeline()
      .addMiddleware(logRequests())
      .addMiddleware(MiddlewareInterception().middleware)
      .addHandler(cascadeHandler);

  await CustomServer().initialize(
      handler: handler,
      address: await CustomEnv.get<String>(key: 'server_address'),
      port: await CustomEnv.get<int>(key: 'server_port'));
}
