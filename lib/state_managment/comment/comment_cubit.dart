import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:saffrun_app/data_managment/comment/comment_repository.dart';
import 'package:saffrun_app/models/comment/comment.dart';

part 'comment_state.dart';

class CommentCubit extends Cubit<CommentState> {
  late CommentRepository commentRepository;

  CommentCubit() : super(CommentInitial()) {
    commentRepository = CommentRepository();
  }

  Future<void> fetchCommentEvent(int i) async {
    emit(CommentLoading());
    try {
      List<CommentData> comments =
          await commentRepository.fetchCommentPageEvent(i);
      emit(CommentLoaded(comments: comments));
    } catch (e) {
      print(e);
      emit(CommentError());
    }
  }

  Future<bool> sendCommentEvent(int eventId, String text) async {
    try {
      bool status = await commentRepository.commentNetworkService
          .sendCommentEventToServer(eventId, text);
      List<CommentData> comments =
          await commentRepository.fetchCommentPageEvent(eventId);
      emit(CommentLoaded(comments: comments));
      return status;
    } catch (e) {
      return false;
    }
  }
}
