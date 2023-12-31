import 'package:flutter/material.dart';
import '../../Controllers/comment_controller.dart';
import '../../Controllers/reaction_controller.dart';
import '../../Models/reel_model.dart';
import '../../global/components/toast_message.dart';
import '../Comment/single_comment.dart';

//import 'comment_bottomsheet.dart';

class ScreenOptions extends StatefulWidget {
  final Reel_Model item;
  final bool showVerifiedTick;
  final Function(String)? onShare;
  final Function(String)? onLike;
  final Function(String, String)? onComment;
  final Function()? onClickMoreBtn;
  final Function()? onFollow;
  final ReactionController reactionController = ReactionController();

  ScreenOptions({
    Key? key,
    required this.item,
    this.showVerifiedTick = true,
    this.onClickMoreBtn,
    this.onComment,
    this.onFollow,
    this.onLike,
    this.onShare,
  }) : super(key: key);

  @override
  _ScreenOptionsState createState() => _ScreenOptionsState();
}

class _ScreenOptionsState extends State<ScreenOptions> {
  CommentController _commentController = CommentController();
  List<dynamic>? comments = [];
  TextEditingController commenTextController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  bool is_loading_fetch_comments = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //fetchComments(post_id_fk);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 110),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        if (widget.item.profileUrl != null)
                          CircleAvatar(
                            radius: 16,
                            child: Image.network(widget.item.profileUrl!),
                          ),
                        if (widget.item.profileUrl == null)
                          const CircleAvatar(
                            radius: 16,
                            backgroundImage:
                                AssetImage('assets/images/profilepicture.jpeg'),
                          ),
                        const SizedBox(width: 6),
                        Text(widget.item.userName,
                            style: const TextStyle(color: Colors.white)),
                        const SizedBox(width: 10),
                        // if (showVerifiedTick)
                        //   const Icon(
                        //     Icons.verified,
                        //     size: 15,
                        //     color: Colors.white,
                        //   ),
                        //if (showVerifiedTick) const SizedBox(width: 6),
                        // if (onFollow != null)
                        //   TextButton(
                        //     onPressed: onFollow,
                        //     child: const Text(
                        //       'Follow',
                        //       style: TextStyle(
                        //         color: Colors.white,
                        //       ),
                        //     ),
                        //   ),
                      ],
                    ),
                    const SizedBox(width: 6),
                    if (widget.item.reelDescription != null)
                      Text(widget.item.reelDescription ?? '',
                          style: const TextStyle(color: Colors.white)),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              Column(
                children: [
                  // if (onLike != null && !widget.item.isLiked)
                  InkWell(
                    onTap: () {
                      // Show loading state
                      setState(() {
                        widget.item.reaction_type_id_fk =
                            '-1'; // Use a value that represents loading
                      });

                      widget.reactionController
                          .addReaction(1, int.parse(widget.item.post_id_fk!),
                              int.parse(widget.item.my_profile_id))
                          .then((value) {
                        setState(() {
                          widget.item.reaction_type_id_fk = value.toString();
                        });
                      });
                    },
                    onDoubleTap: () {
                      // Show loading state
                      setState(() {
                        widget.item.reaction_type_id_fk =
                            '-1'; // Use a value that represents loading
                      });

                      widget.reactionController
                          .addReaction(2, int.parse(widget.item.post_id_fk!),
                              int.parse(widget.item.my_profile_id))
                          .then((value) {
                        setState(() {
                          widget.item.reaction_type_id_fk = value.toString();
                        });
                      });
                    },
                    child: buildReactionIcon(widget.item.reaction_type_id_fk),
                  ),
                  // if (widget.item.isLiked)
                  //   const Icon(Icons.favorite_rounded, color: Colors.red),
                  // Text(NumbersToShort.convertNumToShort(widget.item.likeCount),
                  //     style: const TextStyle(color: Colors.white)),
                  const SizedBox(height: 20),
                  IconButton(
                    icon:
                        const Icon(Icons.comment_rounded, color: Colors.white),
                    onPressed: () {
                      show(context, int.parse(widget.item.post_id_fk!));
                    },
                  ),
                  // Text(
                  //     NumbersToShort.convertNumToShort(
                  //         widget.item.commentList?.length ?? 0),
                  //     style: const TextStyle(color: Colors.white)),
                  const SizedBox(height: 20),
                  // if (onShare != null)
                  InkWell(
                    //onTap: () => onShare!(widget.item.url),
                    child: Transform(
                      transform: Matrix4.rotationZ(5.8),
                      child: const Icon(
                        Icons.send,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  //if (onClickMoreBtn != null)
                  IconButton(
                    icon: const Icon(Icons.more_vert),
                    onPressed: () {},
                    color: Colors.white,
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget buildReactionIcon(String? reaction_type_id_fk) {
    if (widget.item.reaction_type_id_fk == '1') {
      return Icon(
        Icons.emoji_emotions_outlined,
        color: Colors.yellow,
      );
    } else if (widget.item.reaction_type_id_fk == '2') {
      return Icon(Icons.heart_broken);
    } else if (widget.item.reaction_type_id_fk == '-1') {
      return SizedBox(
          width: 2,
          height: 50,
          child: CircularProgressIndicator()); // Loading indicator
    } else {
      return Icon(Icons.emoji_emotions_outlined);
    }
  }

  void fetchComments(int post_id_fk) {
    _commentController.fetchComments(post_id_fk.toString()).then((value) {
      setState(() {
        comments = value;
        is_loading_fetch_comments = false;
      });
    });
  }

  void show(BuildContext context, int post_id_fk) {
    // print(post_id_fk);
    fetchComments(post_id_fk);

    Future.delayed(Duration.zero, () {
      showModalBottomSheet(
          context: context,
          builder: (builder) {
            return Form(
              key: _formkey,
              child: Scaffold(
                bottomNavigationBar: Padding(
                  padding: const EdgeInsets.only(bottom: 50),
                  child: ListTile(
                    leading: const CircleAvatar(
                      radius: 20,
                      backgroundImage:
                          AssetImage('assets/images/profilepicture.jpeg'),
                    ),
                    title: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "No Comment";
                        }
                        return null;
                      },
                      controller: commenTextController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), hintText: ('Comment')),
                    ),
                    trailing: ElevatedButton(
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            //add comment
                            print(commenTextController.text);

                            _commentController
                                .addComment(
                                    commenTextController.text,
                                    post_id_fk,
                                    int.parse(widget.item.my_profile_id))
                                .then((value) {
                              if (value) {
                                ToastMessage(
                                        context: context,
                                        message: "Added comment",
                                        type: "success")
                                    .show();
                              }
                            });
                            commenTextController.clear();
                            fetchComments(post_id_fk);
                          }
                        },
                        child: Text('Post')),
                  ),
                ),
                appBar: AppBar(
                  title: Text("Comments"),
                ),

                //bottomNavigationBar: ,
                body: (comments!.isNotEmpty &&
                        is_loading_fetch_comments == false)
                    ? ListView.builder(
                        itemCount: comments!.length,
                        itemBuilder: (itemBuilder, index) {
                          return Comment(
                              profileIdFk: 0,
                              username: comments![index]['username'],
                              comment: comments![index]['description'],
                              date: comments![index]['updated_at'],
                              time: comments![index]['updated_at']);
                        })
                    : (is_loading_fetch_comments)
                        ? const Center(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircularProgressIndicator(),
                                  Text("Loading...")
                                ]),
                          )
                        : Center(
                            child: Text("No Comments"),
                          ),
              ),
            );
          });
    });
  }
}
