
import '../../../models/live_video_model.dart';

class LiveVideoRepository {
  Future<LiveVideoModel> getLiveVideo() async {
    await Future.delayed(const Duration(milliseconds: 500));

    return LiveVideoModel(
      orderId: "QB-2024-0001258",
      customerName: "Mohammed Khan",
      videoUrl: "",
    );
  }
}