#!/bin/bash

# Check if exactly one argument was provided
if [[ $# -ne 1 ]]; then
  # If not, show usage message
  echo "Please provide an element as an argument."
else
  # Store the first argument in a variable
  argument="$1"
  
  # Define the PostgreSQL command with connection details and output formatting:
  # -t for tuples only (no headers)
  # -c to execute the following command
  PSQL="psql --username=freecodecamp --dbname=periodic_table -t -c"

  # Check if the argument is a number (atomic number)
  if [[ "$argument" =~ ^[0-9]+$ ]]; then
    # Query database for matching atomic number
    # Pipe to xargs to trim whitespace from result
    atomic_number_query=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number = $argument" | xargs)
  else
    # For non-numeric input, search by symbol or name
    atomic_number_query=$($PSQL "SELECT atomic_number FROM elements WHERE symbol = '$argument' OR name = '$argument'" | xargs)
  fi

  # Check if the query returned empty (no match found)
  if [[ -z "$atomic_number_query" ]]; then
    # Show error message if element not found
    echo "I could not find that element in the database."
  else
    # If element found, query all its properties:

    # Get element symbol
    symbol=$($PSQL "SELECT symbol FROM elements WHERE atomic_number = $atomic_number_query" | xargs)
    
    # Get element name
    name=$($PSQL "SELECT name FROM elements WHERE atomic_number = $atomic_number_query" | xargs)
    
    # Get atomic mass from properties table
    atomic_mass=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number = $atomic_number_query" | xargs)
    
    # Get melting point in Celsius
    melting_point_celsius=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number = $atomic_number_query" | xargs)
    
    # Get boiling point in Celsius
    boiling_point_celsius=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number = $atomic_number_query" | xargs)
    
    # Get element type by joining properties and types tables
    type=$($PSQL "SELECT type FROM properties p JOIN types t ON p.type_id = t.type_id WHERE atomic_number = $atomic_number_query" | xargs)

    # Display all collected information in a formatted string
    echo "The element with atomic number $atomic_number_query is $name ($symbol). It's a $type, with a mass of $atomic_mass amu. $name has a melting point of $melting_point_celsius celsius and a boiling point of $boiling_point_celsius celsius."
  fi
fi
