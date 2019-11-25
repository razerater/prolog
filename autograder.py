import sys
import math

'''
    Part 1: 
    The 4 elements who's pairwise products are one less than
    a perfect square.

    Input: N/A
    Output: out0.txt
'''
def test_0():
    score = 0
    output = file_to_str('out0.txt')
    int_arr = str_to_nums(output)
    count = 5
    for i in range(0, len(int_arr)):
        for j in range(i+1, len(int_arr)):
            if not is_perfect_square((int_arr[i] * int_arr[j]) + 1):
                count = count - 1
    if count < 0:
        count = 0
    score = count * 4
    return score

'''
    Part 2:
    An invalid string

    Input: in1.txt
    Output: out1.txt
'''
def test_1():
    global points_per_test

    score = 0
    output = file_to_str('out1.txt')
    if output.strip() == 'Invalid String':
        score = score + points_per_test
    return score


'''
    Part 2:
    An Invalid string

    Input: in2.txt
    Output: out2.txt
'''
def test_2():
    global points_per_test

    score = 0
    output = file_to_str('out2.txt')
    if output.strip() == 'Invalid String':
        score = score + points_per_test
    return score

'''
    Part 2:
    Impossible constraints

    Input: in3.txt
    Output: out3.txt
'''
def test_3():
    global points_per_test

    score = 0
    output = file_to_str('out3.txt')
    if output.strip() == 'No Solution':
        score = score + points_per_test
    return score

'''
    Part 2:
    2 even integers that sum to 6

    Input: in4.txt
    Output: out4.txt
'''
def test_4():
    global points_per_test

    output = file_to_str('out4.txt')
    int_arr = str_to_nums(output)
    score = allot_points(int_arr, points_per_test, 2, 0, 'sum', 6)
    return score

'''
    Part 2:
    3 odd integers that sum to 8
    No Solution

    Input: in5.txt
    Output: out5.txt
'''
def test_5():
    global points_per_test

    score = 0
    output = file_to_str('out5.txt')
    if output.strip() == 'No Solution':
        score = score + points_per_test
    return score

'''
    Part 2:
    2 even and 2 odd integers that sum to 26

    Input: in6.txt
    Output: out6.txt
'''
def test_6():
    global points_per_test

    output = file_to_str('out6.txt')
    int_arr = str_to_nums(output)
    score = allot_points(int_arr, points_per_test, 2, 2, 'sum', 26)
    return score

'''
    Part 2:
    3 even integers that multiply to 3840

    Input: in7.txt
    Output: out7.txt
'''
def test_7():
    global points_per_test

    output = file_to_str('out7.txt')
    int_arr = str_to_nums(output)
    score = allot_points(int_arr, points_per_test, 3, 0, 'multiply', 64)
    return score

'''
    Part 2:
    4 odd integers that multiply to 945

    Input: in8.txt
    Output: out8.txt
'''
def test_8():
    global points_per_test

    output = file_to_str('out8.txt')
    int_arr = str_to_nums(output)
    score = allot_points(int_arr, points_per_test, 0, 4, 'multiply', 945)
    return score

'''
    Part 2:
    3 even and 2 odd integers that multiply to 0

    Input: in9.txt
    Output: out9.txt
'''
def test_9():
    global points_per_test

    output = file_to_str('out9.txt')
    int_arr = str_to_nums(output)
    score = allot_points(int_arr, points_per_test, 3, 2, 'multiply', 0)
    return score

'''
    Part 2:
    Invalid String

    Input: in10.txt
    Output: out10.txt
'''
def test_10():
    global points_per_test

    score = 0
    output = file_to_str('out10.txt')
    if output.strip() == 'Invalid String':
        score = score + points_per_test
    return score
    return score

def file_to_str(filename):
    fp = open(filename, 'r')
    line = fp.readline()
    fp.close()
    return line

def allot_points(int_arr, points, target_even, target_odd, op, target_accum):
    score = points
    num_even = count_parity(int_arr, 'even')
    evenGood = (num_even == target_even)
    if not evenGood:
        score = score - 1.5

    num_odd = count_parity(int_arr, 'odd')
    oddGood = (num_odd == target_odd)

    if not oddGood:
        score = score - 1.5
    

    opGood = check_op(int_arr, target_accum, op)
    if not opGood:
        score = score - 4

    return score

def str_to_nums(input_str):
    try:
        str_arr = input_str.strip().split(',')
        int_arr = list(map(int, str_arr))
    except ValueError:
        print 0
        sys.exit()

    return int_arr

def count_parity(int_arr, parity):
    if parity == 'even':
        return len(list(filter(lambda x: x % 2 == 0, int_arr)))
    else:
        return len(list(filter(lambda x: x % 2 == 1, int_arr)))

def check_op(int_arr, target, op):
    if op == 'sum':
        acc = 0
        for i in range(0, len(int_arr)):
            acc = acc + int_arr[i]
        return acc == target
    else:
        acc = 1
        for i in range(0, len(int_arr)):
            acc = acc * int_arr[i]
        return acc == target 

def is_perfect_square(n):
    root = int(math.sqrt(n))
    return root**2 == n


# Useful Globals
part_1_points = 20
part_2_points = 70
part_2_tests = 10
points_per_test = part_2_points / part_2_tests

if __name__ == "__main__":
    test_num = int(sys.argv[1])
    if test_num == 0:
        print(test_0())
    elif test_num == 1:
        print(test_1())
    elif test_num == 2:
        print(test_2())
    elif test_num == 3:
        print(test_3())
    elif test_num == 4:
        print(test_4())
    elif test_num == 5:
        print(test_5())
    elif test_num == 6:
        print(test_6())
    elif test_num == 7:
        print(test_7())
    elif test_num == 8:
        print(test_8())
    elif test_num == 9:
        print(test_9())
    elif test_num == 10:
        print(test_10())
    else:
        print("Arg needs to be 0-10")
