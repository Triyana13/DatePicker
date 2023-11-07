import 'package:flutter/material.dart';

class Date2Page extends StatefulWidget {
  const Date2Page({Key? key}) : super(key: key);

  @override
  _Date2PageState createState() => _Date2PageState();
}

class _Date2PageState extends State<Date2Page> {
  TimeOfDay? _selectedTime;

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? TimeOfDay.now(),
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Time Picker Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _selectedTime == null
                  ? 'Anda belum memilih '
                  : 'Silahkan pilih waktu: ${_selectedTime?.format(context)}',
            ),
            ElevatedButton(
              onPressed: () => _selectTime(context),
              child: Text('Select Date'),
            ),
          ],
        ),
      ),
    );
  }
}
