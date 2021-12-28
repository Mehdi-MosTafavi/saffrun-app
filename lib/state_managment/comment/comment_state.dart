part of 'comment_cubit.dart';

@immutable
abstract class CommentState {}

class CommentInitial extends CommentState {}

class CommentLoading extends CommentState {}

class CommentLoaded extends CommentState {
  final List<CommentData> comments;

  CommentLoaded({required this.comments});
}

class CommentError extends CommentState {}
