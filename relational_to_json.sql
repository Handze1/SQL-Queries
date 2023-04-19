-- Query:
-- 1) Groups payments by studentNumber (sum)
-- 2) Joined students table with payments table
-- 3) selected student number, Lastname, firstName, creditLimit

select json_object(studentNumber, FirstName, LastName, creditLimit)
from RealParsmodel.payments 
join RealParsmodel.students
using (studentNumber)
group by studentNumber;


