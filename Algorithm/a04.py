def fibonacci(n):
    if n <= 1:
        return n
    else:
        return fibonacci(n-1) + fibonacci(n-2)

n = int(input("Enter a number: "))
print("Fibonacci number at index", n, "is", fibonacci(n))

#Enter a number: 2
#Fibonacci number at index 2 is 1

# Enter a number: 9
# Fibonacci number at index 9 is 34