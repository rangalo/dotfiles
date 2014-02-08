class Abc 
    def x 
        "method" 
    end 
    
    def getx 
        puts x 
        x = "variable" if false 
        puts x 
        x = "variable" 
        puts x 
    end 
    test = Abc.new 
    test.getx 
end
