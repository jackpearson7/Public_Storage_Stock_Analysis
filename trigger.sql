# TABLE CREATION:
# This creates the PSA Data Log table.
CREATE TABLE psa_data_log (
Date DATETIME,
Open DOUBLE,
High DOUBLE,
Low DOUBLE,
Close DOUBLE,
Volume DOUBLE,
Dividends DOUBLE,
psa_data_ID INT(11) AUTO_INCREMENT NOT NULL,
Log_Date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY (psa_data_ID)
);

# This creates the CUBE Data Log table.
CREATE TABLE cube_data_log (
Date DATETIME,
Open DOUBLE,
High DOUBLE,
Low DOUBLE,
Close DOUBLE,
Volume DOUBLE,
Dividends DOUBLE,
cube_data_ID INT(11) AUTO_INCREMENT NOT NULL,
Log_Date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY (cube_data_ID)
);

# This creates the LSI Data Log table.
CREATE TABLE lsi_data_log (
Date DATETIME,
Open DOUBLE,
High DOUBLE,
Low DOUBLE,
Close DOUBLE,
Volume DOUBLE,
Dividends DOUBLE,
lsi_data_ID INT(11) AUTO_INCREMENT NOT NULL,
Log_Date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY (lsi_data_ID)
);

# TRIGGER CREATION:
# This trigger inserts data into the PSA Data Log table. This is helpful to track when additions to the table are made (more recent stock data added) so that if something goes wrong, it is easier to troubleshoot when an error occured.
DELIMITER $$
CREATE TRIGGER psa_data_after_insert
	AFTER INSERT ON psa_data
	FOR EACH ROW
BEGIN
	INSERT INTO psa_data_log
	(Date, Open, High, Low, Close, Volume, Dividends)
	VALUES
	(NEW.Date, NEW.Open, NEW.High, NEW.Low, NEW.Close, NEW.Volume, NEW.Dividends);
END$$
DELIMITER ;

# This inserts new data into the psa_data table so that the trigger is enacted.
INSERT INTO psa_data (Date, Open, High, Low, Close, Volume, Dividends)
VALUES ('2020-05-04', 100, 200, 50, 150, 850000, 0);

# This checks that the trigger worked and inserted the same data into the PSA Data Log table with a timestamp.
SELECT *
FROM psa_data_log;


# This trigger inserts data into the CUBE Data Log table. This is helpful to track when additions to the table are made (more recent stock data added) so that if something goes wrong, it is easier to troubleshoot when an error occured.
DELIMITER $$
CREATE TRIGGER cube_data_after_insert
	AFTER INSERT ON cube_data
	FOR EACH ROW
BEGIN
	INSERT INTO cube_data_log
	(Date, Open, High, Low, Close, Volume, Dividends)
	VALUES
	(NEW.Date, NEW.Open, NEW.High, NEW.Low, NEW.Close, NEW.Volume, NEW.Dividends);
END$$
DELIMITER ;

# This inserts new data into the cube_data table so that the trigger is enacted.
INSERT INTO cube_data (Date, Open, High, Low, Close, Volume, Dividends)
VALUES ('2020-05-04', 80, 95, 80, 92, 700000, 0);

# This checks that the trigger worked and inserted the same data into the CUBE Data Log table with a timestamp.
SELECT *
FROM cube_data_log;

# This trigger inserts data into the LSI Data Log table. This is helpful to track when additions to the table are made (more recent stock data added) so that if something goes wrong, it is easier to troubleshoot when an error occured.
DELIMITER $$
CREATE TRIGGER lsi_data_after_insert
	AFTER INSERT ON lsi_data
	FOR EACH ROW
BEGIN
	INSERT INTO lsi_data_log
	(Date, Open, High, Low, Close, Volume, Dividends)
	VALUES
	(NEW.Date, NEW.Open, NEW.High, NEW.Low, NEW.Close, NEW.Volume, NEW.Dividends);
END$$
DELIMITER ;

# This inserts new data into the lsi_data table so that the trigger is enacted.
INSERT INTO lsi_data_log (Date, Open, High, Low, Close, Volume, Dividends)
VALUES ('2020-05-04', 65, 75, 64, 70, 900000, 0);

# This checks that the trigger worked and inserted the same data into the LSI Data Log table with a timestamp.
SELECT *
FROM lsi_data_log;