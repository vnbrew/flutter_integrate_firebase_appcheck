part of 'categories_bloc.dart';

class CategoriesState extends Equatable {
  const CategoriesState({
    this.categories = const [],
    this.loading = false,
    this.firebaseException,
  });

  final List<Category> categories;
  final bool loading;
  final FirebaseException? firebaseException;

  CategoriesState copyWith({
    List<Category>? categories,
    bool? loading,
    FirebaseException? firebaseException,
  }) {
    return CategoriesState(
      categories: categories ?? this.categories,
      loading: loading ?? this.loading,
      firebaseException: firebaseException,
    );
  }

  @override
  List<Object?> get props => [categories, loading];
}
