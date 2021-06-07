-- Updates the vehicle assigned to the courier
create or replace PROCEDURE updateVehicle(
    curr_id NUMBER,
    new_veh_reg_num VARCHAR2
)
AS 
BEGIN
-- Update of the couriers table
UPDATE couriers 
SET VEHICLE_ID = 
    -- Selects the vehicle ID with a given license plate
    (SELECT VEHICLE_ID
    FROM vehicles 
    WHERE registration_num = new_veh_reg_num)
-- Selection Criterion
WHERE courier_id = curr_id;

END;
