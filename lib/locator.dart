import 'package:bloc_base/core/network/http_request.dart';
import 'package:bloc_base/core/network/http_request_impl.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.I;

void initialBindings() {
  locator.registerSingleton<IHttpRequest>(HttpRequestImpl());
}
