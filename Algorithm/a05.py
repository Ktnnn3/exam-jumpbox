def is_palindrome(s):
    return s == s[::-1]

# def is_palindrome(s):
#     n = len(s)
#     mid = n // 2
#     print('mid',mid)
#     if n % 2 == 0:
#         # print("s[:mid]", s[:mid])
#         # print('s[mid:][::-1]',s[mid:][::-1])
#         return s[:mid] == s[mid:][::-1]
#     else:
#         # print("s[:mid]", s[:mid])
#         # print("s[:mid]", s[:mid+1])
#         # print('s[mid:][::-1]',s[mid+1:][::-1])
#         return s[:mid] == s[mid+1:][::-1]

print(is_palindrome('abba'))  # True
print(is_palindrome('abbc'))  # False
print(is_palindrome('racecar'))  # True
print(is_palindrome('12321'))  # True
# print(is_palindrome('15651'))  # True
