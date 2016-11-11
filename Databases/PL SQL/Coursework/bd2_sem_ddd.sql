CREATE TABLE WORKER (
  ID          INTEGER PRIMARY KEY,
  LOGIN       VARCHAR2(99)
  CONSTRAINT WORKER_LOGIN_NN NOT NULL,
  PASSWORD    VARCHAR2(99)
  CONSTRAINT WORKER_PASSWORD_NN NOT NULL,
  LAST_NAME   VARCHAR2(99)
  CONSTRAINT WORKER_LAST_NAME_NN NOT NULL,
  FIRST_NAME  VARCHAR2(99)
  CONSTRAINT WORKER_FIRST_NAMEE_NN NOT NULL,
  START_DATE  DATE      
  CONSTRAINT WORKER_START_DATE_NN NOT NULL,
  POSITION_ID INTEGER,
  BRIGADE_ID  INTEGER,
  CONSTRAINT FK_WORKER_POSITION_ID FOREIGN KEY (POSITION_ID) REFERENCES POSITION (ID)
)
/

INSERT INTO WORKER (
  ID, LOGIN, PASSWORD, FIRST_NAME, LAST_NAME, START_DATE, POSITION_ID
)
VALUES (1, 's_homer', 'p_homer', 'Homer', 'Simpson', TO_DATE('23.05.1996', 'dd.mm.yyyy'), 1)
/

INSERT INTO WORKER (
  ID, LOGIN, PASSWORD, FIRST_NAME, LAST_NAME, START_DATE, POSITION_ID
)
VALUES (2, 'f_ned', 'p_ned', 'Ned', 'Flanders', TO_DATE('21.03.1999', 'dd.mm.yyyy'), 2)
/

INSERT INTO WORKER (
  ID, LOGIN, PASSWORD, FIRST_NAME, LAST_NAME, START_DATE, POSITION_ID
)
VALUES (3, 'b_kent', 'p_kent', 'Kent', 'Brockman', TO_DATE('14.02.2001', 'dd.mm.yyyy'), 3)
/

INSERT INTO WORKER (
  ID, LOGIN, PASSWORD, FIRST_NAME, LAST_NAME, START_DATE, POSITION_ID
)
VALUES (4, 'g_barney', 'p_barney', 'Barney', 'Gumble', TO_DATE('23.08.1998', 'dd.mm.yyyy'), 1)
/

INSERT INTO WORKER (
  ID, LOGIN, PASSWORD, FIRST_NAME, LAST_NAME, START_DATE, POSITION_ID
)
VALUES (5, 's_cletus', 'p_cletus', 'Cletus', 'Spuckler', TO_DATE('06.05.2003', 'dd.mm.yyyy'), 2)
/

INSERT INTO WORKER (
  ID, LOGIN, PASSWORD, FIRST_NAME, LAST_NAME, START_DATE, POSITION_ID
)
VALUES (6, 's_moe', 'p_moe', 'Moe', 'Szyslak', TO_DATE('03.12.2005', 'dd.mm.yyyy'), 3)
/

INSERT INTO WORKER (
  ID, LOGIN, PASSWORD, FIRST_NAME, LAST_NAME, START_DATE, POSITION_ID
)
VALUES (7, 'w_ralph', 'p_ralph', 'Ralph', 'Wiggum', TO_DATE('01.01.2015', 'dd.mm.yyyy'), 1)
/

INSERT INTO WORKER (
  ID, LOGIN, PASSWORD, FIRST_NAME, LAST_NAME, START_DATE, POSITION_ID
)
VALUES (8, 'b_montgomery', 'p_montgomery', 'Montgomery', 'Burns', TO_DATE('14.01.2012', 'dd.mm.yyyy'), 2)
/

INSERT INTO WORKER (
  ID, LOGIN, PASSWORD, FIRST_NAME, LAST_NAME, START_DATE, POSITION_ID
)
VALUES (9, 'b_selma', 'p_selma', 'Selma', 'Bouvier', TO_DATE('12.12.2012', 'dd.mm.yyyy'), 3)
/

INSERT INTO WORKER (
  ID, LOGIN, PASSWORD, FIRST_NAME, LAST_NAME, START_DATE, POSITION_ID
)
VALUES (10, 'b_jasper', 'p_jasper', 'Jasper', 'Beardly', TO_DATE('08.11.2001', 'dd.mm.yyyy'), 1)
/

