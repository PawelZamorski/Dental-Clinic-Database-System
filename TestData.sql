-- ---------------------------------------------------------

-- Created by Pawel Zamorski G00364553@gmit.ie

-- --------------------------------------------------------


--
-- Dumping data for table `branch`
--

INSERT INTO `branch` (`branchNumber`, `address`, `city`, `phone`) VALUES
(1, '22 Sundown Drive', 'Mallow', '00353-86-777-8789'),
(2, '988 Harbort Trail', 'Cork', '+86 176 487 6799');

-- --------------------------------------------------------

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`employeeNumber`, `branchNumber`, `firstName`, `lastName`, `mobile`, `email`, `jobTitle`, `login`, `password`) VALUES
(1, 1, 'Mary', 'Mulcahy', '00353-86-875-4521', 'mmulcahy@dentalcare.com', 'dentist', 'mmulcahy', 'mmulcahy'),
(2, 1, 'Helen', 'McRoy', '00353-86-457-2813', 'hmcroy@dentalcare.com', 'secretary', 'hmcroy', 'hmcroy'),
(3, 1, 'Dan', 'Lewis', '00353-87-578-6124', 'dlewis@dentalcare.com', 'dental nurse', 'dlewis', 'dlewis'),
(4, 2, 'Dorothy', 'Patterson', '00353-88-845-2365', 'dpatterso@dentalcare.com', 'dentist', 'dpatterso', 'dpatterso'),
(5, 2, 'Leslie', 'Jennings', '00353-86-777-8789', 'ljennings@dentalcare.com', 'dentist', 'ljennings', 'ljennings'),
(6, 2, 'William', 'Jones', '00353-87-812-2514', 'jwilliam@dentalcare.com', 'dentist', 'jwilliam', 'jwilliam'),
(7, 2, 'Julie', 'Firrelli', '00353-85-524-6587', 'jfirrelli@dentalcare.com', 'dental nurse', 'jfirrelli', 'jfirrelli'),
(8, 2, 'Gerard', 'Hernandez', '00353-87-854-2546', 'ghernande@dentalcare.com', 'secretary', 'ghernande', 'ghernande');

