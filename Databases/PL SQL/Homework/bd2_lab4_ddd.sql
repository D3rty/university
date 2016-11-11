-- DLAB4 specification
CREATE OR REPLACE PACKAGE KEMSU2.DLAB4
  AS

  PROCEDURE LAB4_1(INP_DEPT_ID   IN NUMBER,
                   UPD_REGION_ID IN NUMBER);
  PROCEDURE LAB4_2(V_SALARY IN NUMBER);
  PROCEDURE LAB4_3(INP_FIRM IN VARCHAR2,
                   INP_ITEM IN VARCHAR2);

END DLAB4;
/
-- DLAB4 body
CREATE OR REPLACE PACKAGE BODY KEMSU2.DLAB4 AS
-----------------------
PROCEDURE LAB4_1(INP_DEPT_ID   IN NUMBER,
                                   UPD_REGION_ID IN NUMBER)
  IS
    NAME_ALREADY_EXIST     EXCEPTION;
    DEPT_ERROR    EXCEPTION;
    REG_ERROR     EXCEPTION;
    TMP           NUMBER;
    TMP_DEPT_NAME VARCHAR2(20);
    CURSOR CURS IS
        SELECT *
          FROM S_DEPT
          WHERE ID = INP_DEPT_ID;
    CUR_TMP       CURS % ROWTYPE;
  BEGIN

    SELECT COUNT(*)
      INTO TMP
      FROM S_REGION
      WHERE ID = UPD_REGION_ID;
    IF (TMP < 1)
    THEN
      RAISE REG_ERROR;
    END IF;

    OPEN CURS;
    FETCH CURS INTO CUR_TMP;
    IF CURS % NOTFOUND
    THEN
      RAISE DEPT_ERROR;
    END IF;

    SELECT NAME
      INTO TMP_DEPT_NAME
      FROM S_DEPT
      WHERE S_DEPT.ID = INP_DEPT_ID;

    SELECT COUNT(*)
      INTO TMP
      FROM S_DEPT
      WHERE NAME = TMP_DEPT_NAME
        AND REGION_ID = UPD_REGION_ID;

    IF (TMP > 0)
    THEN
      RAISE NAME_ALREADY_EXIST;
    END IF;

    UPDATE S_DEPT
      SET REGION_ID = UPD_REGION_ID
      WHERE ID = INP_DEPT_ID;

  EXCEPTION
    WHEN REG_ERROR THEN DBMS_OUTPUT.PUT_LINE('ERROR: REGION DOES NOT EXIST');
    WHEN DEPT_ERROR THEN DBMS_OUTPUT.PUT_LINE('ERROR: DEPARTMENT DOES NOT EXIST');
    WHEN NAME_ALREADY_EXIST THEN DBMS_OUTPUT.PUT_LINE('ERROR: SAME DEPARTMENT ALREADY EXIST');
  END LAB4_1;


-----------------------
PROCEDURE LAB4_2(V_SALARY IN NUMBER)
  AS
    TMP_SALARY    NUMBER;
    TMP_LAST_NAME VARCHAR(20);
    TMP_DEPT_NAME VARCHAR(20);
    TMP_COUNT     NUMBER;
  BEGIN

    SELECT S_EMP.LAST_NAME,
           S_EMP.SALARY,
           S_DEPT.NAME
      INTO TMP_LAST_NAME,
           TMP_SALARY,
           TMP_DEPT_NAME
      FROM S_EMP,
           S_DEPT
      WHERE S_EMP.DEPT_ID = S_DEPT.ID
        AND v_salary >= S_EMP.SALARY - 100
        AND v_salary <= S_EMP.SALARY + 100;

    DBMS_OUTPUT.PUT_LINE(TMP_LAST_NAME || TMP_DEPT_NAME);

  EXCEPTION
    WHEN NO_DATA_FOUND THEN DBMS_OUTPUT.PUT_LINE('There are no employees with this salary');
    WHEN TOO_MANY_ROWS THEN SELECT COUNT(*)
          INTO TMP_COUNT
          FROM S_EMP,
               S_DEPT
          WHERE S_EMP.DEPT_ID = S_DEPT.ID
            AND v_salary >= S_EMP.SALARY - 100
            AND v_salary <= S_EMP.SALARY + 100;
        DBMS_OUTPUT.PUT_LINE('There are ' || TMP_COUNT || ' employees with this salary');
  END LAB4_2;


