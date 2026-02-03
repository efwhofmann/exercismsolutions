def find(list, value):
    high = len(list)-1
    low = 0
    while low<=high:
        mid = (high + low)//2
        if list[mid]==value:
            return mid
        low, high =  (mid+1, high) if list[mid]<value else (low, mid-1)
    raise ValueError("value not in array")
        
    
