class PostHeaderModel {
  final int id;
  final String title;
  final String userId;
  final String userName;
  final bool isVerified;
  final int hearts;
  final int comments;
  final String videoPreview;
  final String avatar;
  final List<String> tags;
  final String dateCreated;
  final int commentsCount;

  PostHeaderModel(
      {this.id,
      this.title,
      this.userId,
      this.userName,
      this.isVerified,
      this.hearts,
      this.videoPreview,
      this.avatar,
      this.tags,
      this.comments,
      this.dateCreated,
      this.commentsCount});
}
