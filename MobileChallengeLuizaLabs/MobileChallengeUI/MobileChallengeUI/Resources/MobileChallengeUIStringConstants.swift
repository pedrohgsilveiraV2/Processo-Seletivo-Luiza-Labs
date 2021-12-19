// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// fork
  internal static let forkScoreItemDescription = L10n.tr("MobileChallengeUI", "FORK_SCORE_ITEM_DESCRIPTION")
  /// Infelizmente tivemos um error =(
  internal static let genericErrorViewDescription = L10n.tr("MobileChallengeUI", "GENERIC_ERROR_VIEW_DESCRIPTION")
  /// Tentar novamente
  internal static let genericErrorViewRetryActionDescription = L10n.tr("MobileChallengeUI", "GENERIC_ERROR_VIEW_RETRY_ACTION_DESCRIPTION")
  /// star
  internal static let starCoreItemDescription = L10n.tr("MobileChallengeUI", "STAR_CORE_ITEM_DESCRIPTION")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
