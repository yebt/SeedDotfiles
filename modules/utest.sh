#!/bin/bash

# Initialize counters for tests
TESTS_PASSED=0
TESTS_FAILED=0

# Function to log a success
function test_passed() {
	echo -e "${FG_GRN}${F_BLD}[✔]${NC} $1"
	TESTS_PASSED=$((TESTS_PASSED + 1))
}

# Function to log a failure
function test_failed() {
	echo -e "${FG_RD}${F_BLD}[✘]${NC} $1"
	TESTS_FAILED=$((TESTS_FAILED + 1))
}

# Assert that two values are equal
function assert_equals() {
	if [ "$1" == "$2" ]; then
		test_passed "$3"
	else
		test_failed "$3 - Expected '$2' but got '$1'"
	fi
}

# Summary of results
function test_summary() {
	echo
	echo -e " > ${FG_CYN}${F_TLC}Tests passed:${NC} $TESTS_PASSED"
	echo -e " > ${FG_RNG}${F_TLC}Tests failed:${NC} $TESTS_FAILED"
	if [ $TESTS_FAILED -eq 0 ]; then
		echo
		echo -e "${F_TLC}All tests passed! 🎉 ${NC}"
	else
		echo
		echo -e "${F_TLC}Some tests failed.${NC}"
	fi
}

# Reset the counters before starting a new test suite
function test_reset() {
	TESTS_PASSED=0
	TESTS_FAILED=0
}
