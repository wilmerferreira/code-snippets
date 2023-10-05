########################################################################################################################################
# The sum of the squares of the first ten natural numbers is,                                                                          #
#                                                                                                                                      #                                                                           #
# 1² + 2² + ... + 10² = 385                                                                                                            #
# The square of the sum of the first ten natural numbers is,                                                                           #
#                                                                                                                                      #                                                                           #
# (1 + 2 + ... + 10)² = 55² = 3025                                                                                                     #
# Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 − 385 = 2640. #
#                                                                                                                                      #
# Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.               #
########################################################################################################################################

def solve_problem (number_from = 1, number_to = 10):
  numbers=[]
  
  for n in range(number_from, number_to + 1):
    numbers.append(n)

  sum_of_squares = 0
  square_of_sum = 0

  for n in numbers:
    sum_of_squares += n ** 2
    square_of_sum += n

  square_of_sum **= 2

  # print(numbers)
  # print(sum_of_squares)
  # print(square_of_sum)

  print(square_of_sum - sum_of_squares)

solve_problem(number_to = 100)
