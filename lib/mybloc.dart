import 'package:bloc/bloc.dart';
import 'package:workshop/repo.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc() : super(NewsState([]));
  @override
  Stream<NewsState> mapEventToState(NewsEvent event) async* {
    // TODO: implement mapEventToState
    List temp = await GetData().fetchData();
    yield NewsState(temp);
  }
}

class NewsEvent {}

class NewsState {
  List myList = [];
  NewsState(this.myList);
}
