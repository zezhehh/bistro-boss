import 'package:flutter_bloc/flutter_bloc.dart';

class RouteState {
  final String currentPage;
  RouteState(this.currentPage);
}

abstract class RouteEvent {}

class UpdateRouteEvent extends RouteEvent {
  final String route;
  UpdateRouteEvent(this.route);
}

class RouteBloc extends Bloc<RouteEvent, RouteState> {
  RouteBloc() : super(RouteState('/login')) {
    on<UpdateRouteEvent>((event, emit) {
      emit(RouteState(event.route));
    });
  }
}
