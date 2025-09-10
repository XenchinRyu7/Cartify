import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart';

/// Global service locator instance
final GetIt getIt = GetIt.instance;

/// Configure dependency injection for the Cartify app
/// This function sets up all the dependencies using injectable package
@InjectableInit()
Future<void> configureDependencies() async {
  // Initialize all dependencies marked with @injectable
  getIt.init();
  
  // Register any additional dependencies that need manual setup
  await _registerManualDependencies();
}

/// Register dependencies that cannot be auto-generated
Future<void> _registerManualDependencies() async {
  // Database setup
  // getIt.registerSingleton<Database>(await _initDatabase());
  
  // Shared preferences setup
  // getIt.registerSingleton<SharedPreferences>(await SharedPreferences.getInstance());
  
  // Dio setup
  // getIt.registerSingleton<Dio>(_createDio());
  
  // Other manual registrations can be added here
}

/// Initialize the database
// Future<Database> _initDatabase() async {
//   final databasesPath = await getDatabasesPath();
//   final path = join(databasesPath, AppConstants.databaseName);
//   
//   return await openDatabase(
//     path,
//     version: AppConstants.databaseVersion,
//     onCreate: (db, version) async {
//       // Create tables here
//     },
//   );
// }

/// Create and configure Dio instance
// Dio _createDio() {
//   final dio = Dio();
//   
//   dio.options.baseUrl = AppConstants.baseUrl;
//   dio.options.connectTimeout = AppConstants.connectTimeout;
//   dio.options.receiveTimeout = AppConstants.receiveTimeout;
//   
//   // Add interceptors
//   dio.interceptors.add(LogInterceptor(
//     requestBody: true,
//     responseBody: true,
//     logPrint: (obj) => debugPrint(obj.toString()),
//   ));
//   
//   return dio;
// }
