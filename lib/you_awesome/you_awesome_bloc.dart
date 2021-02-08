import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:myapp/you_awesome/index.dart';

class YouAwesomeBloc extends Bloc<YouAwesomeEvent, YouAwesomeState> {
  // todo: check singleton for logic in project
  // use GetIt for DI in projct
  static final YouAwesomeBloc _youAwesomeBlocSingleton = YouAwesomeBloc._internal();
  factory YouAwesomeBloc() {
    return _youAwesomeBlocSingleton;
  }
  YouAwesomeBloc._internal(): super(UnYouAwesomeState(0));
  
  @override
  Future<void> close() async{
    // dispose objects
    await super.close();
  }

  @override
  YouAwesomeState get initialState => UnYouAwesomeState(0);

  @override
  Stream<YouAwesomeState> mapEventToState(
    YouAwesomeEvent event,
  ) async* {
    try {
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_', name: 'YouAwesomeBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
