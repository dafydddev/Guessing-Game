# Function that get input from user and start script. When done, calls count function.
# GRADE POINT 1: HERE IS A FUNCTION

function getInput {
    echo "Guess how many files are in the current directory then press Enter:"
    read response
    echo "You entered: $response, Let's check How you did..."
    countFiles
}

# Function that loops through folder and counts 1 for each file. When done, calls check msg function.
# GRADE POINT 2: HERE IS A LOOP

function countFiles {
    count=0
    filesindir=`ls ./*`
    for eachfile in $filesindir
        do
        let count=$count+1
    done
    gameResult
}

# Function that checks count and sets message accordingly. 
# When done, prints message. And resets get if answer was wrong.
# GRADE POINT 3: HERE ARE IF STATEMENTS

function gameResult {
    if [[ $count -gt $response ]]
    then
        echo "There are more files than you guessed, try again"
        getInput
    elif [[ $count -lt $response ]]
    then
        echo "There are less files than you guessed, try again"
        getInput
    else
        echo "You guessed right! Good job"
    fi
}

# Run function user input. This intially starts the game. 

getInput