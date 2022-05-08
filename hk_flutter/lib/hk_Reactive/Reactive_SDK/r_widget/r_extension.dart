part of r_type_define;

///拓展函数
extension IntExtension on int {
  RxInt get obs => RxInt(this);
}

extension StringExtension on String {
  RxString get obs => RxString(this);
}

extension DoubleExtension on double {
  RxDouble get obs => RxDouble(this);
}

extension BoolExtension on bool {
  RxBool get obs => RxBool(this);
}

extension RxT<T> on T {
  Rx<T> get obs => Rx<T>(this);
}

extension GetxT<T> on T {
  Getx<T> get obs => Getx<T>(this);
}

///封装各类型
class RxInt extends Rx<int> {
  RxInt(int initial) : super(initial);

  RxInt operator +(int other) {
    value = value + other;
    return this;
  }

  RxInt operator -(int other) {
    value = value - other;
    return this;
  }
}

class RxDouble extends Rx<double> {
  RxDouble(double initial) : super(initial);

  RxDouble operator +(double other) {
    value = value + other;
    return this;
  }

  RxDouble operator -(double other) {
    value = value - other;
    return this;
  }
}

class RxString extends Rx<String> {
  RxString(String initial) : super(initial);
}

class RxBool extends Rx<bool> {
  RxBool(bool initial) : super(initial);
  @override
  String toString() {
    return value ? "true" : "false";
  }
}

class GetxSet<E> extends SetMixin<E>
    with NotifyManager<Set<E>>, RxObjectMixin<Set<E>>
    implements RxInterface<Set<E>> {
  GetxSet([Set<E> initial = const {}]) {
    _value = Set.from(initial);
  }

  /// Special override to push() element(s) in a reactive way
  /// inside the List,
  GetxSet<E> operator +(Set<E> val) {
    addAll(val);
    refresh();
    return this;
  }

  void update(void fn(Iterable<E>? value)) {
    fn(value);
    refresh();
  }

  @override
  @protected
  Set<E> get value {
    RxInterface.proxy?.addListener(subject);
    return _value;
  }

  @override
  @protected
  set value(Set<E> val) {
    if (_value == val) return;
    _value = val;
    refresh();
  }

  @override
  bool add(E value) {
    final val = _value.add(value);
    refresh();
    return val;
  }

  @override
  bool contains(Object? element) {
    return value.contains(element);
  }

  @override
  Iterator<E> get iterator => value.iterator;

  @override
  int get length => value.length;

  @override
  E? lookup(Object? object) {
    return value.lookup(object);
  }

  @override
  bool remove(Object? item) {
    var hasRemoved = _value.remove(item);
    if (hasRemoved) {
      refresh();
    }
    return hasRemoved;
  }

  @override
  Set<E> toSet() {
    return value.toSet();
  }

  @override
  void addAll(Iterable<E> item) {
    _value.addAll(item);
    refresh();
  }

  @override
  void clear() {
    _value.clear();
    refresh();
  }

  @override
  void removeAll(Iterable<Object?> elements) {
    _value.removeAll(elements);
    refresh();
  }

  @override
  void retainAll(Iterable<Object?> elements) {
    _value.retainAll(elements);
    refresh();
  }

  @override
  void retainWhere(bool Function(E) E) {
    _value.retainWhere(E);
    refresh();
  }
}