-- --------------------------------------------------------

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`patientNumber`, `firstName`, `lastName`, `gender`, `address`, `city`, `landline`, `mobile`, `email`, `preferedContact`, `firstVisit`, `teethDescription`, `healthHistoryForm`) VALUES
(101, 'Fin', 'Malkin', 'Male', '22 Sundown Drive', 'Mallow', NULL, '+82 521 556 5921', NULL, 'mobile', 0, NULL, NULL),
(102, 'Hiram', 'Yuryichev', 'Male', '81 Farwell Center', 'Mallow', '+63 748 825 8418', '+48 830 145 4888', 'hyuryichev1@dedecms.com', 'email', 0, NULL, NULL),
(103, 'Barnabas', 'Walworche', 'Male', '988 Harbort Trail', 'Mallow', NULL, '+86 176 487 6799', NULL, 'mobile', 0, NULL, NULL),
(104, 'Gib', 'Vater', 'Male', '251 Fuller Center', 'Mallow', NULL, '+86 487 589 8146', 'gvater3@illinois.edu', 'landline', 0, NULL, NULL),
(105, 'Bess', 'Teck', 'Female', '5 Hooker Parkway', 'Mallow', NULL, '+25 487 589 8146', 'bteck4@imageshack.us', 'mobile', 0, NULL, NULL),
(106, 'Jewelle', 'Posselow', 'Female', '217 Maple Wood Park', 'Mallow', NULL, '+62 477 995 5894', 'jposselow5@nps.gov', 'email', 0, NULL, NULL),
(107, 'Jarvis', 'Losselyong', 'Male', '7 Crownhardt Point', 'Mallow', '+234 739 663 9076', '+86 332 647 9783', 'jlosselyong6@biblegateway.com', 'post', 0, NULL, NULL),
(108, 'Fidel', 'McAw', 'Male', '3 Northview Alley', 'Mallow', '+63 881 953 6323', '+63 871 891 4126', NULL, 'mobile', 0, NULL, NULL),
(109, 'Mathew', 'Crafts', 'Male', '97116 Merrick Point', 'Mallow', NULL, '+375 271 248 5159', 'mcrafts8@usatoday.com', 'mobile', 0, NULL, NULL),
(110, 'Barnabe', 'Hunnicot', 'Male', '28651 Prentice Avenue', 'Mallow', NULL, '+46 615 767 2527', NULL, 'mobile', 0, NULL, NULL),
(111, 'Cassondra', 'Gosnell', 'Female', '1292 Schlimgen Road', 'Mallow', '+48 858 987 2548', '+1 704 771 1829', 'cgosnella@yandex.ru', 'email', 1, NULL, NULL),
(112, 'Eilis', 'Batchelor', 'Female', '4 Schmedeman Lane', 'Mallow', '+974 638 359 1026', '+351 866 453 1772', 'ebatchelorb@businessinsider.co', 'landline', 0, NULL, NULL),
(113, 'Antonina', 'Lidgard', 'Female', '930 Magdeline Crossing', 'Mallow', '+48 803 221 3157', '+86 786 593 9078', 'alidgardc@multiply.com', 'mobile', 1, NULL, NULL),
(114, 'Josefa', 'Foakes', 'Female', '66 Hovde Hill', NULL, NULL, '+63 172 768 2128', 'jfoakesd@house.gov', 'email', 0, NULL, NULL),
(115, 'Marty', 'Kettley', 'Male', '1143 Karstens Crossing', 'Mallow', NULL, '+1 321 237 0290', 'mkettleye@rakuten.co.jp', 'landline', 1, NULL, NULL),
(116, 'Sapphira', 'Le Marchand', 'Female', '917 Lyons Place', 'Mallow', NULL, '+880 612 344 7181', NULL, NULL, 0, NULL, NULL),
(117, 'Grace', 'Klimowicz', 'Female', '29074 Orin Center', 'Mallow', NULL, '+30 638 514 4902', 'gklimowiczg@irs.gov', 'landline', 1, NULL, NULL),
(118, 'Merrili', 'Shreeve', 'Female', '7 Corry Court', 'Mallow', NULL, '+380 398 636 5236', 'mshreeveh@fotki.com', 'email', 1, NULL, NULL),
(119, 'Antone', 'Fogg', 'Male', '2555 Glacier Hill Plaza', 'Mallow', '+55 523 517 2248', '+66 256 893 0716', 'afoggi@icio.us', 'post', 0, NULL, NULL),
(120, 'Eilia', 'Smith', NULL, NULL, NULL, NULL, NULL, 'scrumbyj@xing.com', 'email', 1, NULL, NULL),
(121, 'Antone', 'Fogg', 'Male', '2555 New Street', 'Athlon', NULL, '+12 243 893 0876', NULL, 'post', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`appointmentNumber`, `patientNumber`, `employeeNumber`, `appointmentDateTime`, `appointmentStatus`, `apptAim`, `apptHistory`, `followUpTreatment`) VALUES
(1, 101, 1, '2018-04-23 08:00:00', 'VISITED', 'Extraction', 'Description of carried out appointment', 'Description of the follow up treatments'),
(2, 102, 1, '2018-04-23 09:00:00', 'VISITED', 'Filling, examination', 'Description of carried out appointment', 'Description of the follow up treatments'),
(3, 103, 1, '2018-04-23 10:00:00', 'VISITED', 'General', 'Description of carried out appointment', 'Description of the follow up treatments'),
(4, 103, 1, '2018-04-24 10:00:00', 'VISITED', 'Filling', 'Description of carried out appointment', 'Description of the follow up treatments'),
(5, 104, 1, '2018-04-24 08:00:00', 'VISITED', 'Examination', 'Description of carried out appointment', 'Description of the follow up treatments'),
(6, 105, 1, '2018-04-24 09:00:00', 'NOT SHOWED UP', 'General', NULL, NULL),
(7, 106, 1, '2018-04-25 08:00:00', 'CONFIRMED', 'Description of a planned treatment', NULL, NULL),
(8, 107, 1, NULL, 'CANCELLED', 'Lorem ipsum', NULL, NULL),
(9, 108, 1, '2018-04-25 10:00:00', 'ARRANGED', 'General', NULL, NULL),
(10, 109, 1, '2018-04-26 09:00:00', 'ARRANGED', 'General', NULL, NULL),
(11, 111, 1, '2018-04-26 10:00:00', 'CONFIRMED', 'Description of a planned treatment', NULL, NULL),
(13, 110, 3, '2018-04-24 08:00:00', 'VISITED', 'Description of a planned treatment', 'Description of carried out appointment', 'Description of the follow up treatments'),
(14, 111, 3, '2018-04-27 08:00:00', 'CONFIRMED', 'General', NULL, NULL),
(15, 112, 6, '2018-04-23 09:00:00', 'VISITED', 'Lorem ipsum', 'Description of carried out appointment', 'Description of the follow up treatments'),
(16, 102, 6, '2018-04-23 11:00:00', 'VISITED', 'Lorem ipsum', 'Description of carried out appointment', 'Description of the follow up treatments'),
(17, 113, 6, '2018-04-25 09:00:00', 'ARRANGED', 'Lorem ipsum', NULL, NULL),
(18, 104, 6, '2018-04-25 10:00:00', 'CONFIRMED', 'Lorem ipsum', NULL, NULL),
(19, 114, 5, '2018-04-24 10:00:00', 'VISITED', 'Lorem ipsum', 'Description of carried out appointment', 'Description of the follow up treatments'),
(20, 103, 5, '2018-04-24 11:00:00', 'VISITED', 'Lorem ipsum', 'Description of carried out appointment', 'Description of the follow up treatments'),
(21, 115, 5, '2018-04-26 10:00:00', 'ARRANGED', 'Lorem ipsum', NULL, NULL),
(22, 116, 4, '2018-04-24 08:00:00', 'VISITED', 'General', 'Description of carried out appointment', 'Description of the follow up treatments'),
(23, 117, 4, '2018-04-25 09:00:00', 'CONFIRMED', 'Description of a planned treatment', NULL, NULL),
(24, 118, 4, '2018-04-25 10:00:00', 'ARRANGED', 'Description of a planned treatment', NULL, NULL),
(25, 119, 4, '2018-04-26 11:00:00', 'ARRANGED', 'Description of a planned treatment', NULL, NULL),
(26, 119, 7, '2018-04-23 09:00:00', 'VISITED', 'Lorem ipsum', 'Description of carried out appointment', 'Description of the follow up treatments'),
(27, 117, 7, '2018-04-26 10:00:00', 'CONFIRMED', 'Lorem ipsum', NULL, NULL);

