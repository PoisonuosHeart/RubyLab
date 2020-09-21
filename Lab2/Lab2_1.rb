def inputPockemon
  print 'Введи кол-во покемонов: '
  n = gets.to_i
  i = 0
  pk_arr = {} #Массив покемонов
  while(i < n)
    print 'Введт имя покемона:3 : '
    pk_name = gets
    print 'Введт цвет покемона:3 : '
    pk_color = gets
    pk_arr.merge!({pk_name => pk_color})
    i += 1
  end
  return pk_arr
end

def outputPockemon(pk_arr)
   pk_arr.each_with_index{|val, index| puts "Покемон: #{index} #{val} цвета:-)"}
end

pk_arr = inputPockemon
outputPockemon(pk_arr)

