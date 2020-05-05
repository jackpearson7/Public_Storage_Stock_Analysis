# STORED PROCEDURE CREATION:
# This creates a stored procedure that tells the user how many times PSA has paid a dividend within the date range they pass in.
DELIMITER $$

DROP PROCEDURE IF EXISTS getPSADividendCount$$

CREATE PROCEDURE getPSADividendCount(inPSADateStart DATE, inPSADateEnd DATE)
BEGIN
	SET @PSADateStart := inPSADateStart;
	SET @PSADateEnd := inPSADateEnd;

	SELECT COUNT(*)
	FROM psa_data
	WHERE Dividends > 0 AND `Date` BETWEEN @PSADateStart AND @PSADateEnd;	
END$$

DELIMITER ;

# This tests that the PSA Dividend Counter works as intended.
CALL getPSADividendCount('2010-01-04', '2020-04-17');

# This creates a stored procedure that tells the user how many times CUBE has paid a dividend within the date range they pass in.
DELIMITER $$

DROP PROCEDURE IF EXISTS getCUBEDividendCount$$

CREATE PROCEDURE getCUBEDividendCount(inCUBEDateStart DATE, inCUBEDateEnd DATE)
BEGIN
	SET @CUBEDateStart := inCUBEDateStart;
	SET @CUBEDateEnd := inCUBEDateEnd;

	SELECT COUNT(*)
	FROM cube_data
	WHERE Dividends > 0 AND `Date` BETWEEN @CUBEDateStart AND @CUBEDateEnd;	
END$$

DELIMITER ;

# This tests that the PSA Dividend Counter works as intended.
CALL getCUBEDividendCount('2010-01-04', '2020-04-17');

# This creates a stored procedure that tells the user how many times LSI has paid a dividend within the date range they pass in.
DELIMITER $$

DROP PROCEDURE IF EXISTS getLSIDividendCount$$

CREATE PROCEDURE getLSIDividendCount(inLSIDateStart DATE, inLSIDateEnd DATE)
BEGIN
	SET @LSIDateStart := inLSIDateStart;
	SET @LSIDateEnd := inLSIDateEnd;

	SELECT COUNT(*)
	FROM lsi_data
	WHERE Dividends > 0 AND `Date` BETWEEN @LSIDateStart AND @LSIDateEnd;	
END$$

DELIMITER ;

# This tests that the LSI Dividend Counter works as intended.
CALL getLSIDividendCount('2010-01-04', '2020-04-17');