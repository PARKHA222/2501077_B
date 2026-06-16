import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class bbcake extends StatefulWidget {
  final String storeName;
  const bbcake({super.key, required this.storeName});
  @override
  State<bbcake> createState() => _bbcakeState();
}

class _bbcakeState extends State<bbcake> {
  // 디자털 덕후들의 비밀 리뷰 피드 리스트 (각 피드는 이미지, 좋아요 상태, 북마크 상태, 좋아요 수, 날짜, 댓글 목록을 포함)
  late List<Map<String, dynamic>> feedList;

  @override
  void initState() {
    super.initState();
    // 제미나이 AI를 활용하여 피드 리스트 생성 구현하였습니다.
    // 사진은 제가 직접 촬영한 케이크입니다. [사진 출처 : 직접 촬영]
    feedList = [
      {
        "imagePath": "assets/cafe.jpg", 
        "isAsset": true,
        "isLiked": false,
        "isBookmarked": false,
        "likeCount": 21,
        "date": " 26/06/08",
        "comments": [" 쿠키도 맛있지만 커피가 진짜 맛있는 곳  ☕"]
      },
      {
        "imagePath": "assets/cafe2.jpg", 
        "isAsset": true,
        "isLiked": false,
        "isBookmarked": false,
        "likeCount": 54,
        "date": " 26/06/07",
        "comments": [" 초콜릿 케이크의 꾸덕함이 예술입니댯 ദി >⩊<︎︎ 𐦯"]
      },
      {
        "imagePath": "assets/cafe3.jpg", 
        "isAsset": true,
        "isLiked": false,
        "isBookmarked": false,
        "likeCount": 101,
        "date": " 26/06/05",
        "comments": [" 아늑한 분위기와 달콤한 허니브레드의 조합 !"]
      },
    ];
  }

  
  final TextEditingController _commentController = TextEditingController();

  // 말풍선 클릭 시 선택한 피드의 댓글창을 열어주는 함수
  // 수업 시간에 배운 것과 유튜브를 참고하여 구현하였습니다.
  void _showCommentBottomSheet(int feedIndex) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, 
      backgroundColor: const Color.fromARGB(255, 239, 247, 245), 
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder( // 바텀시트 내에서 댓글 추가 시 상태가 바로 반영되도록 StatefulBuilder로 구현하였습니다.
          builder: (context, setBottomSheetState) {
            List<String> currentComments = feedList[feedIndex]["comments"];

            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom, 
                left: 16,
                right: 16,
                top: 16,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start, 
                children: [
                  const Text(
                    " 댓글  쓰기  💬 ",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.brown),
                  ),
                  const SizedBox(height: 14),
                  
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxHeight: 150),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: currentComments.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Text(
                            "• ${currentComments[index]}", // 댓글 목록을 불릿 포인트로 표시하였습니다. [출처: 바이브코딩 / Gemini AI 활용]
                            style: const TextStyle(fontSize: 14, color: Colors.black87),
                          ),
                        );
                      },
                    ),
                  ),
                  const Divider(),
                  
                  Row( 
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _commentController, // 댓글 입력 필드를 제미나이 AI 활용하여 구현하였습니다.
                          decoration: const InputDecoration(
                            hintText: "따뜻한 댓글을 남겨주세요",  // [출처: 바이브코딩 / Gemini AI 활용으로 구현]
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.send, color: Colors.brown),
                        onPressed: () {
                          if (_commentController.text.trim().isNotEmpty) {
                            setState(() {
                              currentComments.add(_commentController.text.trim());
                            });
                            setBottomSheetState(() {}); 
                            _commentController.clear();
                          }
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 92, 92, 92),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color.fromARGB(255, 237, 250, 250)), 
        title: const Text(
          " 디저트   덕후들의   비밀   리뷰   🩶",
          style: TextStyle(color: Color.fromARGB(255, 237, 250, 250), fontWeight: FontWeight.bold, fontSize: 17),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 92, 92, 92),
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: ListView.builder(
        itemCount: feedList.length,
        itemBuilder: (context, index) {
          final feed = feedList[index];

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 20.0, right: 20.0, bottom: 6.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(14), 
                  child: feed["isAsset"]
                      ? Image.asset(
                          feed["imagePath"],
                          height: 360, 
                          width: double.infinity,
                          fit: BoxFit.cover,
                        )
                      : Image.network(
                          feed["imagePath"],
                          height: 360, 
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 11.0, right: 20.0, top: 14.0, bottom: 4.0),
                child: Row(
                  children: [
                    // 하트 버튼 개별 동작 적용을 Gemini AI 활용으로 구현
                    IconButton(
                      onPressed: () {
                        setState(() {
                          feed["isLiked"] = !feed["isLiked"];
                          if (feed["isLiked"]) {
                            feed["likeCount"]++;
                          } else {
                            feed["likeCount"]--;
                          }
                        });
                      },
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      icon: Icon(
                        feed["isLiked"] ? CupertinoIcons.heart_fill : CupertinoIcons.heart,// 하트 아이콘이 좋아요 상태에 따라 채워지거나 빈 하트로 표시되도록 구현하였습니다. [출처: 바이브코딩 / Gemini AI 활용]
                        color: feed["isLiked"] ? const Color.fromARGB(255, 237, 250, 250) : const Color.fromARGB(255, 237, 250, 250),
                      ),
                    ),
                    const Spacer(),

                    Transform.translate(
                      offset: const Offset(6, 1.0), 
                      child: IconButton(
                        onPressed: () => _showCommentBottomSheet(index),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        icon: const Icon(CupertinoIcons.chat_bubble, color: Color.fromARGB(255, 237, 250, 250)),
                      ),
                    ),
                    const SizedBox(width: 11), 
                    
                    // 북마크 (저장) 버튼
                    IconButton(
                      onPressed: () {
                        setState(() {
                          feed["isBookmarked"] = !feed["isBookmarked"];// 북마크 상태 토글 구현하였습니다. [출처: 바이브코딩 / Gemini AI 활용
                        });
                      },
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      icon: Icon(
                        feed["isBookmarked"] ? CupertinoIcons.bookmark_fill : CupertinoIcons.bookmark,
                        color: feed["isBookmarked"] ? const Color.fromARGB(255, 237, 250, 250) : const Color.fromARGB(255, 237, 250, 250),
                      ),
                    ),
                  ],
                ),
              ),

              Padding(// 좋아요 수를 표시하는 텍스트 위젯을 제미나이 AI 활용하여 구현하였습니다.
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4.0),
                child: Text(
                  " ${feed["likeCount"]} likes",
                  style: const TextStyle(fontSize: 16 * 1.2, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 237, 250, 250)),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4.0),
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(color: Color.fromARGB(255, 255, 254, 254), fontSize: 14 * 1.2, height: 1.3),
                    children: [
                      TextSpan(text: feed["comments"].first), 
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 6.0),
                child: Text(
                  feed["date"],
                  style: const TextStyle(fontSize: 17 * 0.99, color: Color.fromARGB(255, 237, 250, 250)),
                ),
              ),

              if (feed["comments"].length > 1) ...[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Divider(color: Colors.white24), 
                      ...feed["comments"].skip(1).map((comment) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Text(
                          "익명 : $comment",
                          style: const TextStyle(fontSize: 14, color: Color.fromARGB(255, 220, 220, 220), fontWeight: FontWeight.w500),
                        ),
                      )),
                    ],
                  ),
                ),
              ],

              const SizedBox(height: 24),
              const Divider(color: Colors.white12, thickness: 1),
            ],
          );
        },
      ),
    );
  }
}
