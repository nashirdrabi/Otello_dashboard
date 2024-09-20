import 'package:ostello_assignment/models/carousal_slider_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

const List<CarousalSliderData> carousalData = [
  CarousalSliderData(
      subtitle: 'Live Sections on JEE Exams ',
      title: 'Live Sections on JEE Exams',
      buttonText: 'Join',
      backgroundColor: '#F7E2A5',
      image: 'carousal1.png'),
  CarousalSliderData(
      subtitle: 'Live Sections on JEE Exams ',
      title: 'Free Courses on JEE Exams',
      backgroundColor: '#FED1BA',
      buttonText: 'Join',
      image: 'carousal1.png'),
];

final carousalDataProvider = Provider((ref) {
  return carousalData;
});
