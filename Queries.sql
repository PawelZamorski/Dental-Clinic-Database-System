-- Created by Pawel Zamorski G00364553@gmit.ie

-- 
-- Basic SELECT, INSERT, UPDATE, DELETE AND CREATE queries
-- 

-- QUERY NO 1: selecting all data from 'patient' table

SELECT * FROM patient;

-- QUERY NO 2: inserting new data into 'patient' table

INSERT INTO patient VALUES (122, 'John', 'Lewis', 'Male', '254 High Street', "Mallow", '+83 523 517 2248', '+23 256 893 0716', 'john3453@icio.us', 'post', false, NULL, NULL);

-- QUERY NO 3: updating a patient data

UPDATE patient SET gender = 'Male', address = '87 Upper Street', mobile = '+35 564 254 7584' WHERE patientNumber = 120;

-- QUERY NO 4: deleting a patient data

DELETE FROM patient WHERE patientNumber = 122;

-- QUERY NO 5: creating the view for all patients having first appointment.

CREATE VIEW MulcahyAppointment AS SELECT * FROM appointment WHERE employeeNumber = 1;

-- 
-- QUERIES BASED ON GIVEN SCENARIO 
-- 

-- QUERY NO 6: selecting all treatments, their category and price offered by Dr Mulcahy. 
-- Data are sorted according to 'category'.

SELECT employee.employeeNumber, employee.lastName, treatment.treatmentName, category.category, treatmentoffered.price 
	FROM employee, treatmentoffered, treatment, category 
	WHERE employee.employeeNumber = 1 
		AND employee.employeeNumber = treatmentoffered.employeeNumber 
		AND treatmentoffered.treatmentNumber = treatment.treatmentNumber 
		AND treatment.categoryNumber = category.categoryNumber;

-- QUERY NO 7: selecting all employee number, employee last name, treatments, their category and price which are not 
-- offered by Dr Mulcahy and are offered by other dentists Dr Mulcahy cooperates with. 
-- Data are sorted according to 'lastName', 'category' and 'treatmneName'.

SELECT employee.employeeNumber, employee.lastName, treatment.treatmentName, category.category, treatmentoffered.price 
	FROM employee, treatmentoffered, treatment, category 
	WHERE employee.employeeNumber = treatmentoffered.employeeNumber 
		AND treatmentoffered.treatmentNumber = treatment.treatmentNumber 
		AND treatment.categoryNumber = category.categoryNumber 
		AND treatment.treatmentName NOT IN 
			(SELECT treatment.treatmentName 
				FROM employee, treatmentoffered, treatment 
				WHERE employee.employeeNumber = 1 
					AND employee.employeeNumber = treatmentoffered.employeeNumber 
					AND treatmentoffered.treatmentNumber = treatment.treatmentNumber) 
	ORDER BY employee.lastName, category.category, treatment.treatmentName;

-- QUERY NO 8: checking if the patient no 101 has 'overdue' bill

SELECT patient.patientNumber, patient.lastName, bill.appointmentNumber AS billNumber, bill.amount, bill.paymentStatus 
	FROM patient, appointment, bill 
	WHERE patient.patientNumber = appointment.patientNumber 
		AND appointment.appointmentNumber = bill.appointmentNumber 
		AND patient.patientNumber = 101 
		AND bill.paymentStatus = 'overdue';

-- QUERY NO 9: checking if any patient has any 'pending' bills and the sum of bills is greater than 100.00

SELECT patient.patientNumber, patient.lastName, SUM(bill.amount), bill.paymentStatus 
	FROM patient, appointment, bill 
	WHERE patient.patientNumber = appointment.patientNumber 
		AND appointment.appointmentNumber = bill.appointmentNumber 
		AND bill.paymentStatus = 'PENDING' 
	GROUP BY patient.patientNumber 
	HAVING SUM(bill.amount) > 100;

-- QUERY NO 10: checking if any payment has overdue.

