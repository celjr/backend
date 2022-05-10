import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class NoticiaApi {
  Handler get handler {
    Router router = Router();

    // listagem
    router.get('/blog/noticias', (Request req) {
      return Response.ok("choveu hoje");
    });

    // nova noticia
    router.post('/blog/noticias', (Request req) {
      return Response.ok('Noticia adicionada');
    });

    // /blog/noticias?id=1 editar noticia
    router.put('/blog/noticias', (Request req) {
      String? id = req.url.queryParameters['id'];
      return Response.ok('Noticia editada');
    });

    // /blog/noticias?id=1 editar noticia
    router.delete('/blog/noticias', (Request req) {
      String? id = req.url.queryParameters['id'];
      return Response.ok('Noticia deletada');
    });
    return router;
  }
}
