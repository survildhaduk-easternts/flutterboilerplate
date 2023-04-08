//
//
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;
//
Future<void> init() async {
//   sl.registerFactory<LoginPageNotifier>(() => LoginPageNotifier(
//       loginUseCase: sl.call(),
//       isLoginUseCase: sl.call(),
//       getUserDataUseCase: sl.call())
//     ..appStarted().whenComplete(() => FlutterNativeSplash.remove()));
//   sl.registerFactory(() => HomeNotifier(
//       getTicketStatusCountUseCase: sl.call(),
//       checkOutUseCase: sl.call(),
//       checkInUseCase: sl.call(),
//       signOutUseCase: sl.call(),
//       notificationUserCase: sl.call(),
//       fetchTicketsDataUsecase: sl.call()));
//   sl.registerFactory(
//     () => ForgotPasswordNotifier(
//       forgotPassowrdUseCase: sl.call(),
//     ),
//   );
//   sl.registerFactory(
//     () => DetailPageNotifier(
//       createNewCommnetUsecase: sl.call(),
//       getAllCommentUseCase: sl.call(),
//       changeTicketStatusUseCase: sl.call(),
//       deleteTicketUseCase: sl.call(),
//       getTicketDetailsByIdDataUseCase: sl.call(),
//       deleteFileUseCase: sl.call(),
//       deleteCommentUseCase: sl.call(),
//     ),
//   );
//   sl.registerFactory<CreateNewTicketNotifier>(() => CreateNewTicketNotifier(
//         getUserApiDataUseCase: sl.call(),
//         getCustomerApiDataUseCase: sl.call(),
//         getCustomerMachineDataUseCase: sl.call(),
//         getMachineModelDataUseCase: sl.call(),
//         getMachineSerialNumDataUseCase: sl.call(),
//         createTicketUseCase: sl.call(),
//         changeTicketStatusUseCase: sl.call(),
//         updateTicketUseCase: sl.call(),
//       ));
//   sl.registerFactory<Applicationbloc>(
//       () => Applicationbloc(locationUsecase: sl.call()));
//   sl.registerFactory<ChangePasswordNotifier>(
//       () => ChangePasswordNotifier(changePasswordUsecase: sl.call()));
//   sl.registerFactory<AudioRecordAndPlayNotifier>(
//       () => AudioRecordAndPlayNotifier());
//
//   //useCase
//   sl.registerLazySingleton<LoginUseCase>(
//       () => LoginUseCase(loginRepository: sl.call()));
//   sl.registerLazySingleton<GetAllCommentUseCase>(
//       () => GetAllCommentUseCase(loginRepository: sl.call()));
//   sl.registerLazySingleton<NotificationUserCase>(
//       () => NotificationUserCase(loginRepository: sl.call()));
//   sl.registerLazySingleton<CheckInUseCase>(
//       () => CheckInUseCase(loginRepository: sl.call()));
//   sl.registerLazySingleton<CheckOutUseCase>(
//       () => CheckOutUseCase(loginRepository: sl.call()));
//   sl.registerLazySingleton<CreateNewCommnetUsecase>(
//       () => CreateNewCommnetUsecase(loginRepository: sl.call()));
//   sl.registerLazySingleton<ChangePasswordUsecase>(
//       () => ChangePasswordUsecase(loginRepository: sl.call()));
//   sl.registerLazySingleton<IsLoginUseCase>(
//       () => IsLoginUseCase(loginRepository: sl.call()));
//   sl.registerLazySingleton<FetchTicketsDataUsecase>(
//       () => FetchTicketsDataUsecase(loginRepository: sl.call()));
//   sl.registerLazySingleton<GetUserDataUseCase>(
//       () => GetUserDataUseCase(loginRepository: sl.call()));
//   sl.registerLazySingleton<SignOutUseCase>(
//       () => SignOutUseCase(loginRepository: sl.call()));
//   sl.registerLazySingleton<GetUserApiDataUseCase>(
//       () => GetUserApiDataUseCase(createTicketRepository: sl.call()));
//   sl.registerLazySingleton<GetCustomerApiDataUseCase>(
//       () => GetCustomerApiDataUseCase(createTicketRepository: sl.call()));
//   sl.registerLazySingleton<GetCustomerMachineDataUseCase>(
//       () => GetCustomerMachineDataUseCase(createTicketRepository: sl.call()));
//   sl.registerLazySingleton<GetMachineModelDataUseCase>(
//       () => GetMachineModelDataUseCase(createTicketRepository: sl.call()));
//   sl.registerLazySingleton<GetMachineSerialNumDataUseCase>(
//       () => GetMachineSerialNumDataUseCase(createTicketRepository: sl.call()));
//   sl.registerLazySingleton<UpdateLocationUsecase>(
//       () => UpdateLocationUsecase(loginRepository: sl.call()));
//   sl.registerLazySingleton<ForgotPassowrdUseCase>(
//       () => ForgotPassowrdUseCase(loginRepository: sl.call()));
//   sl.registerLazySingleton<DeleteTicketUseCase>(
//       () => DeleteTicketUseCase(loginRepository: sl.call()));
//   sl.registerLazySingleton<UpdateTicketUseCase>(
//       () => UpdateTicketUseCase(loginRepository: sl.call()));
//   sl.registerLazySingleton<CreateTicketUseCase>(
//       () => CreateTicketUseCase(loginRepository: sl.call()));
//   sl.registerLazySingleton<ChangeTicketStatusUseCase>(
//       () => ChangeTicketStatusUseCase(loginRepository: sl.call()));
//   sl.registerLazySingleton<GetTicketStatusCountUseCase>(
//       () => GetTicketStatusCountUseCase(loginRepository: sl.call()));
//   sl.registerLazySingleton<ExportFileUseCase>(
//       () => ExportFileUseCase(loginRepository: sl.call()));
//   sl.registerLazySingleton<DeleteFileUseCase>(
//       () => DeleteFileUseCase(loginRepository: sl.call()));
//   sl.registerLazySingleton<GetTicketDetailsByIdDataUseCase>(
//       () => GetTicketDetailsByIdDataUseCase(sl.call()));
//   sl.registerLazySingleton<DeleteCommentUseCase>(
//       () => DeleteCommentUseCase(loginRepository: sl.call()));
//
//   //repository
//   sl.registerLazySingleton<LoginRepository>(
//       () => LoginRepositoryImpl(apiRemoteDataSource: sl.call()));
//   sl.registerLazySingleton<CreateTicketRepository>(
//       () => CreateTicketRepositoryImpl(apiCreateTicketDataSource: sl.call()));
//
//   //data source
//   sl.registerLazySingleton<ApiRemoteDataSource>(() => LoginRemoteSourceIml(
//       loginModel: sl.call(),
//       readAllCommentModel: sl.call(),
//       ticketsModel: sl.call()));
//   sl.registerLazySingleton<ApiCreateTicketDataSource>(
//       () => CreateTicketDataSourceImpl(
//             getAllUserModel: sl.call(),
//             getAllCustomerModel: sl.call(),
//             getCustomerMachineModel: sl.call(),
//             getMachineModalNameModel: sl.call(),
//             getMachineSerialNumberModel: sl.call(),
//           ));
//
//   //External
//   final loginModel = LoginModel();
//   final getAllUserModel = GetAllUserModel();
//   final getAllComment = ReadAllCommentModel();
//   final ticketsModel = TicketsModel();
//   final getAllCustomerModel = GetAllCustomerModel();
//   final getCustomerMachineModel = GetCustomerMachineModel();
//   final getMachineModalNameModel = GetMachineModalNameModel();
//   final getMachineSerialNumberModel = GetMachineSerialNumberModel();
//   final getstatuscountmodel = TicketStatusModel();
//
//   sl.registerLazySingleton(() => loginModel);
//   sl.registerLazySingleton(() => getstatuscountmodel);
//   sl.registerLazySingleton(() => getAllUserModel);
//   sl.registerLazySingleton(() => ticketsModel);
//   sl.registerLazySingleton(() => getAllComment);
//   sl.registerLazySingleton(() => getAllCustomerModel);
//   sl.registerLazySingleton(() => getCustomerMachineModel);
//   sl.registerLazySingleton(() => getMachineModalNameModel);
//   sl.registerLazySingleton(() => getMachineSerialNumberModel);
}
