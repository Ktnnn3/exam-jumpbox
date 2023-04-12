def split_the_bill(group):
    total_spent = sum(group.values())
    n = len(group)
    avg = round(total_spent / n, 2)
    return {name: round(spent - avg, 2) for name, spent in group.items()}

group = {'A': 20, 'B': 15, 'C': 10}
result = split_the_bill(group)
print(result)  # {'A': 5.0, 'B': 0.0, 'C': -5.0}
