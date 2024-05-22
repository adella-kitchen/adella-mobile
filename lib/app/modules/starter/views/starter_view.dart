import 'package:adella_kitchen/app/modules/home/views/widget.dart';
import 'package:adella_kitchen/app/modules/step_page/views/step_page_view.dart';
import 'package:adella_kitchen/app/routes/app_pages.dart';
import 'package:adella_kitchen/theme/widget/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';

import 'package:get/get.dart';

import '../controllers/starter_controller.dart';

class StarterView extends GetView<StarterController> {
  const StarterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  'Apakah sudah memiliki akun?',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 60),
                Image.asset('assets/img/page3.png',
                width: 200,
                height: 200,
                ),
                SizedBox(height: 75,),

                Padding(padding: const EdgeInsets.only(top: 20.0)),
                ElevatedButton(
                    onPressed: () {
                      Get.toNamed(Routes.STEP_PAGE);
                    }, 
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 210, 40, 54),
                        shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        ),
                        fixedSize: Size(300, 30)
                        ),
                    child: Text('Belum memiliki akun?',
                    style: TextStyle(fontSize: 14,
                    color: Colors.white
                    ),
                    )),
                SizedBox(height: 10),
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: BorderSide(color: Colors.black, width: 0.5)
                        ),
                        fixedSize: Size(300, 30)
                        ),
                    child: Text('Sudah memiliki akun',
                    style: TextStyle(fontSize: 14,
                    color: Colors.black,
                    ),
                  )
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
