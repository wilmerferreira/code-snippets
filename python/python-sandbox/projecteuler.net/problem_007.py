########################################################################################################
# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13. #
# What is the 10001st prime number?                                                                   #
########################################################################################################

def is_prime(number):
  if number == 1:
    return True

  if number == 2:
    return False

  count = 2

  while count < number:
    if number % count == 0:
      return False
    count += 1

  return True

def solve_problem(ordinal_number):
  current_number = 1
  prime_count = 0

  while prime_count < ordinal_number:
    if is_prime(current_number) == True:
      prime_count += 1
      print(str(prime_count) + ': ' + str(current_number))

    current_number += 1

solve_problem(10001)