-- --------------------------------------------------------

--
-- Dumping data for table `cancellation`
--

INSERT INTO `cancellation` (`appointmentNumber`, `appointmentDateTime`, `cancellationDateTime`) VALUES
(8, '2018-04-25 09:00:00', '2018-04-24 08:00:00');

-- --------------------------------------------------------

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`categoryNumber`, `category`, `description`) VALUES
(701, 'Examination', 'Category description...'),
(702, 'X-Ray', 'Category description...'),
(703, 'Hygienist', 'Category description...'),
(704, 'Prothetics', 'Category description...'),
(705, 'Filling', 'Category description...'),
(706, 'Extraction', 'Category description...'),
(707, 'Endodontics', 'Category description...'),
(708, 'Prosthodontics', 'Category description...'),
(709, 'Periodontal Surgery', 'Category description...'),
(710, 'Orthodontics', 'Category description...');

-- --------------------------------------------------------

--
-- Dumping data for table `treatment`
--

INSERT INTO `treatment` (`treatmentNumber`, `categoryNumber`, `treatmentName`, `description`) VALUES
(501, 701, 'Examination', 'Treatment description... Lorem ipsum'),
(502, 702, 'X-RAY Partial', 'Treatment description... Lorem ipsum'),
(503, 702, 'X-RAY Panoramic', 'Treatment description... Lorem ipsum'),
(504, 703, 'Cleaning', 'Treatment description... Lorem ipsum'),
(505, 703, 'Tooth Whitening', 'Treatment description... Lorem ipsum'),
(506, 704, 'Full Ceramic Crown', 'Treatment description... Lorem ipsum'),
(507, 704, 'PFM Crown – porcelain fused to metal', 'Treatment description... Lorem ipsum'),
(508, 704, 'Zirconia Crown – all porcelain', 'Treatment description... Lorem ipsum'),
(509, 704, 'Bridge (per unit)', 'Treatment description... Lorem ipsum'),
(510, 705, 'Filling (standard)', 'Treatment description... Lorem ipsum'),
(511, 705, 'Filling (large)', 'Treatment description... Lorem ipsum'),
(512, 705, 'Amalgam', 'Treatment description... Lorem ipsum'),
(513, 706, 'Extraction', 'Treatment description... Lorem ipsum'),
(514, 706, 'Surgical Extraction', 'Treatment description... Lorem ipsum'),
(515, 706, 'Wisdom Tooth (difficult)', 'Treatment description... Lorem ipsum'),
(516, 706, 'Wisdom Tooth (standard)', 'Treatment description... Lorem ipsum'),
(517, 707, 'Front Tooth', 'Treatment description... Lorem ipsum'),
(518, 707, 'Premolar', 'Treatment description... Lorem ipsum'),
(519, 707, 'Molar', 'Treatment description... Lorem ipsum'),
(520, 708, 'Acrylic Denture', 'Treatment description... Lorem ipsum'),
(521, 708, 'Complete upper and lower acrylic', 'Treatment description... Lorem ipsum'),
(522, 708, 'Kobel Denture', 'Treatment description... Lorem ipsum'),
(523, 708, 'Cobalt Chrome Denture', 'Treatment description... Lorem ipsum'),
(524, 709, 'Gum Treatment', 'Treatment description... Lorem ipsum'),
(525, 710, 'Orthodontics (Metal)', 'Treatment description... Lorem ipsum'),
(526, 710, 'Orthodontics (Ceramic)', 'Treatment description... Lorem ipsum'),
(527, 710, 'Orthodontics (Self-ligating)', 'Treatment description... Lorem ipsum'),
(528, 710, 'Orthodontics (Periodic Visits)', 'Treatment description... Lorem ipsum'),
(529, 708, 'Dental Implant with Crown', 'Treatment description... Lorem ipsum'),
(530, 708, 'Implant Supported Denture', 'Treatment description... Lorem ipsum'),
(531, 708, 'CT Scan', 'Treatment description... Lorem ipsum');

