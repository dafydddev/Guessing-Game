# Function that get input from user and start script. When done, calls count function.
# GRADE POINT 1: HERE IS A FUNCTION

function getInput {
    echo "Guess how many files are in the current directory then press Enter:"
    read response
    echo "You entered: $response, Let's check How you did..."
    countFiles
}

# Run function user input. This intially starts the game. 

getInput

# Function that loops through folder and counts 1 for each file. When done, calls check msg function.
# GRADE POINT 2: HERE IS A LOOP

function countFiles {
    count=0
    filesindir=`ls ./*`
    for eachfile in $filesindir
        do
        let count=$count+1
    done
    checkMessage
}

# Function that checks count and sets message accordingly. When done, prints message.
# GRADE POINT 3: HERE ARE IF STATEMENTS

function checkMessage {
    [[ $count -gt $response ]] && message="There are more files than you guessed, try again "
    [[ $count -lt $response ]] && message="There are less files than you guessed, try again"
    [[ $count -eq $response ]] && message="You guessed right! Good job"
    printMessageAndResetGame
}

# Function that echos whatever the message is. 
# Restarts game, if guess was wrong. Otherwise, program finishes.

function printMessageAndResetGame {
    echo $message
    [[ $count -gt $response ]] && getInput
    [[ $count -lt $response ]] && getInput
}