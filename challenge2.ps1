# Variables
$path = "C:\Users\ASUS\Documents\data1"
$name_of_directory = "data1"
$filename_excel = "daily_market_price.xlsx"
$source_dir = "C:\Users\ASUS\Documents"
$target_dir = Join-Path -Path $path -ChildPath $name_of_directory
$log_file = Join-Path -Path $target_dir -ChildPath "move_log.txt"

# Check if the directory exists
if (Test-Path -Path $target_dir -PathType Container) {
    Write-Host "The directory $name_of_directory exists."

    # Check if the source file exists
    $source_file = Join-Path -Path $source_dir -ChildPath $filename_excel
    if (Test-Path -Path $source_file -PathType Leaf) {
        # Copy the file to the target directory
        Copy-Item -Path $source_file -Destination $target_dir -Force

        # Check if the copy was successful
        if ($?) {
            "File Moved Successfully" | Set-Content -Path $log_file
        } else {
            Write-Host "File move failed."
        }
    } else {
        Write-Host "The source file $filename_excel does not exist."
    }
} else {
    Write-Host "$name_of_directory Directory Not Exists!"

    # Create the directory
    New-Item -Path $target_dir -ItemType Directory

    # Check if the directory was created successfully
    if ($?) {
        Write-Host "Directory $name_of_directory created."
    } else {
        Write-Host "Directory creation failed."
    }
}