SELECT patient.patientNumber, patient.lastName, bill.appointmentNumber AS billNumber, bill.amount, bill.paymentStatus 
	FROM patient, appointment, bill 
	WHERE patient.patientNumber = appointment.patientNumber 
		AND appointment.appointmentNumber = bill.appointmentNumber 
		AND bill.paymentStatus = 'overdue';



-- BELOWE IS AN SCENARIO FOR INSERTING NEW APPOINTMENT FOR EXISTING OR FOR NEW PATIENT

-- QUERY NO 11: checking for an available appointment slot for Dr. Mulcahy in a range of dates ie. 3 days (
-- BETWEEN 2018-04-25 AND 2018-04-27)

SELECT employee.lastName, workschema.workDateTime 
	FROM employee, workschema 
	WHERE employee.employeeNumber = workschema.employeeNumber 
		AND employee.employeeNumber = 1 
		AND workschema.workDateTime BETWEEN '2018-04-25 08:00:00' AND '2018-04-27 11:00:00' 
		AND workschema.workDateTime NOT IN 
			(SELECT appointment.appointmentDateTime 
			FROM appointment, employee 
			WHERE appointment.employeeNumber = employee.employeeNumber 
				AND employee.employeeNumber = 1 
				AND appointment.appointmentDateTime BETWEEN '2018-04-25 08:00:00' AND '2018-04-27 11:00:00');

-- QUERY NO 12: checking if a patient already exist in the database by selecting the patient details by first and last name.
--  This statement will result two rows, as only 'patientNumber' which is primary key identifies the patient.

SELECT * FROM patient WHERE firstName = 'Antone' AND lastName = 'Fogg';

-- QUERY NO 13: inserting new appointment for patient no 119 to dr Mulcahy on 2018-04-27 at 10:00:00

START TRANSACTION; -- Starting transaction

SELECT @nextApptNumber := MAX(appointmentNumber) + 1 FROM appointment; -- creating the next available appointmentNumber

INSERT INTO appointment VALUES (@nextApptNumber, 119, 1, '2018-04-27 09:00:00', 'ARRANGED', 'Description of a planned treatment', NULL, NULL); -- inserting new appointment

COMMIT;


-- QUERY NO 14: inserting the new patient and setting an appointment for the new patient 
			-- to dr Mulcahy on 2018-04-27 at 11:00:00. 
			-- The following attributes are set as default: firstVisit, teethDescription, healthHistoryForm

START TRANSACTION; -- starting transaction

SELECT @nextPatientNo := MAX(patientNumber) + 1 FROM patient; -- creatING the next available patientNumber;

-- inserting new patient
INSERT INTO patient (patientNumber, firstName, lastName, gender, address, landline, mobile, email, preferedContact) 
	VALUES (@nextPatientNo, 'Adam', 'Newish', 'Male', '1 Low Street', NULL, '+12 256 893 0716', 'john@icio.us', 'mobile');
	
SELECT @nextApptNumber := MAX(appointmentNumber) + 1 FROM appointment; -- creating the next appointmentNumber

-- inserting new appointment
INSERT INTO appointment VALUES 
(@nextApptNumber, @nextPatientNo, 1, '2018-04-27 10:00:00', 'ARRANGED', 'Description of a planned treatment', NULL, NULL); 

COMMIT; -- committing transaction

-- QUERY NO 15: Rearranging the appointment:

UPDATE appointment SET appointmentDateTime = '2018-04-27 11:00:00' WHERE appointmentNumber = 21;

-- QUERY NO 16: Canceling the appointment. Updating the appointment table and inserting data into cancellation table.

START TRANSACTION; -- starting the transaction
SELECT @apptDateTime := appointmentDateTime FROM appointment WHERE appointmentNumber = 9; -- date of canceled appointment
INSERT INTO cancellation VALUES (9, @apptDateTime, CURRENT_TIMESTAMP);  -- inserting data into cancellation table 
UPDATE appointment SET appointmentDateTime = NULL, appointmentStatus = 'CANCELLED' WHERE appointmentNumber = 9; 
-- updating appointment table. Setting the appointmentDateTime to NULL and appointmentStatus to 'CANCELED'.
COMMIT; -- committing the transaction

