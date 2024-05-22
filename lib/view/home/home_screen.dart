import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/core/constants/route_constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<Offset> _offSetAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    _offSetAnimation =
        Tween<Offset>(begin: Offset.zero, end: const Offset(0, 1.5)).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.elasticIn,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push(RouteConstants.detail);
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height - 100,
              child: Stack(
                children: [
                  Image.asset(
                    'assets/images/road.jpg',
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                  Positioned(
                    left: 200,
                    top: 200,
                    child: SlideTransition(
                      position: _offSetAnimation,
                      child: const Text(
                        'FAV PROJECT',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 34,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 40),
              child: Text(
                'Öne Çıkanlar',
                style: TextStyle(fontSize: 25, color: Colors.yellow),
              ),
            ),
            const Row(
              children: [
                Expanded(child: Divider()),
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                Expanded(child: Divider()),
              ],
            ),
            Wrap(
              children: [
                Image.asset(
                  'assets/images/road.jpg',
                  width: MediaQuery.sizeOf(context).width / 4,
                ),
                Image.asset(
                  'assets/images/road.jpg',
                  width: MediaQuery.sizeOf(context).width / 4,
                ),
                Image.asset(
                  'assets/images/road.jpg',
                  width: MediaQuery.sizeOf(context).width / 4,
                ),
                Image.asset(
                  'assets/images/road.jpg',
                  width: MediaQuery.sizeOf(context).width / 4,
                ),
              ],
            ),
            Container(
              width: double.infinity,
              color: Colors.yellow,
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.arrow_forward_ios),
                label: const Text('Devamını görmek için tıklayınız..'),
                style: ButtonStyle(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
