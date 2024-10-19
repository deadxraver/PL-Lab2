import subprocess
import unittest

class TestDictionary(unittest.TestCase):
    def run_program(self, input_data):
        path = './main'
        result = subprocess.run([path], input=input_data, text=True, capture_output=True)
        return result.stdout, result.stderr


    def test_first(self):
        input_data = 'first word'
        expected_out = 'pervoye slovo omg'
        expected_err = ""
        output, error = self.run_program(input_data)
        self.assertEqual(output.strip(), expected_out)
        self.assertEqual(error.strip(), expected_err)
	
	
    def test_last(self):
        input_data = 'last'
        expected_out = 'Last word in the dictionary'
        expected_err = ''
        output, error = self.run_program(input_data)
        self.assertEqual(output.strip(), expected_out)
        self.assertEqual(error.strip(), expected_err)        
    	
    	
    def test_test(self):
        input_data = 'test'
        expected_out = 'testtesttesttest test test'
        expected_err = ""
        output, error = self.run_program(input_data)
        self.assertEqual(output.strip(), expected_out)
        self.assertEqual(error.strip(), expected_err)

	
    def test_nothing(self):
        input_data = 'nothing'
        expected_out = ''
        expected_err = ""
        output, error = self.run_program(input_data)
        self.assertEqual(output.strip(), expected_out)
        self.assertEqual(error.strip(), expected_err)        	 
        	   

    def test_no_match(self):
        input_data = 'second'
        expected_out = ''
        expected_err = 'there is no such word'
        output, error = self.run_program(input_data)
        self.assertEqual(output.strip(), expected_out)
        self.assertEqual(error.strip(), expected_err) 


    def test_of_err(self):
        input_data = '0' * 256
        expected_out = ''
        expected_err = 'string cannot be greater than 255 bytes'
        output, error = self.run_program(input_data)
        self.assertEqual(output.strip(), expected_out)
        self.assertEqual(error.strip(), expected_err)         	


    def test_long(self):
        input_data = 'a' * 255
        expected_out = 'ok'
        expected_err = ''
        output, error = self.run_program(input_data)
        self.assertEqual(output.strip(), expected_out)
        self.assertEqual(error.strip(), expected_err)


    
if __name__ == '__main__':
    unittest.main()