-- QUERY NO 17: checking if the cancellation was late, ie. 24 hours cancellation policy 
-- The result will be minus, due to using CURRENT_TIMESTAMP in a previous statement QUERY NO 16.

SELECT @apptDateTime := appointmentDateTime FROM cancellation WHERE appointmentNumber = 9;
SELECT @cancelDateTime := cancellationDateTime FROM cancellation WHERE appointmentNumber = 9;
SELECT timestampdiff(hour, @cancelDateTime, @apptDateTime); 

-- QUERY NO 18: inserting new bill for late cancellation

START TRANSACTION; 
SET @appointmentNumber = 9; -- setting variable;
SELECT @cancellationDate := DATE(cancellationDateTime) 
	FROM cancellation 
	WHERE appointmentNumber = @appointmentNumber; 
INSERT INTO bill (appointmentNumber, amount, issuedDate, dueDate) -- 'paymentStatus' is default
	VALUES (@appointmentNumber, 10.00, @cancellationDate, '2018-04-30');
COMMIT;

-- 	QUERY NO 19: checking all appointments for the next 4 days for dr. Mulcahy 
-- between ('2018-04-24 09:00:00' AND '2018-04-27 12:00:00')

SELECT appointment.appointmentNumber, patient.patientNumber, appointment.appointmentDateTime, patient.firstName, 
patient.lastName, appointment.appointmentStatus, patient.preferedContact, patient.address, patient.landline, 
patient.mobile, patient.email 
	FROM appointment, patient 
	WHERE appointment.patientNumber = patient.patientNumber 
		AND appointment.appointmentDateTime BETWEEN '2018-04-24 08:00:00' AND '2018-04-27 11:00:00' 
		AND appointment.employeeNumber = 1 
	ORDER BY appointment.appointmentDateTime;
	
-- 	QUERY NO 20: checking 'arranged' and 'confirmed' appointments for the next 4 days for dr. Mulcahy 
-- between ('2018-04-24 09:00:00' AND '2018-04-27 12:00:00')
	
SELECT appointment.appointmentNumber, patient.patientNumber, appointment.appointmentDateTime, patient.firstName, 
patient.lastName, appointment.appointmentStatus, patient.preferedContact, patient.address, patient.landline, 
patient.mobile, patient.email 
	FROM appointment, patient 
	WHERE appointment.patientNumber = patient.patientNumber 
		AND appointment.appointmentDateTime BETWEEN '2018-04-24 08:00:00' AND '2018-04-27 11:00:00' 
		AND appointment.appointmentStatus IN('ARRANGED', 'CONFIRMED') 
		AND appointment.employeeNumber = 1 
	ORDER BY appointment.appointmentDateTime;

		
-- QUERY NO 21: checking the unpaid bills and the patients details (number, first and last name), 
-- bill number, amount, issued date, payment status, appointment date

SELECT patient.patientNumber, patient.firstName, patient.lastName, bill.appointmentNumber AS billNumber, bill.amount, bill.issuedDate, bill.paymentStatus, patient.address, appointment.appointmentDateTime, appointment.appointmentStatus
	FROM patient, appointment, bill 
	WHERE patient.patientNumber = appointment.patientNumber 
	AND appointment.appointmentNumber = bill.appointmentNumber 
	AND NOT bill.paymentStatus = 'paid';
	
-- QUERY NO 22: checking which treatments, category, final price and description were carried during appointment no 5

