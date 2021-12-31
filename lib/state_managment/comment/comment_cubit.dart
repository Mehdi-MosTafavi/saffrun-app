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

  Future<bool> sendCommentEvent(
      {int? eventId, required String text, int? adminId}) async {
    try {
      bool status = false;
      List<CommentData> comments = [];
      if (eventId != null) {
        status = await commentRepository.commentNetworkService
            .sendCommentEventToServer(eventId, text);
        comments = await commentRepository.fetchCommentPageEvent(eventId);
      } else {
        status = await commentRepository.commentNetworkService
            .sendCommentAdminToServer(adminId!, text);
        comments = await commentRepository.fetchCommentPageAdmin(adminId);
      }

      emit(CommentLoaded(comments: comments));
      return status;
    } catch (e) {
      return false;
    }
  }

  Future<void> fetchCommentAdmin(int i) async {
    emit(CommentLoading());
    try {
      List<CommentData> comments =
          await commentRepository.fetchCommentPageAdmin(i);
      emit(CommentLoaded(comments: comments));
    } catch (e) {
      print(e);
      emit(CommentError());
    }
  }
}
