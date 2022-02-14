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
        result = Array.new(self.length){Array.new(0)}
        self.each.with_index {|ele, i| result[i] << ele}
        args.each do |subarr|
            subarr.each.with_index {|ele, i| result[i] << ele if i < self.length}
        end
        result.each do |subarr|
            while subarr.length < self.length
                subarr << nil
            end
        end
        return result
    end

    def my_rotate(num=1)
        arr = self.map {|ele| ele}
        return self if num == 0
        if num > 0
            num.times do arr.push(arr.shift())
            end
        else
            (-num).times do arr.unshift(arr.pop())
            end
        end 
        return arr
    end

    def my_join(str="")
        new_str = ""
        (0...self.length-1).each do |i|
            new_str+=self[i]+str
        end
        new_str+=self[-1]
        return new_str
    end

    def my_reverse
        arr = []
        self.each {|ele| arr.unshift(ele)}
        return arr
    end

    
end


