import 'package:flutter/material.dart';
import 'package:i_migrate/components/CustomButton.dart';
import 'package:percent_indicator/percent_indicator.dart';
// import 'package:i_migrate/components/checklist_item.dart';

class AgentInfoCard extends StatefulWidget {
  final String title;
  final List<String> items;
  final Function onContinuePressed;

  const AgentInfoCard({
    Key? key,
    required this.title,
    required this.items,
    required this.onContinuePressed,
  }) : super(key: key);

  @override
  _AgentInfoCardState createState() => _AgentInfoCardState();
}

class _AgentInfoCardState extends State<AgentInfoCard> {
  bool _isExpanded = false;
  List<bool> _checkedItems;

  _AgentInfoCardState() : _checkedItems = [];

  @override
  void initState() {
    super.initState();
    _checkedItems = List<bool>.filled(widget.items.length, false);
  }

  void _onItemChanged(int index) {
    setState(() {
      _checkedItems[index] = !_checkedItems[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    int checkedCount = _checkedItems.where((element) => element).length;

    return GestureDetector(
      onTap: () {
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },
      child: Container(
        padding: EdgeInsets.all(25.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Color(0xFFEFEFEF),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                CircularPercentIndicator(
                  radius: 30.0,
                  lineWidth: 4.0,
                  percent: checkedCount / widget.items.length,
                  center: Text(
                    '${((checkedCount / widget.items.length) * 100).round()}%',
                    style: TextStyle(fontSize: 10),
                  ),
                  progressColor: Color(0xFF4F7E93),
                ),
              ],
            ),
            AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              child: _isExpanded
                  ? Column(
                      key: ValueKey<int>(checkedCount),
                      children: [
                        ...widget.items
                            .asMap()
                            .entries
                            .map(
                              (entry) => ChecklistItem(
                                key: ValueKey<int>(entry.key),
                                index: entry.key,
                                title: entry.value,
                                isChecked: _checkedItems[entry.key],
                                onChanged: _onItemChanged,
                              ),
                            )
                            .toList(),
                        SizedBox(height: 10),
                        CustomButton(
                          onTap: widget.onContinuePressed,
                          text: "Continue",
                        )
                        // TextButton(
                        //   onPressed: widget.onContinuePressed,
                        //   child: Text("Continue"),
                        // ),
                      ],
                    )
                  : SizedBox(),
            ),
          ],
        ),
      ),
    );

    // Card(
    //   color: Color(0xFFE5E5E5),
    //   child: InkWell(
    //     onTap: () {
    //       setState(() {
    //         _isExpanded = !_isExpanded;
    //       });
    //     },
    //     child: Padding(
    //       padding: const EdgeInsets.all(8.0),
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: [
    //               Text(
    //                 widget.title,
    //                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
    //               ),
    //               CircularPercentIndicator(
    //                 radius: 30.0,
    //                 lineWidth: 4.0,
    //                 percent: checkedCount / widget.items.length,
    //                 center: Text(
    //                   '${((checkedCount / widget.items.length) * 100).round()}%',
    //                   style: TextStyle(fontSize: 10),
    //                 ),
    //                 progressColor: Colors.blue,
    //               ),
    //             ],
    //           ),
    //           AnimatedSwitcher(
    //             duration: Duration(milliseconds: 300),
    //             child: _isExpanded
    //                 ? Column(
    //                     key: ValueKey<int>(checkedCount),
    //                     children: [
    //                       ...widget.items
    //                           .asMap()
    //                           .entries
    //                           .map(
    //                             (entry) => ChecklistItem(
    //                               key: ValueKey<int>(entry.key),
    //                               index: entry.key,
    //                               title: entry.value,
    //                               isChecked: _checkedItems[entry.key],
    //                               onChanged: _onItemChanged,
    //                             ),
    //                           )
    //                           .toList(),
    //                       SizedBox(height: 10),
    //                       TextButton(
    //                         onPressed: widget.onContinuePressed,
    //                         child: Text("Continue"),
    //                       ),
    //                     ],
    //                   )
    //                 : SizedBox(),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}

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
      activeColor: Color(0xFF4F7E93),
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
