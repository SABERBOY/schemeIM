// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginatedResponse<T> _$PaginatedResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => PaginatedResponse<T>(
  list: (json['list'] as List<dynamic>).map(fromJsonT).toList(),
  page: (json['page'] as num).toInt(),
  size: (json['size'] as num).toInt(),
  total: (json['total'] as num).toInt(),
);

Map<String, dynamic> _$PaginatedResponseToJson<T>(
  PaginatedResponse<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'list': instance.list.map(toJsonT).toList(),
  'page': instance.page,
  'size': instance.size,
  'total': instance.total,
};
