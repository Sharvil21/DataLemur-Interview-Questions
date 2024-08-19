def intersection(a, b):
  empty = []
  for i in a:
    if i in b:
      empty.append(i)
  return empty

