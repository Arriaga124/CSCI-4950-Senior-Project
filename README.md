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
Download [here](https://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/2022-09/R/eclipse-jee-2022-09-R-win32-x86_64.zip)
2. Apache Tomcat Server 8. Download [here](https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.83/bin/apache-tomcat-8.5.83-windows-x64.zip), once downloaded extract it and make note of where you save it
3. MySQLWorkbench 8.0 Download [here](https://dev.mysql.com/downloads/windows/installer/8.0.html)
4. The source code. Either clone the repository into an appropriate folder using the CLI of your choice or unzip the ZIP folder you downloaded from the site.

### Installing Eclipse
1. Once download from above extract the zip file.
2. Navigate "eclipse-jee-2022-09-R-win32-x86_64\eclipse\eclipse.exe", and run the "eclipse.exe"
3. For the select a directory popup simply press the launch button at the bottom, as the default workplace will be correct.
4. The Eclipse will open to the main paige, and the installation for it is complete!

### Installing MySQL Workbench
1. Run the installer
2. select Custom on the choose setup type window
3. On the select products page select MySQL server 8.0.31, Workbench 8.0.31, Connector/j 8.0.31
4. Click Next, Click Execute, Click Next, Click Execute, Click Next, Click Execute, Click Next
5. In the Accounts and Roles window type in root for password
6. Click Next, Click Next, Click Next, Click Execute, Click Finish, Click Next, Click Finish and mysql should launch automatically

### Configuring Eclipse
In order to run the project on eclipse you will need to do the following things
1. From the tabs at the top left go to File -> New -> Dynamic Web Project
2. Configure the Dynamic Web Project window as such
![image](https://user-images.githubusercontent.com/92412809/202046658-a2d3226f-1725-45cd-ad48-a09779cecf11.png)
3. Click Next
4. Click Next again
5. On the Web Module window check the Generate web.xml deployment descriptor checkbox
6. Click Finish
7. Find the folder containing our projects source code. 
8. Select all files except "build" folder, and copy and then paste the selection within your newly created Eclipse project
![image](https://user-images.githubusercontent.com/92412809/202046868-64be643b-0250-40b6-811e-948002ddad08.png)
9. if inable to directly copy and paste, right click on the ProtectivePaws project and select "show in" -> "system explorer"
10. From there open up the ProtectivePaws project and paste it within that folder.
11. When prompted click Overwrite All
12. once all files are finished being added, please right click the ProtectivePaws project within eclipse and select "refresh".

### Before the project will work you must create a database schema for it on MySQL
In our project we have a file called "our_script" which contains the SQL code necessary to create the database. In MySQL create a new schema called "protectivepaws" and simply copy and paste our SQL to create the necessary tables.
1. Click the plus button next to MySQL Connections
2. Name the connection "protective_paws", then select ok
3. Click on the new "protective_paws" connection and type in the password "root" from installing earlier.
4. Click the new schema button at the top and then name it "protectivepaws", and click apply -> apply -> finish. 
5. In our project we have a file called "our_script" which contains the SQL code necessary to create the database, navigate to it via eclipse and open it up.
6. Copy that entire files contents and place it in the open Query 1 window of mySQL.
7. click the lightning bolt button at the top of the query tab to execute the query.
8. then all the tables will be build automatically for you!

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
4. create a folder to host the tomcat server on your computer, and then click the browse button and set it as the installation path for the tomcat server.
5. Then install the Tomcat server.
6. On the Available section, select the project and click Add > to move it to the Configured section
7. Click Finish and the project should launch on the web browser
