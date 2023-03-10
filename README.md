## Bulk Collect and For All - PL/SQL
Bulk data processing with bulk collect and forall are a powerfull tool in terms of transactions with big ammounts of data. This method is way faster than Cursor/ForLoop, offering more performance and efficiency. 

![label](https://img.shields.io/badge/Language-PLSQL-brightgreen)

### Bulk Collect x Cursor
Bulk collect is generally faster than using a cursor in PL/SQL, especially when processing a large number of rows. That happens because Cursors fetch data row by row, each fetch operation retrieves a single row from the database. This can be inefficient, especially if you need to process a large number of rows.

Bulk collect, on the other hand, allows you to fetch multiple rows at once and process them in memory using a collection. 

### Using Bulk Collect/For All

The syntax of this method using Bulk Collect/ForAll statements is as follows:

- Update:
```
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
```

- Insert:
```
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
```

### Understanding the syntax
```
 TYPE record_type IS RECORD (field1 INTEGER, field2 VARCHAR(50), field3 number(5));
```
This statement is used to define a custom data type called a **record** in PL/SQL. A record is a composite data type that contains a set of related fields. 

```
TYPE table_type IS TABLE OF record_type;
```
 This statement is used to define a custom collection type in PL/SQL. It allows to create a **collection** of multiple values of the same datatype. In this method we define that our table_type (collection) will receive the composite data type (record).

```
collection1 table_type;
```
The final declaration is a variable called collection1 that receives the table_type collection.

```
BEGIN
  SELECT field1, field2, field3
  BULK COLLECT INTO collection1
  FROM table1;  
```
This statement is used to fetch multiple rows of data from a SQL query and store them in a PL/SQL collection variable, in this case we are storing the data into collection1.

```
FORALL i IN collection1.FIRST..collection1.LAST
  UPDATE table2
  SET field1 = collection1(i).field1, 
  field2 = collection1(i).field2   
  WHERE field3 = collection1(i).field3;
```
The **FORALL** statement is used to perform a bulk operation on a PL/SQL collection. It is more efficient than looping through each element and performing individual operations.

### Conclusion

The bulk data processing in PL/SQL is an excellent solution for optimize performance in your transactions.