-----------------------
PROCEDURE LAB4_3(INP_FIRM IN VARCHAR2,
                                          INP_ITEM IN VARCHAR2)
  AS
    TYPE NumList IS TABLE OF NUMBER;
    TYPE NameList IS TABLE OF S_PRODUCT.NAME % TYPE;
    PRODUCT  NameList;
    CUSTOMER NameList;
    QUANTITY NumList;
    PRICE    NumList;
    pcount   NUMBER;
  BEGIN

    IF INP_ITEM IS NULL
      AND INP_FIRM IS NOT NULL
    THEN
      EXECUTE IMMEDIATE 'SELECT S_CUSTOMER.NAME,
        S_PRODUCT.NAME,
             S_ITEM.QUANTITY,
             S_ITEM.PRICE
        FROM S_CUSTOMER,
             S_ORD,
             S_PRODUCT,
             S_ITEM
        WHERE S_ORD.CUSTOMER_ID = S_CUSTOMER.ID
          AND S_ITEM.ORD_ID = S_ORD.ID
          AND S_ITEM.PRODUCT_ID = S_PRODUCT.ID
      AND S_CUSTOMER.NAME LIKE :INP_FIRM'
        BULK COLLECT INTO CUSTOMER,
                          PRODUCT,
                          QUANTITY,
                          PRICE
      USING INP_FIRM;

      EXECUTE IMMEDIATE 'SELECT COUNT(*)
        FROM S_CUSTOMER,
             S_ORD,
             S_PRODUCT,
             S_ITEM
        WHERE S_ORD.CUSTOMER_ID = S_CUSTOMER.ID
          AND S_ITEM.ORD_ID = S_ORD.ID
          AND S_ITEM.PRODUCT_ID = S_PRODUCT.ID
      AND S_CUSTOMER.NAME LIKE :INP_FIRM'
        INTO pcount
      USING INP_FIRM;

      DBMS_OUTPUT.PUT_LINE('CUSTOMER   |   PRODUCT   |   QUANTITY   |   PRICE');
      FOR i IN 1 .. pcount
      LOOP
        DBMS_OUTPUT.PUT_LINE(CUSTOMER(i) || '  |  ' || PRODUCT(i) || '  |  ' || QUANTITY(i) || '  |  ' || PRICE(i));
      END LOOP;
    END IF;


    IF INP_FIRM IS NOT NULL
      AND INP_ITEM IS NOT NULL
    THEN
      EXECUTE IMMEDIATE 'SELECT S_CUSTOMER.NAME, 
        S_PRODUCT.NAME,
             S_ITEM.QUANTITY,
             S_ITEM.PRICE
        FROM S_CUSTOMER,
             S_ORD,
             S_PRODUCT,
             S_ITEM
        WHERE S_ORD.CUSTOMER_ID = S_CUSTOMER.ID
          AND S_ITEM.ORD_ID = S_ORD.ID
          AND S_ITEM.PRODUCT_ID = S_PRODUCT.ID
          AND S_CUSTOMER.NAME LIKE :INP_FIRM
          AND S_PRODUCT.NAME LIKE :IMP_ITEM'
        BULK COLLECT INTO CUSTOMER,
                          PRODUCT,
                          QUANTITY,
                          PRICE
      USING INP_FIRM, INP_ITEM;

      EXECUTE IMMEDIATE 'SELECT COUNT(*)
        FROM S_CUSTOMER,
             S_ORD,
             S_PRODUCT,
             S_ITEM
        WHERE S_ORD.CUSTOMER_ID = S_CUSTOMER.ID
          AND S_ITEM.ORD_ID = S_ORD.ID
          AND S_ITEM.PRODUCT_ID = S_PRODUCT.ID
          AND S_CUSTOMER.NAME LIKE :INP_FIRM
          AND S_PRODUCT.NAME LIKE :IMP_ITEM'
        INTO pcount
      USING INP_FIRM, INP_ITEM;

      DBMS_OUTPUT.PUT_LINE('CUSTOMER | PRODUCT | QUANTITY | PRICE');
      FOR i IN 1 .. pcount
      LOOP
        DBMS_OUTPUT.PUT_LINE(CUSTOMER(i) || ' | ' || PRODUCT(i) || ' | ' || QUANTITY(i) || ' | ' || PRICE(i));
      END LOOP;
    END IF;


    IF INP_FIRM IS NULL
      AND INP_ITEM IS NOT NULL
    THEN
      EXECUTE IMMEDIATE 'SELECT S_PRODUCT.NAME,
             S_ITEM.QUANTITY,
             S_ITEM.PRICE
        FROM S_CUSTOMER,
             S_ORD,
             S_PRODUCT,
             S_ITEM
        WHERE S_ORD.CUSTOMER_ID = S_CUSTOMER.ID
          AND S_ITEM.ORD_ID = S_ORD.ID
          AND S_ITEM.PRODUCT_ID = S_PRODUCT.ID
          AND S_PRODUCT.NAME LIKE :IMP_ITEM'
        BULK COLLECT INTO PRODUCT,
                          QUANTITY,
                          PRICE
      USING INP_ITEM;

      EXECUTE IMMEDIATE 'SELECT COUNT(*)
        FROM S_CUSTOMER,
             S_ORD,
             S_PRODUCT,
             S_ITEM
        WHERE S_ORD.CUSTOMER_ID = S_CUSTOMER.ID
          AND S_ITEM.ORD_ID = S_ORD.ID
          AND S_ITEM.PRODUCT_ID = S_PRODUCT.ID
          AND S_PRODUCT.NAME LIKE :IMP_ITEM'
        INTO pcount
      USING INP_ITEM;

      DBMS_OUTPUT.PUT_LINE('PRODUCT | QUANTITY | PRICE');
      FOR i IN 1 .. pcount
      LOOP
        DBMS_OUTPUT.PUT_LINE(PRODUCT(i) || ' | ' || QUANTITY(i) || ' | ' || PRICE(i));
      END LOOP;
    END IF;

  END LAB4_3;

END DLAB4;
/