INSERT INTO WORKER (
  ID, LOGIN, PASSWORD, FIRST_NAME, LAST_NAME, START_DATE, POSITION_ID, BRIGADE_ID
)
VALUES (11, 'a_aristotle', 'p_aristotle', 'Aristotle', 'Amadopolis', TO_DATE('28.11.2011', 'dd.mm.yyyy'), 4, 1)
/

INSERT INTO WORKER (
  ID, LOGIN, PASSWORD, FIRST_NAME, LAST_NAME, START_DATE, POSITION_ID, BRIGADE_ID
)
VALUES (12, 'k_edna', 'p_edna', 'Edna', 'Krabappel', TO_DATE('04.06.2010', 'dd.mm.yyyy'), 5, 1)
/

INSERT INTO WORKER (
  ID, LOGIN, PASSWORD, FIRST_NAME, LAST_NAME, START_DATE, POSITION_ID, BRIGADE_ID
)
VALUES (13, 'c_dan', 'p_dan', 'Dan', 'Castellaneta', TO_DATE('07.11.2001', 'dd.mm.yyyy'), 6, 2)
/

INSERT INTO WORKER (
  ID, LOGIN, PASSWORD, FIRST_NAME, LAST_NAME, START_DATE, POSITION_ID, BRIGADE_ID
)
VALUES (14, 'l_lenny', 'p_lenny', 'Lenny', 'Leonard', TO_DATE('08.01.2009', 'dd.mm.yyyy'), 4, 2)
/

INSERT INTO WORKER (
  ID, LOGIN, PASSWORD, FIRST_NAME, LAST_NAME, START_DATE, POSITION_ID, BRIGADE_ID
)
VALUES (15, 'm_otto', 'p_otto', 'Otto', 'Mann', TO_DATE('03.05.2002', 'dd.mm.yyyy'), 5, 3)
/

INSERT INTO WORKER (
  ID, LOGIN, PASSWORD, FIRST_NAME, LAST_NAME, START_DATE, POSITION_ID, BRIGADE_ID
)
VALUES (16, 'p_martin', 'p_martin', 'Martin', 'Prince', TO_DATE('05.09.2001', 'dd.mm.yyyy'), 6, 3)
/

CREATE TABLE POSITION (
  ID        NUMBER(7) PRIMARY KEY,
  NAME      VARCHAR2(20)
  CONSTRAINT POSITION_NAME_NN NOT NULL,
  WORK_TYPE VARCHAR2(20)
  CONSTRAINT POSITION_WORK_TYPE_NN NOT NULL
)
/

INSERT INTO POSITION (
  ID, NAME, WORK_TYPE
)
VALUES (1, 'ENGINEER', 'TECH')
/

INSERT INTO POSITION (
  ID, NAME, WORK_TYPE
)
VALUES (2, 'TECHNOLOGIST', 'TECH')
/

INSERT INTO POSITION (
  ID, NAME, WORK_TYPE
)
VALUES (3, 'TECHNICAN', 'TECH')
/

INSERT INTO POSITION (
  ID, NAME, WORK_TYPE
)
VALUES (4, 'WELDER', 'LABOR')
/

INSERT INTO POSITION (
  ID, NAME, WORK_TYPE
)
VALUES (5, 'ASSEMBLER', 'LABOR')
/

INSERT INTO POSITION (
  ID, NAME, WORK_TYPE
)
VALUES (6, 'PAINTER', 'LABOR')
/

INSERT INTO POSITION (
  ID, NAME, WORK_TYPE
)
VALUES (7, 'TESTER', 'TESTER')
/

CREATE TABLE LOGGING (
  ID           NUMBER(9),
  INFO         VARCHAR2(9999),
  LOGIN        VARCHAR2(99),
  POSITION     VARCHAR2(99),
  NEW_POSITION VARCHAR2(99),
  ACTION_DATE  DATE
)
/ 

CREATE SEQUENCE LOG_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE PROCEDURE KEMSU2.ADD_POSITION(INP_ID        IN NUMBER,
                                                INP_NAME      IN VARCHAR2,
                                                INP_WORK_TYPE IN VARCHAR2)
  AS
  BEGIN

    EXECUTE IMMEDIATE 'INSERT INTO POSITION
    VALUES (:inp_id, :inp_name, :INP_WORK_TYPE)'
    USING INP_ID, INP_NAME, INP_WORK_TYPE;

  END;
