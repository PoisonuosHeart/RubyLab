def csWord(word)
	if((word[-3] + word[-2]) == "cs")
		return 2 ** (word.size - 1)
	else return (word.chop).reverse
	end
end

print 'Введите слово: '
word = gets.to_s
puts "Результат работы: #{csWord(word)}" 

