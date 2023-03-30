use flutter_data_types::PinError;

// The expected length of the pin code
const EXACT_LENGTH: usize = 6;
// The minimum number of unique digits
const MIN_UNIQUE_DIGITS: usize = 2;
// The radix used to parse a digit, 10 for decimal (16 for hexadecimal)
const RADIX: usize = 10;

/// This function will check whether the pin has a valid length.
fn pin_length_should_be_correct(pin: &str) -> Result<(), PinError> {
    if pin.len() != EXACT_LENGTH {
        Err(PinError::InvalidLength)
    } else {
        Ok(())
    }
}

/// This function will convert a pin to a vector of digits.
/// It will return an error when non-digits are detected.
fn parse_pin_to_digits(pin: &str) -> Result<Vec<u8>, PinError> {
    let digit_options: Vec<Option<u32>> = pin.chars().map(|c| c.to_digit(RADIX as u32)).collect();
    if digit_options.iter().any(|c| c.is_none()) {
        Err(PinError::NonDigits)
    } else {
        let digits: Vec<u8> = digit_options.into_iter().map(|c| c.unwrap() as u8).collect();
        Ok(digits)
    }
}

/// This function will check whether there are enough unique digits.
// NOTE: this function will panic when the vector digits contains numbers > 9.
fn pin_should_contain_enough_unique_digits(digits: &[u8]) -> Result<(), PinError> {
    let count: [u8; RADIX] = {
        let mut count: [u8; RADIX] = [0; RADIX];
        for d in digits.iter() {
            count[(*d as usize)] += 1;
        }
        count
    };
    let unique_digits = count.into_iter().filter(|&d| d > 0).count();
    if unique_digits < MIN_UNIQUE_DIGITS {
        Err(PinError::TooLittleUniqueDigits)
    } else {
        Ok(())
    }
}

/// This function will check whether the pin is ascending or descending
/// by a difference of 1 without modulo.
// NOTE: the assumption here is that a pin contains at least 2 digits.
// NOTE: this function will panic when an empty vector is supplied.
fn pin_should_not_be_ascending_or_descending(digits: &[u8]) -> Result<(), PinError> {
    let mut ascending: bool = true;
    let mut descending: bool = true;
    let mut prev: i8 = digits[0] as i8;
    for &d in &digits[1..] {
        if (d as i8) != prev + 1 {
            ascending = false;
        }
        if (d as i8) != prev - 1 {
            descending = false;
        }
        prev = d as i8;
    }
    if ascending {
        Err(PinError::AscendingDigits)
    } else if descending {
        Err(PinError::DescendingDigits)
    } else {
        Ok(())
    }
}

/// This function will check whether a pin is not too simple.
pub fn validate_pin(pin: &str) -> Result<(), PinError> {
    pin_length_should_be_correct(pin)?;
    let digits = parse_pin_to_digits(pin)?;
    pin_should_contain_enough_unique_digits(&digits)?;
    pin_should_not_be_ascending_or_descending(&digits)?;
    Ok(())
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn valid_pin() {
        assert_eq!(validate_pin("024791"), Ok(()));
        assert_eq!(validate_pin("010101"), Ok(()));
        assert_eq!(validate_pin("000001"), Ok(()));
        assert_eq!(validate_pin("100000"), Ok(()));
    }

    #[test]
    fn pin_should_have_length_6() {
        assert_eq!(validate_pin("02479"), Err(PinError::InvalidLength));
        assert_eq!(validate_pin("0247913"), Err(PinError::InvalidLength));
    }

    #[test]
    fn pin_should_contain_only_digits() {
        assert_eq!(validate_pin("abcdef"), Err(PinError::NonDigits));
        assert_eq!(validate_pin("02479a"), Err(PinError::NonDigits));
    }

    #[test]
    fn pin_should_contain_at_least_2_unique_digits() {
        assert_eq!(validate_pin("000000"), Err(PinError::TooLittleUniqueDigits));
        assert_eq!(validate_pin("999999"), Err(PinError::TooLittleUniqueDigits));
    }

    #[test]
    fn pin_should_not_contain_ascending_digits() {
        assert_eq!(validate_pin("012345"), Err(PinError::AscendingDigits));
        assert_eq!(validate_pin("456789"), Err(PinError::AscendingDigits));
    }

    #[test]
    fn pin_should_not_contain_descending_digits() {
        assert_eq!(validate_pin("543210"), Err(PinError::DescendingDigits));
        assert_eq!(validate_pin("987654"), Err(PinError::DescendingDigits));
    }
}
