import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:victory_villa/model/model.dart';
import 'package:victory_villa/screen/unoccupied_room/controller/available_room_controller.dart';
import 'package:victory_villa/utils/assets.dart';
import 'package:victory_villa/utils/colors.dart';
import 'package:victory_villa/utils/constants.dart';
import 'package:victory_villa/utils/widget/app_bar.dart';
import 'package:victory_villa/utils/widget/room_detail_selector.dart';
import 'package:victory_villa/utils/widget/search_box/search_box.dart';
import 'package:victory_villa/utils/widget/search_card.dart';

class UnoccupiedRoom extends ConsumerWidget {
  const UnoccupiedRoom({Key? key}) : super(key: key);
  Future<bool> onWillPop() async {
    RoomSuite.dispose();
    return true;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<RoomInfo>?> state = ref.watch(unOccupiedRoomProvider);
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        appBar: customAppBar(title: 'Unoccupied Rooms'),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SearchBox(),
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
                            //ref.refresh(unOccupiedRoomProvider);
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
            )
          ],
        ),
      ),
    );
  }
}
