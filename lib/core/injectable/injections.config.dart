// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i4;

import '../../features/datasource/bhagavad_remote_data_source.dart' as _i6;
import '../../features/providers/home_bloc/home_bloc.dart' as _i7;
import '../failure/network/network.dart' as _i5;
import 'dio_client.dart' as _i8;
import 'internet_connection_checker.dart' as _i9;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dioProvider = _$DioProvider();
    final internetConnectionCheckerModule = _$InternetConnectionCheckerModule();
    gh.factory<_i3.Dio>(() => dioProvider.dio);
    gh.lazySingleton<_i4.InternetConnectionChecker>(
        () => internetConnectionCheckerModule.internetConnectionChecker);
    gh.lazySingleton<_i5.NetworkInfo>(() => _i5.NetworkInfoImpl(
        internetConnectionChecker: gh<_i4.InternetConnectionChecker>()));
    gh.lazySingleton<_i6.BhagavadRemoteDataSource>(
        () => _i6.BhagavadRemoteDataSoureImpl(
              dio: gh<_i3.Dio>(),
              networkInfo: gh<_i5.NetworkInfo>(),
            ));
    gh.lazySingleton<_i7.HomeBloc>(
        () => _i7.HomeBloc(gh<_i6.BhagavadRemoteDataSource>()));
    return this;
  }
}

class _$DioProvider extends _i8.DioProvider {}

class _$InternetConnectionCheckerModule
    extends _i9.InternetConnectionCheckerModule {}
