# Student Union Internal Management System Setup
Welcome to the guide for setting up the Student Union Internal Management System! 

This comprehensive guide aims to assist Student Union leaders, administrators, and IT professionals in hosting a robust and user-friendly Internal Management System tailored to their specific requirements. By following the steps outlined here, you'll be able to streamline administrative processes, enhance communication and collaboration, and empower your Student Union to thrive.

So, let's dive in and embark on the journey of setting up an efficient and effective Student Union Internal Management System.

## Connecting to a Cloud Server
The Student Union Internal Management System runs on a Linux (Ubuntu) server hosted on a cloud service, eliminating maintenance and hardware costs. Cloud hosting provides a scalable and secure environment, allowing easy access and ensuring data integrity.

There are a variety of different services that offer cloud hosting services, so it does not make sense to identify a particular one here. Choose one that has servers close to your region and is affordable.

You will also need to have purchased a domain that points to the IP address of your server. 

> Tip: Here are some general instructions for how to configure a domain for your server.
> 1. Choose a domain registrar: There are many domain registrars available, such as GoDaddy, Namecheap, and Google Domains. Choose one that suits your needs and budget.
> 2. Search for available domains: Use the registrar's search tool to find an available domain that you like. You can search for domains by keyword, or by entering a specific domain name.
> 3. Purchase the domain: Once you have found an available domain that you like, follow the registrar's instructions to purchase it. You will need to provide your contact information and payment details.
> 4. Access your domain registrar's DNS settings: Once you have purchased your domain, you will need to access your domain registrar's DNS settings to point your domain towards the IP address of your server. The exact steps for doing this will depend on your registrar, but you should be able to find instructions in their documentation.
> 5. Add an "A" record: In your DNS settings, add an "A" record that points your domain towards the IP address of your server. The exact steps for doing this will depend on your registrar, but you will typically need to enter the IP address of your server in the "Value" field of the "A" record.
> 6. Wait for DNS propagation: Once you have added the "A" record, it may take some time for the changes to propagate across the internet. This can take anywhere from a few minutes to a few hours.

Once you have purchased a cloud server and a domain, you will need to access its terminal to host the system on it. I recommend the PuTTY SSH tool to do this.

> Tip: To SSH into a cloud Linux server using PuTTY, follow these simple instructions:
> 1. Download and install PuTTY: Visit the PuTTY website (https://www.putty.org/) and download the appropriate version of PuTTY for your operating system. Install PuTTY by following the on-screen instructions.
> 2. Obtain server credentials: The cloud service should provide the IP address and the username and password for your server.
> 3. Launch PuTTY: Open PuTTY from your computer's programs or applications menu.
> 4. Configure the connection: In the PuTTY configuration window, enter the server IP address in the "Host Name" field. Make sure the "SSH" option is selected, and the port is set to 22 (the default SSH port).
> 5. Save the session: Optionally, you can enter a name for your session in the "Saved Sessions" field and click the "Save" button to save these settings for future use.
> 6. Connect to the server: Click the "Open" button to initiate the SSH connection.
> 7. Provide login credentials: A new terminal window will open. Enter the username provided by your cloud service provider and press "Enter." If you are using a password for authentication, enter it when prompted. If you are using an SSH key, refer to the next step.
> 8. Configure SSH key authentication (if applicable): If you are using an SSH key instead of a password, follow these additional steps:
   a. Click "Connection" in the left panel of the PuTTY configuration window.
   b. Expand the "SSH" section and select "Auth."
   c. Click the "Browse" button and locate your private key file on your local machine.
   d. Click "Open" to return to the main configuration window.
> 9. Complete the login process: After providing the appropriate credentials (either password or SSH key), press "Enter" to log in to the cloud Linux server via SSH using PuTTY.
> Once connected, you can execute commands and perform administrative tasks on the cloud Linux server through the PuTTY terminal window.

## Setting Up the Program

Download the setup script using the following line.
```console
curl -o setup.sh https://raw.githubusercontent.com/chungchunwang/Student-Union-System/main/setup/setup.sh 
```
Execute the setup script using the following. Make sure to follow the on screen instructions.
```console
bash setup.sh
```
## Configuring the Systems
Now, if you access your domain at the port you provided during the setup process, you should see a running, blank Budibase instance. Follow the onscreen instructions to setup an admin account. Once you log in, it will make you generate a new Budibase app. Follow along until you are able to quit this tour. We will not need to build an app from scratch, we just have to load in the saved app file.

Go to https://github.com/chungchunwang/Student-Union-System/tree/main/app/exports and download the latest version of the app. On the dashboard, click `Create new app`, and then `Import app`. Here, give the app a name and then import the file. It is recommended convention that you name the app after the particular school year this system is for. Thus, you can have multiple copies of the app for different years.

After you have logged in, change the configuration for MySQL to have `Host` be your domain name and password be the password you set for MySQL during the setup process.

Now, install MySQL Workbench at https://dev.mysql.com/downloads/workbench/.