import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:my_preloved/atomic_design_methodology/molecules_screen.dart';

import '../atomic_design_methodology/organism_screen.dart';
import 'colors/app_color.dart';
import 'typography/text_body1.dart';

class AtomScreen extends StatelessWidget {
  const AtomScreen({super.key});
  static const String routeName = 'atom-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Atom'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0.sp),
        children: [
          Card(
            child: ListTile(
              leading: const CircleAvatar(backgroundColor: Colors.deepPurple, child: TextBody1('1')),
              title: const TextBody1('Molecules', color: AppColor.black),
              onTap: () {
                context.pushNamed(MoleculesScreen.routeName);
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: const CircleAvatar(backgroundColor: Colors.deepPurple, child: TextBody1('2')),
              title: const TextBody1('Organism', color: AppColor.black),
              onTap: () {
                context.pushNamed(OrganismScreen.routeName);
              },
            ),
          ),
        ],
      ),
    );
  }
}
