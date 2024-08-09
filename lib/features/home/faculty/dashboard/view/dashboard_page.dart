import 'package:elite_academy/features/home/faculty/dashboard/controller/call_pod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stream_video_flutter/stream_video_flutter.dart';

class FacultyDashboardPage extends StatelessWidget {
  const FacultyDashboardPage({super.key});
  Future<void> _createLivestream(BuildContext context) async {
    // Get the user's name and id

    StreamVideo(
      'mmhfdzb5evj2',
      user: User(
        info: UserInfo(name: 'Test User', id: 'Mace_Windu'
            // id: userId
            ),
      ),
      userToken:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiTWFjZV9XaW5kdSIsImlzcyI6Imh0dHBzOi8vcHJvbnRvLmdldHN0cmVhbS5pbyIsInN1YiI6InVzZXIvTWFjZV9XaW5kdSIsImlhdCI6MTcyMzIyMTAzMiwiZXhwIjoxNzIzODI1ODM3fQ.utU_3vrQ_-A6bxBByQGXLQntF0R1EPJ4coWc8G0miXs',
      // userToken: token,
    );

    // Set up our call object
    final call = StreamVideo.instance.makeCall(
      callType: StreamCallType.liveStream(),
      id: 'xsLaEH0cZnrX',
    );

    // Set some default behaviour for how our devices should be configured once we join a call
    call.connectOptions = CallConnectOptions(
      camera: TrackOption.disabled(),
      microphone: TrackOption.disabled(),
      screenShare: TrackOption.disabled(),
    );

    // Get or create the call object
    final result = await call.getOrCreate(); // Call object is created

    if (result.isSuccess) {
      // Checks to ensure the user can share their screen.
      await call.join(); // Our local app user can join and receive events
      await call.goLive(); // Allow others to see and join the call (exit backstage mode)

      // TODO: Add the call object to the live screen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LiveScreen(
            liveStreamCall: call,
          ),
        ),
      );
    } else {
      debugPrint('Not able to create a call.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VideoCallPage()),
                );
              },
              child: const Text('Join Call'),
            ),
            ElevatedButton(
              onPressed: () => _createLivestream(context),
              child: const Text('Go to Live Screen'),
            ),
          ],
        ),
      ),
    );
  }
}

class VideoCallPage extends ConsumerWidget {
  const VideoCallPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final callAsyncValue = ref.watch(callPod);
    return Scaffold(
      body: callAsyncValue.when(
        data: (call) => StreamCallContainer(
          // Stream's pre-made component
          call: call,
          callContentBuilder: (context, call, callState) {
            return StreamCallContent(
              call: call,
              callState: callState,
              callControlsBuilder: (context, call, callState) {
                final localParticipant = callState.localParticipant!;
                return StreamCallControls(
                  options: [
                    CallControlOption(
                      icon: const Text('👋'),
                      onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Hello'),
                        ),
                      ),
                    ),
                    FlipCameraOption(
                      call: call,
                      localParticipant: localParticipant,
                    ),
                    LeaveCallOption(call: call, onLeaveCallTap: call.leave),
                  ],
                );
              },
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('Error: $error')),
      ),
    );
  }
}

class LiveScreen extends StatefulWidget {
  final liveStreamCall;
  const LiveScreen({super.key, required this.liveStreamCall});

  @override
  State<LiveScreen> createState() => _LiveScreenState();
}

