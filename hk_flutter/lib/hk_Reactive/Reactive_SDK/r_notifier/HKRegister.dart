///  依赖注入，外部可将实例，注入该类中，由该类管理
class HKRegister {
  ///注册实例
  static T put<T>(T dependency, {String? tag}) =>
      _HKInstance().put(dependency, tag: tag);

  ///  获取注入的实例
  static T find<T>({String? tag, String? key}) =>
      _HKInstance().find<T>(tag: tag, key: key);

  ///  删除实例
  static bool delete<T>({String? tag, String? key}) =>
      _HKInstance().delete<T>(tag: tag, key: key);
}

///  具体逻辑
class _HKInstance {
  factory _HKInstance() => _instance ??= _HKInstance._();

  static _HKInstance? _instance;

  _HKInstance._();

  static final Map<String, _InstanceInfo> _single = {};

  ///  注册控制器
  T put<T>(T dependency, {String? tag}) {
    final key = _getKey(T, tag);
    //  只保存第一次注入的控制器
    _single.putIfAbsent(key, () => _InstanceInfo<T>(dependency));
    return find<T>(tag: tag);
  }

  ///  查询已注册的控制器
  T find<T>({String? tag, String? key}) {
    final newKey = key ?? _getKey(T, tag);
    var info = _single[newKey];

    if (info?.value != null) {
      return info!.value;
    } else {
      throw '"$T" not found. You need to put at first';
    }
  }

  ///删除控制器
  bool delete<T>({String? tag, String? key}) {
    final newKey = key ?? _getKey(T, tag);
    if (!_single.containsKey(newKey)) {
      print('"$newKey" already removed.');
      return false;
    }

    _single.remove(newKey);
    print('"$newKey" deleted.');
    return true;
  }

  String _getKey(Type type, String? name) {
    return name == null ? type.toString() : type.toString() + name;
  }
}

class _InstanceInfo<T> {
  _InstanceInfo(this.value);

  T value;
}
