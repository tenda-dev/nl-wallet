import 'package:equatable/equatable.dart';

import '../../../wallet_core/error/core_error.dart';
import '../attribute/attribute.dart';

sealed class PidIssuanceStatus extends Equatable {
  @override
  List<Object?> get props => [];
}

class PidIssuanceAuthenticating extends PidIssuanceStatus {}

class PidIssuanceSuccess extends PidIssuanceStatus {
  final List<Attribute> previews;

  PidIssuanceSuccess(this.previews);

  @override
  List<Object?> get props => [previews];
}

class PidIssuanceError extends PidIssuanceStatus {
  final RedirectError error;

  PidIssuanceError(this.error);

  @override
  List<Object?> get props => [error];
}
