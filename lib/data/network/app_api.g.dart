// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _AppServiceClient implements AppServiceClient {
  _AppServiceClient(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'http://www.thecocktaildb.com';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<Either<Failure, List<DrinksResponse>>> fetchDrink(
      String categoryType) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'c': categoryType};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<List<DrinksResponse>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/json/v1/1/filter.php/',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    if (_result.statusCode == 200) {
      return Right(DrinksListResponse.fromJson(_result.data!).drinks!);
    } else {
      return Left(Failure(_result.statusCode!, _result.statusMessage!));
    }
  }

  @override
  Future<Either<Failure, DrinkDetailsListResponse>> fetchDrinkDetails(
      String drinkId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'i': drinkId};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<DrinkDetailResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/json/v1/1/lookup.php',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    if (_result.statusCode == 200) {
      return Right(DrinkDetailsListResponse.fromJson(_result.data!));
    } else {
      return Left(Failure(_result.statusCode!, _result.statusMessage!));
    }
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}


