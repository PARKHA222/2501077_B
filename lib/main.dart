import 'package:flutter/material.dart';
import 'package:scratcher/scratcher.dart';
import 'bb_cake.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // 상태바 배경을 투명하게 설정 [출처: 바이브코딩 / Gemini AI 활용]
      statusBarIconBrightness: Brightness.dark, // 시간이나 배터리 아이콘을 블랙으로 설정 [출처: 바이브코딩 / Gemini AI 활용]
    ),
  );
  runApp(const SweetFinderApp()); //앱 실행
}

class SweetFinderApp extends StatelessWidget {
  const SweetFinderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FOR YOU DESSERT',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(192, 243, 247, 236),
          primary: const Color.fromARGB(255, 216, 238, 235),
        ),
        scaffoldBackgroundColor: const Color.fromARGB(255, 232, 242, 250), // 전체 배경
        useMaterial3: true, //유튜브에서 참고
      ),
      
      home: const CakeScratchScreen(),

      
    );
  }
}

// ===================================================================
// 1. 케이크로 화면을 닦아내는 미니 게임 화면 [출처: 바이브코딩 / Gemini AI 활용]
// ===================================================================
class CakeScratchScreen extends StatefulWidget {
  const CakeScratchScreen({super.key});

  @override
  State<CakeScratchScreen> createState() => _CakeScratchScreenState();
}

