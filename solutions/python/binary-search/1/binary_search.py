def find(search_list, value):
    A = search_list
    high = len(A)-1
    low = 0
    while low<=high:
        mid = (high + low)//2
        if A[mid]<value:
            low = mid + 1
        elif A[mid]==value:
            return mid
        elif A[mid]>value:
            high = mid-1
    raise ValueError("value not in array")
        
    
