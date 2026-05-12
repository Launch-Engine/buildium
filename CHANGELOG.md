## [Unreleased]

## [0.15.0] - 2026-04-06

### Changed
- `Buildium::BuildiumError` now inherits from `StandardError` so it can be
  raised directly (`raise buildium_result if buildium_result.is_a?(Buildium::BuildiumError)`).
- `BuildiumError#message` now combines the top-line `user_message` with the
  field-level entries from the `Errors` array in the Buildium response. Previously
  the field-level details were parsed into `#errors` but never surfaced when
  consumers raised or logged `#error` alone, producing unhelpful messages like
  `"The request failed validation. Update your request based on the validation
  error message(s) and resubmit."`

### Fixed
- `@error_code` was being assigned to a misnamed `@error_message` ivar in the
  initializer and was therefore unreadable through `attr_reader :error_code`.

## [0.1.0] - 2021-06-11

- Initial release