class _CakeScratchScreenState extends State<CakeScratchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 234, 243, 242),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '당신만의 달콤한 케이크와 \n 쿠키를 찾아보세요 🩶',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 174, 174, 174),
              ),
            ),
            const SizedBox(height: 40),
            
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Scratcher(
                brushSize: 60,
                threshold: 70,
                color: const Color.fromARGB(255, 250, 254, 242),
                onThreshold: () {
                  
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const LoginScreen()),
                  );
                },
                child: Container(
                  width: 350,
                  height: 350,
                  color: Colors.white,
                  child: Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        'assets/cake.jpg',
                        width: 350,
                        height: 350,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace){
                          return const Center (
                            child: Text(
                              'ERROR',
                              style: TextStyle(color: Colors.black12),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              '손으로 슥슥 문질러보세요!',
              style: TextStyle(color: Color.fromARGB(255, 132, 132, 132), fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

// ===================================================================
// 2. 로그인 화면 (별 배경 추가 버전)
// ===================================================================
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      resizeToAvoidBottomInset: false,
      
      backgroundColor: const Color.fromARGB(255, 206, 200, 187),
      body: Stack(
        // 유튜브 참고
        children: [
          const Positioned(
            top: 60,
            left: 50,
            child: Icon(Icons.star, color: Colors.black, size: 28),
          ),
          const Positioned(
            top: 440,
            left: 260,
            child: Icon(Icons.star, color: Colors.black, size: 28),
          ),
          const Positioned(
            top: 100,
            right: 40,
            child: Icon(Icons.star, color: Colors.black, size: 28),
          ),
          const Positioned(
            bottom: 200,
            left: 50,
            child: Icon(Icons.star, color: Colors.black, size: 28),
          ),
          const Positioned(
            bottom: 130,
            right: 70,
            child: Icon(Icons.star, color: Colors.black, size: 28),
          ),
          const Positioned(
            top: 310,
            left: 90,
            child: Icon(Icons.star, color: Colors.black, size: 28),
          ),
          const Positioned(
            top: 140,
            left: 200,
            child: Icon(Icons.star, color: Colors.black, size: 28),
          ),
          const Positioned(
            top: 800,
            left: 150,
            child: Icon(Icons.star, color: Colors.black, size: 28),
          ),


          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'FOR YOU DESSERT \n ૮꒰´｡• ༝ •｡`꒱ა',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 223, 238, 238),
                  ),
                ),
                const SizedBox(height: 40),
                const TextField(
                  enableSuggestions: false,
                  autocorrect: false,
                  style: TextStyle(
                    color: Color.fromARGB(255, 225, 238, 242),
                  ),
                  decoration: InputDecoration(
                    labelText: '아이디',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                const TextField(
                  obscureText: true,
                  style: TextStyle(
                    color: Color.fromARGB(255, 225, 238, 242),
                  ),
                  decoration: InputDecoration(
                    labelText: '비밀번호',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 225, 238, 242),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text(
                    '로그인',
                    style: TextStyle(
                      color: Color.fromARGB(255, 219, 213, 196),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ===================================================================
// 3. 메인 디저트 리스트 화면 (HomeScreen) [출처: 바이브코딩 / Gemini AI 활용]
// ===================================================================
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  String _currentCategory = '케이크';

  
  final TextEditingController _locationController = TextEditingController();

  final Set<String> _favoriteStoreNames = {};

  // 케이크 매장 속 5개 데이터 목록을 보여주기 위해 제미나이 AI 활용
  final List<Map<String, String>> _cakeShops = [
    {
      'name': '바나나 하루키 연남', 
      'address': '서울시 마포구 연남동 260-12', 
      'rating': '4.8', 
      'menu1': '- ̗̀  여름의 맛    ̖́-', 
      'menu2': '퓨어 레몬 케이크 *･ﾟ｡☆',
      'tip': '케이크 테이크 아웃 가능 / (엘리베이터有)'
    },
    {
      'name': '페로몬 성수', 
      'address': '서울시 성동구 성수동 1가 14-57', 
      'rating': '4.9', 
      'menu1': '- ̗̀  자허토르테 머랭 치즈 케이크    ̖́-', 
      'menu2': '피스타치오 체리 케이크 *･ﾟ｡☆',
      'tip': '뚝섬역 5번 출구 5분 거리, 케이크 예약 가능'
    },
    {
      'name': '티도 티도 케이크', 
      'address': '서울시 성동구 무학로2길 7', 
      'rating': '4.7', 
      'menu1': '- ̗̀  오레오 케이크    ̖́-', 
      'menu2': '미니 앤 케이크 *･ﾟ｡☆',
      'tip': '주말에는 웨이팅 필수, 반려동물 동반 가능'
    },
    {
      'name': '카페 수나', 
      'address': '경기 수원시 영통구 이의동 1313-2', 
      'rating': '4.6', 
      'menu1': '- ̗̀  흑임자 갸또 케이크    ̖́-', 
      'menu2': '바스트 치즈 케이크 *･ﾟ｡☆',
      'tip': '깨끗한 골목 안 카페, 홀케이크 예약 가능'
    },
    {
      'name': '메이드 인 집시', 
      'address': '경기 고양시 일산동구 정발산동 12-7', 
      'rating': '4.9', 
      'menu1': '- ̗̀  제리 초코 케이크    ̖́-', 
      'menu2': '시나몬 애플 케이크 *･ﾟ｡☆',
      'tip': '주차 공간 협소, 조용한 분위기의 디저트 가게 '
    },
  ];

  // 쿠키 매장 속 5개 데이터 목록
  final List<Map<String, String>> _cookieShops = [
    {
      'name': '미도리컬러', 
      'address': '대전 동구 소제동 299-79', 
      'rating': '4.9', 
      'menu1': '- ̗̀  말차 화이트 쿠키    ̖́-', 
      'menu2': '마카다미아 쿠키 *･ﾟ｡☆',
      'tip': '따뜻한 분위기, 산미 없는 아메리카노와 궁합 최고'
    },
    {
      'name': '마이페이보릿 쿠키', 
      'address': '부산 수영구 광남로 103', 
      'rating': '4.8', 
      'menu1': '- ̗̀  솔트 초코 아몬드 쿠키    ̖́-', 
      'menu2': '벨벳 크림치즈 쿠키 *･ﾟ｡☆',
      'tip': '인기 쿠키는 2시 전에 솔드 아웃, 바닷가 필수 코스'
    },
    {
      'name': '쿠키에비뉴 11', 
      'address': '광주 동구 장동로 51', 
      'rating': '4.4', 
      'menu1': '- ̗̀  미드나잇 스모어 쿠키    ̖́-', 
      'menu2': '누텔라 헤이즐넛 쿠키 *･ﾟ｡☆',
      'tip': '특별한 느낌으로 선물 포장 가능'
    },
    {
      'name': '무프 아파트먼트', 
      'address': '서울시 성동구 하왕십리동 975-20', 
      'rating': '4.7', 
      'menu1': '- ̗̀  크럼블 치즈 쿠키    ̖́-', 
      'menu2': '두바이 쫀득 쿠키 *･ﾟ｡☆',
      'tip': '디저트 맛집, 달콤한 쿠키와 필터 커피 조합 추천'
    },
    {
      'name': '벨베이크', 
      'address': '서울시 마포구 독막로3길 24-11', 
      'rating': '4.5', 
      'menu1': '- ̗̀  까망 크럼블 쿠키    ̖́-', 
      'menu2': '무화과 크림치즈 쿠키 *･ﾟ｡☆',
      'tip': '새로운 느낌의 쿠키를 선보이는 디저트 가게'
    },
  ];

  void _toggleFavorite(String storeName) {
    setState(() {
      if (_favoriteStoreNames.contains(storeName)) {
        _favoriteStoreNames.remove(storeName);
      } else {
        _favoriteStoreNames.add(storeName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    final List<Map<String, String>> allShops = [..._cakeShops, ..._cookieShops];
    final List<Map<String, String>> favoriteShops = allShops
        .where((shop) => _favoriteStoreNames.contains(shop['name']))
        .toList();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 206, 200, 187),
      appBar: AppBar(
        title: const Text('FOR YOU DESSERT 🩶', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 206, 200, 187),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // [1] 오늘의 추천 케이크 배너 제미나이 AI 활용
            Container(
              margin: const EdgeInsets.all(16),
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  colors: [Color.fromARGB(255, 237, 242, 229), Color.fromARGB(255, 225, 238, 242)],
                ),
              ),
              child: const Center(
                child: Text(
                  '오늘의 추천 케이크 \n"레몬 엔젤 케이크" 50% 할인!',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color.fromARGB(255, 176, 176, 176), fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            // [2] 카테고리 버튼들
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CategoryButton(
                    label: '케이크',
                    icon: Icons.cake,
                    isSelected: _currentCategory == '케이크',
                    onPressed: () {
                      setState(() {
                        _currentCategory = '케이크';
                      });
                    },
                  ),
                  CategoryButton(
                    label: '쿠키',
                    icon: Icons.cookie,
                    isSelected: _currentCategory == '쿠키',
                    onPressed: () {
                      setState(() {
                        _currentCategory = '쿠키';
                      });
                    },
                  ),
                  CategoryButton(
                    label: '내 주변',
                    icon: Icons.location_on,
                    isSelected: _currentCategory == '내 주변',
                    onPressed: () {
                      setState(() {
                        _currentCategory = '내 주변';
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),

            // [3] 조건문(if)을 사용해 현재 카테고리에 맞는 화면 띄우기 (케이크, 쿠키, 내 주변) - 제미나이 AI 활용
            if (_currentCategory == '케이크') ...[
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _cakeShops.length,
                itemBuilder: (context, index) {
                  final shop = _cakeShops[index];
                  return ShopCard(
                    name: shop['name'] ?? '이름 없음',
                    address: shop['address'] ?? '주소 없음',
                    rating: shop['rating'] ?? '0.0',
                    menu1: shop['menu1'] ?? '추천 메뉴 준비 중',
                    menu2: shop['menu2'] ?? '추천 메뉴 준비 중',
                    tip: shop['tip'] ?? '매장 이용 팁 준비 중',
                    isFavorited: _favoriteStoreNames.contains(shop['name']), 
                    onFavoriteToggle: () => _toggleFavorite(shop['name']!),
                  );
                },
              ),
            ] else if (_currentCategory == '쿠키') ...[
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _cookieShops.length,
                itemBuilder: (context, index) {
                  final shop = _cookieShops[index];
                  return ShopCard(
                    name: shop['name'] ?? '이름 없음',
                    address: shop['address'] ?? '주소 없음',
                    rating: shop['rating'] ?? '0.0',
                    menu1: shop['menu1'] ?? '추천 메뉴 준비 중',
                    menu2: shop['menu2'] ?? '추천 메뉴 준비 중',
                    tip: shop['tip'] ?? '매장 이용 팁 준비 중',
                    isFavorited: _favoriteStoreNames.contains(shop['name']), 
                    onFavoriteToggle: () => _toggleFavorite(shop['name']!),
                  );
                },
              ),
            ] else if (_currentCategory == '내 주변') ...[
              Padding(
                padding: const EdgeInsets.all(11.0),
                child: Card(
                  color: const Color.fromARGB(255, 239, 247, 245),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  child: Padding(
                    padding: const EdgeInsets.all(21.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '내  위치를  입력해보세요  ૮ ꒰｡• . •｡꒱ ა',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 11),
                        TextField(
                          controller: _locationController,
                          decoration: const InputDecoration(
                            hintText: '예: 서울시 성동구 살곶이길 200',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.search),
                            fillColor: Colors.white,
                            filled: true,
                          ),
                        ),
                        const SizedBox(height: 12),
                        ElevatedButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: const Color.fromARGB(255, 223, 230, 229),
                                content: Text(
                                  '${_locationController.text} 주변 매장을 검색합니다!',
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 180, 178, 175),
                                    fontWeight: FontWeight.bold,
                                  )
                                )
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 206, 200, 187),
                            minimumSize: const Size.fromHeight(48),
                          ),
                          child: const Text('이 위치로 설정하기', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],

            if (_currentCategory == '내 주변') ...[
              Padding(
                // 여백을 세밀하게 조절할 수 있도록 only로 세팅하기 위해 제미나이 AI 활용
                padding: const EdgeInsets.only(top: 12.0, left: 16.0, right: 16.0, bottom: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.favorite, color: Color.fromARGB(255, 237, 250, 250)),
                        SizedBox(width: 8),
                        Text(
                          '나만의 특별한 디저트',
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ],
                   ),
                   const SizedBox(height: 12),
          
                    if (favoriteShops.isEmpty) ...[
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(32),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 134, 121, 121).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Center(
                          child: Text(
                            '마음에 드는 디저트 가게에 하트를 눌러보세요!',
                            style: TextStyle(color: Colors.white70, fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ] else ...[
                      // 하트를 누르면 뜨는 가로 양방향 스크롤 카드를 위해 제미나이 AI 활용
                      SizedBox(
                        height: 110,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: favoriteShops.length,
                          itemBuilder: (context, index) {
                            final fShop = favoriteShops[index];
                            return Container(
                              width: 150,
                              margin: const EdgeInsets.only(right: 12),
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 239, 247, 245),
                                borderRadius: BorderRadius.circular(16),
                             ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.store, color: Color.fromARGB(255, 206, 200, 187)),
                                  const SizedBox(height: 6),
                                  Text(
                                    fShop['name']!,
                                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text('★ ${fShop['rating']}', style: const TextStyle(fontSize: 12, color: Colors.grey)),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],

                    const SizedBox(height: 16),
                  
                   
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                           builder: (context) => const bbcake(storeName: "나만의 특별한 디저트"),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 237, 250, 250), 
                        minimumSize: const Size.fromHeight(60),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 0,
                      ),
                      icon: const Icon(CupertinoIcons.square_list, color: Color.fromARGB(255, 130, 130, 130), size: 18),
                      label: const Text(
                        '디저트  덕후들의  비밀  리뷰를  만나보세요',
                        style: TextStyle(color: Color.fromARGB(255, 130, 130, 130), fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          const SizedBox(height: 30), // 맨 아래 안전 마진 여백
          ],
        ),
      ),
    );
  }
}
// ===================================================================
// 카테고리 버튼 위젯 (기존 코드 유지) [출처: 바이브코딩 / Gemini AI 활용]
// ===================================================================
class CategoryButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onPressed;

  const CategoryButton({
    super.key,
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, color: isSelected ? const Color.fromARGB(255, 206, 200, 187) : const Color.fromARGB(255, 211, 222, 225)),
      label: Text(label, style: TextStyle(color: isSelected ? Colors.black : Colors.black54, fontWeight: isSelected ? FontWeight.bold : FontWeight.normal)),
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? const Color.fromARGB(255, 239, 247, 245) : Colors.white,
        elevation: isSelected ? 2 : 0,
      ),
    );
  }
}

// ===================================================================
// 매장 카드 위젯 (리뷰 팝업, 추천 메뉴 팝업, 즐겨찾기 기능 포함) [출처: 바이브코딩 / Gemini AI 활용]
// ===================================================================
class ShopCard extends StatelessWidget {
  final String name;
  final String address;
  final String rating;
  final String menu1; 
  final String menu2; 
  final String tip;
  final bool isFavorited; 
  final VoidCallback onFavoriteToggle;
  
  const ShopCard({
    super.key, 
    required this.name, 
    required this.address, 
    required this.rating,
    required this.menu1,
    required this.menu2,
    required this.tip,
    required this.isFavorited, 
    required this.onFavoriteToggle,
  });

  void _showMenuDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color.fromARGB(255, 239, 247, 245),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: Text(
            '$name 추천 메뉴',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            textAlign: TextAlign.center,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '          추천 디저트를 만나보세요 ',
                style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 143, 143, 143)),
              ),
              const SizedBox(height: 16),
              Text(' $menu1', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
              const SizedBox(height: 10),
              Text(' $menu2', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0, bottom: 8.0),
              child: InkWell(
                onTap: () => Navigator.pop(context),
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 206, 200, 187),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    '확인',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 239, 247, 245),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: const Icon(Icons.store, color: Color.fromARGB(255, 206, 200, 187), size: 40),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(address),
        trailing: Text(
          '★ $rating',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 179, 174, 163)
          )
        ),
        onTap: () {
          
          bool localFavoriteStatus = isFavorited;

          showModalBottomSheet(
            context: context,
            backgroundColor: const Color.fromARGB(255, 239, 247, 245),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            ),
            builder: (BuildContext sheetContext) {
              return StatefulBuilder(
                builder: (BuildContext context, StateSetter setModalState) {
                  return Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Container(
                            width: 40,
                            height: 4,
                            margin: const EdgeInsets.only(bottom: 20),
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Flexible(
                                    child: Text(
                                      name,
                                      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  InkWell(
                                    onTap: () => _showMenuDialog(context),
                                    borderRadius: BorderRadius.circular(6),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(255, 206, 200, 187),
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: const Text(
                                        '추천 메뉴',
                                        style: TextStyle(
                                          color: Colors.white, 
                                          fontSize: 12, 
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              '★ $rating',
                              style: const TextStyle(fontSize: 20, color: Color.fromARGB(255, 184, 180, 163), fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        const Divider(color: Color.fromARGB(255, 206, 200, 187)),
                        const SizedBox(height: 12),
                        
                        Row(
                          children: [
                            const Text('매장 위치', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
                            const SizedBox(width: 8),
                            InkWell(
                              onTap: () {
                                
                                onFavoriteToggle(); 
                                // 바텀시트 내부 하트 상태 즉시 토글 및 UI 갱신
                                setModalState(() {
                                  localFavoriteStatus = !localFavoriteStatus;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 206, 200, 187),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Icon(
                                  localFavoriteStatus ? Icons.favorite : Icons.favorite_border,
                                  color: localFavoriteStatus ? const Color.fromARGB(255, 225, 242, 240) : Colors.white,
                                  size: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(address, style: const TextStyle(fontSize: 16)),
                        const SizedBox(height: 20),
                        
                        const Text('매장 이용 팁', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
                        const SizedBox(height: 4),
                        Text(tip, style: const TextStyle(fontSize: 16)),
                        const SizedBox(height: 24),
                        ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 206, 200, 187),
                            minimumSize: const Size.fromHeight(48),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                          child: const Text('닫기', style: TextStyle(color: Colors.white, fontSize: 16)),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}