/

CREATE OR REPLACE PROCEDURE KEMSU2.ADD_WORKER(INP_ID          IN NUMBER,
                                              INP_LOGIN       IN VARCHAR2,
                                              INP_PASSWORD    IN VARCHAR2,
                                              INP_FIRST_NAME  IN VARCHAR2,
                                              INP_LAST_NAME   IN VARCHAR2,
                                              INP_START_DATE  IN DATE,
                                              INP_POSITION_ID IN NUMBER,
                                              INP_BRIGADE_ID  IN NUMBER)
  AS
  BEGIN

    EXECUTE IMMEDIATE 'INSERT INTO WORKER
    VALUES (:inp_id, :inp_login, tohash(:inp_password), :inp_last_name, :inp_first_name, :inp_start_date, :inp_position_id, :inp_brigade_id)'
    USING INP_ID, INP_LOGIN, INP_PASSWORD, INP_FIRST_NAME, INP_LAST_NAME, INP_START_DATE, INP_POSITION_ID, INP_BRIGADE_ID;

  END;
/

CREATE OR REPLACE PROCEDURE KEMSU2.AUTHORIZATE(INP_LOGIN       IN VARCHAR2,
                                               INP_PASSWORD    IN VARCHAR2,
                                               inp_position_id IN NUMBER)
  AS
  BEGIN

    IF (ISAUTHENTICATION(INP_LOGIN, INP_PASSWORD)
      AND ISROLETRUE(INP_LOGIN, inp_position_id))
    THEN
      DBMS_OUTPUT.PUT_LINE('Authorization complete');
      INSERT INTO LOGGING (
        ID, INFO, LOGIN, POSITION, ACTION_DATE
      )
      VALUES (LOG_SEQ.NEXTVAL, 'Authorization complete', INP_LOGIN, inp_position_id, SYSDATE);
    ELSIF (ISAUTHENTICATION(INP_LOGIN, INP_PASSWORD))
    THEN
      DBMS_OUTPUT.PUT_LINE('Authentication complete');
      INSERT INTO LOGGING (
        ID, INFO, LOGIN, ACTION_DATE
      )
      VALUES (LOG_SEQ.NEXTVAL, 'Authentication complete. Role is wrong', INP_LOGIN, SYSDATE);
    END IF;

  END;
/

CREATE OR REPLACE PROCEDURE KEMSU2.DELETE_POSITION(INP_ID IN NUMBER)
  AS
  BEGIN

    EXECUTE IMMEDIATE
    'DELETE FROM POSITION WHERE ID = :inp_id'
    USING INP_ID;

  END;
/

CREATE OR REPLACE PROCEDURE KEMSU2.DELETE_POSITION_FOR_WORKER(worker_id IN NUMBER)
  AS
  BEGIN

    UPDATE WORKER
      SET POSITION_ID = ''
      WHERE ID = worker_id;

  END;
/

CREATE OR REPLACE PROCEDURE KEMSU2.DELETE_WORKER(INP_ID IN NUMBER)
  AS
  BEGIN

    EXECUTE IMMEDIATE
    'DELETE FROM WORKER WHERE ID = :inp_id'
    USING INP_ID;

  END;
/

