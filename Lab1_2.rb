def cmp_numb(fst, scd)
	vl = 20
	if((fst == vl) || (scd == vl))
		return vl
	else return (fst + scd)
	end
end

print 'Введите первое число: '
fst = gets.to_i
print 'Введите второе число: '
scd = gets.to_i

puts "Результат: #{cmp_numb(fst, scd)}"
