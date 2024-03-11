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

import '../datasource/bhagavad_remote_data_source.dart' as _i4;
import '../providers/home_bloc/home_bloc.dart' as _i5;
import 'dio_client.dart' as _i6;

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
    gh.factory<_i3.Dio>(() => dioProvider.dio);
    gh.lazySingleton<_i4.BhagavadRemoteDataSource>(
        () => _i4.BhagavadRemoteDataSoureImpl(dio: gh<_i3.Dio>()));
    gh.lazySingleton<_i5.HomeBloc>(
        () => _i5.HomeBloc(gh<_i4.BhagavadRemoteDataSource>()));
    return this;
  }
}

class _$DioProvider extends _i6.DioProvider {}
