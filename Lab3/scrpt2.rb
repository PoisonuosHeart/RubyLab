CONST_START_BALANCE = 100.0
$my_deposit = rand(0.0 .. 999.99).floor(2)

def deposit(money) # Действие при выборе пользователем D
    puts "Available deposit: #{$my_deposit}"
    print 'Enter how money need: '
    new_d = gets.to_f
    if new_d <= $my_deposit
        $my_deposit = $my_deposit - new_d
        return money + new_d
    else return money
    end
end

def withdraw(money) # Действие при выборе пользователем W
    loop do
        print 'Enter how money need: '
        _money = gets.to_f
        if ((_money <= money) && (_money > 0))
            return money - _money
        else puts "Error! You don`t have enough money! Input correct value"
        end
    end
end

def balance(money) # Действие при выборе пользователем В
    puts "Balance: #{money}"
end

def err(ch) # Действие в случае ошибки
    puts "You input encorrect value: #{ch}\nPlease try again\n"
end


def menu(money)
    ch = nil
    loop do
    print "D - deposit; W - withdraw\nB - balance; Q - quit\nEnter: "
        ch = gets.to_s
        ch = ch[0]
        if ch >= 'a'
            ch = ch.ord - 32
            ch = ch.chr
        end

        case ch
        when 'D'
            money = deposit(money)
        when 'W'
            money = withdraw(money)
        when 'B'
            balance(money)
        when 'Q'
            break
        else err(ch)
        end

        if ch == 'Q'
            break
        end
    end
    return money
end

def main
    f_name = "balance.txt"
    money = CONST_START_BALANCE
    if(File.exists?(f_name))
        f = File.open(f_name, "r+")
        money = f.read
        if(money.empty?)
            money = CONST_START_BALANCE
        else 
            money = money.to_f
        end
    else 
        f = File.open(f_name, "w")
    end
    f.close
    money = menu(money) # Результат работы пользователя
    # Обновляем файл
    new_f = File.open("tmpScrpt2.txt", "w")
    new_f.write(money.to_s)
    new_f.close
    File.delete(f_name)
    File.rename("tmpScrpt2.txt", f_name)    
end

main