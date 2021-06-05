-- Determining the designation of the package size from the 
-- selected S, M, L, XL. The selection is made based on the 
-- result of adding the shortest and longest edges of the parcel.
create or replace FUNCTION parcelSize(
 x_dim NUMBER,
 y_dim NUMBER, 
 z_dim NUMBER
)
RETURN VARCHAR2 
AS 
parcel_size VARCHAR2(2);
max_dim NUMBER;
min_dim NUMBER;
sum_dim NUMBER;

BEGIN

SELECT GREATEST(x_dim, y_dim, z_dim) 
INTO max_dim 
FROM dual;

SELECT LEAST(x_dim, y_dim, z_dim)
INTO min_dim
FROM dual;

sum_dim := max_dim + min_dim; 

IF sum_dim < 40 THEN -- S
parcel_size := 'S';

ELSIF sum_dim < 80 THEN -- M
parcel_size := 'M';

ELSIF sum_dim  < 150 THEN -- L
parcel_size := 'L';

ELSIF sum_dim < 200 THEN -- XL
parcel_size := 'XL';

ELSE
DBMS_OUTPUT.PUT_LINE('Parcel too big!!');
END IF;

RETURN parcel_size;
END parcelSize;
