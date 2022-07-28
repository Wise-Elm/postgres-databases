#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# Clear tables.
echo $($PSQL "TRUNCATE teams, games")

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
    if [[ $YEAR != "year" ]]
    then

        # Construct teams table.

        # Get WINNER_ID or create WINNER_ID if not found.
        WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
        # If WINNER_ID not found.
        if [[ -z $WINNER_ID ]]
        then
            # Insert winner into teams db.
            INSERT_WINNER_ID_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
            if [[ $INSERT_WINNER_ID_RESULT == "INSERT 0 1" ]]
            then
                echo Inserted into teams, $WINNER
                # Get newly created WINNER_ID.
                WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
            else
                echo Error inserting $WINNER into teams table.
            fi
        fi

        # Get OPPONENT_ID or create OPPONENT_ID if not found.
        OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
        # If OPPONENT_ID not found.
        if [[ -z $OPPONENT_ID ]]
        then
            # Insert opponent into teams db.
            INSERT_OPPONENT_ID_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
            if [[ $INSERT_OPPONENT_ID_RESULT == "INSERT 0 1" ]]
            then
                echo Inserted into teams, $OPPONENT
                # Get newly created OPPONENT_ID.
                OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
            else
                echo Error inserting $OPPONENT into teams table.
            fi
        fi

        # Construct games table.

        GAME=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) 
        VALUES('$YEAR', '$ROUND', '$WINNER_ID', '$OPPONENT_ID', '$WINNER_GOALS', '$OPPONENT_GOALS')")
        if [[ $GAME == "INSERT 0 1" ]]
        then
            echo Inserted into games, $YEAR, $ROUND, $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS
        fi
    fi
done
