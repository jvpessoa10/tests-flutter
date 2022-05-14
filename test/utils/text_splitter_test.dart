import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tests/utils/text_splitter.dart';


void main() {
  late TextSplitter splitter;

  setUp(() {
    splitter = TextSplitter();
  });

  test('When split, given text separated by two commas, split() will return tree words', () {
    expect(splitter.split("one,two,three", ","), equals(["one", "two", "three"]));
  });

  test('When split, given text separated by two commas, split() will return tree words', () {
    expect(splitter.split("one,two,three", ","), equals(["one", "two", "three"]));
  });

}