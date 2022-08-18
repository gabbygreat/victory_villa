import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:victory_villa/model/model.dart';
import 'package:victory_villa/screen/occupied_room/controller/occupied_room_controller.dart';
import 'package:victory_villa/utils/assets.dart';
import 'package:victory_villa/utils/colors.dart';
import 'package:victory_villa/utils/constants.dart';
import 'package:victory_villa/utils/widget/app_bar.dart';
import 'package:victory_villa/utils/widget/no_content.dart';
import 'package:victory_villa/utils/widget/no_network.dart';
import 'package:victory_villa/utils/widget/search_box/search_box.dart';
import 'package:victory_villa/utils/widget/search_card.dart';

class UnavailableRoom extends ConsumerWidget {
  const UnavailableRoom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<RoomInfo>?> state = ref.watch(occupiedRoomProvider);
    return Scaffold(
      appBar: customAppBar(title: 'Occupied Rooms'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          state.when(
            data: (value) => Expanded(
              child: Column(
                children: [
                  SearchBox(
                    enabled: false,
                    roomInfoList: value,
                  ),
                  Expanded(
                    child: value == null
                        ? Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: VictoryConstants.kPadding * 2,
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                  child:
                                      SvgPicture.asset(VictoryAssets.network),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    ref.refresh(occupiedRoomProvider);
                                  },
                                  child: Text(
                                    'RETRY\n',
                                    style: TextStyle(
                                      color: VictoryColor.faintColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                      decorationStyle:
                                          TextDecorationStyle.dashed,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : value.isNotEmpty
                            ? ListView.builder(
                                itemBuilder: (context, index) {
                                  return SearchCard(
                                    roomInfo: value[index],
                                  );
                                },
                                itemCount: value.length,
                              )
                            : const NoContent(),
                  ),
                ],
              ),
            ),
            error: (e, trace) => NoInternet(
              onTap: () => ref.refresh(occupiedRoomProvider),
            ),
            loading: () => const Expanded(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
