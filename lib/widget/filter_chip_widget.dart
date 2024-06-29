import 'package:flutter/material.dart';

class FilterChipWidget extends StatefulWidget {
  const FilterChipWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<FilterChipWidget> createState() => _FilterChipWidgetState();
}

class Item {
  String label;
  Color color;
  bool isSelected;

  Item(this.label, this.color, this.isSelected);
}

class _FilterChipWidgetState extends State<FilterChipWidget> {
  List items = [
    Item("Cabbage and lettuce", Colors.white, false),
    Item("Cucumber and tomato", Colors.white, false),
    Item("Onions and garlic", Colors.white, false),
    Item("Peppers", Colors.white, false),
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: getFilteredFriend(),
    );
  }

  List<Widget> getFilteredFriend() {
    List<Widget> chips = [];
    for (int i = 0; i < items.length; i++) {
      Widget item = Padding(
        padding: EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 5,
        ),
        child: FilterChip(
          side: BorderSide(color: Colors.transparent),
          checkmarkColor: Colors.deepPurple,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
            side: BorderSide.none,// Adjust the radius as needed
          ),
          label: Text(items[i].label),
          labelStyle:  items[i].isSelected ? TextStyle(color: Colors.deepPurple) : TextStyle(color:  Colors.grey.shade500),
          backgroundColor: items[i].color,
          selected: items[i].isSelected,
          onSelected: (value) {
            setState(() {
              items[i].isSelected = value;
            });
          },
        ),
      );
      chips.add(item);
    }
    return chips;
  }
}
