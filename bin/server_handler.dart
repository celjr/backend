import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class ServeHandler {
  Handler get handler {
    final router = Router();
    router.get('/', (Request request) {
      return Response(
        200,
        body: '<h1>Primeira rota</h1>',
        headers: {'content-type': 'text/html'},
      );
    });

    router.get('/ola/mundo/<usuario>', (Request req, String usuario) {
      return Response.ok("Ola Mundo $usuario");
    });
    // http://localhost:8080/query?nome=Junior
    router.get('/query', (Request req) {
      String? nome = req.url.queryParameters['nome'];
      String? idade = req.url.queryParameters['idade'];
      return Response.ok('Query eh: $nome,  $idade');
    });

    router.post('/login', (Request req) async {
      var result = await req.readAsString();
      Map json = jsonDecode(result);

      var usuario = json['usuario'];
      var senha = json['senha'];

      if (usuario == 'admin' && senha == '123') {
        Map result = {'token': '123', 'user_id': 1};
        var jsonResponse = jsonEncode(result);
        return Response.ok(jsonResponse,
            headers: {'content-type': 'application/json'});
      } else {
        return Response.forbidden('acesso negado');
      }
    });

    return router;
  }
}
