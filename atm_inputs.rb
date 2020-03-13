require 'colorize'
require 'tty-prompt'
require 'tty-spinner'
require 'tty-progressbar'

#This class will take user inputs and check if they're valid inputs
# The valid inputs are 1, 2, 3, 4 if not, will show a message
# Will no accept negative numbers
class UserInput
    def initialize
        @display = Messages.new
        @spinner = TTY::Spinner.new("[:spinner] Loading ...", format: :pulse_2) # Initializes our spinner
    end

    def get_amount(selected_option)
       
        puts "------------------------------------------------".colorize(:blue)
        puts "How much would you like to #{selected_option}?"
        
        amount = gets.chomp.to_i 

        # Shows progress bar during deposit and withdrawal
        bar = TTY::ProgressBar.new("Processing [:bar]".colorize(:yellow), total: 12)
          12.times do
          sleep(0.1)
          bar.advance(1)
        end

        if check_value?(amount)
            return amount 
        else
            @display.display_error
        end
        @display.display_goodbye
    end

    def get_options
        option_list = gets.chomp.to_i
        valid_options = [1, 2, 3, 4]
    
        @spinner.auto_spin
        sleep(0.5)
        @spinner.stop('')

        if valid_options.include?(option_list)
            return option_list 
        else
            @display.display_error
        end
    end


    def check_value?(amount)
        if amount > 0 
            return true
        end
    end
end

#This class will show the display messages for the user to interact
class Messages
    def initialize
        @prompt = TTY::Prompt.new # Initializes prompt
    end

    def display_welcome
        puts "    -------------------------------"
        puts "      Welcome to your Nearest ATM".colorize(:green)
        puts "    --------------------------------"
    end

    def show_menu
        @prompt.enum_select("How may we assist you today? Please select from the following options:",
             %w(Deposit Withdraw Balance Exit))
    end
   
    def get_name(name)

        puts "Hello, #{name}"
    end

    def verify_deposit(deposit_amount)
     
        puts "Request recieved. $ #{deposit_amount} will added to your account".colorize(:green)
    end

    def verify_withdraw(withdrawal_amount)
        puts "Request recieved. $ #{withdrawal_amount} will be withdrawn from your account".colorize(:green)
    end

    def exceed_withdrawal
       
        puts "You cannot withdraw more than your balance.".colorize(:red)
    end

    def display_goodbye()
        puts "Goodbye...".colorize(:yellow)
    end

    def display_error
        puts "Invalid Input.".colorize(:red)
    end
    
    def show_balance(balance)
        puts "Your current balance is $ #{balance}.".colorize(:cyan)

    end

    
end