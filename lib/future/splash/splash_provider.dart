// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashNotifier extends StateNotifier<SplashState> {
  SplashNotifier() : super(SplashState());
}

class SplashState {
  final bool? isRedirectHome;

  SplashState({this.isRedirectHome});

  @override
  List<Object?> get props => [isRedirectHome];

  SplashState copyWith({
    bool? isRedirectHome,
  }) {
    return SplashState(
      isRedirectHome: isRedirectHome ?? this.isRedirectHome,
    );
  }
}
