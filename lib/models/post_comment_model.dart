class PostCommentModel {
  final int commentId;
  final String commentTitle;
  final String commentUserId;
  final String commentUserName;
  final bool commentIsVerified;
  final int commentHearts;
  final String commentVideoPreview;
  final String commentAvatar;

  PostCommentModel(
      {this.commentId,
      this.commentTitle,
      this.commentUserId,
      this.commentUserName,
      this.commentIsVerified,
      this.commentHearts,
      this.commentVideoPreview,
      this.commentAvatar});
}
