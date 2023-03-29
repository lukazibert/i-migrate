import 'package:flutter/material.dart';

class ChecklistItem extends StatefulWidget {
  final String title;
  final int index;
  final bool isChecked;
  final ValueChanged<int> onChanged;

  const ChecklistItem(
      {Key? key,
      required this.title,
      required this.index,
      required this.isChecked,
      required this.onChanged})
      : super(key: key);

  @override
  _ChecklistItemState createState() => _ChecklistItemState();
}

class _ChecklistItemState extends State<ChecklistItem> {
  late bool _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.isChecked;
  }

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
      value: _isChecked,
      onChanged: (bool? value) {
        setState(() {
          _isChecked = value ?? false;
        });
        widget.onChanged(widget.index);
      },
      title: Text(widget.title),
    );
  }
}