-- --------------------------------------------------------

--
-- Dumping data for table `treatmentoffered`
--

INSERT INTO `treatmentoffered` (`employeeNumber`, `treatmentNumber`, `price`) VALUES
(1, 501, '50.00'),
(1, 502, '20.00'),
(1, 503, '40.00'),
(1, 504, '60.00'),
(1, 505, '300.00'),
(1, 506, '550.00'),
(1, 507, '800.00'),
(1, 508, '900.00'),
(1, 509, '800.00'),
(1, 510, '70.00'),
(1, 511, '100.00'),
(1, 513, '90.00'),
(1, 514, '200.00'),
(1, 515, '300.00'),
(1, 516, '150.00'),
(1, 517, '400.00'),
(1, 518, '450.00'),
(1, 519, '700.00'),
(3, 504, '60.00'),
(3, 505, '250.00'),
(4, 501, '50.00'),
(4, 502, '20.00'),
(4, 503, '40.00'),
(4, 504, '60.00'),
(4, 505, '300.00'),
(4, 506, '550.00'),
(4, 507, '800.00'),
(4, 508, '900.00'),
(4, 509, '800.00'),
(4, 510, '70.00'),
(4, 511, '100.00'),
(4, 513, '90.00'),
(4, 514, '200.00'),
(4, 515, '300.00'),
(4, 516, '150.00'),
(4, 517, '400.00'),
(4, 518, '450.00'),
(4, 519, '700.00'),
(5, 520, '400.00'),
(5, 521, '700.00'),
(5, 522, '1200.00'),
(5, 523, '1400.00'),
(5, 524, '1000.00'),
(5, 529, '1500.00'),
(5, 530, '6400.00'),
(5, 531, '150.00'),
(6, 525, '900.00'),
(6, 526, '1400.00'),
(6, 527, '1200.00'),
(6, 528, '50.00'),
(6, 531, '150.00'),
(7, 504, '60.00'),
(7, 505, '300.00');

-- --------------------------------------------------------

--
-- Dumping data for table `appointmentdetail`
--

