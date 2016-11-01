# arr = ["a", "b"]
#         r_array = []
#         i = -1
#         arr.each do
#             r_array << arr[i]
#             i -= 1
#         end
# puts r_array

arr = [1, 2, 2, 2, 3]
        i = -1
        counter = 0
        arr.each do |i|
             if arr[i] == arr[i-1]
                counter = i
             end
        end
puts counter