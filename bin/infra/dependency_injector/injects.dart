import '../../apis/api.dart';
import '../../apis/login_api.dart';
import '../../apis/noticia_api.dart';
import '../../models/notice_model.dart';
import '../../services/generic_service.dart';
import '../../services/notice_service.dart';
import '../security/security_service.dart';
import '../security/security_service_imp.dart';
import 'dependency_injector.dart';

class Injects {
  static DependencyInjector initialize() {
    var di = DependencyInjector();

    di.register<SecurityService>(() => SecurityServiceImp());

    di.register<LoginApi>(() => LoginApi(di()));

    di.register<GenericService<NoticiaModel>>(() => NoticiaService());
    di.register<NoticiaApi>(() => NoticiaApi(di()));

    return di;
  }
}
