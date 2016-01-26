-- Listing 1. MYSQL stored function for 
-- Exponential moving average (EMA) calculation 

-- first set the delimiter to $$ 
-- otherwise, it will treat the normal ';' as end statement
DELIMITER $$   

-- execute a drop if the function exists
-- in the example, our db is stock
-- we call the function cal_ema
DROP function IF EXISTS `stock`.`func_ema`$$

-- in the () Identifies the in parameters
-- for ema calculation, 3 parameters are needed
CREATE function func_ema(
  in_period INT,
  in_prior_ema FLOAT,
  in_current_price FLOAT
)
-- specify the return data type as 
-- float with 2 decimal points
RETURNS FLOAT (5,2)
DETERMINISTIC
-- to calculate ema, 3 values are needed
-- var in_period: is the ema period 
-- for example, to get a 10 day ema, pass in 10 as the parameter
-- var in_prior_ema: is the prior day ema
-- var in_current_price: is the current price

BEGIN
        -- declare the ema variable
        -- to store the calculated value
        DECLARE ema FLOAT(5,2); 
        
        -- perform the calculation
        SET ema = ((in_current_price * ( 2 / ( in_period + 1 ))) 
                + (in_prior_ema * (1 - (2 / (in_period + 1)))));
        -- round the result to 2 decimal points
        SET ema = ROUND(ema, 2);
        
        -- return the result
        return ema;
-- end the stored function code block
END $$

-- to execute the function
-- let say a 10 day ema
-- 57.87 is the prior day 10 day ema
-- 59.27 is the current price

mysql> SELECT func_ema(10, 57.87, 59.27);
+---------------------------+
| func_ema(10, 57.87, 59.27)|
+---------------------------+
|                     58.12 |
+---------------------------+
1 row in set (0.00 sec)

mysql>


 
-- Listing 2. MYSQL Stored Procedure
-- calculation EMA 
DROP PROCEDURE IF EXISTS `stock`.`proc_cal_ema`$$


CREATE PROCEDURE proc_cal_ema(
  IN in_period INT,
  IN in_prior_ema FLOAT,
  IN in_current_price FLOAT
)
-- to calculate ema, 3 values are needed
-- var in_period: is the ema period 
-- for example, to get a 15 day ema, pass in 15 as the parameter
-- var in_prior_ema: is the prior day ema
-- var in_current_price: is the current price

BEGIN
        DECLARE ema FLOAT; 
        SET ema = ((in_current_price * ( 2 / ( in_period + 1 ))) 
                + (in_prior_ema * (1 - (2 / (in_period + 1)))));
        SET ema = ROUND(ema, 2);
        SELECT ema;
END $$

