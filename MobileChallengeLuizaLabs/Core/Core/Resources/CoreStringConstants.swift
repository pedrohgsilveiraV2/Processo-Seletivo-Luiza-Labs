// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// Could not use URL as Response
  internal static let badUrlDescription = L10n.tr("Core", "BAD_URL_DESCRIPTION")
  /// Not Modified
  internal static let notModifiedDescription = L10n.tr("Core", "NOT_MODIFIED_DESCRIPTION")
  /// Service Unavailable
  internal static let serviceUnavailableDescription = L10n.tr("Core", "SERVICE_UNAVAILABLE_DESCRIPTION")
  /// undefined error
  internal static let undefinedDescription = L10n.tr("Core", "UNDEFINED_DESCRIPTION")
  /// Unprocessable Entity
  internal static let validationFailedDescription = L10n.tr("Core", "VALIDATION_FAILED_DESCRIPTION")
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
