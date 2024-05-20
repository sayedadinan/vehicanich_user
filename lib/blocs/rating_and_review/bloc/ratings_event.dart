part of 'ratings_bloc.dart';

sealed class RatingsEvent {}

class RatingAndReviewAdding extends RatingsEvent {
  final String ratingCount;
  final String feedback;
  final String shopId;
  RatingAndReviewAdding({
    required this.ratingCount,
    required this.feedback,
    required this.shopId,
  });
}
