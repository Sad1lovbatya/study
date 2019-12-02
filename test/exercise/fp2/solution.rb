module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      
      def my_each
       index = 0 
       while index < self.length
        yield self[index]
        index += 1
        end
        self
      end
      
     
      # Написать свою функцию my_map
      def my_map
        array =  MyArray.new
        my_each {|element| array << yield(element)}
        array
      end

      # Написать свою функцию my_compact
      def my_compact
        array = MyArray.new
        my_each {|element| array << element if element != nil}
        array
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil)
        my_each { |element| acc.nil? ? acc = element : acc = yield(acc, element) }
        acc
      end
    end
  end
end
