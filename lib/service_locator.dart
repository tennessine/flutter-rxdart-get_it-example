import 'package:flutter_app/services/button_message_bus.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt();

void setupLocator() {
  locator.registerSingleton(ButtonMessageBus());
}