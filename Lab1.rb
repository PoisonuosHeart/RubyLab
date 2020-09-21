def show_message(age, name, sername)
 if(age != nil)
    print "Привет, #{name.chomp} #{sername.chomp}. "
    if(age.to_i < 18)
      puts 'Тебе меньше 18 лет, но начать учиться программировать никогда не поздно'
    else 
      puts 'Самое время заняться делом!'
    end
 else puts 'Error! Wrong parametr'
 end
end

def input(message)
  print "Введи #{message}: "
  return  gets	
end

$name = input('имя')
$sername = input('фамилия')
$age = input('возраст')

show_message($age, $name, $sername)