CREATE OR REPLACE PROCEDURE KEMSU2.PRINTLOG(INP_LOGIN      IN VARCHAR2,
                                            INP_START_DATE IN DATE,
                                            inp_end_date   IN DATE,
                                            inp_action     IN VARCHAR2)
  AS
    sql_statment     VARCHAR2(9999);
    sql_statment1    VARCHAR2(9999);
    sql_comma        VARCHAR2(1) := NULL;

    TYPE NumList IS TABLE OF NUMBER;
    TYPE NameList IS TABLE OF LOGGING.INFO % TYPE;
    TYPE DateList IS TABLE OF VARCHAR2(999);
    cursID           NumList;
    cursINFO         NameList;
    cursLOGIN        NameList;
    cursPOSITION     NameList;
    cursNEW_POSITION NameList;
    cursACTION_DATE  DateList;
    strcount         NUMBER(38);
  BEGIN

    sql_statment := 'SELECT action_date, INFO  FROM LOGGING WHERE ID IS NOT NULL';
    sql_statment1 := 'SELECT count(*)  FROM LOGGING WHERE ID IS NOT NULL';

    IF (INP_LOGIN IS NOT NULL)
    THEN
      sql_statment := sql_statment || ' ' || ' AND lower(LOGIN) = lower(:inp_login)';
      sql_statment1 := sql_statment1 || ' ' || ' AND lower(LOGIN) = lower(:inp_login)';
    END IF;

    IF (inp_action IS NOT NULL)
    THEN
      sql_statment := sql_statment || ' ' || ' AND LOWER(INFO) = LOWER(:inp_action)';
      sql_statment1 := sql_statment1 || ' ' || ' AND LOWER(INFO) = LOWER(:inp_action)';
    END IF;

    IF (INP_START_DATE IS NOT NULL)
      AND (inp_end_date IS NOT NULL)
    THEN
      sql_statment := sql_statment || ' ' || ' AND action_date BETWEEN :inp_start_date AND :inp_end_date';
      sql_statment1 := sql_statment1 || ' ' || ' AND action_date BETWEEN :inp_start_date AND :inp_end_date';
    END IF;


    IF (inp_action IS NULL
      AND INP_START_DATE IS NULL
      AND inp_end_date IS NULL
      AND INP_LOGIN IS NOT NULL)
    THEN
      EXECUTE IMMEDIATE sql_statment
        BULK COLLECT INTO cursACTION_DATE,
                          cursINFO
      USING INP_LOGIN;
      EXECUTE IMMEDIATE sql_statment1
        INTO strcount
      USING INP_LOGIN;
    END IF;


    IF (INP_LOGIN IS NULL
      AND INP_START_DATE IS NULL
      AND inp_end_date IS NULL
      AND inp_action IS NOT NULL)
    THEN
      EXECUTE IMMEDIATE sql_statment
        BULK COLLECT INTO cursACTION_DATE,
                          cursINFO
      USING inp_action;
      EXECUTE IMMEDIATE sql_statment1
        INTO strcount
      USING inp_action;
    END IF;


    IF (inp_action IS NULL
      AND INP_LOGIN IS NULL
      AND INP_START_DATE IS NOT NULL
      AND inp_end_date IS NOT NULL)
    THEN
      EXECUTE IMMEDIATE sql_statment
        BULK COLLECT INTO cursACTION_DATE,
                          cursINFO
      USING INP_START_DATE, inp_end_date;
      EXECUTE IMMEDIATE sql_statment1
        INTO strcount
      USING INP_START_DATE, inp_end_date;
    END IF;


    IF (inp_action IS NULL
      AND INP_LOGIN IS NOT NULL
      AND INP_START_DATE IS NOT NULL
      AND inp_end_date IS NOT NULL)
    THEN
      EXECUTE IMMEDIATE sql_statment
        BULK COLLECT INTO cursACTION_DATE,
                          cursINFO
      USING INP_LOGIN, INP_START_DATE, inp_end_date;
      EXECUTE IMMEDIATE sql_statment1
        INTO strcount
      USING INP_LOGIN, INP_START_DATE, inp_end_date;
    END IF;


    IF (INP_LOGIN IS NULL
      AND inp_action IS NOT NULL
      AND INP_START_DATE IS NOT NULL
      AND inp_end_date IS NOT NULL)
    THEN
      EXECUTE IMMEDIATE sql_statment
        BULK COLLECT INTO cursACTION_DATE,
                          cursINFO
      USING inp_action, INP_START_DATE, inp_end_date;
      EXECUTE IMMEDIATE sql_statment1
        INTO strcount
      USING inp_action, INP_START_DATE, inp_end_date;
    END IF;


    IF (INP_START_DATE IS NULL
      AND inp_end_date IS NULL
      AND INP_LOGIN IS NOT NULL
      AND inp_action IS NOT NULL)
    THEN
      EXECUTE IMMEDIATE sql_statment
        BULK COLLECT INTO cursACTION_DATE,
                          cursINFO
      USING INP_LOGIN, inp_action;
      EXECUTE IMMEDIATE sql_statment1
        INTO strcount
      USING INP_LOGIN, inp_action;
    END IF;


    IF (INP_START_DATE IS NOT NULL
      AND inp_end_date IS NOT NULL
      AND INP_LOGIN IS NOT NULL
      AND inp_action IS NOT NULL)
    THEN
      EXECUTE IMMEDIATE sql_statment
        BULK COLLECT INTO cursACTION_DATE,
                          cursINFO
      USING INP_LOGIN, inp_action, INP_START_DATE, inp_end_date;
      EXECUTE IMMEDIATE sql_statment1
        INTO strcount
      USING INP_LOGIN, inp_action, INP_START_DATE, inp_end_date;
    END IF;

    FOR I IN 1 .. strcount
    LOOP
      DBMS_OUTPUT.PUT_LINE(cursACTION_DATE(I) || ' - ' || cursINFO(I));
    END LOOP;

  END;
