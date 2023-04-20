part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;

  const factory HomeState.loading() = Loading;

  const factory HomeState.success(List<BookModel> listTypeBook) = Success;

  const factory HomeState.error({String? error}) = Error;

  const factory HomeState.detail(BookModel books) = Detail;

  const factory HomeState.errors() = Errors;
}
