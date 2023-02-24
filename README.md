## Bulk Collect and For All - PL/SQL
Bulk data processing with bulk collect and forall are a powerfull tool in terms of transactions with big ammounts of data. This method is way faster than Cursor/ForLoop, offering more performance and efficiency. 

![label](https://img.shields.io/badge/Language-PLSQL-brightgreen)

### Bulk Collect x Cursor
Bulk collect is generally faster than using a cursor in PL/SQL, especially when processing a large number of rows. That happens because Cursors fetch data row by row, each fetch operation retrieves a single row from the database. This can be inefficient, especially if you need to process a large number of rows.

Bulk collect, on the other hand, allows you to fetch multiple rows at once and process them in memory using a collection. 