class GetxList<E> extends ListMixin<E>
    with NotifyManager<List<E>>, RxObjectMixin<List<E>>
    implements RxInterface<List<E>> {
  GetxList([List<E> initial = const []]) {
    _value = List.from(initial);
  }

  factory GetxList.filled(int length, E fill, {bool growable = false}) {
    return GetxList(List.filled(length, fill, growable: growable));
  }

  factory GetxList.empty({bool growable = false}) {
    return GetxList(List.empty(growable: growable));
  }

  /// Creates a list containing all [elements].
  factory GetxList.from(Iterable elements, {bool growable = true}) {
    return GetxList(List.from(elements, growable: growable));
  }

  /// Creates a list from [elements].
  factory GetxList.of(Iterable<E> elements, {bool growable = true}) {
    return GetxList(List.of(elements, growable: growable));
  }

  /// Generates a list of values.
  factory GetxList.generate(int length, E generator(int index),
      {bool growable = true}) {
    return GetxList(List.generate(length, generator, growable: growable));
  }

  /// Creates an unmodifiable list containing all [elements].
  factory GetxList.unmodifiable(Iterable elements) {
    return GetxList(List.unmodifiable(elements));
  }

  @override
  Iterator<E> get iterator => value.iterator;

  @override
  void operator []=(int index, E val) {
    _value[index] = val;
    refresh();
  }

  /// Special override to push() element(s) in a reactive way
  /// inside the List,
  @override
  GetxList<E> operator +(Iterable<E> val) {
    addAll(val);
    refresh();
    return this;
  }

  @override
  E operator [](int index) {
    return value[index];
  }

  @override
  void add(E item) {
    _value.add(item);
    refresh();
  }

  @override
  void addAll(Iterable<E> item) {
    _value.addAll(item);
    refresh();
  }

  @override
  int get length => value.length;

  @override
  @protected
  List<E> get value {
    RxInterface.proxy?.addListener(subject);
    return _value;
  }

  @override
  set length(int newLength) {
    _value.length = newLength;
    refresh();
  }

  @override
  void insertAll(int index, Iterable<E> iterable) {
    _value.insertAll(index, iterable);
    refresh();
  }

  @override
  Iterable<E> get reversed => value.reversed;

  @override
  Iterable<E> where(bool Function(E) test) {
    return value.where(test);
  }

  @override
  Iterable<T> whereType<T>() {
    return value.whereType<T>();
  }

  @override
  void sort([int compare(E a, E b)?]) {
    _value.sort(compare);
    refresh();
  }
}

class GetxMap<K, V> extends MapMixin<K, V>
    with NotifyManager<Map<K, V>>, RxObjectMixin<Map<K, V>>
    implements RxInterface<Map<K, V>> {
  GetxMap([Map<K, V> initial = const {}]) {
    _value = Map.from(initial);
  }

  factory GetxMap.from(Map<K, V> other) {
    return GetxMap(Map.from(other));
  }

  /// Creates a [LinkedHashMap] with the same keys and values as [other].
  factory GetxMap.of(Map<K, V> other) {
    return GetxMap(Map.of(other));
  }

  ///Creates an unmodifiable hash based map containing the entries of [other].
  factory GetxMap.unmodifiable(Map<dynamic, dynamic> other) {
    return GetxMap(Map.unmodifiable(other));
  }

  /// Creates an identity map with the default implementation, [LinkedHashMap].
  factory GetxMap.identity() {
    return GetxMap(Map.identity());
  }

  @override
  V? operator [](Object? key) {
    return value[key as K];
  }

  @override
  void operator []=(K key, V value) {
    _value[key] = value;
    refresh();
  }

  @override
  void clear() {
    _value.clear();
    refresh();
  }

  @override
  Iterable<K> get keys => value.keys;

  @override
  V? remove(Object? key) {
    final val = _value.remove(key);
    refresh();
    return val;
  }

  @override
  @protected
  Map<K, V> get value {
    RxInterface.proxy?.addListener(subject);
    return _value;
  }
}

///简单类型的通用逻辑
class Rx<T> {
  RNotifier subject = RNotifier();

  Rx(T initial) {
    _value = initial;
  }

  late T _value;

  bool firstRebuild = true;

  String get string => value.toString();

  @override
  String toString() => value.toString();

  set value(T val) {
    if (_value == val && !firstRebuild) return;
    firstRebuild = false;
    _value = val;

    subject.notify();
  }

  T get value {
    if (RManager.proxy != null) {
      RManager.proxy!.addListener(subject);
    }
    return _value;
  }
}

/// value自带方法拓展到本体
extension RxIntExt on Rx<int> {
  int operator &(int other) => value & other;

  int operator |(int other) => value | other;

  int operator ^(int other) => value ^ other;

  int operator ~() => ~value;

  int operator <<(int shiftAmount) => value << shiftAmount;

  int operator >>(int shiftAmount) => value >> shiftAmount;

  int modPow(int exponent, int modulus) => value.modPow(exponent, modulus);

  int modInverse(int modulus) => value.modInverse(modulus);

  int gcd(int other) => value.gcd(other);

  bool get isEven => value.isEven;

  bool get isOdd => value.isOdd;

  int get bitLength => value.bitLength;

  int toUnsigned(int width) => value.toUnsigned(width);

  int toSigned(int width) => value.toSigned(width);

  int operator -() => -value;

  int abs() => value.abs();

  int get sign => value.sign;

  int round() => value.round();

  int floor() => value.floor();

  int ceil() => value.ceil();

  int truncate() => value.truncate();

