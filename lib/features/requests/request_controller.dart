import '../../services/firestore_service.dart';
import 'request_model.dart';

class RequestController {
  Future<String?> createRequest(RequestModel request) async {
    try {
      await FirestoreService.saveRequest(request);
      return null;
    } catch (e) {
      return e.toString();
    }
  }

  Future<List<RequestModel>> getPendingRequests() async {
    return FirestoreService.getPendingRequests();
  }

  Future<void> acceptRequest(
    String requestId,
    String providerId,
  ) async {
    await FirestoreService.acceptRequest(
      requestId,
      providerId,
    );
  }

  Future<void> rejectRequest(
    String requestId,
  ) async {
    await FirestoreService.rejectRequest(
      requestId,
    );
  }

  Future<void> completeRequest(
    String requestId,
  ) async {
    await FirestoreService.completeRequest(
      requestId,
    );
  }

  Future<RequestModel?> getLatestRequest(
  String riderId,
) async {
  return FirestoreService.getLatestRequest(
    riderId,
  );
}

Future<List<RequestModel>> getRiderRequests(
  String riderId,
) async {
  return FirestoreService.getRiderRequests(
    riderId,
  );
}

Future<RequestModel?> getRequestById(
  String requestId,
) async {
  return FirestoreService.getRequestById(
    requestId,
  );
}
}