/

CREATE OR REPLACE PROCEDURE KEMSU2.SET_POSITION_FOR_WORKER(worker_id       IN NUMBER,
                                                           inp_position_id IN NUMBER)
  AS
  BEGIN

    UPDATE WORKER
      SET POSITION_ID = inp_position_id
      WHERE ID = worker_id;

  END;
/

CREATE OR REPLACE PROCEDURE KEMSU2.UPDATE_POSITION(POSITION_ID   IN NUMBER,
                                                   INP_NAME      IN VARCHAR2,
                                                   INP_WORK_TYPE IN VARCHAR2)
  AS
  BEGIN

    UPDATE POSITION
      SET NAME = INP_NAME, WORK_TYPE = INP_WORK_TYPE
      WHERE ID = POSITION_ID;

  END;
/

CREATE OR REPLACE PROCEDURE KEMSU2.UPDATE_WORKER(worker_id      IN NUMBER,
                                                 INP_LOGIN      IN VARCHAR2,
                                                 INP_PASSWORD   IN VARCHAR2,
                                                 INP_FIRST_NAME IN VARCHAR2,
                                                 INP_LAST_NAME  IN VARCHAR2,
                                                 INP_START_DATE IN DATE,
                                                 INP_BRIGADE_ID IN NUMBER)
  AS
  BEGIN

    UPDATE WORKER
      SET LOGIN = INP_LOGIN, PASSWORD = TOHASH(INP_PASSWORD), LAST_NAME = INP_LAST_NAME, FIRST_NAME = INP_FIRST_NAME, START_DATE = INP_START_DATE, BRIGADE_ID = INP_BRIGADE_ID
      WHERE ID = worker_id;

  END;
/

CREATE OR REPLACE FUNCTION KEMSU2.ISAUTHENTICATION(INP_LOGIN    IN VARCHAR2,
                                                   INP_PASSWORD IN VARCHAR2)
  RETURN BOOLEAN
  AS
    pass VARCHAR2(99);
  BEGIN

    SELECT PASSWORD
      INTO pass
      FROM WORKER
      WHERE LOGIN = INP_LOGIN;

    IF TOHASH(INP_PASSWORD) = pass
    THEN
      RETURN TRUE;
    ELSE
      DBMS_OUTPUT.PUT_LINE('Invalid password');
      RETURN FALSE;
    END IF;

  EXCEPTION
    WHEN NO_DATA_FOUND THEN DBMS_OUTPUT.PUT_LINE('There are no workers with this login');
  END;
/

CREATE OR REPLACE FUNCTION KEMSU2.ISROLETRUE(inp_login       IN VARCHAR2,
                                             inp_position_id IN NUMBER)
  RETURN BOOLEAN
  AS
    true_position NUMBER(20);
  BEGIN

    SELECT POSITION_ID
      INTO true_position
      FROM WORKER
      WHERE LOGIN = inp_login;

    IF inp_position_id = true_position
    THEN
      RETURN TRUE;
    ELSE
      DBMS_OUTPUT.PUT_LINE('Invalid position');
      RETURN FALSE;
    END IF;

  END;
/

CREATE OR REPLACE FUNCTION KEMSU2.TOHASH(p_in IN VARCHAR2)
  RETURN VARCHAR2
  IS
    l_hash VARCHAR2(2000);
  BEGIN
    l_hash := RAWTOHEX(UTL_RAW.CAST_TO_RAW(DBMS_OBFUSCATION_TOOLKIT.MD5(INPUT_STRING => p_in)));
    RETURN l_hash;
  END;
/