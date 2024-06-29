import 'package:explorando_clima_app/model/place.dart';
import 'package:explorando_clima_app/model/profile.dart';
import 'package:flutter/material.dart';

import '../util/month.dart';

class Stay {
  final Place place;
  final List<Profile> people;
  final DateTimeRange dateTimeRange;

  String get durationText =>
      '${monthMap[dateTimeRange.start.month]} ${dateTimeRange.start.day.toString()} — ${dateTimeRange.end.day.toString()}';

  Stay(
      {required this.place, required this.dateTimeRange, required this.people});
}