import 'package:flutter/material.dart';

class Date1Page extends StatefulWidget {
  const Date1Page({Key? key}) : super(key: key);

  @override
  _Date1PageState createState() => _Date1PageState();
}

class _Date1PageState extends State<Date1Page> {
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2099),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Example Kalender'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _selectedDate == null
                  ? 'Anda belum memilih'
                  : 'Silahkan pilih: ${_selectedDate?.toLocal()}',
            ),
            ElevatedButton(
              onPressed: () => _selectDate(context),
              child: Text('Pilih tanggal lahir anda'),
            ),
          ],
        ),
      ),
    );
  }
}
