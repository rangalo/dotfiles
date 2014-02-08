class Result 
    def values 
        a, b, c = false, nil, 5 
        a ||= 1 
        b ||= 2 
        c ||= 3 
        puts a, b, c 
    end 
end
test = Result.new
test.values
