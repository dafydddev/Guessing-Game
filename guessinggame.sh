# Function that get input from user and start script. When done, calls count function.

function getInput {
    echo "Guess how many files are in the current directory then press Enter:"
    read response
    echo "You entered: $response, Let's check How you did..."
    countFiles
}

# Function that loops through folder and counts 1 for each file. When done, calls check msg function.

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

function checkMessage {
    [[ $count -gt $response ]] && message="There are more files than you guessed, try again "
    [[ $count -lt $response ]] && message="There are less files than you guessed, try again"
    [[ $count -eq $response ]] && message="You guessed right! Good job"
    printMessageAndResetGame
}

# Function that prints whatever the message is.

function printMessageAndResetGame {
    echo $message
    [[ $count -gt $response ]] && getInput
    [[ $count -lt $response ]] && getInput
}

# Run function user input 
# Run function for how many files are in current folder
# Run function for message based on count

getInput