INSERT INTO `appointmentdetail` (`appointmentNumber`, `employeeNumber`, `treatmentNumber`, `finalPrice`, `quantity`, `description`) VALUES
(1, 1, 510, '70.00', 1, 'Description of carried treatment, ie. tooth no, used materials, ect'),
(2, 1, 513, '90.00', 1, 'Description of carried treatment, ie. tooth no, used materials, ect'),
(3, 1, 501, '20.00', 1, 'Description of carried treatment, ie. tooth no, used materials, ect'),
(3, 1, 503, '40.00', 1, 'Description of carried treatment, ie. tooth no, used materials, ect'),
(4, 1, 510, '70.00', 1, 'Description of carried treatment, ie. tooth no, used materials, ect'),
(5, 1, 502, '20.00', 1, 'Description of carried treatment, ie. tooth no, used materials, ect'),
(5, 1, 515, '250.00', 1, 'Description of carried treatment, ie. tooth no, used materials, ect'),
(13, 3, 504, '60.00', 1, 'Description of carried treatment, ie. tooth no, used materials, ect'),
(15, 6, 527, '1200.00', 1, 'Description of carried treatment, ie. tooth no, used materials, ect'),
(15, 6, 531, '150.00', 1, 'Description of carried treatment, ie. tooth no, used materials, ect'),
(16, 6, 525, '900.00', 1, 'Description of carried treatment, ie. tooth no, used materials, ectc'),
(19, 5, 521, '700.00', 1, 'Description of carried treatment, ie. tooth no, used materials, ect'),
(20, 5, 523, '1250.00', 1, 'Description of carried treatment, ie. tooth no, used materials, ect'),
(20, 5, 531, '150.00', 1, 'Description of carried treatment, ie. tooth no, used materials, ect'),
(22, 4, 511, '100.00', 1, 'Description of carried treatment, ie. tooth no, used materials, ect'),
(26, 7, 504, '60.00', 1, 'Description of carried treatment, ie. tooth no, used materials, ect');

-- --------------------------------------------------------

--
-- Dumping data for table `bill`
--

INSERT INTO `bill` (`appointmentNumber`, `amount`, `issuedDate`, `dueDate`, `paymentStatus`) VALUES
(1, '70.00', '2018-04-23', '2018-04-24', 'OVERDUE'),
(2, '90.00', '2018-04-23', '2018-04-23', 'PAID'),
(3, '60.00', '2018-04-23', '2018-04-23', 'PAID'),
(4, '140.00', '2018-04-23', '2018-04-23', 'PAID'),
(5, '270.00', '2018-04-24', '2018-04-26', 'PENDING'),
(6, '10.00', '2018-04-24', '2018-04-26', 'PENDING'),
(13, '60.00', '2018-04-24', '2018-04-24', 'PENDING'),
(15, '1350.00', '2018-04-23', '2018-04-30', 'PENDING'),
(16, '900.00', '2018-04-23', '2018-04-23', 'PENDING'),
(19, '700.00', '2018-04-24', '2018-04-24', 'PAID'),
(20, '1400.00', '2018-04-24', '2018-04-24', 'PAID'),
(22, '100.00', '2018-04-24', '2018-04-24', 'PAID'),
(26, '60.00', '2018-04-23', '2018-04-23', 'PAID');

-- --------------------------------------------------------

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`paymentNumber`, `appointmentNumber`, `amountPaid`, `paymentDate`, `paymentMethod`) VALUES
(50, 2, '90.00', '2018-04-23', 'CASH'),
(51, 3, '60.00', '2018-04-23', 'CARD'),
(52, 4, '140.00', '2018-04-23', 'CARD'),
(53, 5, '60.00', '2018-04-24', 'CASH'),
(54, 15, '350.00', '2018-04-23', 'CASH'),
(55, 15, '500.00', '2018-04-24', 'BANK TRANSFER'),
(56, 16, '500.00', '2018-04-23', 'CARD'),
(57, 19, '700.00', '2018-04-24', 'CARD'),
(58, 20, '1400.00', '2018-04-24', 'CARD'),
(59, 22, '100.00', '2018-04-24', 'CARD'),
(60, 26, '60.00', '2018-04-23', 'CASH');

-- --------------------------------------------------------

--
-- Dumping data for table `workschema`
--

