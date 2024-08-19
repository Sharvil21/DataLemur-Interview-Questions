import re

def isPalindrome(phrase):
  return re.sub('[^A-Za-z0-9]+', '', phrase).lower()[::-1] == re.sub('[^A-Za-z0-9]+', '', phrase).lower()

