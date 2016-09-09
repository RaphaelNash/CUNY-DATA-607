/*
LAB 2-2
Raphael Nash
In this week’s folder, you are given instructions for restoring the tb database into MySQL. 
After we’ve loaded our tb database into our database server, we’ll want to create a .CSV 
file to load into Excel (or another spreadsheet program).

Specifically, we want to export a .CSV file that contains total tuberculosis cases by country by year. 
So we need to do some data transformation work in SQL to get our SELECT statement how we want it, then wrap 
the SELECT statement into a statement that exports the data to a .CSV file. Then we load the .CSV file into Excel.
On the right is the first few rows of the resultset that we want to get from the SELECT 
statement that we’ll run against the tb table in our tb database. 
This will require two transformations on the single table.

*/


select country, year, sum( coalesce(child, 0) + coalesce(adult, 0) +coalesce( elderly,0 )) Cases
INTO OUTFILE '/tmp/tb-output-rnash.csv'
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '\\'
LINES TERMINATED BY '\n'
from tb
group by 
country, year having sum( coalesce(child, 0) + coalesce(adult, 0) +coalesce( elderly,0 ))  > 0
; 
