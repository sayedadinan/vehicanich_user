import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:vehicanich/data/data_provider/keys.dart';
import 'package:vehicanich/data/data_provider/shop_data.dart';
part 'ratings_event.dart';
part 'ratings_state.dart';

class RatingsBloc extends Bloc<RatingsEvent, RatingsState> {
  RatingsBloc() : super(RatingsInitial()) {
    on<RatingAndReviewAdding>(ratingAndReviewadding);
  }
  ratingAndReviewadding(
      RatingAndReviewAdding event, Emitter<RatingsState> emit) async {
    try {
      final shopReference = ShopReference()
          .shopCollectionReference()
          .doc(event.shopId)
          .collection(ReferenceKeys.rateAndReview)
          .doc();
      shopReference.set({
        "ratinCount": event.ratingCount,
        "feedback": event.feedback,
      });
      log('succes');
    } catch (e) {
      log('there is some error in rating bloc $e');
    }
  }
}
