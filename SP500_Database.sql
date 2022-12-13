/*-------------------------------------- Creating the Database --------------------------------------------*/

create database sharemarket;

use sharemarket;

-- SP_500 table creation	
create table if not exists SP_500(
     Symbol varchar(50) not null,
     `date` date not null,
     `open` decimal(50,2) not null,
     high decimal(50,2) not null,
     low decimal(50,2) not null,
     `close` decimal(50,2) not null,
     volume integer not null
     );
     
 -- Loading the values in the table
LOAD DATA INFILE 'D:\\Full_SatckDataAnalytics_Notes\\FSDA_Internship_Project\\S&P_500.csv'
INTO TABLE SP_500
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;   