-- DLAB3 specification
CREATE OR REPLACE PACKAGE KEMSU2.DLAB3 
  AS

  PROCEDURE LAB3_1(n IN NUMBER);
  PROCEDURE LAB3_2;
  PROCEDURE LAB3_3(inp_n IN NUMBER);
  PROCEDURE LAB3_5(wy    IN NUMBER,
                   total IN NUMBER,
                   flag  IN NUMBER);
  PROCEDURE LAB3_6(date1         IN DATE,
                   date2         IN DATE,
                   SUM_PRICE     IN BOOLEAN,
                   ITEM_QUANTITY IN BOOLEAN,
                   ORD_QUANTITY  IN BOOLEAN);

END DLAB3;
/

-- DLAB3 body
CREATE OR REPLACE PACKAGE BODY KEMSU2.DLAB3
  AS

  PROCEDURE LAB3_1(n IN NUMBER)
    AS
      CURSOR TOP_DOGS_CURSOR IS
          SELECT LAST_NAME,
                 SALARY
            FROM S_EMP
            WHERE SALARY IS NOT NULL
            ORDER BY SALARY DESC;
    BEGIN

      FOR ITEM_RECORD IN TOP_DOGS_CURSOR
      LOOP
        DBMS_OUTPUT.PUT_LINE(ITEM_RECORD.LAST_NAME || ' ' || ITEM_RECORD.SALARY);
        EXIT WHEN TOP_DOGS_CURSOR % ROWCOUNT > n;
      END LOOP;

    END;
  ------------------------------------------------
  PROCEDURE LAB3_2
    IS
      N NUMBER;
      I NUMBER;
      CURSOR EMP_COMM IS
          SELECT ID,
                 NVL(COMMISSION_PCT, 0) COMMISSION
            FROM S_EMP
            ORDER BY COMMISSION DESC;

    --ALTER TABLE S_EMP
    --ADD STARS VARCHAR2(100);

    BEGIN
      FOR CUR_EMP IN EMP_COMM
      LOOP
        N := ROUND(CUR_EMP.COMMISSION);
        IF (N > 0)
        THEN
          FOR I IN 1 .. N
          LOOP
            UPDATE S_EMP
              SET STARS = STARS || '*'
              WHERE ID = CUR_EMP.ID;
          END LOOP;
        ELSE
          DBMS_OUTPUT.PUT_LINE('No commission');
          EXIT;
        END IF;
      END LOOP;

    END;
  --------------------------------------
  PROCEDURE LAB3_3(inp_n IN NUMBER)
    AS

      CURSOR TOP_DOGS_CURSOR IS
          SELECT LAST_NAME,
                 SALARY
            FROM S_EMP
            WHERE SALARY IS NOT NULL
            ORDER BY SALARY DESC;

      PREV_SAL NUMBER := 0;
      N        NUMBER := inp_n;
    BEGIN


      FOR CUR_EMP IN TOP_DOGS_CURSOR
      LOOP

        IF CUR_EMP.SALARY = PREV_SAL
        THEN
          N := N + 1;
        END IF;

        PREV_SAL := CUR_EMP.SALARY;

        DBMS_OUTPUT.PUT_LINE(CUR_EMP.LAST_NAME || ' ' || CUR_EMP.SALARY);
        EXIT WHEN TOP_DOGS_CURSOR % ROWCOUNT > N - 1;
      END LOOP;

    END;

  ------------------------------------------------
  PROCEDURE LAB3_5(wy    IN NUMBER,
                   total IN NUMBER,
                   flag  IN NUMBER)
    AS
      CURSOR EMP_CURSOR IS
          SELECT MANAG.LAST_NAME MANAGER,
                 EMP.LAST_NAME EMPLOYER
            FROM S_EMP EMP,
                 S_EMP MANAG
            WHERE EMP.MANAGER_ID = MANAG.ID
              AND TRUNC(MONTHS_BETWEEN(SYSDATE, EMP.START_DATE) / 12) >= wy;
      CURSOR MANAG_CURSOR IS
          SELECT S_EMP.LAST_NAME,
                 SUM(total) SUMTOT
            FROM S_ORD,
                 S_EMP
            WHERE S_ORD.SALES_REP_ID = S_EMP.ID
            GROUP BY S_EMP.LAST_NAME;
      OUTPUT   VARCHAR2(9999);
      EMPLINE  VARCHAR2(9999) := '';
      PREV_MNG VARCHAR2(9999) := '';
    BEGIN

      IF (flag = 1)
      THEN
        FOR CUR_EMP IN EMP_CURSOR
        LOOP
          IF CUR_EMP.MANAGER = PREV_MNG
          THEN
            EMPLINE := EMPLINE || ', ' || CUR_EMP.EMPLOYER;
          ELSE
            OUTPUT := PREV_MNG || ': ' || EMPLINE;
            DBMS_OUTPUT.PUT_LINE(OUTPUT);
            EMPLINE := CUR_EMP.EMPLOYER;
          END IF;
          PREV_MNG := CUR_EMP.MANAGER;
        END LOOP CURS;
      END IF;


      IF (flag = 2)
      THEN
        FOR CUR_MANAG IN MANAG_CURSOR
        LOOP
          IF CUR_MANAG.SUMTOT > total
          THEN
            DBMS_OUTPUT.PUT_LINE(CUR_MANAG.LAST_NAME);
          END IF;
        END LOOP CURS;
      END IF;

    END;

  -----------------------------------------
  PROCEDURE LAB3_6(date1         IN DATE,
                   date2         IN DATE,
                   SUM_PRICE     IN BOOLEAN,
                   ITEM_QUANTITY IN BOOLEAN,
                   ORD_QUANTITY  IN BOOLEAN)
    AS
      TYPE RATING_REF IS REF CURSOR;
      sql_statment  VARCHAR2(4000);
      sql_comma     VARCHAR2(1) := NULL;
      rating_cursor RATING_REF;
      RATE_ITEM     S_PRODUCT.NAME % TYPE;
    BEGIN

      sql_statment := 'SELECT S_PRODUCT.NAME
        FROM S_ORD,
             S_ITEM,
             S_PRODUCT
        WHERE S_ITEM.ORD_ID = S_ORD.ID
          AND S_ITEM.PRODUCT_ID = S_PRODUCT.ID
      AND TO_DATE(S_ORD.DATE_ORDERED, ''dd/MM/YYYY'') BETWEEN TO_DATE(date1, ''dd/MM/YYYY'') AND TO_DATE(date2, ''dd/MM/YYYY'')
        GROUP BY S_PRODUCT.NAME';

      IF (SUM_PRICE IS NOT NULL)
        OR (ITEM_QUANTITY IS NOT NULL)
        OR (ORD_QUANTITY IS NOT NULL)
      THEN
        sql_statment := sql_statment || ' ORDER BY ';
      END IF;

      IF (SUM_PRICE IS NOT NULL)
      THEN
        sql_statment := sql_statment || sql_comma || ' SUM(S_ITEM.QUANTITY * S_ITEM.PRICE) DESC';
        sql_comma := ',';
      END IF;

      IF (ITEM_QUANTITY IS NOT NULL)
      THEN
        sql_statment := sql_statment || sql_comma || ' SUM(S_ITEM.QUANTITY) DESC';
        sql_comma := ',';
      END IF;

      IF (ORD_QUANTITY IS NOT NULL)
      THEN
        sql_statment := sql_statment || sql_comma || ' COUNT(*) DESC';
      END IF;

      OPEN rating_cursor FOR sql_statment;
      LOOP
        FETCH rating_cursor INTO RATE_ITEM;
        DBMS_OUTPUT.PUT_LINE(RATE_ITEM);
        EXIT WHEN rating_cursor % NOTFOUND;
      END LOOP;
      CLOSE rating_cursor;

    END;

END DLAB3;