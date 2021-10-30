pragma solidity ^0.8.0;

/**
    Reference: https://github.com/pipermerriam/ethereum-datetime/blob/master/contracts/DateTime.sol
    Functions have been purged to whatever is required.
    Changed year type from `uint16` to `uint`. Wanted to support almost infinite time. :)
    Don't see any audits for this. Have done basic review.
 */
contract DateTime {

        uint constant YEAR_IN_SECONDS = 31536000;
        uint constant LEAP_YEAR_IN_SECONDS = 31622400;
        uint constant ORIGIN_YEAR = 1970;

        function isLeapYear(uint year) public pure returns (bool) {
                if (year % 4 != 0) {
                        return false;
                }
                if (year % 100 != 0) {
                        return true;
                }
                if (year % 400 != 0) {
                        return false;
                }
                return true;
        }

        function leapYearsBefore(uint year) public pure returns (uint) {
                year -= 1;
                return year / 4 - year / 100 + year / 400;
        }

        function getYear(uint timestamp) public pure returns (uint) {
                uint secondsAccountedFor = 0;
                uint year;
                uint numLeapYears;

                // Year
                year = ORIGIN_YEAR + timestamp / YEAR_IN_SECONDS;
                numLeapYears = leapYearsBefore(year) - leapYearsBefore(ORIGIN_YEAR);

                secondsAccountedFor += LEAP_YEAR_IN_SECONDS * numLeapYears;
                secondsAccountedFor += YEAR_IN_SECONDS * (year - ORIGIN_YEAR - numLeapYears);

                while (secondsAccountedFor > timestamp) {
                        if (isLeapYear(year - 1)) {
                                secondsAccountedFor -= LEAP_YEAR_IN_SECONDS;
                        }
                        else {
                                secondsAccountedFor -= YEAR_IN_SECONDS;
                        }
                        year -= 1;
                }
                return year;
        }

}