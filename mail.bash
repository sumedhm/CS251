#! /bin/bash
clear

task="Class"												# user can edit tasks here
echo $'\t' "This program is a Reminder".$'\n'								# about program
echo $'\a'												# reminder tone
echo "Its $(date +"%A,%D,%r") $USER" $'\n\t'" Time for $task"						# shows on terminal about reminder

echo $"$task" $'\t'" $(date +"%A %t %D %t %r")" >> reminder.txt						#prints timestamp on file

echo $(mailx -s "Reminder for $task" sumedh@iitk.ac.in							#mails about the reminder to user
"Its $(date +"%A, %D,%r") $USER" $'\n\t' "Its time to go for class."
)

exit 1													#end program
