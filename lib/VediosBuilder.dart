import 'package:TeacherLicense/Vedios.dart';
import 'package:auto_direction/auto_direction.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:random_color/random_color.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

Color get getRandomColor => RandomColor().randomColor(
    colorBrightness: const ColorBrightness.custom(const Range(
        ((ColorBrightness.maxBrightness + ColorBrightness.minBrightness) ~/
            1.2),
        ColorBrightness.maxBrightness)));

class VedioBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("الدورات"),
      ),
      body: ListView.builder(
        itemCount: FinalVedios.vedios.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GestureDetector(
                onTap: () {
                  Get.to(ViewVedio(FinalVedios.vedios[index]));
                },
                child: Card(
                  color: getRandomColor,
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
                  elevation: 4,
                  child: Column(
                    children: [
                      AutoDirection(
                        text: FinalVedios.vedios[index].name,
                        child: Text(FinalVedios.vedios[index].name,
                            style: const TextStyle(
                              fontSize: 18,
                              letterSpacing: 1.2,
                            ),
                            textAlign: TextAlign.center),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class ViewVedio extends StatefulWidget {
  Vedios v;
  ViewVedio(this.v);

  @override
  _ViewVedioState createState() => _ViewVedioState();
}

class _ViewVedioState extends State<ViewVedio> {
  YoutubePlayerController _controller;
  @override
  void initState() {
    _controller = YoutubePlayerController(
        initialVideoId: widget.v.id,
        flags: YoutubePlayerFlags(
          autoPlay: true,
          mute: false,
        ));

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(widget.v.name),centerTitle: true,),
      body: YoutubePlayerBuilder(
        builder: (BuildContext, Widget) {
          return Column(
            children: [
              SizedBox(
                height: Get.height * 0.2,
              ),
              Widget,
              SizedBox(
                height: Get.height * 0.07,
              ),
              AutoDirection(text: widget.v.name,
              child: Text(widget.v.name,style: TextStyle(fontSize: 20),))
            ],
          );
        },
        player: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
        ),
      ),
    );
  }
}
