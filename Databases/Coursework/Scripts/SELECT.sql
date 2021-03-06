SELECT PT.MODEL, W.NAME
FROM PRODUCT P, PRODUCT_TYPE PT, WORKSHOP W
WHERE PT.WORKSHOP_ID=W.ID
AND P.TYPE_ID=PT.ID;

SELECT P.NAME, COUNT(*)
FROM PRODUCT P, PRODUCT_TYPE PT, WORKSHOP W, SECTOR S, SECTOR_OPERATION SO
WHERE P.TYPE_ID=PT.ID
AND PT.WORKSHOP_ID=W.ID
AND S.WORKSHOP_ID=W.ID
AND SO.SECTOR_ID=S.ID
AND SO.OP_PRODUCT_ID=P.ID
AND TO_CHAR(SO.START_DATE,'yyyy') LIKE 2014
GROUP BY P.NAME;


SELECT W.LAST_NAME, P.NAME, S.NAME
FROM WORKER W, POSITION P, BRIGADE B, SECTOR_OPERATION SO, SECTOR S
WHERE W.POSITION_ID=P.ID
AND W.BRIGADE_ID=B.ID
AND SO.BRIGADE_ID=B.ID
AND SO.SECTOR_ID=S.ID
AND S.ID=1; 


SELECT SECTOR.NAME, WORKSHOP.NAME, WORKER.LAST_NAME
FROM SECTOR, WORKSHOP, WORKER
WHERE SECTOR.WORKSHOP_ID=WORKSHOP.ID
AND SECTOR.SECTOR_CHIEF_ID=WORKER.ID;


SELECT SECTOR_OPERATION.NAME, PRODUCT.NAME
FROM SECTOR_OPERATION, PRODUCT
WHERE SECTOR_OPERATION.OP_PRODUCT_ID=PRODUCT.ID
AND PRODUCT.NAME LIKE 'Nissan Qashqai';


SELECT BRIGADE.ID, SECTOR.NAME
FROM BRIGADE, SECTOR, SECTOR_OPERATION
WHERE BRIGADE.OPERATION_ID=SECTOR_OPERATION.ID
AND SECTOR_OPERATION.SECTOR_ID=SECTOR.ID
AND SECTOR.ID=1;


SELECT WORKER.LAST_NAME, SECTOR.NAME
FROM WORKER, SECTOR
WHERE SECTOR.MASTER_ID=WORKER.ID;


SELECT P.NAME
FROM PRODUCT P, PRODUCT_TYPE PT, WORKSHOP W, SECTOR S, SECTOR_OPERATION SO
WHERE P.TYPE_ID=PT.ID
AND PT.WORKSHOP_ID=W.ID
AND S.WORKSHOP_ID=W.ID
AND SO.SECTOR_ID=S.ID
AND SO.OP_PRODUCT_ID=P.ID
AND SO.END_DATE IS NULL;


SELECT BRIGADE.ID
FROM BRIGADE, SECTOR_OPERATION, PRODUCT
WHERE SECTOR_OPERATION.OP_PRODUCT_ID=PRODUCT.ID
AND SECTOR_OPERATION.BRIGADE_ID=BRIGADE.ID
AND PRODUCT.NAME LIKE 'Nissan Qashqai';


SELECT TEST_LAB.NAME
FROM TEST_LAB, TEST, PRODUCT
WHERE TEST.TEST_PRODUCT_ID=PRODUCT.ID
AND TEST.TEST_LAB_ID=TEST_LAB.ID
AND PRODUCT.NAME LIKE 'Nissan Qashqai';


SELECT PRODUCT.NAME
FROM TEST_LAB, TEST, PRODUCT
WHERE TEST.TEST_PRODUCT_ID=PRODUCT.ID
AND TEST.TEST_LAB_ID=TEST_LAB.ID
AND TEST_LAB.ID=1
AND TO_CHAR(TEST.START_DATE,'yyyy') LIKE 2014;


SELECT WORKER.LAST_NAME
FROM TEST_LAB, TEST, PRODUCT, WORKER
WHERE TEST.TEST_PRODUCT_ID=PRODUCT.ID
AND TEST.TEST_LAB_ID=TEST_LAB.ID
AND WORKER.TEST_LAB_ID=TEST_LAB.ID
AND TEST_LAB.ID=1
AND TO_CHAR(TEST.START_DATE,'yyyy') LIKE 2014
AND PRODUCT.NAME LIKE 'Nissan Qashqai';



SELECT TEST.TEST_TOOL
FROM TEST_LAB, TEST, PRODUCT
WHERE TEST.TEST_PRODUCT_ID=PRODUCT.ID
AND TEST.TEST_LAB_ID=TEST_LAB.ID
AND TO_CHAR(TEST.START_DATE,'yyyy') LIKE 2014
AND PRODUCT.NAME LIKE 'Nissan Qashqai';



SELECT P.NAME, COUNT(*)
FROM PRODUCT P, PRODUCT_TYPE PT, WORKSHOP W, SECTOR S, SECTOR_OPERATION SO
WHERE P.TYPE_ID=PT.ID
AND PT.WORKSHOP_ID=W.ID
AND S.WORKSHOP_ID=W.ID
AND SO.SECTOR_ID=S.ID
AND SO.OP_PRODUCT_ID=P.ID
AND SO.END_DATE IS NULL
GROUP BY P.NAME;