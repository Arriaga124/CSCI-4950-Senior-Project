# Protective Paws

Protective Paws is an inventory management system that can aid the management team of animal shelters in maintaining and managing information about the shelter. It facilitates in keeping record of the animals, their supplies and personnel available to care for them. The system aims to reduce the neglect of sheltered animals by providing the staff with useful information to ensure that all the animal’s needs are met.

## Technologies Used

- Eclipse IDE for Enterprise Java and Web Developers
- Java
- Java Servlets
- JSP
- MySQL 
- Tomcat Server

## How to Run

### What you will need
1. Eclipse IDE for Enterprise Java and Web Developers.
Download [here](https://www.eclipse.org/downloads/download.php?file=/oomph/epp/2022-09/R/eclipse-inst-jre-win64.exe)
2. Apache Tomcat Server 8. Download [here](https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.83/bin/apache-tomcat-8.5.83-windows-x64.zip), once downloaded extract it and make note of where you save it
3. MySQLWorkbench 8.0 Download [here](https://dev.mysql.com/downloads/windows/installer/8.0.html). Choose the 1st option
4. The source code. Either clone the repository into an appropriate folder using the CLI of your choice or unzip the ZIP folder you downloaded from the site.

### Installing Eclipse
1. Once downloaded click on the file to run the installer.
2. On this window make sure to select Eclipse IDE for Enterprise Java and Web Developers
![image](https://user-images.githubusercontent.com/92412809/202097449-474feecc-bcc9-4c0a-9961-ba822e548a52.png)
3. Leave defaults and click INSTALL. When promted accept the User Agreement
4. Once installed click LAUNCH. Then click Launch again on the popup. Eclipse is now installed!

### Installing MySQL Workbench
1. Run the installer
2. select Custom on the choose setup type window
3. On the select products page select MySQL server 8.0.31, Workbench 8.0.31, Connector/j 8.0.31
4. Click Next, Click Execute, Click Next, Click Execute, Click Next, Click Execute, Click Next
5. In the Accounts and Roles window, type in a password you will remember. We will be using "root" for password.
6. Click Next, Click Next, Click Next, Click Execute, Click Finish, Click Next, Click Finish and mysql should launch automatically

### Configuring Eclipse
In order to run the project on eclipse you will need to do the following things
1. From the tabs at the top left go to File -> New -> Dynamic Web Project
2. Configure the Dynamic Web Project window as such
![image](https://user-images.githubusercontent.com/92412809/202046658-a2d3226f-1725-45cd-ad48-a09779cecf11.png)
3. Click Next, then Click Next again
5. On the Web Module window check the "Generate web.xml deployment descriptor" checkbox
6. Click Finish
7. Find the folder containing our projects source code. If it is in a zip folder make sure to extract it first
8. Select all files except the "build" folder. Copy and then paste the selection within your newly created Eclipse project
![image](https://user-images.githubusercontent.com/92412809/202101282-112f11a7-27e6-4825-8f24-d756afae4e28.png)

9. When prompted click Overwrite All and that is all for this part!
- If unable to directly copy and paste, right click on the ProtectivePaws project and select "show in" -> "system explorer"
- From there open up the ProtectivePaws project and paste it within that folder.
- once all files are finished being added, please right click the ProtectivePaws project within eclipse and select "refresh".

### Before the project will work you must create a database schema for it on MySQL
In our project we have a file called "our_script" which contains the SQL code necessary to create the database. In MySQL create a new schema called "protectivepaws" and simply copy and paste our SQL to create the necessary tables.
1. Click the plus button next to MySQL Connections
2. Name the connection "protective_paws", then select ok
3. Click on the new "protective_paws" connection and type in the password "root" from installing earlier.
4. Click the new schema button at the top and then name it "protectivepaws", and click apply -> apply -> finish. 
5. In our project we have a file called "our_script" which contains the SQL code necessary to create the database, navigate to it via eclipse and open it up.
6. Copy that entire files contents and place it in the open Query 1 window of mySQL.
7. click the lightning bolt button at the top of the query tab to execute the query.
8. All the tables will be built automatically for you!

### Next comes setting up the project to connect to MySQL
1. In the project folder go to Java Resources -> src -> net.team6.protectivepaws.utils -> JDBCUtils.java
2. On this file find the following code and change it with your MySQL username and password (Will be "root" from earlier)
![image](https://user-images.githubusercontent.com/92412809/202047126-44516a4d-f52d-49b8-84b1-9c08462f92d9.png)
3. Save the file.

### Next comes setting up Tomcat Server on eclipse
1. On Eclipse Project Explorer Right click the project’s folder and select Run As -> Run on Server
2. On the popup window, double click the Apache folder and select Tomcat v8.5 Server
![image](https://user-images.githubusercontent.com/92412809/202047243-1f3f405d-6595-4a39-8f89-e7653667a5ed.png)
3. Click Next 
4. On the Tomcat Server window, click Browse... and then find where you saved the Tomcat Server download. It will be a folder titled "apache-tomcat-8.5.83". It's located inside the "apache-tomcat-8.5.83-windows-x64" folder that was downloaded.
![image](https://user-images.githubusercontent.com/92412809/202108322-78ac2593-2f0f-48bf-a3f8-5d8d5b9cf085.png)
5. Click Next
6. On the Available section, select the project and click Add > to move it to the Configured section
7. Click Finish and the project should launch on the web browser
