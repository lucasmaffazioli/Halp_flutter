class FeedPostsModel {
  final int id;
  final String title;
  final String userName;
  final bool isVerified;
  final int hearts;
  final int comments;
  final String videoPreview;
  final String avatar;
  final List<String> tags;

  FeedPostsModel(
      {this.id,
      this.title,
      this.userName,
      this.isVerified,
      this.hearts,
      this.videoPreview,
      this.avatar,
      this.tags,
      this.comments});

  // void toggleCheckbox() {
  //   isChecked = !isChecked;
  // }
}
