# Variables
$path = "C:\Users\ASUS\Documents\data1"
$name_of_directory = "data1"

# Check if the directory exists
if (Test-Path -Path "$path\$name_of_directory" -PathType Container) {
    Write-Host "There is $name_of_directory Directory Exists!"
} else {
    Write-Host "$name_of_directory Directory Not Exists!"
    # Create the directory
    New-Item -Path "$path\$name_of_directory" -ItemType Directory
}