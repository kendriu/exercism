
def is_leap_year(year):
    if not year % 400 or not year % 4 and year % 100:
        return True
    return False
