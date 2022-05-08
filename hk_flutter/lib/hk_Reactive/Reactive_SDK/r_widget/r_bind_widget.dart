import 'package:flutter/widgets.dart';
import '../r_notifier/HKRegister.dart';

class RBindWidget extends StatefulWidget {
  const RBindWidget({
    Key? key,
    this.bind,
    this.tag,
    this.binds,
    this.tags,
    required this.child,
  })  : assert(
          binds == null || tags == null || binds.length == tags.length,
          'The binds and tags arrays length is not equal\n'
          'or the elements in the two arrays not feat one-to-one',
        ),
        super(key: key);

  final Object? bind;
  final String? tag;

  final List<Object>? binds;
  final List<String>? tags;

  final Widget child;

  @override
  _RBindWidgetState createState() => _RBindWidgetState();
}

class _RBindWidgetState extends State<RBindWidget> {
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  void dispose() {
    _closeController();
    _closeControllers();

    super.dispose();
  }

  void _closeController() {
    if (widget.bind == null) {
      return;
    }

    var key = widget.bind.runtimeType.toString() + (widget.tag ?? '');
    HKRegister.delete(key: key);
  }

  void _closeControllers() {
    if (widget.binds == null) {
      return;
    }

    for (var i = 0; i < widget.binds!.length; i++) {
      var type = widget.binds![i].runtimeType.toString();

      if (widget.tags == null) {
        HKRegister.delete(key: type);
      } else {
        var key = type + (widget.tags?[i] ?? '');
        HKRegister.delete(key: key);
      }
    }
  }
}
