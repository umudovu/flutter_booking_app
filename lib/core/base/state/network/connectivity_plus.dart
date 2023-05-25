// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InternetCheckNotifier extends StateNotifier<InternetCheckState> {
  InternetCheckNotifier() : super(InternetCheckState());

  Future<bool> checkInternetConnectivity() async {
    var connectivityResult = await state._connectivity.checkConnectivity();
    state = state.copyWith(
        hasInternet: (connectivityResult != ConnectivityResult.none));
    return state.hasInternet ?? false;
  }
}

class InternetCheckState extends Equatable {
  InternetCheckState({this.hasInternet});

  final bool? hasInternet;
  final Connectivity _connectivity = Connectivity();

  @override
  List<Object?> get props => [hasInternet];

  InternetCheckState copyWith({
    bool? hasInternet,
  }) {
    return InternetCheckState(
      hasInternet: hasInternet ?? this.hasInternet,
    );
  }
}