  double roundToDouble() => value.roundToDouble();

  double floorToDouble() => value.floorToDouble();

  double ceilToDouble() => value.ceilToDouble();

  double truncateToDouble() => value.truncateToDouble();
}

extension RxDoubleExt on Rx<double> {
  Rx<double> operator +(num other) {
    value = value + other;
    return this;
  }

  Rx<double> operator -(num other) {
    value = value - other;
    return this;
  }

  double operator *(num other) => value * other;

  double operator %(num other) => value % other;

  double operator /(num other) => value / other;

  int operator ~/(num other) => value ~/ other;

  double operator -() => -value;

  double abs() => value.abs();

  double get sign => value.sign;

  int round() => value.round();

  int floor() => value.floor();

  int ceil() => value.ceil();

  int truncate() => value.truncate();

  double roundToDouble() => value.roundToDouble();

  double floorToDouble() => value.floorToDouble();

  double ceilToDouble() => value.ceilToDouble();

  double truncateToDouble() => value.truncateToDouble();
}

extension RxBoolExt on Rx<bool> {
  bool get isTrue => value;

  bool get isFalse => !isTrue;

  bool operator &(bool other) => other && value;

  bool operator |(bool other) => other || value;

  bool operator ^(bool other) => !other == value;
}

extension RxStringExt on Rx<String> {
  String operator +(String val) => _value + val;
  int compareTo(String other) {
    return value.compareTo(other);
  }

  bool endsWith(String other) {
    return value.endsWith(other);
  }

  bool startsWith(Pattern pattern, [int index = 0]) {
    return value.startsWith(pattern, index);
  }

  int indexOf(Pattern pattern, [int start = 0]) {
    return value.indexOf(pattern, start);
  }

  int lastIndexOf(Pattern pattern, [int? start]) {
    return value.lastIndexOf(pattern, start);
  }

  bool get isEmpty => value.isEmpty;

  bool get isNotEmpty => !isEmpty;

  String substring(int startIndex, [int? endIndex]) {
    return value.substring(startIndex, endIndex);
  }

  String trim() {
    return value.trim();
  }

  String trimLeft() {
    return value.trimLeft();
  }

  String trimRight() {
    return value.trimRight();
  }

  String padLeft(int width, [String padding = ' ']) {
    return value.padLeft(width, padding);
  }

  String padRight(int width, [String padding = ' ']) {
    return value.padRight(width, padding);
  }

  bool contains(Pattern other, [int startIndex = 0]) {
    return value.contains(other, startIndex);
  }

  String replaceAll(Pattern from, String replace) {
    return value.replaceAll(from, replace);
  }

  List<String> split(Pattern pattern) {
    return value.split(pattern);
  }

  List<int> get codeUnits => value.codeUnits;

  Runes get runes => value.runes;

  String toLowerCase() {
    return value.toLowerCase();
  }

  String toUpperCase() {
    return value.toUpperCase();
  }

  Iterable<Match> allMatches(String string, [int start = 0]) {
    return value.allMatches(string, start);
  }

  Match? matchAsPrefix(String string, [int start = 0]) {
    return value.matchAsPrefix(string, start);
  }
}

// 借助流订阅实现set、list、map的自更新【GETX】
class RxNotifier<T> = RxInterface<T> with NotifyManager<T>;

abstract class RxInterface<T> {
  bool get canUpdate;

  /// Adds a listener to stream
  void addListener(GetStream<T> rxGetx);

  /// Close the Rx Variable
  void close();

  static RxInterface? proxy;

  /// Calls `callback` with current value, when the value changes.
  StreamSubscription<T> listen(void Function(T event) onData,
      {Function? onError, void Function()? onDone, bool? cancelOnError});

  /// Avoids an unsafe usage of the `proxy`
  static T notifyChildren<T>(RxNotifier observer, ValueGetter<T> builder) {
    final _observer = RxInterface.proxy;
    RxInterface.proxy = observer;
    final result = builder();
    if (!observer.canUpdate) {
      RxInterface.proxy = _observer;
      throw """
      [Get] the improper use of a GetX has been detected. 
      You should only use GetX or Obx for the specific widget that will be updated.
      If you are seeing this error, you probably did not insert any observable variables into GetX/Obx 
      or insert them outside the scope that GetX considers suitable for an update 
      (example: GetX => HeavyWidget => variableObservable).
      If you need to update a parent widget and a child widget, wrap each one in an Obx/GetX.
      """;
    }
    RxInterface.proxy = _observer;
    return result;
  }
}

