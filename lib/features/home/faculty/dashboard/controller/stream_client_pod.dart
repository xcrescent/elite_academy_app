import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stream_video_flutter/stream_video_flutter.dart';

final streamClientPod = Provider<Future<StreamVideo>>((ref) async {
  // final guest = User.guest(userId: guestId, name: guestName, image: guestImage);
  final client = StreamVideo(
    '3v3qt2sftmeg',
    user: User.guest(userId: 'testing', name: 'Test User'),
    // userToken: 'x6bj4ryumuebx4ypggtyzw5624qkv9xmxgaj2x4gnjkkthsafjvwpeue5js8s9tq',
    options: const StreamVideoOptions(
      logPriority: Priority.info,
    ),
  );

  // final client = StreamVideo(
  //   apiKey,
  //   user: guest,
  // );

  final result = await client.connect();
// if result wasn't successful, then result will return null
  final userToken = result.getDataOrNull();
  final userInfo = client.currentUser;
  print('Client: $client');
  print('User Token: $userToken');
  print('User Info: $userInfo');
  return client;
});
