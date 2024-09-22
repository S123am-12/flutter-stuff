import 'package:flutter/material.dart';
import 'package:scrollable_inertia/scrollable_inertia.dart';

class List_View extends StatefulWidget {
  const List_View({super.key});

  @override
  _List_ViewState createState() => _List_ViewState();
}

class _List_ViewState extends State<List_View> {
  bool _enlarged = false;  // Track the size state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List View"),
        backgroundColor: Colors.blue,
      ),
      body: InertiaListener(
        child: MotionBlur(
          //sigmaX: 5.0,  // Horizontal blur strength
          //sigmaY: 5.0,  // Vertical blur strength
          child: ListView.builder(
            itemCount: 25,  // Number of items
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _enlarged = !_enlarged;  // Toggle size when tapped
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: AnimatedSize(
                    duration: const Duration(seconds: 1),  // Animation duration
                    curve: Curves.easeInOut,  // Animation curve
                    child: FlutterLogo(
                      size: _enlarged ? 150 : 100,  // Change size based on state
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