mixin RxObjectMixin<T> on NotifyManager<T> {
  late T _value;

  /// Makes a direct update of [value] adding it to the Stream
  /// useful when you make use of Rx for custom Types to referesh your UI.
  ///
  /// Sample:
  /// ```
  ///  class Person {
  ///     String name, last;
  ///     int age;
  ///     Person({this.name, this.last, this.age});
  ///     @override
  ///     String toString() => '$name $last, $age years old';
  ///  }
  ///
  /// final person = Person(name: 'John', last: 'Doe', age: 18).obs;
  /// person.value.name = 'Roi';
  /// person.refresh();
  /// print( person );
  /// ```
  void refresh() {
    subject.add(value);
  }

  /// updates the value to `null` and adds it to the Stream.
  /// Even with null-safety coming, is still an important feature to support, as
  /// `call()` doesn't accept `null` values. For instance,
  /// `InputDecoration.errorText` has to be null to not show the "error state".
  ///
  /// Sample:
  /// ```
  /// final inputError = ''.obs..nil();
  /// print('${inputError.runtimeType}: $inputError'); // outputs > RxString: null
  /// ```
  // void nil() {
  //   subject.add(_value = null);
  // }

  /// Makes this Rx looks like a function so you can update a new
  /// value using `rx(someOtherValue)`. Practical to assign the Rx directly
  /// to some Widget that has a signature ::onChange( value )
  ///
  /// Example:
  /// ```
  /// final myText = 'GetX rocks!'.obs;
  ///
  /// // in your Constructor, just to check it works :P
  /// ever( myText, print ) ;
  ///
  /// // in your build(BuildContext) {
  /// TextField(
  ///   onChanged: myText,
  /// ),
  ///```
  T call([T? v]) {
    if (v != null) {
      value = v;
    }
    return value;
  }

  bool firstRebuild = true;

  /// Same as `toString()` but using a getter.
  String get string => value.toString();

  @override
  String toString() => value.toString();

  /// Returns the json representation of `value`.
  dynamic toJson() => value;

  /// This equality override works for _RxImpl instances and the internal
  /// values.
  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object o) {
    // Todo, find a common implementation for the hashCode of different Types.
    if (o is T) return value == o;
    if (o is RxObjectMixin<T>) return value == o.value;
    return false;
  }

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode => _value.hashCode;

  /// Updates the [value] and adds it to the stream, updating the observer
  /// Widget, only if it's different from the previous value.
  set value(T val) {
    if (subject.isClosed) return;
    if (_value == val && !firstRebuild) return;
    firstRebuild = false;
    _value = val;

    subject.add(_value);
  }

  /// Returns the current [value]
  T get value {
    RxInterface.proxy?.addListener(subject);
    return _value;
  }

  Stream<T> get stream => subject.stream;

  /// Binds an existing `Stream<T>` to this Rx<T> to keep the values in sync.
  /// You can bind multiple sources to update the value.
  /// Closing the subscription will happen automatically when the observer
  /// Widget (`GetX` or `Obx`) gets unmounted from the Widget tree.
  void bindStream(Stream<T> stream) {
    final listSubscriptions =
        _subscriptions[subject] ??= <StreamSubscription>[];
    listSubscriptions.add(stream.listen((va) => value = va));
  }
}

mixin NotifyManager<T> {
  GetStream<T> subject = GetStream<T>();
  final _subscriptions = <GetStream, List<StreamSubscription>>{};

  bool get canUpdate => _subscriptions.isNotEmpty;

  /// This is an internal method.
  /// Subscribe to changes on the inner stream.
  void addListener(GetStream<T> rxGetx) {
    if (!_subscriptions.containsKey(rxGetx)) {
      final subs = rxGetx.listen((data) {
        if (!subject.isClosed) subject.add(data);
      });
      final listSubscriptions =
          _subscriptions[rxGetx] ??= <StreamSubscription>[];
      listSubscriptions.add(subs);
    }
  }

  StreamSubscription<T> listen(
    void Function(T) onData, {
    Function? onError,
    void Function()? onDone,
    bool? cancelOnError,
  }) =>
      subject.listen(
        onData,
        onError: onError,
        onDone: onDone,
        cancelOnError: cancelOnError ?? false,
      );

  /// Closes the subscriptions for this Rx, releasing the resources.
  void close() {
    _subscriptions.forEach((getStream, _subscriptions) {
      for (final subscription in _subscriptions) {
        subscription.cancel();
      }
    });

    _subscriptions.clear();
    subject.close();
  }
}

