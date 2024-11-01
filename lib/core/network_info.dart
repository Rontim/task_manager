import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class NetworkInfo extends GetxService {
  static late Connectivity _connectivity;
  static RxBool isConnected = false.obs;

  // Initialize the network info service
  static Future<void> init() async {
    _connectivity = Connectivity();
    List<ConnectivityResult> result = await _connectivity.checkConnectivity();
    _updateConnectionStatus(result);

    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  // Update connection status
  static void _updateConnectionStatus(List<ConnectivityResult> result) {
    isConnected.value = result.contains(ConnectivityResult.wifi) ||
        result.contains(ConnectivityResult.mobile);

    if (!isConnected.value) {
      isConnected.value = result.contains(ConnectivityResult.ethernet);
    }
  }

  static bool get isOnline => isConnected.value;
}
