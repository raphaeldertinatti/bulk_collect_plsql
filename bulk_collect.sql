--example bulk collect update:

DECLARE
  TYPE record_type IS RECORD (field1 INTEGER, field2 VARCHAR(50), field3 number(5));
  TYPE table_type IS TABLE OF record_type;
  collection1 table_type;
BEGIN
  SELECT field1, field2, field3
  BULK COLLECT INTO collection1
  FROM table1;  

  FORALL i IN collection1.FIRST..collection1.LAST
  UPDATE table2
  SET field1 = collection1(i).field1, 
  field2 = collection1(i).field2   
  WHERE field3 = collection1(i).field3;
END;

--example bulk collect insert:

DECLARE
  TYPE record_type IS RECORD (field1 INTEGER, field2 VARCHAR(50), field3 number(5));
  TYPE table_type IS TABLE OF record_type;
  collection1 table_type;
BEGIN
  SELECT field1, field2, field3
  BULK COLLECT INTO collection1
  FROM table1;  

  FORALL i IN collection1.FIRST..collection1.LAST
    INSERT INTO table2 (field1, field2, field3) 
    values 
    (collection1(i).field1, collection1(i).field2,collection1(i).field3);
END;