import 'package:ostello_assignment/models/card_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

const List<CardData> cardData = [
  CardData(title: "Free Courses", image: 'free.png'),
  CardData(title: "Attendance", image: 'attendance.png'),
  CardData(title: "Store", image: 'store.png'),
  CardData(title: "Assessment", image: 'assessment.png'),
];

final cardDataProvider = Provider((ref) {
  return cardData;
});
