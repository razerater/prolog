# Part 1
swipl -q -f part_1.pl -t main > out0.txt
python autograder.py 0

# Part 2
# Test 1
in=$(cat in1.txt)
swipl -q -f part_2.pl -t main "$in" > out1.txt
python autograder.py 1

# Test 2
in=$(cat in2.txt)
swipl -q -f part_2.pl -t main "$in" > out2.txt
python autograder.py 2

# Test 3
in=$(cat in3.txt)
swipl -q -f part_2.pl -t main "$in" > out3.txt
python autograder.py 3

# Test 4
in=$(cat in4.txt)
swipl -q -f part_2.pl -t main "$in" > out4.txt
python autograder.py 4

# Test 5
in=$(cat in5.txt)
swipl -q -f part_2.pl -t main "$in" > out5.txt
python autograder.py 5

# Test 6
in=$(cat in6.txt)
swipl -q -f part_2.pl -t main "$in" > out6.txt
python autograder.py 6

# Test 7
in=$(cat in7.txt)
swipl -q -f part_2.pl -t main "$in" > out7.txt
python autograder.py 7

# Test 8
in=$(cat in8.txt)
swipl -q -f part_2.pl -t main "$in" > out8.txt
python autograder.py 8

# Test 9
in=$(cat in9.txt)
swipl -q -f part_2.pl -t main "$in" > out9.txt
python autograder.py 9

# Test 10
in=$(cat in10.txt)
swipl -q -f part_2.pl -t main "$in" > out10.txt
python autograder.py 10


