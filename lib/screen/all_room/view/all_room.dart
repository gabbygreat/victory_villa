import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:victory_villa/model/model.dart';
import 'package:victory_villa/screen/all_room/controller/all_room_controller.dart';
import 'package:victory_villa/utils/assets.dart';
import 'package:victory_villa/utils/colors.dart';
import 'package:victory_villa/utils/constants.dart';
import 'package:victory_villa/utils/widget/app_bar.dart';
import 'package:victory_villa/utils/widget/horizontal_line.dart';
import 'package:victory_villa/utils/widget/room_detail_selector.dart';
import 'package:victory_villa/utils/widget/search_card.dart';
import 'package:victory_villa/utils/widget/text_field.dart';

class AllRoom extends ConsumerWidget {
  const AllRoom({Key? key}) : super(key: key);

  Future<bool> onWillPop() async {
    RoomSuite.dispose();
    return true;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<RoomInfo>?> state = ref.watch(allRoomProvider(''));
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        appBar: customAppBar(title: 'All Rooms'),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.only(
                right: VictoryConstants.kPadding,
                top: VictoryConstants.kPadding * 0.5,
              ),
              child: SizedBox(
                height: 40,
                width: MediaQuery.of(context).size.width * 0.75,
                child: PopupMenuButton<String>(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  onSelected: (item) {
                    switch (item) {
                    }
                  },
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<String>>[
                    PopupMenuItem<String>(
                      value: 'suite',
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Room suite',
                        style: TextStyle(color: VictoryColor.primaryColor),
                      ),
                    ),
                    PopupMenuItem<String>(
                      value: 'name',
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Occupant / Guarantor name',
                        style: TextStyle(color: VictoryColor.primaryColor),
                      ),
                    ),
                    PopupMenuItem<String>(
                      value: 'number',
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Room number',
                        style: TextStyle(color: VictoryColor.primaryColor),
                      ),
                    ),
                  ],
                  child: TextField(
                    enabled: false,
                    decoration: customInputDecoration(
                      suffixIcon: const Icon(Icons.arrow_drop_down),
                      prefixIcon: const Icon(Icons.search),
                      hint: 'Room suite',
                    ),
                  ),
                ),
              ),
            ),
            horizontalLine(showText: false),
            Padding(
              padding: EdgeInsets.all(VictoryConstants.kPadding),
              child: SizedBox(
                child: RoomDetailSelector(
                  searchText: true,
                  perform: () {
                    
                    ref.refresh(allRoomProvider(RoomSuite.roomSuite));
                  },
                ),
              ),
            ),
            // horizontalLine(showText: false),
            state.when(
              data: (value) => Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return SearchCard(
                      roomInfo: value![index],
                    );
                  },
                  itemCount: value!.length,
                ),
              ),
              error: (e, trace) {
                return Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: VictoryConstants.kPadding * 2,
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: SvgPicture.asset(VictoryAssets.network),
                        ),
                        GestureDetector(
                          onTap: () {
                            ref.refresh(allRoomProvider('A'));
                          },
                          child: Text(
                            'RETRY\n',
                            style: TextStyle(
                              color: VictoryColor.faintColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              decorationStyle: TextDecorationStyle.dashed,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              loading: () => const Expanded(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
