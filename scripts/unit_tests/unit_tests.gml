// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function unittest_str_(tests){
//@Formats unit tests to be more readable
//@param {array} Unit test results
//	format :[i,0] = 'Unit name', [i,1] = result, [i, 2] = expected result
//@return {string} Readable output of unit tests
output = ""
	for (i = 0; i < array_length(tests); ++i){
		output += tests[i, 0] + ": "
		if (tests[i, 1] == tests[i, 2]){
			output += "PASS	   Expected: " + string(tests[i, 2]) + "   Got: " + string(tests[i, 1])
		} else {
			output += "FAIL	   Expected: " + string(tests[i, 2]) + "   Got: " + string(tests[i, 1])
		}
		output += "\n"
	}
	return(output)
}
function unit_tests(){
	results = array_next_high_unitTest();
	show_debug_message(unittest_str_(results))
}

function array_next_high_unitTest(){
	var i = 0
	var testIntegers = [1,2,3,4,5]
	var testFloat = [1.1,2.2,3.3,4.4,5.5]
	var testOneElement = [10]
	testResults[i, 0] = "Integers"
	testResults[i, 1] = array_next_high(testIntegers, 3)
	testResults[i, 2] = 4
	i++
	testResults[i, 0] = "Integers"
	testResults[i, 1] = array_next_high(testIntegers, 0)
	testResults[i, 2] = 1
	i++
	testResults[i, 0] = "Float"
	testResults[i, 1] = array_next_high(testFloat, 3)
	testResults[i, 2] = 3.3
	i++
	testResults[i, 0] = "Single"
	testResults[i, 1] = array_next_high(testOneElement, 3)
	testResults[i, 2] = 10
	return(testResults)
}