SELECT appointmentdetail.appointmentNumber, treatment.treatmentName, category.category, appointmentdetail.finalPrice,
 appointmentdetail.description 
	FROM appointmentdetail, treatmentoffered, treatment, category 
	WHERE appointmentdetail.treatmentNumber = treatmentoffered.treatmentNumber 
		AND appointmentdetail.employeeNumber = treatmentoffered.employeeNumber 
		AND treatmentoffered.treatmentNumber = treatment.treatmentNumber 
		AND treatment.categoryNumber = category.categoryNumber 
		AND appointmentdetail.appointmentNumber = 5;


-- QUERY NO 23: checking the sum for all treatments carried out during particular appointment no 5 

SELECT SUM(finalPrice) FROM appointmentdetail WHERE appointmentNumber = 5;
	
-- QUERY NO 24: checking how much a patient owns if the payment was partial for appointment no 5

SELECT bill.appointmentNumber AS billNumber, bill.amount - (SELECT SUM(payment.amountPaid) 
			FROM payment 
			WHERE payment.appointmentNumber = 5) AS ownedSum
	FROM bill 
	WHERE bill.appointmentNumber = 5;
	
-- QUERY NO 25: checking all treatments carried out for the patient no 103 with details

SELECT appointmentdetail.employeeNumber, employee.lastName, appointment.appointmentNumber, appointment.appointmentDateTime,
 treatment.treatmentName, category.category, appointmentdetail.finalPrice, appointmentdetail.description 
	FROM employee, appointment, appointmentdetail, treatmentoffered, treatment, category 
	WHERE appointment.appointmentNumber = appointmentdetail.appointmentNumber 
		AND employee.employeeNumber = appointmentdetail.employeeNumber 
		AND appointmentdetail.employeeNumber = treatmentoffered.employeeNumber 
		AND appointmentdetail.treatmentNumber = treatmentoffered.treatmentNumber 
		AND treatmentoffered.treatmentNumber = treatment.treatmentNumber 
		AND treatment.categoryNumber = category.categoryNumber 
		AND appointment.patientNumber = 103;


-- QUERY NO 26: updating prices of treatment only for dr Mulcahy. 

UPDATE treatmentoffered SET price = price + (price * 0.1) WHERE employeeNumber = 1;

-- QUERY NO 27: inserting a payment into the payment table. 2 payment for the same bill.

START TRANSACTION; -- Starting transaction

SELECT @nextPaymentNumber := MAX(paymentNumber) + 1 FROM payment; -- creating the next available paymnetNumber

INSERT INTO payment (paymentNumber, appointmentNumber, amountPaid, paymentDate, paymentMethod) 
	VALUES (@nextPaymentNumber, 5, 100.00, CURRENT_DATE, 'CASH'); -- inserting new payment

COMMIT;

START TRANSACTION; -- Starting transaction

SELECT @nextPaymentNumber := MAX(paymentNumber) + 1 FROM payment; -- creating the next available paymnetNumber

INSERT INTO payment (paymentNumber, appointmentNumber, amountPaid, paymentDate, paymentMethod) 
	VALUES (@nextPaymentNumber, 5, 110.00, CURRENT_DATE, 'CASH'); -- inserting new payment

COMMIT;

-- QUERY NO 28: checking how much a patient owns if the payment was partial

SELECT bill.appointmentNumber AS billNumber, bill.amount - 
		(SELECT IFNULL (SUM(payment.amountPaid), 0)  -- IFNULL function if there was no payments 
			FROM payment 
			WHERE payment.appointmentNumber = 5) AS ownedSum
	FROM bill 
	WHERE bill.appointmentNumber = 5;
	
-- QUERY NO 29: changing the 'paymentStatus' in 'bill' table if the payment was full

UPDATE bill SET paymentStatus = 'PAID' WHERE appointmentNumber = 5;

-- QUERY NO 30: checking the description of all appointments for the patient no 103, including branch number, 
-- doctor name, patient number, first and last name, the appointment date and time, status, aim, 
-- history and description about the next planned treatment ('followUPTreatment').