class _LiveScreenState extends State<LiveScreen> {
  late Call livestreamCall = widget.liveStreamCall;
  // late final TabController _tabController =
  //     TabController(length: 5, vsync: this);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.grey,
      // appBar: PreferredSize(
      //   preferredSize: const Size.fromHeight(431),
      //   child: Column(children: [
      // LiveWidget(),
      ///
      // StreamBuilder(
      //   stream: livestreamCall.state.valueStream,
      //   initialData: livestreamCall.state.value,
      //   builder: (context, snapshot) {
      //     final callState = snapshot.data!;
      //     final participant = callState.callParticipants.first;
      //     return Scaffold(
      //       body: Stack(
      //         children: [
      //           if (snapshot.hasData)
      //             StreamVideoRenderer(
      //               call: livestreamCall,
      //               videoTrackType: SfuTrackType.video,
      //               participant: participant,
      //             ),
      //           if (!snapshot.hasData)
      //             const Center(
      //               child: CircularProgressIndicator(),
      //             ),
      //           if (snapshot.hasData && callState.status.isDisconnected)
      //             const Center(
      //               child: Text('Stream not live'),
      //             ),
      //           Positioned(
      //             top: 12.0,
      //             left: 12.0,
      //             child: Material(
      //               shape: RoundedRectangleBorder(
      //                 borderRadius: BorderRadius.circular(24),
      //               ),
      //               color: Colors.red,
      //               child: Center(
      //                 child: Padding(
      //                   padding: const EdgeInsets.all(8.0),
      //                   child: Text(
      //                     'Viewers: ${callState.callParticipants.length}',
      //                     style: const TextStyle(
      //                       fontSize: 14,
      //                       color: Colors.white,
      //                       fontWeight: FontWeight.bold,
      //                     ),
      //                   ),
      //                 ),
      //               ),
      //             ),
      //           ),
      //           Positioned(
      //             top: 12.0,
      //             right: 12.0,
      //             child: Material(
      //               shape: RoundedRectangleBorder(
      //                 borderRadius: BorderRadius.circular(24),
      //               ),
      //               color: Colors.black,
      //               child: GestureDetector(
      //                 onTap: () {
      //                   livestreamCall.end();
      //                   Navigator.pop(context);
      //                 },
      //                 child: const Center(
      //                   child: Padding(
      //                     padding: EdgeInsets.all(8.0),
      //                     child: Text(
      //                       'End Call',
      //                       style: TextStyle(
      //                         fontSize: 14,
      //                         color: Colors.white,
      //                         fontWeight: FontWeight.bold,
      //                       ),
      //                     ),
      //                   ),
      //                 ),
      //               ),
      //             ),
      //           ),
      //         ],
      //       ),
      //     );
      //   },
      // ),
      ///
      // const Padding(
      //   padding: EdgeInsets.only(left: 24.0, right: 24, top: 15),
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       Text.rich(
      //         TextSpan(
      //           children: [
      //             TextSpan(
      //               text: 'Algebra 12 ',
      //               style: TextStyle(
      //                 color: Color(0xFF2A2E3B),
      //                 fontSize: 18,
      //                 fontFamily: 'Avenir Next LT Pro',
      //                 fontWeight: FontWeight.w600,
      //                 // height: 0.07,
      //                 letterSpacing: -0.32,
      //               ),
      //             ),
      //             TextSpan(
      //               text: ': ',
      //               style: TextStyle(
      //                 color: Color(0xFF2A2E3B),
      //                 fontSize: 22,
      //                 fontFamily: 'Avenir Next LT Pro',
      //                 fontWeight: FontWeight.w400,
      //                 // height: 0,
      //                 letterSpacing: -0.32,
      //               ),
      //             ),
      //             TextSpan(
      //               text: 'Functions 4',
      //               style: TextStyle(
      //                 color: Color(0xFF2A2E3B),
      //                 fontSize: 18,
      //                 fontFamily: 'Avenir Next LT Pro',
      //                 fontWeight: FontWeight.w400,
      //                 height: 0.07,
      //                 letterSpacing: -0.32,
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //       SizedBox(
      //         height: 10,
      //       ),
      //       Text.rich(
      //         TextSpan(
      //           children: [
      //             TextSpan(
      //               text: 'Most shocking news',
      //               style: TextStyle(
      //                 color: Color(0xFF2A2E3B),
      //                 fontSize: 16,
      //                 fontFamily: 'Avenir Next LT Pro',
      //                 fontWeight: FontWeight.w600,
      //                 // height: 0.08,
      //                 letterSpacing: -0.32,
      //               ),
      //             ),
      //             TextSpan(
      //               text: ' ',
      //               style: TextStyle(
      //                 color: Color(0xFF262933),
      //                 fontSize: 16,
      //                 fontFamily: 'Avenir Next LT Pro',
      //                 fontWeight: FontWeight.w400,
      //                 // height: 0.08,
      //                 letterSpacing: -0.32,
      //               ),
      //             ),
      //             TextSpan(
      //               text:
      //                   'most shocking news most shocking news most shocking news most shocking news most shocking news\n',
      //               style: TextStyle(
      //                 color: Color(0xFF262933),
      //                 fontSize: 16,
      //                 fontFamily: 'Avenir Next LT Pro',
      //                 fontWeight: FontWeight.w400,
      //                 // height: 0.08,
      //                 letterSpacing: -0.32,
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      // TabBar(
      //   controller: _tabController,
      //   indicatorColor: Colors.transparent,
      //   padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
      //   unselectedLabelStyle: const TextStyle(
      //     color: Color(0xFF878487),
      //     fontSize: 12,
      //     fontFamily: 'Avenir Next LT Pro',
      //     fontWeight: FontWeight.w600,
      //     letterSpacing: -0.32,
      //   ),
      //   labelStyle: const TextStyle(
      //     color: Color(0xFF7D23E0),
      //     fontSize: 12,
      //     fontFamily: 'Avenir Next LT Pro',
      //     fontWeight: FontWeight.w600,
      //     letterSpacing: -0.32,
      //   ),
      //   tabs: [
      //     Tab(
      //       icon: SvgPicture.asset('assets/icons/live_chat_icon.svg'),
      //       text: 'Chat',
      //     ),
      //     Tab(
      //       icon: SvgPicture.asset('assets/icons/live_doubt_icon.svg'),
      //       text: 'Doubts',
      //     ),
      //     Tab(
      //       icon: SvgPicture.asset('assets/icons/live_notes_icon.svg'),
      //       text: 'Notes',
      //     ),
      //     Tab(
      //       icon: SvgPicture.asset('assets/icons/live_reward_icon.svg'),
      //       text: 'Reward',
      //     ),
      //     Tab(
      //       icon: SvgPicture.asset('assets/icons/live_share_icon.svg'),
      //       text: 'Share',
      //     )
      //   ],
      // ),
      // DividerWidget()
      //   ]),
      // ),
      body: StreamBuilder(
        stream: livestreamCall.state.valueStream,
        initialData: livestreamCall.state.value,
        builder: (context, snapshot) {
          final callState = snapshot.data!;
          final participant = callState.callParticipants.first;
          return Scaffold(
            body: Stack(
              children: [
                if (snapshot.hasData)
                  Column(
                    children: [
                      Container(
                          height: 325,
                          width: double.infinity,
                          // child: StreamVideoRenderer(
                          //   videoFit: VideoFit.cover,
                          //   call: livestreamCall,
                          //   videoTrackType: SfuTrackType.screenShare,
                          //   participant: participant,
                          // ),
                          child: LivestreamPlayer(
                            call: livestreamCall,
                          )),
                      const Text("HELLO"),
                      // Container(
                      //   height: 325,
                      //   width: double.infinity,
                      //   // child: StreamVideoRenderer(
                      //   //   videoFit: VideoFit.cover,
                      //   //   call: livestreamCall,
                      //   //   videoTrackType: SfuTrackType.video,
                      //   //   participant: participant,
                      //   // ),
                      //   child: LivestreamPlayer(
                      //     call: livestreamCall,
                      //
                      //   )
                      // ),
                    ],
                  ),
                if (!snapshot.hasData)
                  const Center(
                    child: CircularProgressIndicator(),
                  ),
                if (snapshot.hasData && callState.status.isDisconnected)
                  const Center(
                    child: Text('Stream not live'),
                  ),
                Positioned(
                  top: 12.0,
                  left: 12.0,
                  child: Material(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    color: Colors.red,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Viewers: ${callState.callParticipants.length}',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 12.0,
                  right: 12.0,
                  child: Material(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    color: Colors.black,
                    child: GestureDetector(
                      onTap: () {
                        livestreamCall.end();
                        Navigator.pop(context);
                      },
                      child: const Center(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'End Call',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      //     body: TabBarView(controller: _tabController, children: [
      //       ChatTab(),
      //       Container(),
      //       Container(),
      //       Container(),
      //       Container(),
      // ]),
    ));
  }
}

class LiveWidget extends StatelessWidget {
  const LiveWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 225,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/icons/live_bg.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: 225,
          decoration: const BoxDecoration(
            // image: DecorationImage(
            //   image: AssetImage('assets/icons/live_bg.png'),
            //   fit: BoxFit.cover,
            // ),
            // backgroundBlendMode: BlendMode.,

            color: Color(0xffD9D9D9),
            gradient: LinearGradient(
              begin: Alignment(-0.00, 1.00),
              end: Alignment(0, -1),
              colors: [Color(0xCC1C1C1C), Color(0x3D262933)],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 11.0, top: 9, right: 11),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(
              children: [
                Container(
                  width: 22,
                  height: 22,
                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 5),
                  decoration: ShapeDecoration(
                    color: Color(0xff4C4452).withOpacity(0.5),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                  ),
                  child: SvgPicture.asset(
                    'assets/icons/back_arrow.svg',
                    color: Colors.white,
                    width: 22,
                    height: 22,
                  ),
                ),
                const SizedBox(width: 5),
                const Text(
                  'VR Academy',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Avenir Next LT Pro',
                    fontWeight: FontWeight.w600,
                    height: 1.03,
                    letterSpacing: -0.32,
                  ),
                ),
                Container(
                    width: 25,
                    height: 30,
                    child: Image.asset(
                      'assets/images/new-ui/images/verified.png',
                      height: 30,
                      width: 30,
                    )),
              ],
            ),
            Row(children: [
              Container(
                  height: 21,
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: ShapeDecoration(
                    color: Color(0xFF7D23E0),
                    shape: RoundedRectangleBorder(
                      // side: BorderSide(width: 0.40, color: Color(0xFF7D23E0)),
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  child: Center(
                    child: const Text(
                      'Follow',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: 'Avenir Next LT Pro',
                        fontWeight: FontWeight.w600,
                        height: 0,
                        letterSpacing: -0.32,
                      ),
                    ),
                  )),
              SizedBox(
                width: 3,
              ),
              Container(
                height: 21,
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 5),
                decoration: ShapeDecoration(
                  color: Color(0x7F4C4452),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/icons/account_icon.svg'),
                    const SizedBox(width: 4),
                    Center(
                      child: Text(
                        '37.8k',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontFamily: 'Avenir Next LT Pro',
                          fontWeight: FontWeight.w400,
                          height: 1,
                          letterSpacing: -0.32,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ])
          ]),
        ),
        Positioned(
          bottom: 12.23,
          right: 13.23,
          child: SvgPicture.asset('assets/icons/expand_icon.svg'),
        ),
      ],
    );
  }
}

class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0, right: 24, top: 3),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              height: 2,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  transform: GradientRotation(0.00 * 3.14),
                  begin: Alignment.topRight,
                  end: Alignment.topLeft,
                  // stops: [0.00, 1.00],
                  colors: [Colors.black, Colors.white],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              height: 2,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  transform: GradientRotation(0.00 * 3.14),
                  begin: Alignment.topLeft,
                  end: Alignment.topRight,
                  // stops: [0.00, 1.00],
                  colors: [Colors.black, Colors.white],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChatTab extends StatelessWidget {
  const ChatTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 7,
              itemBuilder: (context, index) => Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                width: double.infinity,
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: SizedBox(
                        height: 40,
                        width: 40,
                        child: Image.asset('assets/icons/live_user_icon.png'),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Nabh ',
                            style: TextStyle(
                              color: Color(0xFF2A2E3B),
                              fontSize: 14,
                              fontFamily: 'Avenir Next LT Pro',
                              fontWeight: FontWeight.w700,
                              letterSpacing: -0.32,
                            ),
                          ),
                          TextSpan(
                            text:
                                'Most shocking news most shocking news \nmost shocking news most shocking news most\nshocking news most shocking news.\n',
                            style: TextStyle(
                              color: Color(0xFF878487),
                              fontSize: 14,
                              fontFamily: 'Avenir Next LT Pro',
                              fontWeight: FontWeight.w600,
                              letterSpacing: -0.32,
                            ),
                          ),
                        ],
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Stack(
            children: [
              Card(
                elevation: 4,
                shadowColor: Color(0xff979797).withOpacity(0.3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  height: 50,
                  child: TextField(
                      decoration: InputDecoration(
                    hintText: 'Comment...',
                    fillColor: Colors.white,
                    hintStyle: const TextStyle(
                      color: Color(0xFF9D9C9D),
                      fontSize: 14,
                      fontFamily: 'Avenir Next LT Pro',
                      fontWeight: FontWeight.w400,
                      letterSpacing: -0.32,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                  )),
                ),
              ),
              Positioned(
                  right: 15,
                  bottom: 15,
                  child: SvgPicture.asset('assets/icons/live_send_icon.svg')),
            ],
          )
        ],
      ),
    );
  }
}
