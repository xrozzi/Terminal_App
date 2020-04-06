# ATM terminal App

# Sotware Development Plan

## Purpose
The purpose of 'Your nearest ATM' is to be an user-friendly ATM. 'Your nearest ATM' is a simple program that will let you deposit, withdraw, let you know your balance or exit.

## Functions

**Deposit:** The user can only deposit positives numbers, if the user inputs a negative or a string, a message will show up.

**Withdraw:** The user can make a withdraw unless the amount wanted to be taken is less than the current balance.

**Balance:** It will show a default $100 balance. The user can withdraw up to that amount, if it exceeds the amount a message will show up indicating that that function can't be done due to overdrawn.

**Exit:** It will exit the program


## User interaction

A welcome message will be displayed, then the user will be prompted to enter their name. When the user writes their name, the user has to enter the 'enter' key twice for the program to start. A greeting with user's name will be displayed. Then a numeric list with 4 functions will be displayed: deposit, withdraw, balance and exit. The user can select a function by selecting a number, from 1 to 4 accordingly.

![alt text](https://github.com/xrozzi/Terminal_App/blob/master/docs/welcome.png)


After selecting a number from the list, the user has to enter the desired number again in order for the program to run. If user just hits enter instead of any number from the list, an 'Invalid Input' error message will be displayed and the program will end.

![alt text](https://github.com/xrozzi/Terminal_App/blob/master/docs/deposit.png)

User's balance will be display for each function.

If user enters a negative number or a string instead of a number(float, or integer) an 'Invalid Input' error message will be displayed, and the program will end. If user enter float numbers, they will be converted to an integer.

## Control Flow

![alt text](https://github.com/xrozzi/Terminal_App/blob/master/docs/flowchart.png)


## Help Documentation

'Your Nearest ATM' is a command line application developed for Unix based systems.

In order to run the program Ruby needs to be installed on user's computer.

If user does not have Ruby already installed on their computer follow the next steps.

**1.** Install Homebrew: By running the following command on the terminal <br/> 
```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

**2.** Install rbenv: rbenv is a light weight Ruby version manager. Run the following command line on the terminal. <br/> 
```
$   brew install rbenv
```

**3.** Install ruby: Follow the next command line on terminal. <br/> 
```
$   rbenv install 2.6.3
```

**4.** Install git following this link <https://www.atlassian.com/git/tutorials/install-git> <br/> 
```
$   brew install git
```

**5.** Clone the Terminal_App repository from github. <br/> 
```
$   git clone https://github.com/xrozzi/Terminal_App.git
```

**6.** The following gem dependencies need to be installed. <br/> 
```
$   gem install colorize 
$   gem install tty-prompt 
$   gem install tty-spinner 
$   gem 'tty-progressbar' 
```
**7.** Navigate to specified directory and run Your Nearest ATM
```
$   ruby atm_main.rb
```





### Resources

https://ttytoolkit.org/components/ <br/> 
https://medium.com/@max.bautista97/interactive-cli-command-line-interface-applications-with-ruby-gems-f5c2f67c43e9 <br/> 
https://www.rubydoc.info/gems/tty-prompt https://github.com/piotrmurach/tty-box https://rdoc.info/github/fazibear/colorize