require 'date'
class Platform
    def find_platform(arv,dep,n)
        convert_time(arv)
        convert_time(dep)
        arv.sort!
        dep.sort!
        platform = 1
        result = 1
        i = 1
        j = 0
        while i < n && j < n
            if arv[i] < dep[j]
                platform += 1
                i += 1

                if platform > result
                    result = platform
                end    
            else
                platform -= 1
                j += 1
            end    
        end
        return result
    end

    private

    def convert_time(arr)
        arr.each_with_index do |value,index|
            if dt = DateTime.parse(value) rescue false 
                seconds = dt.hour * 3600 + dt.min * 60
                arr[index] = seconds.to_i
            end
        end
        return arr.map(&:to_i)
    end
end


arv = []
dep = []
puts "Enter number of flights"
f = gets.chomp
f = f.to_i
n = f.to_i
while f > 0
    puts "Enter arrival time"
    a = gets.chomp
    arv.push(a)
    puts "Enter departure time"
    b = gets.chomp
    dep.push(b)
    f -= 1
end
obj = Platform.new
puts(obj.find_platform(arv,dep,n))
