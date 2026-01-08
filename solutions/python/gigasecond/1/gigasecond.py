from datetime import timedelta, datetime

def add(moment):
    gigasec = timedelta(seconds=1_000_000_000)
    return moment+gigasec
