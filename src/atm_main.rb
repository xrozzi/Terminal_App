require_relative 'atm_inputs'
require 'colorize'


class ATMMain
	def initialize
		@display = Messages.new
		@get = UserInput.new
		@transaction = Transactions.new
		#@spinner = TTY::Spinner.new("[:spinner] Loading ...", format: :pulse_2)
	end

	def execute
		
		@display.display_welcome 
		puts "What's your name?"
		name = gets.chomp
		balance = 100 
		
		selection = gets.chomp
		

		while selection != 4 
			@display.get_name(name)
			puts ""
			@display.show_menu 
			@display.show_balance(balance)
			selection = @get.get_options
			
			case selection

				when 1
				selected_option = "deposit"
				deposit_amount = @get.get_amount(selected_option) 
            	balance = @transaction.deposit_balance(balance, deposit_amount) 
				@display.verify_deposit(deposit_amount) 
				puts "------------------------------------------------".colorize(:blue)
				@display.show_balance(balance) 
				puts "------------------------------------------------".colorize(:blue)

				when 2
				selected_option = "Withdraw"
				withdrawal_amount = @get.get_amount(selected_option)

					if balance >= withdrawal_amount 
                	balance = @transaction.withdraw_balance(balance, withdrawal_amount) 
					@display.verify_withdraw(withdrawal_amount) 
					puts "------------------------------------------------".colorize(:blue)
					@display.show_balance(balance)
					puts "------------------------------------------------".colorize(:blue)
					else
								@display.exceed_withdrawal
					end

				when 3
				puts "----------------------------------".colorize(:blue)
				@display.show_balance(balance) 
				puts "----------------------------------".colorize(:blue)

				when 4
				puts "----------------------------------".colorize(:blue)
				@display.display_goodbye

				else
					@display.display_error 
      		end
		end
	end
end



class Transactions
	def deposit_balance(balance, deposit_amount)
		balance += deposit_amount
		return balance
	end

	def withdraw_balance(balance, withdraw_amount)
		balance = balance - withdraw_amount
		return balance
	end
end

new_transaction = ATMMain.new
new_transaction.execute
