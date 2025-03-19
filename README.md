Automated EC2 Update Script with Cron Jobs & Email Notifications
This project automates system maintenance tasks on an EC2 instance by scheduling regular updates and sending email notifications about the update status. The script first checks disk space, and based on its availability, either runs the updates or sends a failure notification.

Overview
Disk Space Check: Ensures that there is sufficient space before proceeding with updates.
Automated Weekly Updates: Runs apt update and apt upgrade commands every week via cron job.
Email Notifications: Sends an email after each update, indicating whether the update was successful or if there were issues (e.g., low disk space or update failure).
Error Handling: If disk space is low, it will stop the update and notify the user of the failure.
Features
Automated Weekly Maintenance: Updates your EC2 instance automatically every week.
Disk Space Monitoring: Prevents updates from running if disk space is low.
Email Alerts: Notifications for both successful updates and errors.
Easy to Use: Just set it up once, and the cron job takes care of the rest.
Getting Started
Clone the repository:

bash
Copy
Edit
git clone https://github.com/yourusername/automated-ec2-update.git
cd automated-ec2-update
Script Setup:

The script checks disk space before proceeding with the update. If space is sufficient, it runs apt update and apt upgrade.
The script will send an email to notify you of the update status. You will need to set up Postfix to enable email sending from the EC2 instance.
Configure Email Notifications:

Set up Postfix for email configuration on your EC2 instance.
Ensure you have App Passwords enabled if using Gmail to send notifications.
Set Up Cron Job:

Schedule the cron job by editing your crontab:
bash
Copy
Edit
crontab -e
Add the following line to schedule the script to run every week at 11:50 AM:
bash
Copy
Edit
50 11 * * 1 /path/to/your/script.sh
Monitor the Logs:

Check your email inbox for weekly update status.
Logs can also be monitored via /var/log/mail.log for troubleshooting.
Example Email Notifications
Success:

kotlin
Copy
Edit
Good morning, this is confirmation that your EC2 instance has been updated. Enjoy your week and happy coding!
Failure (Low Disk Space or Update Failure):

pgsql
Copy
Edit
Warning: Update failed due to low disk space on your EC2 instance.
Please check the available space and resolve the issue.
Dependencies
Postfix for sending email notifications
Linux Cron Jobs for scheduling tasks
Bash for scripting
