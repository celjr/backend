import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../models/notice_model.dart';
import '../services/generic_service.dart';
import 'api.dart';

class NoticiaApi extends Api {
  final GenericService<NoticiaModel> _service;
  NoticiaApi(this._service);

  @override
  Handler getHandler({List<Middleware>? middlewares, bool isSecurity = true}) {
    Router router = Router();

    // listagem
    router.get('/blog/noticias', (Request req) {
      List<NoticiaModel> noticias = _service.findAll();
      List<Map> notciasMap = noticias.map((e) => e.toJson()).toList();

      return Response.ok(
        jsonEncode(notciasMap),
      );
    });

    // nova noticia
    router.post('/blog/noticias', (Request req) async {
      var body = await req.readAsString();
      _service.save(NoticiaModel.fromJson(jsonDecode(body)));

      return Response(201);
    });

    // /blog/noticias?id=1 editar noticia
    router.put('/blog/noticias', (Request req) {
      String? id = req.url.queryParameters['id'];

      // _service.save('');
      return Response.ok('Noticia editada');
    });

    // /blog/noticias?id=1 editar noticia
    router.delete('/blog/noticias', (Request req) {
      String? id = req.url.queryParameters['id'];

      // _service.delete(1);
      return Response.ok('Noticia deletada');
    });
    return createHandler(
        router: router, middlewares: middlewares, isSecurity: isSecurity);
  }
}
