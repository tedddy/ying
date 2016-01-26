-- First enable the global event scheduler:

SET GLOBAL event_scheduler = ON;

-- You can check if it is running by doing:

SHOW PROCESSLIST;

-- Your created events should now execute.
