import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_integrate_firebase_appcheck/di/di.dart';
import 'package:flutter_integrate_firebase_appcheck/response/category.dart';
import 'package:injectable/injectable.dart';

part 'categories_event.dart';
part 'categories_state.dart';

@Injectable()
class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc() : super(const CategoriesState()) {
    on<LoadCategories>(_onLoadCategories);
  }

  final _firebaseFirestore = getIt<FirebaseFirestore>();

  FutureOr<void> _onLoadCategories(
    LoadCategories event,
    Emitter<CategoriesState> emit,
  ) async {
    emit(state.copyWith(loading: true));
    try {
      final categories = await _firebaseFirestore
          .collection('categories')
          .get()
          .then((value) => value.docs.map(Category.fromSnapshot).toList());
      emit(state.copyWith(loading: false, categories: categories));
    } on FirebaseException catch (e) {
      emit(state.copyWith(loading: false, firebaseException: e));
    }
  }
}