SELECT branch.branchNumber, employee.lastName, appointment.patientNumber, patient.firstName, patient.lastName, 
appointment.appointmentDateTime, appointment.appointmentStatus, appointment.apptAim, appointment.apptHistory, 
appointment.followUpTreatment 
	FROM branch, employee, appointment, patient 
	WHERE branch.branchNumber = employee.branchNumber 
		AND employee.employeeNumber = appointment.employeeNumber 
		AND appointment.patientNumber = patient.patientNumber 
		AND patient.patientNumber = 103;


-- QUERY NO 31: checking the description of the last visited appointment from 'appointment' table for the patient no 103, 
-- including branch number, doctor name, patient number, first and last name, the 
-- appointment date and time, status, aim, history and description about the next planned treatment ('followUPTreatment').

SELECT branch.branchNumber, employee.lastName, appointment.patientNumber, patient.firstName, patient.lastName, 
appointment.appointmentDateTime, appointment.appointmentStatus, appointment.apptAim, appointment.apptHistory, 
appointment.followUpTreatment 
	FROM branch, employee, appointment, patient 
	WHERE branch.branchNumber = employee.branchNumber 
		AND employee.employeeNumber = appointment.employeeNumber 
		AND appointment.patientNumber = patient.patientNumber 
		AND patient.patientNumber = 103
		AND appointment.appointmentDateTime = (SELECT MAX(appointmentDateTime) 
			FROM appointment 
			WHERE patientNumber = 103 
			AND appointmentStatus = 'VISITED');

-- 	QUERY NO 32: checking the details ('appointmentDetail') about the last carried out appointment for the patient no 103

SELECT employee.lastName, appointment.appointmentDateTime, treatment.treatmentName, category.category, 
appointmentdetail.finalPrice, appointmentdetail.description 
	FROM employee, appointment, appointmentdetail, treatmentoffered, treatment, category 
	WHERE employee.employeeNumber = treatmentoffered.employeeNumber 
		AND appointmentdetail.appointmentNumber = appointment.appointmentNumber 
		AND appointmentdetail.treatmentNumber = treatmentoffered.treatmentNumber 
		AND appointmentdetail.employeeNumber = treatmentoffered.employeeNumber 
		AND treatmentoffered.treatmentNumber = treatment.treatmentNumber
		AND treatment.categoryNumber = category.categoryNumber 
		AND patientNumber = 103 
		AND appointmentDateTime = (SELECT MAX(appointmentDateTime) 
			FROM appointment 
			WHERE patientNumber = 103 
				AND appointmentStatus = 'VISITED');


-- QUERY NO 33: selecting a specialist who offers treatment that dr Mulcahy does not provide, ie 'CT SCAN', 
-- and for available appointments between 2018-04-25 and 2018-04-27

SELECT branch.address, branch.city, employee.lastName, workschema.workDateTime, treatment.treatmentName, category.category,
 treatmentoffered.price 
	FROM branch, employee, workschema, treatmentoffered, treatment, category 
	WHERE branch.branchNumber = employee.branchNumber 
		AND employee.employeeNumber = workschema.employeeNumber 
		AND employee.employeeNumber = treatmentoffered.employeeNumber 
		AND treatmentoffered.treatmentNumber = treatment.treatmentNumber 
		AND treatment.categoryNumber = category.categoryNumber 
		AND treatment.treatmentName = 'CT SCAN' 
		AND workschema.workDateTime BETWEEN '2018-04-25 08:00:00' AND '2018-04-27 11:00:00' 
		AND workschema.workDateTime NOT IN 
			(SELECT appointment.appointmentDateTime 
			FROM appointment, employee 
			WHERE appointment.employeeNumber = employee.employeeNumber 
			AND appointment.appointmentDateTime BETWEEN '2018-04-25 08:00:00' AND '2018-04-27 11:00:00');

-- QUERY NO 34: selecting how many appointments dr Mulcahy carried out in the last 2 days 
-- (BETWEEN '2018-04-23 09:00:00' AND '2018-04-24 12:00:00')