abstract class _RxImpl<T> extends RxNotifier<T> with RxObjectMixin<T> {
  _RxImpl(T initial) {
    _value = initial;
  }

  void addError(Object error, [StackTrace? stackTrace]) {
    subject.addError(error, stackTrace);
  }

  Stream<R> map<R>(R mapper(T? data)) => stream.map(mapper);

  void update(void fn(T? val)) {
    fn(_value);
    subject.add(_value);
  }

  void trigger(T v) {
    var firstRebuild = this.firstRebuild;
    value = v;
    if (!firstRebuild) {
      subject.add(v);
    }
  }
}

class Getx<T> extends _RxImpl<T> {
  Getx(T initial) : super(initial);

  @override
  dynamic toJson() {
    try {
      return (value as dynamic)?.toJson();
    } on Exception catch (_) {
      throw '$T has not method [toJson]';
    }
  }
}

/// 下列为拓展方法

extension SetExtension<E> on Set<E> {
  GetxSet<E> get obs {
    return GetxSet<E>(<E>{})..addAll(this);
  }

  /// Add [item] to [List<E>] only if [condition] is true.
  void addIf(dynamic condition, E item) {
    if (condition is Condition) condition = condition();
    if (condition is bool && condition) add(item);
  }

  /// Adds [Iterable<E>] to [List<E>] only if [condition] is true.
  void addAllIf(dynamic condition, Iterable<E> items) {
    if (condition is Condition) condition = condition();
    if (condition is bool && condition) addAll(items);
  }

  /// Replaces all existing items of this list with [item]
  void assign(E item) {
    // if (this is RxSet) {
    //   (this as RxSet)._value;
    // }

    clear();
    add(item);
  }

  /// Replaces all existing items of this list with [items]
  void assignAll(Iterable<E> items) {
    // if (this is RxSet) {
    //   (this as RxSet)._value;
    // }
    clear();
    addAll(items);
  }
}

extension ListExtension<E> on List<E> {
  GetxList<E> get obs => GetxList<E>(this);

  /// Add [item] to [List<E>] only if [item] is not null.
  void addNonNull(E item) {
    if (item != null) add(item);
  }

  // /// Add [Iterable<E>] to [List<E>] only if [Iterable<E>] is not null.
  // void addAllNonNull(Iterable<E> item) {
  //   if (item != null) addAll(item);
  // }

  /// Add [item] to [List<E>] only if [condition] is true.
  void addIf(dynamic condition, E item) {
    if (condition is Condition) condition = condition();
    if (condition is bool && condition) add(item);
  }

  /// Adds [Iterable<E>] to [List<E>] only if [condition] is true.
  void addAllIf(dynamic condition, Iterable<E> items) {
    if (condition is Condition) condition = condition();
    if (condition is bool && condition) addAll(items);
  }

  /// Replaces all existing items of this list with [item]
  void assign(E item) {
    // if (this is RxList) {
    //   (this as RxList)._value;
    // }

    clear();
    add(item);
  }

  /// Replaces all existing items of this list with [items]
  void assignAll(Iterable<E> items) {
    // if (this is RxList) {
    //   (this as RxList)._value;
    // }
    clear();
    addAll(items);
  }
}

extension MapExtension<K, V> on Map<K, V> {
  GetxMap<K, V> get obs {
    return GetxMap<K, V>(this);
  }

  void addIf(dynamic condition, K key, V value) {
    if (condition is Condition) condition = condition();
    if (condition is bool && condition) {
      this[key] = value;
    }
  }

  void addAllIf(dynamic condition, Map<K, V> values) {
    if (condition is Condition) condition = condition();
    if (condition is bool && condition) addAll(values);
  }

  void assign(K key, V val) {
    if (this is GetxMap) {
      final map = (this as GetxMap);
      // map._value;
      map._value.clear();
      this[key] = val;
    } else {
      clear();
      this[key] = val;
    }
  }

  void assignAll(Map<K, V> val) {
    if (val is GetxMap && this is GetxMap) {
      if ((val as GetxMap)._value == (this as GetxMap)._value) return;
    }
    if (this is GetxMap) {
      final map = (this as GetxMap);
      if (map._value == val) return;
      map._value = val;
      map.refresh();
    } else {
      if (this == val) return;
      clear();
      addAll(val);
    }
  }
}
