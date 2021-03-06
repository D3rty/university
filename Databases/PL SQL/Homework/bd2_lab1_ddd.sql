
CREATE or REPLACE PROCEDURE MY_PROCEDURE
AS
BEGIN
DBMS_OUTPUT.PUT_LINE('MY PROCEDURE WORKS');
END;
/

CREATE or REPLACE PROCEDURE NEW_DEPT
(NEW_DEPT_ID IN NUMBER,
NEW_DEPT_NAME IN VARCHAR2,
NEW_DEPT_REGION_ID IN NUMBER)
AS
BEGIN
INSERT INTO S_DEPT (ID, NAME, REGION_ID)
VALUES(NEW_DEPT_ID, NEW_DEPT_NAME, NEW_DEPT_REGION_ID);
END;
/

CREATE or REPLACE PROCEDURE DEPT_REG_UPD 
(UPD_DEPT_ID IN NUMBER, 
UPD_REGION_ID IN NUMBER) 
IS 
BEGIN 
UPDATE S_DEPT 
SET REGION_ID = UPD_REGION_ID 
WHERE ID = UPD_DEPT_ID; 
COMMIT; 
END;
/

CREATE or REPLACE PROCEDURE DEL_DEPT 
(DEL_DEPT_ID NUMBER) 
IS 
BEGIN 
DELETE 
FROM S_DEPT 
WHERE ID = DEL_DEPT_ID; 
END;
/

CREATE or REPLACE PROCEDURE NEW_EMP 
(NEW_EMP_ID IN NUMBER,
NEW_EMP_LAST_NAME IN VARCHAR2,
NEW_EMP_FIRST_NAME IN VARCHAR2,
NEW_EMP_USER_ID IN NUMBER,
NEW_EMP_START_DATE IN VARCHAR2,
NEW_EMP_COMMENTS IN VARCHAR2,
NEW_EMP_MANAGER_ID IN NUMBER,
NEW_EMP_TITLE IN VARCHAR2,
NEW_EMP_DEPT_ID IN NUMBER,
NEW_EMP_SALARY IN NUMBER,
NEW_EMP_COMMISSION_PCT IN NUMBER)
AS
BEGIN
INSERT INTO S_EMP(ID, LAST_NAME, FIRST_NAME, USERID, START_DATE, COMMENTS, MANAGER_ID, TITLE, DEPT_ID, SALARY, COMMISSION_PCT)
VALUES(NEW_EMP_ID, NEW_EMP_LAST_NAME, NEW_EMP_FIRST_NAME, NEW_EMP_USER_ID, TO_DATE(NEW_EMP_START_DATE,'DD.MM.YYYY'),
 NEW_EMP_COMMENTS, NEW_EMP_MANAGER_ID, NEW_EMP_TITLE, NEW_EMP_DEPT_ID, NEW_EMP_SALARY, NEW_EMP_COMMISSION_PCT);
END;
/

CREATE OR REPLACE PROCEDURE COUNT (NUM1 IN NUMBER, NUM2 IN NUMBER, TEMP OUT NUMBER)
AS
BEGIN
TEMP := NUM1/NUM2 + NUM2;
DBMS_OUTPUT.PUT_LINE(TEMP);
END;
/

CREATE or REPLACE FUNCTION SALARY 
(TMP_EMP_ID IN NUMBER, 
TMP_EMP_BONUS OUT NUMBER, 
TMP_EMP_SALARY OUT NUMBER, 
TMP_EMP_END OUT NUMBER) 
RETURN NUMBER 
IS 
BEGIN 
SELECT COMMISSION_PCT*0.01 
INTO TMP_EMP_BONUS 
FROM S_EMP 
WHERE TMP_EMP_ID=ID; 

SELECT SALARY 
INTO TMP_EMP_SALARY 
FROM S_EMP 
WHERE TMP_EMP_ID=ID; 

IF TMP_EMP_BONUS IS NOT NULL THEN 
TMP_EMP_END:=(TMP_EMP_SALARY+TMP_EMP_SALARY*TMP_EMP_BONUS)*12; 
END IF; 

IF TMP_EMP_SALARY IS NULL THEN 
TMP_EMP_END:=0; 
END IF; 

RETURN TMP_EMP_END; 
END;
/