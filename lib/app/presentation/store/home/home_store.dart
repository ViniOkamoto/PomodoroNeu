import 'package:mobx/mobx.dart';
import 'package:pomodoroapp/app/domain/models/item.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {}
