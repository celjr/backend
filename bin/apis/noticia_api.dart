import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class NoticiaApi {
  Handler get handler {
    Router router = Router();

    router.get('/blog/noticias', (Request req) {
      return Response.ok("choveu hoje");
    });

    return router;
  }
}
