import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'show_feedback_provider.g.dart';

@riverpod
class ShowModalNotifier extends _$ShowModalNotifier {
  @override
  bool build() {
    return isShown;
  }

  void show() => isShown = !isShown;
  void hide() => isShown = !isShown;

  bool get isFeedBackShown => isShown;
}

bool isShown = false;
