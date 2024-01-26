import 'package:elite_academy/features/home/admin/dashboard/model/org_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repository/org_repository.dart';
//
// final orgDetailsPod =
//     StreamProvider.autoDispose.family<OrgModel, String>((ref, orgId) {
//   final firestore = ref.watch(firestoreProvider);
//   return firestore
//       .collection('orgs')
//       .doc(orgId)
//       .snapshots()
//       .map((event) => OrgModel.fromMap(event.data()!));
// });

final orgDetailsPod = FutureProvider.autoDispose.family<OrgModel, String>(
  (ref, orgId) async {
    final orgRepo = ref.read(orgRepositoryProvider);
    return await orgRepo.getOrgById(orgId);
  },
);

final orgListPod = FutureProvider.autoDispose<List<OrgModel>>(
  (ref) async {
    final orgRepo = ref.read(orgRepositoryProvider);
    return await orgRepo.getAllOrg();
  },
);

final addOrgPod = FutureProvider.autoDispose.family<void, OrgModel>(
  (ref, orgModel) async {
    final orgRepo = ref.read(orgRepositoryProvider);
    await orgRepo.addOrg(orgModel);
  },
);
