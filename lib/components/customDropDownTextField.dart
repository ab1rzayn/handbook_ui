import 'package:flutter/material.dart';

class DropdownTextField extends StatefulWidget {
  final List<String> dropdownItems;
  final String labelText;

  const DropdownTextField(
      {Key? key, required this.dropdownItems, required this.labelText})
      : super(key: key);

  @override
  _DropdownTextFieldState createState() => _DropdownTextFieldState();
}

class _DropdownTextFieldState extends State<DropdownTextField> {
  TextEditingController _textEditingController = TextEditingController();
  String? _selectedItem;

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      child: TextField(
        controller: _textEditingController,
        decoration: InputDecoration(
          labelText: widget.labelText,
          suffixIcon: IconButton(
            icon: Icon(Icons.arrow_drop_down),
            onPressed: () {
              _showDropdownMenu(context);
            },
          ),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  void _showDropdownMenu(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select an item'),
          content: Container(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: widget.dropdownItems.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(widget.dropdownItems[index]),
                  onTap: () {
                    setState(() {
                      _selectedItem = widget.dropdownItems[index];
                      _textEditingController.text = _selectedItem!;
                    });
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}