INSERT INTO `workschema` (`employeeNumber`, `workDateTime`) VALUES
(1, '2018-04-23 08:00:00'),
(1, '2018-04-23 09:00:00'),
(1, '2018-04-23 10:00:00'),
(1, '2018-04-23 11:00:00'),
(1, '2018-04-24 08:00:00'),
(1, '2018-04-24 09:00:00'),
(1, '2018-04-24 10:00:00'),
(1, '2018-04-24 11:00:00'),
(1, '2018-04-25 08:00:00'),
(1, '2018-04-25 09:00:00'),
(1, '2018-04-25 10:00:00'),
(1, '2018-04-25 11:00:00'),
(1, '2018-04-26 08:00:00'),
(1, '2018-04-26 09:00:00'),
(1, '2018-04-26 10:00:00'),
(1, '2018-04-26 11:00:00'),
(1, '2018-04-27 08:00:00'),
(1, '2018-04-27 09:00:00'),
(1, '2018-04-27 10:00:00'),
(1, '2018-04-27 11:00:00'),
(2, '2018-04-23 08:00:00'),
(2, '2018-04-23 09:00:00'),
(2, '2018-04-23 10:00:00'),
(2, '2018-04-23 11:00:00'),
(2, '2018-04-24 08:00:00'),
(2, '2018-04-24 09:00:00'),
(2, '2018-04-24 10:00:00'),
(2, '2018-04-24 11:00:00'),
(2, '2018-04-25 08:00:00'),
(2, '2018-04-25 09:00:00'),
(2, '2018-04-25 10:00:00'),
(2, '2018-04-25 11:00:00'),
(2, '2018-04-26 08:00:00'),
(2, '2018-04-26 09:00:00'),
(2, '2018-04-26 10:00:00'),
(2, '2018-04-26 11:00:00'),
(2, '2018-04-27 08:00:00'),
(2, '2018-04-27 09:00:00'),
(2, '2018-04-27 10:00:00'),
(2, '2018-04-27 11:00:00'),
(3, '2018-04-23 08:00:00'),
(3, '2018-04-27 08:00:00'),
(3, '2018-04-27 09:00:00'),
(4, '2018-04-24 08:00:00'),
(4, '2018-04-24 09:00:00'),
(4, '2018-04-24 10:00:00'),
(4, '2018-04-24 11:00:00'),
(4, '2018-04-25 08:00:00'),
(4, '2018-04-25 09:00:00'),
(4, '2018-04-25 10:00:00'),
(4, '2018-04-25 11:00:00'),
(4, '2018-04-26 08:00:00'),
(4, '2018-04-26 09:00:00'),
(4, '2018-04-26 10:00:00'),
(4, '2018-04-26 11:00:00'),
(5, '2018-04-24 08:00:00'),
(5, '2018-04-24 09:00:00'),
(5, '2018-04-24 10:00:00'),
(5, '2018-04-24 11:00:00'),
(5, '2018-04-26 08:00:00'),
(5, '2018-04-26 09:00:00'),
(5, '2018-04-26 10:00:00'),
(5, '2018-04-26 11:00:00'),
(6, '2018-04-23 08:00:00'),
(6, '2018-04-23 09:00:00'),
(6, '2018-04-23 10:00:00'),
(6, '2018-04-23 11:00:00'),
(6, '2018-04-25 08:00:00'),
(6, '2018-04-25 09:00:00'),
(6, '2018-04-25 10:00:00'),
(6, '2018-04-25 11:00:00'),
(7, '2018-04-23 08:00:00'),
(7, '2018-04-26 08:00:00'),
(8, '2018-04-23 08:00:00'),
(8, '2018-04-23 09:00:00'),
(8, '2018-04-23 10:00:00'),
(8, '2018-04-23 11:00:00'),
(8, '2018-04-24 08:00:00'),
(8, '2018-04-24 09:00:00'),
(8, '2018-04-24 10:00:00'),
(8, '2018-04-24 11:00:00'),
(8, '2018-04-25 08:00:00'),
(8, '2018-04-25 09:00:00'),
(8, '2018-04-25 10:00:00'),
(8, '2018-04-25 11:00:00'),
(8, '2018-04-26 08:00:00'),
(8, '2018-04-26 09:00:00'),
(8, '2018-04-26 10:00:00'),
(8, '2018-04-26 11:00:00'),
(8, '2018-04-27 08:00:00'),
(8, '2018-04-27 09:00:00'),
(8, '2018-04-27 10:00:00'),
(8, '2018-04-27 11:00:00');
