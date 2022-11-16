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
2. Apache Tomcat Server 8. Download [here](https://tomcat.apache.org/download-80.cgi ), once downloaded extract it and make note of where you save it
3. MySQLWorkbench 8.0 Download [here](https://dev.mysql.com/downloads/windows/installer/8.0.html)
4. The source code. Either clone the repository into an appropriate folder using the CLI of your choice or unzip the ZIP folder you downloaded from the site.

### Before the project will work you must create a database schema for it on MySQL
In our project we have a file called our_script which contains the SQL code necessary to create the database. In MySQL create a new schema called protectivepaws and simply copy and paste our SQL to create the necessary tables.

### Configuring Eclipse
In order to run the project on eclipse you will need to do the following things
1. From the tabs at the top right go to File -> New -> Dynamic Web Project
2. Configure the Dynamic Web Project window as such
![image](https://user-images.githubusercontent.com/92412809/202046658-a2d3226f-1725-45cd-ad48-a09779cecf11.png)
3. Click Next
4. Click Next again
5. On the Web Module window check the Generate web.xml deployment descriptor checkbox
6. Click Finish
7. Find the folder containing our project 
8. Select all files except build and copy and paste onto your newly created Eclipse project
![image](https://user-images.githubusercontent.com/92412809/202046868-64be643b-0250-40b6-811e-948002ddad08.png)
9. When prompted click Overwrite All

### Next comes setting up the project to connect to MySQL
1. In the project folder go to Java Resources -> src -> net.team6.protectivepaws.utils -> JDBCUtils.java
2. On this file find the following code and change it with your MySQL username and password
![image](https://user-images.githubusercontent.com/92412809/202047126-44516a4d-f52d-49b8-84b1-9c08462f92d9.png)

### Next comes setting up Tomcat Server on eclipse
1. On Eclipse Project Explorer Right click the project’s folder and select Run As -> Run on Server
2. On the popup window, double click the Apache folder and select Tomcat v8.5 Server
![image](https://user-images.githubusercontent.com/92412809/202047243-1f3f405d-6595-4a39-8f89-e7653667a5ed.png)
3. Click Next 
4. On the Available section, select the project and click Add > to move it to the Configured section
5. Click Finish and the project should launch on the web browser
