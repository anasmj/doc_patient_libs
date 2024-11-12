part of '../extensions.dart';

extension IntExt on int {
  Widget get toHeight => SizedBox(height: double.parse('$this'));
  Widget get toWidth => SizedBox(width: double.parse('$this'));
}
