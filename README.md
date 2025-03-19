# Automated EC2 Update Script with Cron Jobs & Email Notifications

In this project, I automated the process of updating my EC2 instance running Ubuntu. The script performs a disk space check, runs system updates if the disk space is sufficient, and sends email notifications regarding the update status. If the disk space is low, it skips the update and sends a failure email instead.

## Key Features

- **Disk Space Check**: The script checks if there’s enough available disk space before running updates. If space is low, it skips the update and sends an email about the failure.
- **Automated Weekly Updates**: Using a cron job, the system automatically runs updates every week, ensuring the instance stays up-to-date without manual intervention.
- **Email Notifications**: Whether the update is successful or fails, I receive an email notification with the relevant status:
  - **Success**: "Confirmation that your EC2 instance has been updated."
  - **Failure (Low Disk Space)**: Notifies me if the update was skipped due to insufficient disk space.

## Technologies Used

- **Postfix** for sending email notifications
- **Cron Jobs** for weekly scheduling
- **Bash** for scripting the update process

## How It Works

1. **Disk Space Check**: Before running updates, the script checks the available disk space. If space is sufficient, it proceeds with updates.
2. **Update Process**: The script runs `apt update` and `apt upgrade` to keep the system up to date.
3. **Email Notifications**: After each update, an email is sent to confirm the success or failure of the update.

This project simplifies EC2 maintenance by automating regular updates and ensuring I stay informed via email notifications about the health of my instance.

## Screenshots
log file 
![log file](https://github.com/user-attachments/assets/0c1e9782-6c60-49c1-b657-f4ee84e7bc83)
crontab setup
![crontab setup](https://github.com/user-attachments/assets/01274d4b-0efb-4d38-bb60-6bf5acf2227c)
cronjob script
![cronjob script](https://github.com/user-attachments/assets/f2e1223f-6838-4cd0-932b-a600da0b55d0)
script execution
![cronjob execution](https://github.com/user-attachments/assets/9bf7cfb7-3bfd-423b-9147-188cd9ef1fe9)
Success email output 
![email output success](https://github.com/user-attachments/assets/3fc561d5-1fd5-4a60-87ab-962e064824b7)
Failure email output 
![email output failure](https://github.com/user-attachments/assets/dab61e55-85d2-4906-b124-021ae257ad49)

