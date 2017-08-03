# Check for Hacked Passwords with PowerShell
This is a PowerShell function for testing to see if a password has been compromised based off of [Troy Hunt's Pwned Passwords list](https://haveibeenpwned.com/Passwords).

# DISCLAMER 
This script is not yet fast enough to use in a meaningful way. I'm working on a second script to optimize the database.

## How to use
        . .\Compare-HackedPasswords.ps1
        Compare-HackedPasswords -Password 'pa$$word'

Will return a boolean value i.e., True or False.