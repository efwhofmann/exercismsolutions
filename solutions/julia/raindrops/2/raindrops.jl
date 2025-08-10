function raindrops(number)
    str = ""
    number % 3 == 0 && (str *="Pling")
    number % 5 == 0 && (str *="Plang")
    number % 7 == 0 && (str *="Plong")
    length(str) == 0 ? "$number" : str
end
