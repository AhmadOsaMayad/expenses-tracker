abstract class DateHelpers {
	/// Accepts DateTime or String values.
	///
	/// Supported string formats include:
	/// - 2026/05/01 09:38 PM
	/// - ISO-8601 strings parsable by DateTime.parse
	static DateTime toDateTime(dynamic value) {
		if (value is DateTime) return value;

		if (value is String) {
			final text = value.trim();
			if (text.isEmpty) {
				throw const FormatException('Empty date/time string');
			}

			// Try native parser first (ISO-like values).
			try {
				return DateTime.parse(text);
			} catch (_) {
				// Continue to custom parser below.
			}

			// Supports: yyyy/MM/dd hh:mm AM|PM
			final regExp = RegExp(
				r'^(\d{4})\/(\d{1,2})\/(\d{1,2})\s+(\d{1,2}):(\d{2})\s*([AaPp][Mm])$',
			);
			final match = regExp.firstMatch(text);
			if (match != null) {
				final year = int.parse(match.group(1)!);
				final month = int.parse(match.group(2)!);
				final day = int.parse(match.group(3)!);
				var hour = int.parse(match.group(4)!);
				final minute = int.parse(match.group(5)!);
				final period = match.group(6)!.toUpperCase();

				if (hour < 1 || hour > 12) {
					throw const FormatException('Hour must be between 1 and 12 for AM/PM format');
				}

				if (period == 'AM') {
					if (hour == 12) hour = 0;
				} else {
					if (hour != 12) hour += 12;
				}

				return DateTime(year, month, day, hour, minute);
			}
		}

		throw FormatException('Unsupported date/time value: $value');
	}

	/// Returns value as: yyyy/MM/dd hh:mm AM|PM
	static String toDateTimeString(dynamic value) {
		final dateTime = toDateTime(value);
		final year = dateTime.year.toString().padLeft(4, '0');
		final month = dateTime.month.toString().padLeft(2, '0');
		final day = dateTime.day.toString().padLeft(2, '0');

		final period = dateTime.hour >= 12 ? 'PM' : 'AM';
		var hour12 = dateTime.hour % 12;
		if (hour12 == 0) hour12 = 12;
		final hour = hour12.toString().padLeft(2, '0');
		final minute = dateTime.minute.toString().padLeft(2, '0');

		return '$year/$month/$day $hour:$minute $period';
	}

	/// Returns only date as: yyyy/MM/dd
	static String toDateString(dynamic value) {
		final dateTime = toDateTime(value);
		final year = dateTime.year.toString().padLeft(4, '0');
		final month = dateTime.month.toString().padLeft(2, '0');
		final day = dateTime.day.toString().padLeft(2, '0');
		return '$year/$month/$day';
	}

	/// Returns only time as: hh:mm AM|PM
	static String toTimeString(dynamic value) {
		final dateTime = toDateTime(value);
		final period = dateTime.hour >= 12 ? 'PM' : 'AM';
		var hour12 = dateTime.hour % 12;
		if (hour12 == 0) hour12 = 12;
		final hour = hour12.toString().padLeft(2, '0');
		final minute = dateTime.minute.toString().padLeft(2, '0');
		return '$hour:$minute $period';
	}
}