CONST_START_BALANCE = 100.0 #Дефолтное значение денег экземпляра класса CashMachine

class CashMachine
    attr_reader :money, :my_deposit
    def initialize
        @@my_deposit ||= rand(0.0 .. 999.99).floor(2) #Одна сумма для всех экземпляров этого класса. Каждый берет из n(которое для всех общее)
    end
    def deposit # Действие при выборе пользователем D
            puts "Available deposit: #{@@my_deposit}"
            loop do
                print 'Enter how money need: '
                new_d = gets.to_f
                if ((new_d <= @@my_deposit) && (new_d >= 0))
                    @@my_deposit = @@my_deposit - new_d
                    @money += new_d
                    break
                end
                puts "Error! Please try input value >= 0. You input now: #{new_d}"
            end
        end
        
        def withdraw # Действие при выборе пользователем W
            loop do
                print 'Enter how @money need: '
                _money = gets.to_f
                if ((_@money <= @money) && (_@money > 0))
                    @money -= _money
                else puts "Error! You don`t have enough @money! Input correct value"
                end
            end
        end
        
        def balance # Действие при выборе пользователем В
            puts "Balance: #{@money}"
        end
        
        def err(ch) # Действие в случае ошибки
            puts "You input encorrect value: #{ch}\nPlease try again\n"
        end
        
        
        def menu
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
                    self.deposit
                when 'W'
                    self.withdraw
                when 'B'
                    self.balance
                when 'Q'
                    break
                else self.err(ch)
                end
        
                if ch == 'Q'
                    break
                end
            end
        end
        
        def init
            f_name = "balance.txt"
            if(File.exists?(f_name))
                f = File.open(f_name, "r+")
                @money = f.read
                if(@money.empty?)
                    @money = CONST_START_BALANCE
                else 
                    @money = @money.to_f
                end
            else 
                f = File.open(f_name, "w")
            end
            f.close
            self.menu# Результат работы пользователя
            # Обновляем файл
            new_f = File.open("tmpScrpt2.txt", "w")
            new_f.write(@money.to_s)
            new_f.close
            File.delete(f_name)
            File.rename("tmpScrpt2.txt", f_name)    
        end
end

bank = CashMachine.new
bank.init