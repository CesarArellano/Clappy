import '../../l10n/app_localizations.dart';
import '../network/network_exceptions.dart';

extension NetworkExceptionLocalization on NetworkException {
  String localizedMessage(AppLocalizations l10n) => switch (type) {
    NetworkErrorType.timeout => l10n.networkErrorTimeout,
    NetworkErrorType.noConnection => l10n.networkErrorNoConnection,
    NetworkErrorType.cancelled => l10n.networkErrorCancelled,
    NetworkErrorType.badCertificate => l10n.networkErrorBadCertificate,
    NetworkErrorType.badRequest => l10n.networkErrorBadRequest,
    NetworkErrorType.unauthorized => l10n.networkErrorUnauthorized,
    NetworkErrorType.forbidden => l10n.networkErrorForbidden,
    NetworkErrorType.notFound => l10n.networkErrorNotFound,
    NetworkErrorType.rateLimited => l10n.networkErrorRateLimited,
    NetworkErrorType.serverError => l10n.networkErrorServerError,
    NetworkErrorType.unknown => l10n.networkErrorUnknown,
  };
}
