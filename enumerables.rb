class Array 
    def my_each(&prc)
        i = 0
        while i < self.length
            prc.call(self[i])
            i+=1
        end
        return self
    end

    def my_select(&prc)
        arr = []
        self.each {|ele| arr << ele if prc.call(ele) }
        return arr
    end

    def my_reject(&prc)
        return self - my_select(&prc)
    end

    def my_any?(&prc)
        self.each {|ele| return true if prc.call(ele)}
        false
    end

    def my_all?(&prc)
        self.each {|ele| return false if !prc.call(ele)}
        true
    end
    
    def my_flatten
        return [] if self.length < 1
        return self if self.length == 1 && !self[0].is_a?(Array)
        return self[0].my_flatten + self[1..-1].my_flatten
    end

    [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten

end