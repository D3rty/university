CREATE SEQUENCE STUD_SEQ
INCREMENT BY 2
START WITH 124
MAXVALUE 9999
MINVALUE 9
CACHE 3
NOCYCLE;

SELECT sequence_name, min_value, max_value, increment_by, last_number
FROM user_sequences
WHERE sequence_name LIKE 'STUD_SEQ';

DROP SEQUENCE STUD_SEQ;



CREATE INDEX s_emp_name_idx
ON s_emp(last_name, first_name);

SELECT ic.index_name, ic.column_name, ic.column_position col_pos,ix.uniqueness
FROM user_indexes ix, user_ind_columns ic
WHERE ic.index_name = ix.index_name
AND ic.table_name = 'S_EMP';

DROP INDEX s_emp_name_idx;