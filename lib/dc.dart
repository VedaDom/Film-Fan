import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'core/network/network_info.dart';

Future<void> init() async {
  await GetStorage.init();
  Get.lazyPut(() => GetStorage());
  Get.lazyPut(() => InternetConnectionChecker());
  Get.lazyPut<NetworkInfo>(() => NetworkInfoImpl(Get.find()));
}
