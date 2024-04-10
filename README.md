# backup
Programmer: maxhaase@gmail.com

This is a Bash script that you can invoke from crontab to backup essential data on an Linux system, excluding directories that typically contain cache, temporary files, or other non-essential data. It is a must-have if you have anything important on your computer! 
Note: my personal preference is to mount a disk on /SPACE/BACKUP/ which you can change if you want. I strongly advice you to encrypt the disc, especially if it is an external disk like a USB drive, to prevent unauthorized access! 

# This script:

Keeps file permissions and other attributes intact.
Names the backup file in the format /SPACE/BACKUP/backup_<DayOfWeek>_<Month>_<Day>_<Year>_<time>.tar.gz.
Measures the time taken to perform the backup operation in minutes and emails the result to the root user.
Deletes backups older than 15 days, but ensures at least the last 10 backups are retained. You can adjust these as you wish. 

# Instructions:

Create /SPACE (sudo mkdir /SPACE), it is recommended to mount a large external storage device, thus if you disk breaks, it doesn't take with it your backups! 
Copy the above script into a file, for example, backup.sh.
Make the script executable by running chmod +x backup.sh.
Edit your crontab file by running sudo crontab -e to schedule the script. You might add a line like 0 2 * * * /path/to/backup.sh to run the backup daily at 2:00 AM. You could use 0 * * * * if you want it backed up every hour, but remember that the more frequent you backup, the more disk it requires, however, it is nice to recover (not to lose) 1 hour of work at the most and always have that feeling of safety. 
Ensure your system has mail installed for the email functionality to work, or modify the script to use an alternative method of notification as needed.
This script assumes you have sufficient permissions to access all files and directories intended for backup and to write to the backup directory. It also assumes that the mail command is configured correctly to send emails from your system. Adjustments may be required based on the specific setup and requirements of your system.

# Restore a backup

It doesn't matter where you store your backup files, as long as it isn't on a broken disk, the following instructions will get your files back. 

# Instructions:
Copy the script into a new file, e.g., /SPACE/BACKUP/decompress_backup.sh
Make the script executable with the command chmod +x /SPACE/BACKUP/decompress_backup.sh
Run the script, passing the path to the backup file as an argument. For example:

/SPACE/BACKUP/decompress_backup.sh /SPACE/BACKUP/backup_Friday_April_12_2024_02-00_.tar.gz

This script performs basic checks to ensure that a file name is provided and that the file exists. It then creates a directory named after the backup file (excluding the .tar.gz part) and extracts the contents of the backup file into this directory. If the target directory already exists, the script exits to prevent accidental overwriting of any existing data.

