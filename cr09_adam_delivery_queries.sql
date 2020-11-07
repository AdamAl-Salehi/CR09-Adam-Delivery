--report 1(how many packages were sent from cities that have the letter (a) in their name)

SELECT COUNT(address.city)
from address
JOIN customer on customer.fk_customer_addressId  = address.addressId
JOIN package on package.fk_sender_customer = customer.customerId
where city LIKE '%a%';

--report2(who sent the packages queried in the first report)

SELECT firstName, lastName, fk_sender_customer, city,packageId
from address
JOIN customer on customer.fk_customer_addressId  = address.addressId
JOIN package on package.fk_sender_customer = customer.customerId
where city LIKE '%a%';

--report3(who sent packages/mail between 2020-10-28 and 2020-11-01 employeeID that collected the package and the date of collecting)(3 JOINS used)

SELECT customer.firstName, customer.lastName, fk_sender_customer, packageId, dateOfCollecting, fk_collecting_employeeId
FROM collect
JOIN package on package.packageId= collect.fk_packageId
JOIN customer on customer.customerId = package.fk_sender_customer
JOIN employee on employee.employeeId = collect.fk_collecting_employeeId
WHERE collect.dateOfCollecting BETWEEN "2020-10-28" AND "2020-11-01"

--report4(packages that are still haven't been delivered)

SELECT delivery.fk_packageId, delivery.deliveryId, delivery.dateOfDelivering, delivery.fk_delivery_employeeId
FROM  delivery
JOIN employee on employee.employeeId= delivery.fk_delivery_employeeId
WHERE delivery.dateOfDelivering is null

--report5(How many rows we have in each table in the database)

SELECT table_name, table_rows
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = 'cr09_adam_delivery';

--report6(customers who have the letter (a) in their first name AND live in a street that has the letter (r) in its name)

SELECT firstName, lastName, city, street
FROM customer
JOIN address ON address.addressId= customer.fk_customer_addressId
WHERE firstName LIKE '%a%' AND  address.street LIKE '%r%'