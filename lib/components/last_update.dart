import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LastUpdate extends StatelessWidget {
  final String date;

  LastUpdate({required this.date});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 16, top: 24, bottom: 4),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Icon(
                Icons.date_range,
                color: Colors.black26,
                size: 16,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4),
                child: Text(
                  "Last Update ${DateFormat('dd MMMM yyyy').format(DateTime.parse(date))}",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black38),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

}