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
        # i = 0
        # while i < self.length
        #     j = 0
        #     while j < args.length + 1
        #         if self[i] != nil
        #             result[i][j] = self[i]
        #         end
        #         j += 1
        #         args.each do |subarray|
        #             if subarray[i] != nil
        #                 result[i][j] = subarray[i]
        #             end
        #         end
        #         j += 1
        #     end
        #     i += 1
        # end
        result
    end
end

a = [ 4, 5, 6 ]
b = [ 7, 8, 9 ]
p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

c = [10, 11, 12]
d = [13, 14, 15]
p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]