#!/bin/bash

# Database connection setup - connects to PostgreSQL database
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Game introduction
echo -e "\n~~~~~ NUMBER GUESS GAME ~~~~~\n"
echo "Enter your username:"
read USERNAME

# Check if user exists in database
USERID=$($PSQL "select user_id from users where username = '$USERNAME'" | xargs)

# Handle new user registration
if [[ -z $USERID ]]
then 
  # Insert new user with initial values
  insert_result=$($PSQL "insert into users(username, games_played, best_game) values ('$USERNAME', 0, 0)")
  if [[ $insert_result == "INSERT 0 1" ]]
  then
    echo -e "Welcome, $USERNAME! It looks like this is your first time here.\n"
    # Get the newly created user ID
    USERID=$($PSQL "select user_id from users where username = '$USERNAME'" | xargs)
  else
    echo "Error: Failed to create user account."
  fi
else
  # Retrieve existing user's game statistics
  GAMES_PLAYED=$($PSQL "select games_played from users where user_id = $USERID" | xargs)
  BEST_GAME=$($PSQL "select best_game from users where user_id = $USERID" | xargs)
  echo -e "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses.\n"
fi

# Generate random number between 1 and 1000
RANDOM_NUMBER=$(( RANDOM % 1000 + 1 ))
# Initialize guess counter
number_of_guesses=1

# Start the guessing game
echo -e "Guess the secret number between 1 and 1000:\n"
read GUESSED_NUMBER

# Main game loop - continues until correct guess
while true
do
  # Validate input is a number
  if [[ "$GUESSED_NUMBER" =~ ^[0-9]+$ ]]
  then
    # Check if guess is low
    if [[ $GUESSED_NUMBER -lt $RANDOM_NUMBER ]]
    then
      echo "It's higher than that, guess again:"
      ((number_of_guesses++))
      read GUESSED_NUMBER
    # Check if guess is high
    elif [[ $GUESSED_NUMBER -gt $RANDOM_NUMBER ]]
    then
      echo "It's lower than that, guess again:"
      ((number_of_guesses++))
      read GUESSED_NUMBER
    else
      # Correct guess - exit loop
      break
    fi
  else
    # Handle invalid input (non-integer)
    echo "That is not an integer, guess again:"
    read GUESSED_NUMBER
    ((number_of_guesses++))
  fi
done

# Update game statistics
((GAMES_PLAYED++))
# Get current best game score
BEST_GAME=$($PSQL "select best_game from users where user_id = $USERID" | xargs)

# Determine if we need to update best_game
if [[ $BEST_GAME -eq 0 || $number_of_guesses -lt $BEST_GAME ]]
then
  # For new players (BEST_GAME=NULL), this will set their first score
  # For returning players, this will update if they did better
  update_result=$($PSQL "UPDATE users SET games_played=$GAMES_PLAYED, best_game=$number_of_guesses WHERE user_id = $USERID")
else
  # Only update games_played if they didn't beat their best
  update_result=$($PSQL "UPDATE users SET games_played=$GAMES_PLAYED WHERE user_id = $USERID")
fi

# Game completion message
echo "You guessed it in $number_of_guesses tries. The secret number was $RANDOM_NUMBER. Nice job!"