SELECT COUNT(*) FROM appointment 
	WHERE employeeNumber = 1 
	AND appointmentStatus = 'VISITED' 
	AND appointmentDateTime BETWEEN '2018-04-23 08:00:00' AND '2018-04-24 11:00:00';
	
-- 	QUERY NO 35: selecting the sum of bills for treatments carried out by dr Mulcahy in the last 2 days 
-- (BETWEEN '2018-04-23 09:00:00' AND '2018-04-24 12:00:00')

SELECT IFNULL(SUM(amount), 0) -- IFNULL function in case there was no bill
	FROM bill, appointment
	WHERE bill.appointmentNumber = appointment.appointmentNumber 
	AND appointment.appointmentDateTime BETWEEN '2018-04-23 08:00:00' AND '2018-04-24 11:00:00' 
	AND appointment.employeeNumber = 1;
	
-- QUERY NO 36: checking how much patients paid for treatments carried out by dr Mulcahy in the last 2 days 
-- (BETWEEN '2018-04-23 09:00:00' AND '2018-04-24 12:00:00')

SELECT IFNULL(SUM(payment.amountPaid), 0) -- IFNULL function in case there was no payments
	FROM payment, appointment, bill 
	WHERE payment.appointmentNumber = bill.appointmentNumber 
		AND bill.appointmentNumber = appointment.appointmentNumber 
		AND appointment.appointmentDateTime BETWEEN '2018-04-23 08:00:00' AND '2018-04-24 11:00:00' 
		AND appointment.employeeNumber = 1;

-- QUERY NO 37: checking how much patients own to dr Mulcahy for treatments carried out by dr Mulcahy in the last 2 days
-- (BETWEEN '2018-04-23 09:00:00' AND '2018-04-24 12:00:00')

SELECT IFNULL(SUM(amount), 0) - 
	(SELECT IFNULL(SUM(payment.amountPaid), 0) 
		FROM payment, appointment, bill 
		WHERE payment.appointmentNumber = bill.appointmentNumber 
			AND bill.appointmentNumber = appointment.appointmentNumber 
			AND appointment.appointmentDateTime BETWEEN '2018-04-23 08:00:00' AND '2018-04-24 11:00:00' 
			AND appointment.employeeNumber = 1) AS sumOwnedByPatients 
	FROM bill, appointment 
	WHERE bill.appointmentNumber = appointment.appointmentNumber 
		AND appointment.appointmentDateTime BETWEEN '2018-04-23 08:00:00' AND '2018-04-24 11:00:00' 
		AND appointment.employeeNumber = 1;

		
-- QUERY NO 38: deleting employee no 8 (secretary) from employee table. This employee did not have any appointment and
-- it is possible to delete all his data from employee' and 'workschema' table at once - ON DELETE CASCADE
		
DELETE FROM employee WHERE employeeNumber = 8;

-- SOME QUERIES FORM CODD'S RULE FILE.

-- QUERY NO 39: selecting meta data from the database 'g00364553_zamorski'

SELECT TABLE_SCHEMA, TABLE_NAME, TABLE_TYPE 
	FROM INFORMATION_SCHEMA.TABLES 
	WHERE TABLE_SCHEMA = 'g00364553_zamorski';

-- QUERY NO 40: inserting new branch no 3, moving employee from branch no 2 to the branch no 3, deleting branch no 2
	
START TRANSACTION;
INSERT INTO branch VALUES (3, '87 New branch address', 'Cork', '+00353 87 854 85');
UPDATE employee SET branchNumber = 3 WHERE branchNumber = 2;
DELETE FROM branch WHERE branchNumber = 2;
COMMIT;

-- QUERY NO 41: The statement creates a view. It is possible to select data from tables vertically, horizontally and from more than one table.

CREATE VIEW MallowEmployee AS SELECT city, firstName, lastName 
	FROM branch, employee 
	WHERE branch.branchNumber = 1 
		AND branch.branchNumber = employee.branchNumber;




