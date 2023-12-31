class Reel_Model {
  final String? post_id_fk;
  final String videoUrl, updated_at, my_profile_id;
  final String userName;
  final String? profileUrl;
  String? reaction_type_id_fk;
  final String? reelDescription;

  Reel_Model(
    this.videoUrl,
    this.userName, {
    this.post_id_fk,
    required this.updated_at,
    required this.my_profile_id,
    this.profileUrl,
    this.reaction_type_id_fk,
    this.reelDescription,
  });
}
