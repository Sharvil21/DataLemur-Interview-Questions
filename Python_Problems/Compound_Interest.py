def compound_interest(principal, rate, contribution, years):
    for i in range(1,years+1):
      principal = principal + (1.0*principal*rate/100) + contribution
    
    return round(principal,2)
