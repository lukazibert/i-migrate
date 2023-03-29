import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:i_migrate/components/checklist_item.dart';

class AgentInfoCard extends StatefulWidget {
  final String title;
  final List<String> items;
  final VoidCallback? onContinuePressed;

  const AgentInfoCard({
    Key? key,
    required this.title,
    required this.items,
    this.onContinuePressed,
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

    return Card(
      color: Color(0xFFE5E5E5),
      child: InkWell(
        onTap: () {
          setState(() {
            _isExpanded = !_isExpanded;
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
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
                    progressColor: Colors.blue,
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
                          TextButton(
                            onPressed: widget.onContinuePressed,
                            child: Text("Continue"),
                          ),
                        ],
                      )
                    : SizedBox(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
