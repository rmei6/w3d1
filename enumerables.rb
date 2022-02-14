require "byebug"
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
        arr = []
        self.each do |ele|
            if !ele.is_a?(Array)
                arr += [ele]
            else
                arr += ele.my_flatten
            end
        end
        return arr
    end

    def my_zip(*args)
        result = Array.new(self.length){Array.new(args.length+1)}
        
    end

    

end