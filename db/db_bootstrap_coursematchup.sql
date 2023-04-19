-- Create CourseMatchUp database

CREATE DATABASE coursematchup;

-- Via the Docker Compose file, a special user called webapp will 
-- be created in MySQL. We are going to grant that user 
-- all privilages to the new database we just created. 
-- TODO: If you changed the name of the database above, you need 
-- to change it here too.
grant all privileges on coursematchup.* to 'webapp'@'%';
flush privileges;


-- Use CourseMatchUp database

USE coursematchup;


-- Create Departments table

CREATE TABLE Departments (

    department_code INT,

    name VARCHAR(255),

    college VARCHAR(255),

    PRIMARY KEY (department_code)

);

-- Create Students table
CREATE TABLE Students (

    userID INT,

    year INT,

    address VARCHAR(255),

    budget INT,

    firstN VARCHAR(255),

    lastN VARCHAR(255),

    email VARCHAR(255),

    department_code INT,

    PRIMARY KEY (userID),

    FOREIGN KEY (department_code) references Departments(department_code)

);


-- Create Interests table

CREATE TABLE Interests (

    userID int,

    academic VARCHAR(255),

    personal VARCHAR(255),

    professional VARCHAR(255),

    FOREIGN KEY (userID) REFERENCES Students(userID)
    ON DELETE CASCADE

);


-- Create Transcripts table

CREATE TABLE Transcripts (

    transcriptID INT AUTO_INCREMENT,

    standing BOOLEAN,

    GPA FLOAT,

    credits INT,

    creditReqs INT,

    userID int,

    PRIMARY KEY (transcriptID),

    FOREIGN KEY (userID) REFERENCES Students(userID)

);


-- Create Courses table

CREATE TABLE Courses (

    courseID INT AUTO_INCREMENT,

    numcredits INT,

    name VARCHAR(255),

    department_code INT,

    PRIMARY KEY (courseID, name),

    FOREIGN KEY (department_code) REFERENCES Departments(department_code)

);

-- Create Course_Prereqs table

CREATE TABLE Course_Prereqs (

    prereqID INT,

    courseID INT,

    FOREIGN KEY (prereqID) REFERENCES Courses(courseID)
    ON DELETE CASCADE,

    FOREIGN KEY (courseID) REFERENCES Courses(courseID)
    ON DELETE CASCADE

);

-- Create Transcripts_Courses table

CREATE TABLE Transcripts_Courses (
    transcriptID INT,

    courseID INT,

    grade INT,

    PRIMARY KEY (transcriptID, courseID),
    FOREIGN KEY (transcriptID) REFERENCES Transcripts(transcriptID),
    FOREIGN KEY (courseID) REFERENCES Courses(courseID)
    ON DELETE CASCADE
);


-- Create Course_Ratings table

CREATE TABLE Course_Ratings (

    courseID INT,

    rating FLOAT,

    FOREIGN KEY (courseID) REFERENCES Courses(courseID)
    ON DELETE CASCADE

);


-- Create Course_Reqsfulfilled table

CREATE TABLE Course_Reqsfulfilled (

    courseID INT,

    nupathReq VARCHAR(255),

    PRIMARY KEY (courseID),

    FOREIGN KEY (courseID) REFERENCES Courses(courseID)
    ON DELETE CASCADE

);


-- Create Instructors table

CREATE TABLE Instructors (

    teacherID INT,

    name VARCHAR(255),

    email VARCHAR(255),

    PRIMARY KEY (teacherID)

);


-- Create Instructor_Ratings table

CREATE TABLE Instructor_Ratings (

    teacherID INT,

    rating FLOAT,

    FOREIGN KEY (teacherID) REFERENCES Instructors(teacherID)

);


-- Create Transcript_Nupathreqs table

CREATE TABLE Transcript_Nupathreqs (

    transcriptID INT,

    nupathNeeded VARCHAR(255),

    FOREIGN KEY (transcriptID) REFERENCES Transcripts(transcriptID)

);


-- Create Sections table

CREATE TABLE Sections (

    secNumber INT,

    semester VARCHAR(255),

    teacherID INT,

    enrollmentSlots INT,

    courseID INT,

    PRIMARY KEY (secNumber, semester, courseID),

    FOREIGN KEY (courseID) REFERENCES Courses(courseID)
    ON DELETE CASCADE,

    FOREIGN KEY (teacherID) REFERENCES Instructors(teacherID)

);


-- Create Textbooks table

CREATE TABLE Textbooks

(

    bookID INT,

    price  FLOAT,

    PRIMARY KEY (bookID)

);


-- Create Courses_Textbooks table

CREATE TABLE Courses_Textbooks (

    courseID INT,

    bookID INT,

    PRIMARY KEY (courseID, bookID),

    FOREIGN KEY (courseID) REFERENCES Courses(courseID)
    ON DELETE CASCADE,

    FOREIGN KEY (bookID) REFERENCES Textbooks(bookID)

);


use coursematchup;

INSERT INTO Departments(department_code,name,college) VALUES (5306,'Chemistry','College of Social Sciences and Humanities');
INSERT INTO Departments(department_code,name,college) VALUES (5134,'Psychology','College of Science');
INSERT INTO Departments(department_code,name,college) VALUES (8930,'Architecture','Bouvé College of Health Sciences');
INSERT INTO Departments(department_code,name,college) VALUES (9096,'Pharmacy','College of Science');
INSERT INTO Departments(department_code,name,college) VALUES (7626,'Electrical Engineering','College of Professional Studies');
INSERT INTO Departments(department_code,name,college) VALUES (5665,'Electrical Engineering','College of Engineering');
INSERT INTO Departments(department_code,name,college) VALUES (9259,'Criminal Justice','College of Science');
INSERT INTO Departments(department_code,name,college) VALUES (695,'Criminal Justice','School of Law');
INSERT INTO Departments(department_code,name,college) VALUES (7013,'English','College of Professional Studies');
INSERT INTO Departments(department_code,name,college) VALUES (8947,'Political Science','College of Arts Media and Design');
INSERT INTO Departments(department_code,name,college) VALUES (7555,'Computer Science','College of Social Sciences and Humanities');
INSERT INTO Departments(department_code,name,college) VALUES (5206,'Criminal Justice','College of Engineering');
INSERT INTO Departments(department_code,name,college) VALUES (700,'Electrical Engineering','College of Science');
INSERT INTO Departments(department_code,name,college) VALUES (8398,'Bioengineering','Khoury College of Computer Sciences');
INSERT INTO Departments(department_code,name,college) VALUES (233,'English','College of Social Sciences and Humanities');
INSERT INTO Departments(department_code,name,college) VALUES (5763,'Sociology','College of Science');
INSERT INTO Departments(department_code,name,college) VALUES (7388,'Sociology','College of Social Sciences and Humanities');
INSERT INTO Departments(department_code,name,college) VALUES (3307,'Theatre','College of Engineering');
INSERT INTO Departments(department_code,name,college) VALUES (281,'Pharmacy','Bouvé College of Health Sciences');
INSERT INTO Departments(department_code,name,college) VALUES (4371,'Gender Studies','D’Amore-McKim School of Business');
INSERT INTO Departments(department_code,name,college) VALUES (5336,'Criminal Justice','Bouvé College of Health Sciences');
INSERT INTO Departments(department_code,name,college) VALUES (384,'Computer Science','College of Social Sciences and Humanities');
INSERT INTO Departments(department_code,name,college) VALUES (2880,'Chemistry','College of Social Sciences and Humanities');
INSERT INTO Departments(department_code,name,college) VALUES (1807,'Gender Studies','Bouvé College of Health Sciences');
INSERT INTO Departments(department_code,name,college) VALUES (1046,'Computer Science','College of Engineering');
INSERT INTO Departments(department_code,name,college) VALUES (1401,'Mechanical Engineering','College of Professional Studies');
INSERT INTO Departments(department_code,name,college) VALUES (2046,'Chemistry','Khoury College of Computer Sciences');
INSERT INTO Departments(department_code,name,college) VALUES (1741,'Architecture','College of Arts Media and Design');
INSERT INTO Departments(department_code,name,college) VALUES (2392,'English','College of Arts Media and Design');
INSERT INTO Departments(department_code,name,college) VALUES (762,'Linguistics','College of Professional Studies');
INSERT INTO Departments(department_code,name,college) VALUES (4210,'Journalism','Bouvé College of Health Sciences');
INSERT INTO Departments(department_code,name,college) VALUES (6840,'Electrical Engineering','D’Amore-McKim School of Business');
INSERT INTO Departments(department_code,name,college) VALUES (7633,'Bioengineering','College of Science');
INSERT INTO Departments(department_code,name,college) VALUES (696,'Theatre','College of Social Sciences and Humanities');
INSERT INTO Departments(department_code,name,college) VALUES (7091,'Political Science','College of Arts Media and Design');
INSERT INTO Departments(department_code,name,college) VALUES (4703,'Political Science','D’Amore-McKim School of Business');
INSERT INTO Departments(department_code,name,college) VALUES (2318,'Criminal Justice','College of Arts Media and Design');
INSERT INTO Departments(department_code,name,college) VALUES (8570,'Architecture','College of Engineering');
INSERT INTO Departments(department_code,name,college) VALUES (2960,'Criminal Justice','College of Arts Media and Design');
INSERT INTO Departments(department_code,name,college) VALUES (3281,'Psychology','College of Science');



INSERT INTO Students(userID,year,address,budget,firstN,lastN,email,department_code) VALUES (1,2023,'6 Springview Circle',162.29,'Marshal','Druitt','mdruitt0@dedecms.com',8930);
INSERT INTO Students(userID,year,address,budget,firstN,lastN,email,department_code) VALUES (2,2023,'81 Truax Trail',149.99,'Arv','Lazar','alazar1@yale.edu',2392);
INSERT INTO Students(userID,year,address,budget,firstN,lastN,email,department_code) VALUES (3,2022,'565 Center Plaza',96.34,'Eveline','Duckworth','educkworth2@amazon.com',5763);
INSERT INTO Students(userID,year,address,budget,firstN,lastN,email,department_code) VALUES (4,2022,'82 Pankratz Alley',121.24,'Vladamir','Cuseick','vcuseick3@telegraph.co.uk',5134);
INSERT INTO Students(userID,year,address,budget,firstN,lastN,email,department_code) VALUES (5,2022,'971 Hoffman Center',93.98,'Spencer','Colaco','scolaco4@so-net.ne.jp',2960);
INSERT INTO Students(userID,year,address,budget,firstN,lastN,email,department_code) VALUES (6,2024,'82290 Arizona Alley',126.15,'Margret','Jodrelle','mjodrelle5@infoseek.co.jp',1807);
INSERT INTO Students(userID,year,address,budget,firstN,lastN,email,department_code) VALUES (7,2022,'35 Novick Park',108.0,'Nickey','Farn','nfarn6@guardian.co.uk',7013);
INSERT INTO Students(userID,year,address,budget,firstN,lastN,email,department_code) VALUES (8,2026,'14150 Hauk Street',141.94,'Fey','Aspall','faspall7@mashable.com',2318);
INSERT INTO Students(userID,year,address,budget,firstN,lastN,email,department_code) VALUES (9,2022,'86621 Moland Park',17.6,'Babbie','Corbyn','bcorbyn8@amazon.co.uk',5763);
INSERT INTO Students(userID,year,address,budget,firstN,lastN,email,department_code) VALUES (10,2022,'1 Stuart Point',116.87,'Nowell','De Angelo','ndeangelo9@salon.com',5336);
INSERT INTO Students(userID,year,address,budget,firstN,lastN,email,department_code) VALUES (11,2025,'0 Hanson Way',47.79,'Jocko','Aris','jarisa@nih.gov',8930);
INSERT INTO Students(userID,year,address,budget,firstN,lastN,email,department_code) VALUES (12,2022,'3 Welch Trail',193.22,'Justinian','Bargery','jbargeryb@linkedin.com',8570);
INSERT INTO Students(userID,year,address,budget,firstN,lastN,email,department_code) VALUES (13,2022,'618 Lien Way',147.94,'Ida','Moyse','imoysec@nytimes.com',1807);
INSERT INTO Students(userID,year,address,budget,firstN,lastN,email,department_code) VALUES (14,2022,'8557 Marcy Park',123.12,'Bud','Bercevelo','bbercevelod@google.co.uk',9096);
INSERT INTO Students(userID,year,address,budget,firstN,lastN,email,department_code) VALUES (15,2025,'66698 Prairieview Way',116.08,'Basile','Pipping','bpippinge@scribd.com',1807);
INSERT INTO Students(userID,year,address,budget,firstN,lastN,email,department_code) VALUES (16,2024,'9251 Onsgard Pass',11.35,'Ody','Rahlof','orahloff@fda.gov',7626);
INSERT INTO Students(userID,year,address,budget,firstN,lastN,email,department_code) VALUES (17,2026,'8 Sullivan Way',103.89,'Margit','Sommerland','msommerlandg@guardian.co.uk',700);
INSERT INTO Students(userID,year,address,budget,firstN,lastN,email,department_code) VALUES (18,2023,'7 Farragut Road',125.65,'Barrie','Reoch','breochh@unc.edu',5336);
INSERT INTO Students(userID,year,address,budget,firstN,lastN,email,department_code) VALUES (19,2024,'32 Saint Paul Street',156.52,'Al','Kingzett','akingzetti@tripadvisor.com',9096);
INSERT INTO Students(userID,year,address,budget,firstN,lastN,email,department_code) VALUES (20,2022,'02483 3rd Point',180.82,'Marnie','Hubbold','mhubboldj@reference.com',762);
INSERT INTO Students(userID,year,address,budget,firstN,lastN,email,department_code) VALUES (21,2022,'75626 Autumn Leaf Street',78.16,'Rayner','Hillock','rhillockk@bizjournals.com',9259);
INSERT INTO Students(userID,year,address,budget,firstN,lastN,email,department_code) VALUES (22,2025,'41400 Prairieview Pass',197.95,'Claudius','Christofides','cchristofidesl@networkadvertising.org',8930);
INSERT INTO Students(userID,year,address,budget,firstN,lastN,email,department_code) VALUES (23,2023,'7 Briar Crest Hill',12.34,'Corey','Sheals','cshealsm@newsvine.com',2880);
INSERT INTO Students(userID,year,address,budget,firstN,lastN,email,department_code) VALUES (24,2022,'206 Colorado Parkway',135.34,'Ortensia','Davidsson','odavidssonn@upenn.edu',4210);
INSERT INTO Students(userID,year,address,budget,firstN,lastN,email,department_code) VALUES (25,2023,'03920 Corben Circle',91.58,'Petronella','Buffin','pbuffino@hostgator.com',384);
INSERT INTO Students(userID,year,address,budget,firstN,lastN,email,department_code) VALUES (26,2024,'61721 Ramsey Pass',34.29,'Edwin','Humphrey','ehumphreyp@fastcompany.com',4371);
INSERT INTO Students(userID,year,address,budget,firstN,lastN,email,department_code) VALUES (27,2023,'8242 Mendota Trail',165.64,'Gusta','Pacitti','gpacittiq@yellowpages.com',2880);
INSERT INTO Students(userID,year,address,budget,firstN,lastN,email,department_code) VALUES (28,2023,'51 Sachtjen Place',15.72,'Kerianne','Crowson','kcrowsonr@redcross.org',1807);
INSERT INTO Students(userID,year,address,budget,firstN,lastN,email,department_code) VALUES (29,2024,'118 Pawling Parkway',188.96,'Sean','Smallpiece','ssmallpieces@deliciousdays.com',7013);
INSERT INTO Students(userID,year,address,budget,firstN,lastN,email,department_code) VALUES (30,2025,'85061 Fallview Pass',180.53,'Ingamar','Pickrell','ipickrellt@nhs.uk',1807);
INSERT INTO Students(userID,year,address,budget,firstN,lastN,email,department_code) VALUES (31,2022,'5 Daystar Center',31.47,'Emogene','Grimsditch','egrimsditchu@senate.gov',5206);
INSERT INTO Students(userID,year,address,budget,firstN,lastN,email,department_code) VALUES (32,2026,'2707 Clove Center',136.13,'Reggis','Arnet','rarnetv@technorati.com',1401);
INSERT INTO Students(userID,year,address,budget,firstN,lastN,email,department_code) VALUES (33,2026,'587 Logan Pass',132.04,'Elicia','Tal','etalw@networkadvertising.org',2392);
INSERT INTO Students(userID,year,address,budget,firstN,lastN,email,department_code) VALUES (34,2022,'0 Meadow Valley Pass',111.71,'Dorian','Haskins','dhaskinsx@scientificamerican.com',384);
INSERT INTO Students(userID,year,address,budget,firstN,lastN,email,department_code) VALUES (35,2023,'5152 Farwell Court',0.63,'Justis','Ellsworthe','jellsworthey@indiatimes.com',281);
INSERT INTO Students(userID,year,address,budget,firstN,lastN,email,department_code) VALUES (36,2024,'19 Sommers Alley',196.91,'Grace','Topham','gtophamz@oakley.com',7013);
INSERT INTO Students(userID,year,address,budget,firstN,lastN,email,department_code) VALUES (37,2025,'13428 Pierstorff Drive',127.17,'Clarinda','Scuse','cscuse10@gravatar.com',3281);
INSERT INTO Students(userID,year,address,budget,firstN,lastN,email,department_code) VALUES (38,2025,'02 Hoepker Terrace',171.9,'Evie','Keasey','ekeasey11@walmart.com',7555);
INSERT INTO Students(userID,year,address,budget,firstN,lastN,email,department_code) VALUES (39,2022,'9105 West Drive',183.65,'Goraud','Kernocke','gkernocke12@redcross.org',762);
INSERT INTO Students(userID,year,address,budget,firstN,lastN,email,department_code) VALUES (40,2023,'5 Charing Cross Place',34.73,'Milo','Lawlee','mlawlee13@comcast.net',3281);



INSERT INTO Textbooks(bookID,price) VALUES (235,78.82);
INSERT INTO Textbooks(bookID,price) VALUES (701,55.08);
INSERT INTO Textbooks(bookID,price) VALUES (668,40.08);
INSERT INTO Textbooks(bookID,price) VALUES (703,72.44);
INSERT INTO Textbooks(bookID,price) VALUES (31,26.39);
INSERT INTO Textbooks(bookID,price) VALUES (145,27.65);
INSERT INTO Textbooks(bookID,price) VALUES (514,91.11);
INSERT INTO Textbooks(bookID,price) VALUES (663,88.58);
INSERT INTO Textbooks(bookID,price) VALUES (726,33.58);
INSERT INTO Textbooks(bookID,price) VALUES (953,24.34);
INSERT INTO Textbooks(bookID,price) VALUES (859,6.8);
INSERT INTO Textbooks(bookID,price) VALUES (390,32.62);
INSERT INTO Textbooks(bookID,price) VALUES (743,88.8);
INSERT INTO Textbooks(bookID,price) VALUES (941,82.81);
INSERT INTO Textbooks(bookID,price) VALUES (863,55.82);
INSERT INTO Textbooks(bookID,price) VALUES (366,38.68);
INSERT INTO Textbooks(bookID,price) VALUES (857,14.26);
INSERT INTO Textbooks(bookID,price) VALUES (610,75.89);
INSERT INTO Textbooks(bookID,price) VALUES (458,49.61);
INSERT INTO Textbooks(bookID,price) VALUES (678,51.99);
INSERT INTO Textbooks(bookID,price) VALUES (731,15.6);
INSERT INTO Textbooks(bookID,price) VALUES (538,92.22);
INSERT INTO Textbooks(bookID,price) VALUES (55,82.02);
INSERT INTO Textbooks(bookID,price) VALUES (464,84.82);
INSERT INTO Textbooks(bookID,price) VALUES (836,86.51);
INSERT INTO Textbooks(bookID,price) VALUES (204,83.17);
INSERT INTO Textbooks(bookID,price) VALUES (138,34.66);
INSERT INTO Textbooks(bookID,price) VALUES (69,74.35);
INSERT INTO Textbooks(bookID,price) VALUES (661,83.5);
INSERT INTO Textbooks(bookID,price) VALUES (873,91.76);
INSERT INTO Textbooks(bookID,price) VALUES (771,80.86);
INSERT INTO Textbooks(bookID,price) VALUES (120,72.08);
INSERT INTO Textbooks(bookID,price) VALUES (110,36.61);
INSERT INTO Textbooks(bookID,price) VALUES (521,91.68);
INSERT INTO Textbooks(bookID,price) VALUES (208,82.33);
INSERT INTO Textbooks(bookID,price) VALUES (471,56.0);
INSERT INTO Textbooks(bookID,price) VALUES (210,62.23);
INSERT INTO Textbooks(bookID,price) VALUES (692,33.3);
INSERT INTO Textbooks(bookID,price) VALUES (984,80.38);
INSERT INTO Textbooks(bookID,price) VALUES (813,60.58);

INSERT INTO Interests(userID,academic,personal,professional) VALUES (1,'Asian Studies','Watching TV','Nursing');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (2,'English','Photography','Accounting');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (3,'Sociology','Skating','Architecture');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (4,'English','Gaming','Accounting');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (5,'Law','Gaming','Philosophy');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (6,'Asian Studies','Having Fun','Doctor');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (7,'Economics','Running','Doctor');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (8,'Asian Studies','Sports','Philosophy');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (9,'Linguistics','Sports','Doctor');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (10,'Engineering','Running','Accounting');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (11,'Engineering','Running','Accounting');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (12,'Linguistics','Running','Computer Science');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (13,'Engineering','Humanitarianism','Doctor');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (14,'Economics','Gaming','Architecture');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (15,'Theatre','Running','Computer Science');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (16,'Linguistics','World Peace','Education');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (17,'History','Eating','Nursing');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (18,'Sociology','Watching TV','Nursing');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (19,'Chemistry','Gaming','Education');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (20,'Chemistry','Skating','Philosophy');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (21,'Sociology','Sports','Philosophy');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (22,'Psychology','Photography','Philosophy');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (23,'Asian Studies','Having Fun','Doctor');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (24,'Computer Science','Gaming','Nursing');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (25,'Computer Science','Singing','Accounting');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (26,'English','Having Fun','Retail');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (27,'Sociology','Having Fun','Accounting');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (28,'Philosophy','World Peace','Computer Science');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (29,'English','Humanitarianism','Philosophy');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (30,'English','Photography','Politics');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (31,'Law','Singing','Accounting');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (32,'Chemistry','Gaming','Computer Science');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (33,'Theatre','Watching TV','Politics');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (34,'Economics','World Peace','Retail');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (35,'History','Sports','Accounting');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (36,'History','Photography','Politics');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (37,'Theatre','World Peace','Politics');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (38,'Computer Science','Having Fun','Computer Science');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (39,'History','Running','Education');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (40,'Psychology','Dancing','Philosophy');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (1,'English','Humanitarianism','Computer Science');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (2,'Philosophy','Dancing','Nursing');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (3,'Sociology','Skating','Politics');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (4,'English','World Peace','Doctor');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (5,'Psychology','Skating','Nursing');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (6,'Theatre','Watching TV','Computer Science');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (7,'Economics','Photography','Theatre');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (8,'Philosophy','Having Fun','Education');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (9,'Computer Science','World Peace','Nursing');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (10,'Sociology','Singing','Theatre');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (11,'Philosophy','Eating','Philosophy');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (12,'Chemistry','Watching TV','Retail');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (13,'History','Dancing','Doctor');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (14,'Asian Studies','Sports','Computer Science');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (15,'Computer Science','Skating','Philosophy');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (16,'History','World Peace','Politics');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (17,'English','Running','Accounting');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (18,'Chemistry','Having Fun','Accounting');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (19,'Sociology','Skating','Philosophy');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (20,'Philosophy','Skating','Nursing');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (21,'Psychology','Dancing','Philosophy');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (22,'Sociology','World Peace','Accounting');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (23,'Chemistry','Humanitarianism','Architecture');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (24,'Linguistics','Gaming','Philosophy');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (25,'Computer Science','Singing','Architecture');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (26,'Law','Singing','Accounting');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (27,'Philosophy','Watching TV','Doctor');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (28,'Philosophy','Skating','Retail');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (29,'Engineering','Singing','Doctor');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (30,'Philosophy','Having Fun','Accounting');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (31,'Theatre','Dancing','Accounting');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (32,'Economics','Dancing','Computer Science');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (33,'Psychology','Photography','Theatre');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (34,'Chemistry','Photography','Architecture');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (35,'Computer Science','Eating','Theatre');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (36,'Philosophy','Running','Philosophy');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (37,'Chemistry','Dancing','Accounting');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (38,'Economics','Skating','Nursing');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (39,'English','Watching TV','Accounting');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (40,'Economics','Humanitarianism','Doctor');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (1,'Sociology','Running','Doctor');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (2,'Linguistics','Running','Accounting');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (3,'Psychology','Photography','Theatre');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (4,'English','Dancing','Education');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (5,'Linguistics','Skating','Education');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (6,'Engineering','Photography','Doctor');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (7,'Sociology','Dancing','Computer Science');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (8,'Linguistics','Gaming','Theatre');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (9,'Philosophy','Having Fun','Architecture');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (10,'Law','Running','Retail');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (11,'Philosophy','Dancing','Politics');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (12,'Sociology','Singing','Theatre');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (13,'History','Gaming','Politics');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (14,'Economics','Running','Accounting');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (15,'Law','Skating','Theatre');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (16,'Chemistry','Running','Nursing');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (17,'Chemistry','Watching TV','Retail');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (18,'English','Running','Nursing');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (19,'Economics','Photography','Philosophy');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (20,'Sociology','Eating','Theatre');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (21,'Engineering','Watching TV','Education');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (22,'Theatre','Running','Theatre');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (23,'Asian Studies','Singing','Nursing');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (24,'Psychology','Singing','Theatre');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (25,'Law','Photography','Doctor');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (26,'Computer Science','Photography','Education');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (27,'English','Having Fun','Doctor');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (28,'Asian Studies','Humanitarianism','Architecture');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (29,'Chemistry','Gaming','Nursing');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (30,'English','Having Fun','Philosophy');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (31,'Law','Sports','Accounting');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (32,'Theatre','Running','Education');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (33,'Theatre','Humanitarianism','Accounting');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (34,'Theatre','Photography','Retail');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (35,'Computer Science','Gaming','Theatre');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (36,'English','Sports','Retail');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (37,'Engineering','World Peace','Politics');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (38,'Economics','Dancing','Retail');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (39,'Economics','Gaming','Computer Science');
INSERT INTO Interests(userID,academic,personal,professional) VALUES (40,'Theatre','Watching TV','Doctor');




INSERT INTO Transcripts(transcriptID,standing,GPA,credits,creditReqs,userID) VALUES (1,TRUE,3.4,26,25,1);
INSERT INTO Transcripts(transcriptID,standing,GPA,credits,creditReqs,userID) VALUES (2,FALSE,2.54,57,20,2);
INSERT INTO Transcripts(transcriptID,standing,GPA,credits,creditReqs,userID) VALUES (3,FALSE,0.97,55,113,3);
INSERT INTO Transcripts(transcriptID,standing,GPA,credits,creditReqs,userID) VALUES (4,TRUE,2.89,51,100,4);
INSERT INTO Transcripts(transcriptID,standing,GPA,credits,creditReqs,userID) VALUES (5,TRUE,1.81,121,100,5);
INSERT INTO Transcripts(transcriptID,standing,GPA,credits,creditReqs,userID) VALUES (6,TRUE,3.98,126,133,6);
INSERT INTO Transcripts(transcriptID,standing,GPA,credits,creditReqs,userID) VALUES (7,FALSE,2.78,132,70,7);
INSERT INTO Transcripts(transcriptID,standing,GPA,credits,creditReqs,userID) VALUES (8,TRUE,1.78,115,0,8);
INSERT INTO Transcripts(transcriptID,standing,GPA,credits,creditReqs,userID) VALUES (9,TRUE,0.68,143,135,9);
INSERT INTO Transcripts(transcriptID,standing,GPA,credits,creditReqs,userID) VALUES (10,FALSE,2.26,134,7,10);
INSERT INTO Transcripts(transcriptID,standing,GPA,credits,creditReqs,userID) VALUES (11,FALSE,0.49,48,45,11);
INSERT INTO Transcripts(transcriptID,standing,GPA,credits,creditReqs,userID) VALUES (12,TRUE,1.64,3,136,12);
INSERT INTO Transcripts(transcriptID,standing,GPA,credits,creditReqs,userID) VALUES (13,FALSE,2.41,71,77,13);
INSERT INTO Transcripts(transcriptID,standing,GPA,credits,creditReqs,userID) VALUES (14,TRUE,2.37,1,116,14);
INSERT INTO Transcripts(transcriptID,standing,GPA,credits,creditReqs,userID) VALUES (15,FALSE,1.96,124,11,15);
INSERT INTO Transcripts(transcriptID,standing,GPA,credits,creditReqs,userID) VALUES (16,FALSE,0.93,124,30,16);
INSERT INTO Transcripts(transcriptID,standing,GPA,credits,creditReqs,userID) VALUES (17,FALSE,3.79,84,112,17);
INSERT INTO Transcripts(transcriptID,standing,GPA,credits,creditReqs,userID) VALUES (18,TRUE,1.19,40,32,18);
INSERT INTO Transcripts(transcriptID,standing,GPA,credits,creditReqs,userID) VALUES (19,FALSE,2.81,2,54,19);
INSERT INTO Transcripts(transcriptID,standing,GPA,credits,creditReqs,userID) VALUES (20,FALSE,2.53,108,58,20);
INSERT INTO Transcripts(transcriptID,standing,GPA,credits,creditReqs,userID) VALUES (21,FALSE,1.91,141,12,21);
INSERT INTO Transcripts(transcriptID,standing,GPA,credits,creditReqs,userID) VALUES (22,FALSE,3.05,147,68,22);
INSERT INTO Transcripts(transcriptID,standing,GPA,credits,creditReqs,userID) VALUES (23,TRUE,3.88,93,53,23);
INSERT INTO Transcripts(transcriptID,standing,GPA,credits,creditReqs,userID) VALUES (24,TRUE,2.41,43,81,24);
INSERT INTO Transcripts(transcriptID,standing,GPA,credits,creditReqs,userID) VALUES (25,TRUE,0.2,7,18,25);
INSERT INTO Transcripts(transcriptID,standing,GPA,credits,creditReqs,userID) VALUES (26,TRUE,2.97,78,30,26);
INSERT INTO Transcripts(transcriptID,standing,GPA,credits,creditReqs,userID) VALUES (27,TRUE,0.22,116,22,27);
INSERT INTO Transcripts(transcriptID,standing,GPA,credits,creditReqs,userID) VALUES (28,FALSE,3.71,139,97,28);
INSERT INTO Transcripts(transcriptID,standing,GPA,credits,creditReqs,userID) VALUES (29,FALSE,2.94,131,5,29);
INSERT INTO Transcripts(transcriptID,standing,GPA,credits,creditReqs,userID) VALUES (30,FALSE,3.49,27,69,30);
INSERT INTO Transcripts(transcriptID,standing,GPA,credits,creditReqs,userID) VALUES (31,TRUE,0.68,29,14,31);
INSERT INTO Transcripts(transcriptID,standing,GPA,credits,creditReqs,userID) VALUES (32,TRUE,2.48,75,83,32);
INSERT INTO Transcripts(transcriptID,standing,GPA,credits,creditReqs,userID) VALUES (33,FALSE,0.55,15,31,33);
INSERT INTO Transcripts(transcriptID,standing,GPA,credits,creditReqs,userID) VALUES (34,FALSE,3.81,45,46,34);
INSERT INTO Transcripts(transcriptID,standing,GPA,credits,creditReqs,userID) VALUES (35,TRUE,2.86,89,105,35);
INSERT INTO Transcripts(transcriptID,standing,GPA,credits,creditReqs,userID) VALUES (36,FALSE,1.89,149,0,36);
INSERT INTO Transcripts(transcriptID,standing,GPA,credits,creditReqs,userID) VALUES (37,FALSE,2.55,82,11,37);
INSERT INTO Transcripts(transcriptID,standing,GPA,credits,creditReqs,userID) VALUES (38,TRUE,1.19,74,0,38);
INSERT INTO Transcripts(transcriptID,standing,GPA,credits,creditReqs,userID) VALUES (39,FALSE,2.82,50,117,39);
INSERT INTO Transcripts(transcriptID,standing,GPA,credits,creditReqs,userID) VALUES (40,TRUE,3.37,120,12,40);



INSERT INTO Courses(courseID,numCredits,name,department_code) VALUES (3172,3,'Database Design',5306);
INSERT INTO Courses(courseID,numCredits,name,department_code) VALUES (2978,1,'Fundamentals of Computer Science',5134);
INSERT INTO Courses(courseID,numCredits,name,department_code) VALUES (3020,2,'Object-Oriented Design',8930);
INSERT INTO Courses(courseID,numCredits,name,department_code) VALUES (1005,1,'Intro to Psychology',9096);
INSERT INTO Courses(courseID,numCredits,name,department_code) VALUES (2966,3,'Intro to Sociology',7626);
INSERT INTO Courses(courseID,numCredits,name,department_code) VALUES (2626,4,'Intro to Logic',5665);
INSERT INTO Courses(courseID,numCredits,name,department_code) VALUES (2837,1,'Anthropology',9259);
INSERT INTO Courses(courseID,numCredits,name,department_code) VALUES (2778,2,'General Chemistry',695);
INSERT INTO Courses(courseID,numCredits,name,department_code) VALUES (1146,2,'Organic Chemistry',7013);
INSERT INTO Courses(courseID,numCredits,name,department_code) VALUES (2323,3,'Statistics',8947);
INSERT INTO Courses(courseID,numCredits,name,department_code) VALUES (1964,1,'Fundamentals of Electronics',7555);
INSERT INTO Courses(courseID,numCredits,name,department_code) VALUES (3753,3,'Electronic Design',5206);
INSERT INTO Courses(courseID,numCredits,name,department_code) VALUES (1833,1,'Optics',700);
INSERT INTO Courses(courseID,numCredits,name,department_code) VALUES (2268,4,'Robotics',8398);
INSERT INTO Courses(courseID,numCredits,name,department_code) VALUES (2992,2,'Intro to Machine Learning',233);
INSERT INTO Courses(courseID,numCredits,name,department_code) VALUES (1740,1,'Electromagnetic Theory',5763);
INSERT INTO Courses(courseID,numCredits,name,department_code) VALUES (2242,3,'Intro to Astronomy',7388);
INSERT INTO Courses(courseID,numCredits,name,department_code) VALUES (3371,3,'Modern Science',3307);
INSERT INTO Courses(courseID,numCredits,name,department_code) VALUES (1267,3,'Medical Physics',281);
INSERT INTO Courses(courseID,numCredits,name,department_code) VALUES (3142,3,'String Theory',4371);
INSERT INTO Courses(courseID,numCredits,name,department_code) VALUES (2410,3,'Microeconomics',5336);
INSERT INTO Courses(courseID,numCredits,name,department_code) VALUES (3134,4,'Macroeconomics',384);
INSERT INTO Courses(courseID,numCredits,name,department_code) VALUES (2734,4,'Behavioral Economics',2880);
INSERT INTO Courses(courseID,numCredits,name,department_code) VALUES (3904,4,'Foundations of Biology',1807);
INSERT INTO Courses(courseID,numCredits,name,department_code) VALUES (1404,4,'The Human Organism',1046);
INSERT INTO Courses(courseID,numCredits,name,department_code) VALUES (1555,4,'Genetics and Molecular Biology',1401);
INSERT INTO Courses(courseID,numCredits,name,department_code) VALUES (2583,2,'East Asian Studies',2046);
INSERT INTO Courses(courseID,numCredits,name,department_code) VALUES (3741,1,'History of Boston',1741);
INSERT INTO Courses(courseID,numCredits,name,department_code) VALUES (2389,2,'History of Espionage',2392);
INSERT INTO Courses(courseID,numCredits,name,department_code) VALUES (1412,3,'The Holocaust and Comparative Genocide',762);
INSERT INTO Courses(courseID,numCredits,name,department_code) VALUES (3581,1,'Law',4210);
INSERT INTO Courses(courseID,numCredits,name,department_code) VALUES (2764,4,'Justice',6840);
INSERT INTO Courses(courseID,numCredits,name,department_code) VALUES (2083,3,'and Society in Modern China',7633);
INSERT INTO Courses(courseID,numCredits,name,department_code) VALUES (2338,2,'Topics in World History',696);
INSERT INTO Courses(courseID,numCredits,name,department_code) VALUES (1477,2,'Intro to Criminal Justice',7091);
INSERT INTO Courses(courseID,numCredits,name,department_code) VALUES (3776,2,'Criminal Due Process',4703);
INSERT INTO Courses(courseID,numCredits,name,department_code) VALUES (2051,2,'Crime',2318);
INSERT INTO Courses(courseID,numCredits,name,department_code) VALUES (1707,2,'Media',8570);
INSERT INTO Courses(courseID,numCredits,name,department_code) VALUES (1849,2,'and Politics',2960);
INSERT INTO Courses(courseID,numCredits,name,department_code) VALUES (1331,2,'Intro to Computer Science',3281);
INSERT INTO Courses(courseID,numCredits,name,department_code) VALUES (1418,3,'Policing a Democratic Society',5306);
INSERT INTO Courses(courseID,numCredits,name,department_code) VALUES (2374,4,'Global Criminology',5134);
INSERT INTO Courses(courseID,numCredits,name,department_code) VALUES (3618,1,'Criminal Justice Research Methods',8930);
INSERT INTO Courses(courseID,numCredits,name,department_code) VALUES (1547,3,'Financial Crimes',9096);
INSERT INTO Courses(courseID,numCredits,name,department_code) VALUES (2524,1,'Sports Psychology',7626);
INSERT INTO Courses(courseID,numCredits,name,department_code) VALUES (3367,4,'Clinical Neuroanatomy',5665);
INSERT INTO Courses(courseID,numCredits,name,department_code) VALUES (3748,3,'Developmental Psychology',9259);
INSERT INTO Courses(courseID,numCredits,name,department_code) VALUES (1846,4,'Learning Principles and Behavior Analysis',695);
INSERT INTO Courses(courseID,numCredits,name,department_code) VALUES (3404,4,'Fundamentals of Computer Science 2',7013);
INSERT INTO Courses(courseID,numCredits,name,department_code) VALUES (1197,1,'Cognition',8947);
INSERT INTO Courses(courseID,numCredits,name,department_code) VALUES (3664,3,'Psychology of Language',7555);
INSERT INTO Courses(courseID,numCredits,name,department_code) VALUES (1614,1,'Neuropsychology',5206);
INSERT INTO Courses(courseID,numCredits,name,department_code) VALUES (1426,2,'Intro to Rhetoric',700);
INSERT INTO Courses(courseID,numCredits,name,department_code) VALUES (2760,3,'Intro to Literary Studies',8398);
INSERT INTO Courses(courseID,numCredits,name,department_code) VALUES (3207,4,'Global Literatures',233);
INSERT INTO Courses(courseID,numCredits,name,department_code) VALUES (1679,2,'What Is Nature?',5763);
INSERT INTO Courses(courseID,numCredits,name,department_code) VALUES (3492,4,'Writing to Heal',7388);
INSERT INTO Courses(courseID,numCredits,name,department_code) VALUES (3933,2,'Writing Boston',3307);
INSERT INTO Courses(courseID,numCredits,name,department_code) VALUES (3330,3,'Creative Nonfiction',281);
INSERT INTO Courses(courseID,numCredits,name,department_code) VALUES (2617,2,'Emerson and Thoreau',4371);
INSERT INTO Courses(courseID,numCredits,name,department_code) VALUES (1591,3,'Topics in Rhetoric',5336);
INSERT INTO Courses(courseID,numCredits,name,department_code) VALUES (1179,3,'American Government',384);
INSERT INTO Courses(courseID,numCredits,name,department_code) VALUES (1560,4,'Intro to Political Science',2880);
INSERT INTO Courses(courseID,numCredits,name,department_code) VALUES (2662,4,'Comparative Politics',1807);
INSERT INTO Courses(courseID,numCredits,name,department_code) VALUES (2302,3,'Urban Policies and Politics',1046);
INSERT INTO Courses(courseID,numCredits,name,department_code) VALUES (1571,4,'Religion and Politics',1401);
INSERT INTO Courses(courseID,numCredits,name,department_code) VALUES (3796,4,'Terrorism and Counterterrorism',2046);
INSERT INTO Courses(courseID,numCredits,name,department_code) VALUES (3149,4,'Arab-Israeli Conflict',1741);
INSERT INTO Courses(courseID,numCredits,name,department_code) VALUES (3871,2,'Model United Nations',2392);
INSERT INTO Courses(courseID,numCredits,name,department_code) VALUES (1964,3,'Security and Resilience Policy',762);
INSERT INTO Courses(courseID,numCredits,name,department_code) VALUES (3967,4,'Science and Pseudoscience',4210);
INSERT INTO Courses(courseID,numCredits,name,department_code) VALUES (2210,3,'Intro to Religious Studies',6840);
INSERT INTO Courses(courseID,numCredits,name,department_code) VALUES (1907,2,'Comparative Ethics',7633);
INSERT INTO Courses(courseID,numCredits,name,department_code) VALUES (2773,1,'Selling Spirituality',696);
INSERT INTO Courses(courseID,numCredits,name,department_code) VALUES (3496,3,'Intro to Economic Justice',7091);
INSERT INTO Courses(courseID,numCredits,name,department_code) VALUES (3319,3,'Apocalypticism in Film',4703);
INSERT INTO Courses(courseID,numCredits,name,department_code) VALUES (3155,3,'Buildings and Cities',2318);
INSERT INTO Courses(courseID,numCredits,name,department_code) VALUES (3883,2,'A Global History',8570);
INSERT INTO Courses(courseID,numCredits,name,department_code) VALUES (3224,3,'Understanding Design',2960);
INSERT INTO Courses(courseID,numCredits,name,department_code) VALUES (1160,1,'Intro to Building Systems',3281);


INSERT INTO Course_Prereqs(prereqID,courseID) VALUES (1849,3871);
INSERT INTO Course_Prereqs(prereqID,courseID) VALUES (1005,2764);
INSERT INTO Course_Prereqs(prereqID,courseID) VALUES (2374,3371);
INSERT INTO Course_Prereqs(prereqID,courseID) VALUES (1418,3664);
INSERT INTO Course_Prereqs(prereqID,courseID) VALUES (2773,1005);
INSERT INTO Course_Prereqs(prereqID,courseID) VALUES (3871,1179);
INSERT INTO Course_Prereqs(prereqID,courseID) VALUES (1418,1907);
INSERT INTO Course_Prereqs(prereqID,courseID) VALUES (1964,1412);
INSERT INTO Course_Prereqs(prereqID,courseID) VALUES (3330,3883);
INSERT INTO Course_Prereqs(prereqID,courseID) VALUES (3367,2760);
INSERT INTO Course_Prereqs(prereqID,courseID) VALUES (3796,1197);
INSERT INTO Course_Prereqs(prereqID,courseID) VALUES (2242,1560);
INSERT INTO Course_Prereqs(prereqID,courseID) VALUES (1964,1964);
INSERT INTO Course_Prereqs(prereqID,courseID) VALUES (3967,2374);
INSERT INTO Course_Prereqs(prereqID,courseID) VALUES (2583,1614);
INSERT INTO Course_Prereqs(prereqID,courseID) VALUES (3776,3142);
INSERT INTO Course_Prereqs(prereqID,courseID) VALUES (3404,2083);
INSERT INTO Course_Prereqs(prereqID,courseID) VALUES (1418,2210);
INSERT INTO Course_Prereqs(prereqID,courseID) VALUES (2374,3172);
INSERT INTO Course_Prereqs(prereqID,courseID) VALUES (1555,2773);
INSERT INTO Course_Prereqs(prereqID,courseID) VALUES (3020,2051);
INSERT INTO Course_Prereqs(prereqID,courseID) VALUES (1591,1426);
INSERT INTO Course_Prereqs(prereqID,courseID) VALUES (1160,1267);
INSERT INTO Course_Prereqs(prereqID,courseID) VALUES (1426,1555);
INSERT INTO Course_Prereqs(prereqID,courseID) VALUES (1547,2764);
INSERT INTO Course_Prereqs(prereqID,courseID) VALUES (1005,1267);
INSERT INTO Course_Prereqs(prereqID,courseID) VALUES (2764,2966);
INSERT INTO Course_Prereqs(prereqID,courseID) VALUES (2374,1146);
INSERT INTO Course_Prereqs(prereqID,courseID) VALUES (2764,1571);
INSERT INTO Course_Prereqs(prereqID,courseID) VALUES (2302,3207);
INSERT INTO Course_Prereqs(prereqID,courseID) VALUES (2083,3748);
INSERT INTO Course_Prereqs(prereqID,courseID) VALUES (2524,2778);
INSERT INTO Course_Prereqs(prereqID,courseID) VALUES (3207,3492);
INSERT INTO Course_Prereqs(prereqID,courseID) VALUES (3367,3776);
INSERT INTO Course_Prereqs(prereqID,courseID) VALUES (3618,1849);
INSERT INTO Course_Prereqs(prereqID,courseID) VALUES (1707,1404);
INSERT INTO Course_Prereqs(prereqID,courseID) VALUES (2524,2242);
INSERT INTO Course_Prereqs(prereqID,courseID) VALUES (3134,1964);
INSERT INTO Course_Prereqs(prereqID,courseID) VALUES (2992,3904);
INSERT INTO Course_Prereqs(prereqID,courseID) VALUES (3753,3496);
INSERT INTO Course_Prereqs(prereqID,courseID) VALUES (1404,2583);
INSERT INTO Course_Prereqs(prereqID,courseID) VALUES (1833,3904);
INSERT INTO Course_Prereqs(prereqID,courseID) VALUES (2734,3319);
INSERT INTO Course_Prereqs(prereqID,courseID) VALUES (3149,1412);
INSERT INTO Course_Prereqs(prereqID,courseID) VALUES (2617,3967);
INSERT INTO Course_Prereqs(prereqID,courseID) VALUES (2410,3020);
INSERT INTO Course_Prereqs(prereqID,courseID) VALUES (3155,1418);
INSERT INTO Course_Prereqs(prereqID,courseID) VALUES (1146,2764);
INSERT INTO Course_Prereqs(prereqID,courseID) VALUES (3172,3741);
INSERT INTO Course_Prereqs(prereqID,courseID) VALUES (2242,1964);
INSERT INTO Course_Prereqs(prereqID,courseID) VALUES (2617,1740);
INSERT INTO Course_Prereqs(prereqID,courseID) VALUES (3776,2837);
INSERT INTO Course_Prereqs(prereqID,courseID) VALUES (1267,2617);
INSERT INTO Course_Prereqs(prereqID,courseID) VALUES (3581,1146);
INSERT INTO Course_Prereqs(prereqID,courseID) VALUES (1555,2626);
INSERT INTO Course_Prereqs(prereqID,courseID) VALUES (2338,3664);
INSERT INTO Course_Prereqs(prereqID,courseID) VALUES (2374,3883);
INSERT INTO Course_Prereqs(prereqID,courseID) VALUES (3172,2617);
INSERT INTO Course_Prereqs(prereqID,courseID) VALUES (3753,3020);
INSERT INTO Course_Prereqs(prereqID,courseID) VALUES (1571,1477);



INSERT INTO Transcripts_Courses(transcriptID,courseID,grade) VALUES (1,3172,69);
INSERT INTO Transcripts_Courses(transcriptID,courseID,grade) VALUES (2,2978,90);
INSERT INTO Transcripts_Courses(transcriptID,courseID,grade) VALUES (3,3020,70);
INSERT INTO Transcripts_Courses(transcriptID,courseID,grade) VALUES (4,1005,96);
INSERT INTO Transcripts_Courses(transcriptID,courseID,grade) VALUES (5,2966,91);
INSERT INTO Transcripts_Courses(transcriptID,courseID,grade) VALUES (6,2626,73);
INSERT INTO Transcripts_Courses(transcriptID,courseID,grade) VALUES (7,2837,100);
INSERT INTO Transcripts_Courses(transcriptID,courseID,grade) VALUES (8,2778,82);
INSERT INTO Transcripts_Courses(transcriptID,courseID,grade) VALUES (9,1146,72);
INSERT INTO Transcripts_Courses(transcriptID,courseID,grade) VALUES (10,2323,84);
INSERT INTO Transcripts_Courses(transcriptID,courseID,grade) VALUES (11,1964,65);
INSERT INTO Transcripts_Courses(transcriptID,courseID,grade) VALUES (12,3753,66);
INSERT INTO Transcripts_Courses(transcriptID,courseID,grade) VALUES (13,1833,96);
INSERT INTO Transcripts_Courses(transcriptID,courseID,grade) VALUES (14,2268,95);
INSERT INTO Transcripts_Courses(transcriptID,courseID,grade) VALUES (15,2992,77);
INSERT INTO Transcripts_Courses(transcriptID,courseID,grade) VALUES (16,1740,95);
INSERT INTO Transcripts_Courses(transcriptID,courseID,grade) VALUES (17,2242,86);
INSERT INTO Transcripts_Courses(transcriptID,courseID,grade) VALUES (18,3371,84);
INSERT INTO Transcripts_Courses(transcriptID,courseID,grade) VALUES (19,1267,85);
INSERT INTO Transcripts_Courses(transcriptID,courseID,grade) VALUES (20,3142,95);
INSERT INTO Transcripts_Courses(transcriptID,courseID,grade) VALUES (21,2410,73);
INSERT INTO Transcripts_Courses(transcriptID,courseID,grade) VALUES (22,3134,97);
INSERT INTO Transcripts_Courses(transcriptID,courseID,grade) VALUES (23,2734,96);
INSERT INTO Transcripts_Courses(transcriptID,courseID,grade) VALUES (24,3904,99);
INSERT INTO Transcripts_Courses(transcriptID,courseID,grade) VALUES (25,1404,97);
INSERT INTO Transcripts_Courses(transcriptID,courseID,grade) VALUES (26,1555,79);
INSERT INTO Transcripts_Courses(transcriptID,courseID,grade) VALUES (27,2583,91);
INSERT INTO Transcripts_Courses(transcriptID,courseID,grade) VALUES (28,3741,87);
INSERT INTO Transcripts_Courses(transcriptID,courseID,grade) VALUES (29,2389,68);
INSERT INTO Transcripts_Courses(transcriptID,courseID,grade) VALUES (30,1412,96);
INSERT INTO Transcripts_Courses(transcriptID,courseID,grade) VALUES (31,3581,81);
INSERT INTO Transcripts_Courses(transcriptID,courseID,grade) VALUES (32,2764,97);
INSERT INTO Transcripts_Courses(transcriptID,courseID,grade) VALUES (33,2083,99);
INSERT INTO Transcripts_Courses(transcriptID,courseID,grade) VALUES (34,2338,76);
INSERT INTO Transcripts_Courses(transcriptID,courseID,grade) VALUES (35,1477,84);
INSERT INTO Transcripts_Courses(transcriptID,courseID,grade) VALUES (36,3776,74);
INSERT INTO Transcripts_Courses(transcriptID,courseID,grade) VALUES (37,2051,99);
INSERT INTO Transcripts_Courses(transcriptID,courseID,grade) VALUES (38,1707,72);
INSERT INTO Transcripts_Courses(transcriptID,courseID,grade) VALUES (39,1849,81);
INSERT INTO Transcripts_Courses(transcriptID,courseID,grade) VALUES (40,1331,79);
INSERT INTO Transcripts_Courses(transcriptID,courseID,grade) VALUES (1,1418,69);
INSERT INTO Transcripts_Courses(transcriptID,courseID,grade) VALUES (2,2374,68);
INSERT INTO Transcripts_Courses(transcriptID,courseID,grade) VALUES (3,3618,85);
INSERT INTO Transcripts_Courses(transcriptID,courseID,grade) VALUES (4,1547,69);
INSERT INTO Transcripts_Courses(transcriptID,courseID,grade) VALUES (5,2524,74);
INSERT INTO Transcripts_Courses(transcriptID,courseID,grade) VALUES (6,3367,89);
INSERT INTO Transcripts_Courses(transcriptID,courseID,grade) VALUES (7,3748,70);
INSERT INTO Transcripts_Courses(transcriptID,courseID,grade) VALUES (8,1846,96);
INSERT INTO Transcripts_Courses(transcriptID,courseID,grade) VALUES (9,3404,85);
INSERT INTO Transcripts_Courses(transcriptID,courseID,grade) VALUES (10,1197,95);
INSERT INTO Transcripts_Courses(transcriptID,courseID,grade) VALUES (11,3664,66);
INSERT INTO Transcripts_Courses(transcriptID,courseID,grade) VALUES (12,1614,98);
INSERT INTO Transcripts_Courses(transcriptID,courseID,grade) VALUES (13,1426,89);
INSERT INTO Transcripts_Courses(transcriptID,courseID,grade) VALUES (14,2760,68);
INSERT INTO Transcripts_Courses(transcriptID,courseID,grade) VALUES (15,3207,97);
INSERT INTO Transcripts_Courses(transcriptID,courseID,grade) VALUES (16,1679,98);
INSERT INTO Transcripts_Courses(transcriptID,courseID,grade) VALUES (17,3492,75);
INSERT INTO Transcripts_Courses(transcriptID,courseID,grade) VALUES (18,3933,86);
INSERT INTO Transcripts_Courses(transcriptID,courseID,grade) VALUES (19,3330,99);
INSERT INTO Transcripts_Courses(transcriptID,courseID,grade) VALUES (20,2617,82);
INSERT INTO Transcripts_Courses(transcriptID,courseID,grade) VALUES (21,1591,65);
INSERT INTO Transcripts_Courses(transcriptID,courseID,grade) VALUES (22,1179,65);
INSERT INTO Transcripts_Courses(transcriptID,courseID,grade) VALUES (23,1560,69);
INSERT INTO Transcripts_Courses(transcriptID,courseID,grade) VALUES (24,2662,93);
INSERT INTO Transcripts_Courses(transcriptID,courseID,grade) VALUES (25,2302,69);
INSERT INTO Transcripts_Courses(transcriptID,courseID,grade) VALUES (26,1571,68);
INSERT INTO Transcripts_Courses(transcriptID,courseID,grade) VALUES (27,3796,94);
INSERT INTO Transcripts_Courses(transcriptID,courseID,grade) VALUES (28,3149,78);
INSERT INTO Transcripts_Courses(transcriptID,courseID,grade) VALUES (29,3871,100);
INSERT INTO Transcripts_Courses(transcriptID,courseID,grade) VALUES (30,1964,90);
INSERT INTO Transcripts_Courses(transcriptID,courseID,grade) VALUES (31,3967,87);
INSERT INTO Transcripts_Courses(transcriptID,courseID,grade) VALUES (32,2210,67);
INSERT INTO Transcripts_Courses(transcriptID,courseID,grade) VALUES (33,1907,76);
INSERT INTO Transcripts_Courses(transcriptID,courseID,grade) VALUES (34,2773,77);
INSERT INTO Transcripts_Courses(transcriptID,courseID,grade) VALUES (35,3496,73);
INSERT INTO Transcripts_Courses(transcriptID,courseID,grade) VALUES (36,3319,80);
INSERT INTO Transcripts_Courses(transcriptID,courseID,grade) VALUES (37,3155,89);
INSERT INTO Transcripts_Courses(transcriptID,courseID,grade) VALUES (38,3883,93);
INSERT INTO Transcripts_Courses(transcriptID,courseID,grade) VALUES (39,3224,88);
INSERT INTO Transcripts_Courses(transcriptID,courseID,grade) VALUES (40,1160,90);


INSERT INTO Course_Ratings(courseID,rating) VALUES (3172,8);
INSERT INTO Course_Ratings(courseID,rating) VALUES (2978,4);
INSERT INTO Course_Ratings(courseID,rating) VALUES (3020,6);
INSERT INTO Course_Ratings(courseID,rating) VALUES (1005,10);
INSERT INTO Course_Ratings(courseID,rating) VALUES (2966,3);
INSERT INTO Course_Ratings(courseID,rating) VALUES (2626,1);
INSERT INTO Course_Ratings(courseID,rating) VALUES (2837,9);
INSERT INTO Course_Ratings(courseID,rating) VALUES (2778,6);
INSERT INTO Course_Ratings(courseID,rating) VALUES (1146,5);
INSERT INTO Course_Ratings(courseID,rating) VALUES (2323,10);
INSERT INTO Course_Ratings(courseID,rating) VALUES (1964,1);
INSERT INTO Course_Ratings(courseID,rating) VALUES (3753,9);
INSERT INTO Course_Ratings(courseID,rating) VALUES (1833,8);
INSERT INTO Course_Ratings(courseID,rating) VALUES (2268,5);
INSERT INTO Course_Ratings(courseID,rating) VALUES (2992,7);
INSERT INTO Course_Ratings(courseID,rating) VALUES (1740,3);
INSERT INTO Course_Ratings(courseID,rating) VALUES (2242,4);
INSERT INTO Course_Ratings(courseID,rating) VALUES (3371,7);
INSERT INTO Course_Ratings(courseID,rating) VALUES (1267,10);
INSERT INTO Course_Ratings(courseID,rating) VALUES (3142,7);
INSERT INTO Course_Ratings(courseID,rating) VALUES (2410,5);
INSERT INTO Course_Ratings(courseID,rating) VALUES (3134,10);
INSERT INTO Course_Ratings(courseID,rating) VALUES (2734,8);
INSERT INTO Course_Ratings(courseID,rating) VALUES (3904,10);
INSERT INTO Course_Ratings(courseID,rating) VALUES (1404,2);
INSERT INTO Course_Ratings(courseID,rating) VALUES (1555,8);
INSERT INTO Course_Ratings(courseID,rating) VALUES (2583,8);
INSERT INTO Course_Ratings(courseID,rating) VALUES (3741,1);
INSERT INTO Course_Ratings(courseID,rating) VALUES (2389,9);
INSERT INTO Course_Ratings(courseID,rating) VALUES (1412,2);
INSERT INTO Course_Ratings(courseID,rating) VALUES (3581,5);
INSERT INTO Course_Ratings(courseID,rating) VALUES (2764,3);
INSERT INTO Course_Ratings(courseID,rating) VALUES (2083,7);
INSERT INTO Course_Ratings(courseID,rating) VALUES (2338,7);
INSERT INTO Course_Ratings(courseID,rating) VALUES (1477,1);
INSERT INTO Course_Ratings(courseID,rating) VALUES (3776,5);
INSERT INTO Course_Ratings(courseID,rating) VALUES (2051,6);
INSERT INTO Course_Ratings(courseID,rating) VALUES (1707,7);
INSERT INTO Course_Ratings(courseID,rating) VALUES (1849,8);
INSERT INTO Course_Ratings(courseID,rating) VALUES (1331,10);
INSERT INTO Course_Ratings(courseID,rating) VALUES (1418,6);
INSERT INTO Course_Ratings(courseID,rating) VALUES (2374,7);
INSERT INTO Course_Ratings(courseID,rating) VALUES (3618,3);
INSERT INTO Course_Ratings(courseID,rating) VALUES (1547,7);
INSERT INTO Course_Ratings(courseID,rating) VALUES (2524,10);
INSERT INTO Course_Ratings(courseID,rating) VALUES (3367,8);
INSERT INTO Course_Ratings(courseID,rating) VALUES (3748,1);
INSERT INTO Course_Ratings(courseID,rating) VALUES (1846,4);
INSERT INTO Course_Ratings(courseID,rating) VALUES (3404,7);
INSERT INTO Course_Ratings(courseID,rating) VALUES (1197,1);
INSERT INTO Course_Ratings(courseID,rating) VALUES (3664,10);
INSERT INTO Course_Ratings(courseID,rating) VALUES (1614,4);
INSERT INTO Course_Ratings(courseID,rating) VALUES (1426,6);
INSERT INTO Course_Ratings(courseID,rating) VALUES (2760,10);
INSERT INTO Course_Ratings(courseID,rating) VALUES (3207,4);
INSERT INTO Course_Ratings(courseID,rating) VALUES (1679,8);
INSERT INTO Course_Ratings(courseID,rating) VALUES (3492,10);
INSERT INTO Course_Ratings(courseID,rating) VALUES (3933,7);
INSERT INTO Course_Ratings(courseID,rating) VALUES (3330,8);
INSERT INTO Course_Ratings(courseID,rating) VALUES (2617,9);
INSERT INTO Course_Ratings(courseID,rating) VALUES (1591,6);
INSERT INTO Course_Ratings(courseID,rating) VALUES (1179,6);
INSERT INTO Course_Ratings(courseID,rating) VALUES (1560,6);
INSERT INTO Course_Ratings(courseID,rating) VALUES (2662,5);
INSERT INTO Course_Ratings(courseID,rating) VALUES (2302,8);
INSERT INTO Course_Ratings(courseID,rating) VALUES (1571,9);
INSERT INTO Course_Ratings(courseID,rating) VALUES (3796,4);
INSERT INTO Course_Ratings(courseID,rating) VALUES (3149,4);
INSERT INTO Course_Ratings(courseID,rating) VALUES (3871,4);
INSERT INTO Course_Ratings(courseID,rating) VALUES (1964,1);
INSERT INTO Course_Ratings(courseID,rating) VALUES (3967,4);
INSERT INTO Course_Ratings(courseID,rating) VALUES (2210,1);
INSERT INTO Course_Ratings(courseID,rating) VALUES (1907,2);
INSERT INTO Course_Ratings(courseID,rating) VALUES (2773,9);
INSERT INTO Course_Ratings(courseID,rating) VALUES (3496,6);
INSERT INTO Course_Ratings(courseID,rating) VALUES (3319,6);
INSERT INTO Course_Ratings(courseID,rating) VALUES (3155,2);
INSERT INTO Course_Ratings(courseID,rating) VALUES (3883,7);
INSERT INTO Course_Ratings(courseID,rating) VALUES (3224,3);
INSERT INTO Course_Ratings(courseID,rating) VALUES (1160,9);
INSERT INTO Course_Ratings(courseID,rating) VALUES (3172,7);
INSERT INTO Course_Ratings(courseID,rating) VALUES (2978,1);
INSERT INTO Course_Ratings(courseID,rating) VALUES (3020,3);
INSERT INTO Course_Ratings(courseID,rating) VALUES (1005,3);
INSERT INTO Course_Ratings(courseID,rating) VALUES (2966,6);
INSERT INTO Course_Ratings(courseID,rating) VALUES (2626,4);
INSERT INTO Course_Ratings(courseID,rating) VALUES (2837,4);
INSERT INTO Course_Ratings(courseID,rating) VALUES (2778,1);
INSERT INTO Course_Ratings(courseID,rating) VALUES (1146,4);
INSERT INTO Course_Ratings(courseID,rating) VALUES (2323,3);
INSERT INTO Course_Ratings(courseID,rating) VALUES (1964,10);
INSERT INTO Course_Ratings(courseID,rating) VALUES (3753,1);
INSERT INTO Course_Ratings(courseID,rating) VALUES (1833,7);
INSERT INTO Course_Ratings(courseID,rating) VALUES (2268,5);
INSERT INTO Course_Ratings(courseID,rating) VALUES (2992,10);
INSERT INTO Course_Ratings(courseID,rating) VALUES (1740,8);
INSERT INTO Course_Ratings(courseID,rating) VALUES (2242,7);
INSERT INTO Course_Ratings(courseID,rating) VALUES (3371,9);
INSERT INTO Course_Ratings(courseID,rating) VALUES (1267,2);
INSERT INTO Course_Ratings(courseID,rating) VALUES (3142,10);
INSERT INTO Course_Ratings(courseID,rating) VALUES (2410,7);
INSERT INTO Course_Ratings(courseID,rating) VALUES (3134,2);
INSERT INTO Course_Ratings(courseID,rating) VALUES (2734,6);
INSERT INTO Course_Ratings(courseID,rating) VALUES (3904,5);
INSERT INTO Course_Ratings(courseID,rating) VALUES (1404,10);
INSERT INTO Course_Ratings(courseID,rating) VALUES (1555,10);
INSERT INTO Course_Ratings(courseID,rating) VALUES (2583,9);
INSERT INTO Course_Ratings(courseID,rating) VALUES (3741,2);
INSERT INTO Course_Ratings(courseID,rating) VALUES (2389,3);
INSERT INTO Course_Ratings(courseID,rating) VALUES (1412,2);
INSERT INTO Course_Ratings(courseID,rating) VALUES (3581,8);
INSERT INTO Course_Ratings(courseID,rating) VALUES (2764,1);
INSERT INTO Course_Ratings(courseID,rating) VALUES (2083,6);
INSERT INTO Course_Ratings(courseID,rating) VALUES (2338,2);
INSERT INTO Course_Ratings(courseID,rating) VALUES (1477,5);
INSERT INTO Course_Ratings(courseID,rating) VALUES (3776,9);
INSERT INTO Course_Ratings(courseID,rating) VALUES (2051,3);
INSERT INTO Course_Ratings(courseID,rating) VALUES (1707,10);
INSERT INTO Course_Ratings(courseID,rating) VALUES (1849,5);
INSERT INTO Course_Ratings(courseID,rating) VALUES (1331,2);
INSERT INTO Course_Ratings(courseID,rating) VALUES (1418,8);
INSERT INTO Course_Ratings(courseID,rating) VALUES (2374,8);
INSERT INTO Course_Ratings(courseID,rating) VALUES (3618,6);
INSERT INTO Course_Ratings(courseID,rating) VALUES (1547,10);
INSERT INTO Course_Ratings(courseID,rating) VALUES (2524,6);
INSERT INTO Course_Ratings(courseID,rating) VALUES (3367,3);
INSERT INTO Course_Ratings(courseID,rating) VALUES (3748,3);
INSERT INTO Course_Ratings(courseID,rating) VALUES (1846,7);
INSERT INTO Course_Ratings(courseID,rating) VALUES (3404,5);
INSERT INTO Course_Ratings(courseID,rating) VALUES (1197,2);
INSERT INTO Course_Ratings(courseID,rating) VALUES (3664,8);
INSERT INTO Course_Ratings(courseID,rating) VALUES (1614,2);
INSERT INTO Course_Ratings(courseID,rating) VALUES (1426,7);
INSERT INTO Course_Ratings(courseID,rating) VALUES (2760,5);
INSERT INTO Course_Ratings(courseID,rating) VALUES (3207,2);
INSERT INTO Course_Ratings(courseID,rating) VALUES (1679,3);
INSERT INTO Course_Ratings(courseID,rating) VALUES (3492,5);
INSERT INTO Course_Ratings(courseID,rating) VALUES (3933,3);
INSERT INTO Course_Ratings(courseID,rating) VALUES (3330,2);
INSERT INTO Course_Ratings(courseID,rating) VALUES (2617,3);
INSERT INTO Course_Ratings(courseID,rating) VALUES (1591,7);
INSERT INTO Course_Ratings(courseID,rating) VALUES (1179,8);
INSERT INTO Course_Ratings(courseID,rating) VALUES (1560,7);
INSERT INTO Course_Ratings(courseID,rating) VALUES (2662,8);
INSERT INTO Course_Ratings(courseID,rating) VALUES (2302,4);
INSERT INTO Course_Ratings(courseID,rating) VALUES (1571,2);
INSERT INTO Course_Ratings(courseID,rating) VALUES (3796,2);
INSERT INTO Course_Ratings(courseID,rating) VALUES (3149,6);
INSERT INTO Course_Ratings(courseID,rating) VALUES (3871,7);
INSERT INTO Course_Ratings(courseID,rating) VALUES (1964,1);
INSERT INTO Course_Ratings(courseID,rating) VALUES (3967,1);
INSERT INTO Course_Ratings(courseID,rating) VALUES (2210,3);
INSERT INTO Course_Ratings(courseID,rating) VALUES (1907,1);
INSERT INTO Course_Ratings(courseID,rating) VALUES (2773,4);
INSERT INTO Course_Ratings(courseID,rating) VALUES (3496,6);
INSERT INTO Course_Ratings(courseID,rating) VALUES (3319,4);
INSERT INTO Course_Ratings(courseID,rating) VALUES (3155,4);
INSERT INTO Course_Ratings(courseID,rating) VALUES (3883,3);
INSERT INTO Course_Ratings(courseID,rating) VALUES (3224,4);
INSERT INTO Course_Ratings(courseID,rating) VALUES (1160,5);



INSERT INTO Course_Reqsfulfilled(courseID,nupathReq) VALUES (3172,'Employing Ethical Reasoning');
INSERT INTO Course_Reqsfulfilled(courseID,nupathReq) VALUES (2978,'Understanding Societies and Institutions');
INSERT INTO Course_Reqsfulfilled(courseID,nupathReq) VALUES (3020,'Integrating Knowledge and Skills Through Experience');
INSERT INTO Course_Reqsfulfilled(courseID,nupathReq) VALUES (1005,'Conducting Formal and Quantitative Reasoning');
INSERT INTO Course_Reqsfulfilled(courseID,nupathReq) VALUES (2966,'Demonstrating Thought and Action in a Capstone');
INSERT INTO Course_Reqsfulfilled(courseID,nupathReq) VALUES (2626,'Interpreting Culture');
INSERT INTO Course_Reqsfulfilled(courseID,nupathReq) VALUES (2837,'Engaging with the Natural and Designed World');
INSERT INTO Course_Reqsfulfilled(courseID,nupathReq) VALUES (2778,'Understanding Societies and Institutions');
INSERT INTO Course_Reqsfulfilled(courseID,nupathReq) VALUES (1146,'Interpreting Culture');
INSERT INTO Course_Reqsfulfilled(courseID,nupathReq) VALUES (2323,'Engaging Differences and Diversity');
INSERT INTO Course_Reqsfulfilled(courseID,nupathReq) VALUES (1964,'Integrating Knowledge and Skills Through Experience');
INSERT INTO Course_Reqsfulfilled(courseID,nupathReq) VALUES (3753,'Understanding Societies and Institutions');
INSERT INTO Course_Reqsfulfilled(courseID,nupathReq) VALUES (1833,'Demonstrating Thought and Action in a Capstone');
INSERT INTO Course_Reqsfulfilled(courseID,nupathReq) VALUES (2268,'Conducting Formal and Quantitative Reasoning');
INSERT INTO Course_Reqsfulfilled(courseID,nupathReq) VALUES (2992,'Integrating Knowledge and Skills Through Experience');
INSERT INTO Course_Reqsfulfilled(courseID,nupathReq) VALUES (1740,'Demonstrating Thought and Action in a Capstone');
INSERT INTO Course_Reqsfulfilled(courseID,nupathReq) VALUES (2242,'Writing Across Audiences and Genres');
INSERT INTO Course_Reqsfulfilled(courseID,nupathReq) VALUES (3371,'Integrating Knowledge and Skills Through Experience');
INSERT INTO Course_Reqsfulfilled(courseID,nupathReq) VALUES (1267,'Exploring Creative Expression and Innovation');
INSERT INTO Course_Reqsfulfilled(courseID,nupathReq) VALUES (3142,'Understanding Societies and Institutions');
INSERT INTO Course_Reqsfulfilled(courseID,nupathReq) VALUES (2410,'Understanding Societies and Institutions');
INSERT INTO Course_Reqsfulfilled(courseID,nupathReq) VALUES (3134,'Employing Ethical Reasoning');
INSERT INTO Course_Reqsfulfilled(courseID,nupathReq) VALUES (2734,'Integrating Knowledge and Skills Through Experience');
INSERT INTO Course_Reqsfulfilled(courseID,nupathReq) VALUES (3904,'Writing Across Audiences and Genres');
INSERT INTO Course_Reqsfulfilled(courseID,nupathReq) VALUES (1404,'Writing Across Audiences and Genres');
INSERT INTO Course_Reqsfulfilled(courseID,nupathReq) VALUES (1555,'Conducting Formal and Quantitative Reasoning');
INSERT INTO Course_Reqsfulfilled(courseID,nupathReq) VALUES (2583,'Writing Across Audiences and Genres');
INSERT INTO Course_Reqsfulfilled(courseID,nupathReq) VALUES (3741,'Understanding Societies and Institutions');
INSERT INTO Course_Reqsfulfilled(courseID,nupathReq) VALUES (2389,'Writing Across Audiences and Genres');
INSERT INTO Course_Reqsfulfilled(courseID,nupathReq) VALUES (1412,'Demonstrating Thought and Action in a Capstone');
INSERT INTO Course_Reqsfulfilled(courseID,nupathReq) VALUES (3581,'Demonstrating Thought and Action in a Capstone');
INSERT INTO Course_Reqsfulfilled(courseID,nupathReq) VALUES (2764,'Integrating Knowledge and Skills Through Experience');
INSERT INTO Course_Reqsfulfilled(courseID,nupathReq) VALUES (2083,'Engaging with the Natural and Designed World');
INSERT INTO Course_Reqsfulfilled(courseID,nupathReq) VALUES (2338,'Integrating Knowledge and Skills Through Experience');
INSERT INTO Course_Reqsfulfilled(courseID,nupathReq) VALUES (1477,'Interpreting Culture');
INSERT INTO Course_Reqsfulfilled(courseID,nupathReq) VALUES (3776,'Engaging Differences and Diversity');
INSERT INTO Course_Reqsfulfilled(courseID,nupathReq) VALUES (2051,'Understanding Societies and Institutions');
INSERT INTO Course_Reqsfulfilled(courseID,nupathReq) VALUES (1707,'Demonstrating Thought and Action in a Capstone');
INSERT INTO Course_Reqsfulfilled(courseID,nupathReq) VALUES (1849,'Exploring Creative Expression and Innovation');
INSERT INTO Course_Reqsfulfilled(courseID,nupathReq) VALUES (1331,'Engaging with the Natural and Designed World');
INSERT INTO Course_Reqsfulfilled(courseID,nupathReq) VALUES (1418,'Writing Across Audiences and Genres');
INSERT INTO Course_Reqsfulfilled(courseID,nupathReq) VALUES (2374,'Demonstrating Thought and Action in a Capstone');
INSERT INTO Course_Reqsfulfilled(courseID,nupathReq) VALUES (3618,'Understanding Societies and Institutions');
INSERT INTO Course_Reqsfulfilled(courseID,nupathReq) VALUES (1547,'Conducting Formal and Quantitative Reasoning');
INSERT INTO Course_Reqsfulfilled(courseID,nupathReq) VALUES (2524,'Analyzing and Using Data');
INSERT INTO Course_Reqsfulfilled(courseID,nupathReq) VALUES (3367,'Writing Across Audiences and Genres');
INSERT INTO Course_Reqsfulfilled(courseID,nupathReq) VALUES (3748,'Demonstrating Thought and Action in a Capstone');
INSERT INTO Course_Reqsfulfilled(courseID,nupathReq) VALUES (1846,'Engaging with the Natural and Designed World');
INSERT INTO Course_Reqsfulfilled(courseID,nupathReq) VALUES (3404,'Employing Ethical Reasoning');
INSERT INTO Course_Reqsfulfilled(courseID,nupathReq) VALUES (1197,'Interpreting Culture');
INSERT INTO Course_Reqsfulfilled(courseID,nupathReq) VALUES (3664,'Understanding Societies and Institutions');
INSERT INTO Course_Reqsfulfilled(courseID,nupathReq) VALUES (1614,'Exploring Creative Expression and Innovation');
INSERT INTO Course_Reqsfulfilled(courseID,nupathReq) VALUES (1426,'Conducting Formal and Quantitative Reasoning');
INSERT INTO Course_Reqsfulfilled(courseID,nupathReq) VALUES (2760,'Conducting Formal and Quantitative Reasoning');
INSERT INTO Course_Reqsfulfilled(courseID,nupathReq) VALUES (3207,'Understanding Societies and Institutions');
INSERT INTO Course_Reqsfulfilled(courseID,nupathReq) VALUES (1679,'Conducting Formal and Quantitative Reasoning');
INSERT INTO Course_Reqsfulfilled(courseID,nupathReq) VALUES (3492,'Conducting Formal and Quantitative Reasoning');
INSERT INTO Course_Reqsfulfilled(courseID,nupathReq) VALUES (3933,'Writing Across Audiences and Genres');
INSERT INTO Course_Reqsfulfilled(courseID,nupathReq) VALUES (3330,'Demonstrating Thought and Action in a Capstone');
INSERT INTO Course_Reqsfulfilled(courseID,nupathReq) VALUES (2617,'Engaging Differences and Diversity');
INSERT INTO Course_Reqsfulfilled(courseID,nupathReq) VALUES (1591,'Engaging with the Natural and Designed World');
INSERT INTO Course_Reqsfulfilled(courseID,nupathReq) VALUES (1179,'Analyzing and Using Data');
INSERT INTO Course_Reqsfulfilled(courseID,nupathReq) VALUES (1560,'Engaging Differences and Diversity');
INSERT INTO Course_Reqsfulfilled(courseID,nupathReq) VALUES (2662,'Conducting Formal and Quantitative Reasoning');
INSERT INTO Course_Reqsfulfilled(courseID,nupathReq) VALUES (2302,'Understanding Societies and Institutions');
INSERT INTO Course_Reqsfulfilled(courseID,nupathReq) VALUES (1571,'Interpreting Culture');
INSERT INTO Course_Reqsfulfilled(courseID,nupathReq) VALUES (3796,'Demonstrating Thought and Action in a Capstone');
INSERT INTO Course_Reqsfulfilled(courseID,nupathReq) VALUES (3149,'Analyzing and Using Data');
INSERT INTO Course_Reqsfulfilled(courseID,nupathReq) VALUES (3871,'Employing Ethical Reasoning');
INSERT INTO Course_Reqsfulfilled(courseID,nupathReq) VALUES (3967,'Engaging Differences and Diversity');
INSERT INTO Course_Reqsfulfilled(courseID,nupathReq) VALUES (2210,'Writing Across Audiences and Genres');
INSERT INTO Course_Reqsfulfilled(courseID,nupathReq) VALUES (1907,'Employing Ethical Reasoning');
INSERT INTO Course_Reqsfulfilled(courseID,nupathReq) VALUES (2773,'Understanding Societies and Institutions');
INSERT INTO Course_Reqsfulfilled(courseID,nupathReq) VALUES (3496,'Demonstrating Thought and Action in a Capstone');
INSERT INTO Course_Reqsfulfilled(courseID,nupathReq) VALUES (3319,'Exploring Creative Expression and Innovation');
INSERT INTO Course_Reqsfulfilled(courseID,nupathReq) VALUES (3155,'Engaging Differences and Diversity');
INSERT INTO Course_Reqsfulfilled(courseID,nupathReq) VALUES (3883,'Engaging with the Natural and Designed World');
INSERT INTO Course_Reqsfulfilled(courseID,nupathReq) VALUES (3224,'Employing Ethical Reasoning');
INSERT INTO Course_Reqsfulfilled(courseID,nupathReq) VALUES (1160,'Analyzing and Using Data');



INSERT INTO Instructors(teacherID,name,email) VALUES (1,'Rickie Scartifield','rscartifield0@nymag.com');
INSERT INTO Instructors(teacherID,name,email) VALUES (2,'Sharyl Tibbotts','stibbotts1@alibaba.com');
INSERT INTO Instructors(teacherID,name,email) VALUES (3,'Shayla Ginger','sginger2@umn.edu');
INSERT INTO Instructors(teacherID,name,email) VALUES (4,'Dennie Pala','dpala3@msu.edu');
INSERT INTO Instructors(teacherID,name,email) VALUES (5,'Kasper Youster','kyouster4@upenn.edu');
INSERT INTO Instructors(teacherID,name,email) VALUES (6,'Brear Devitt','bdevitt5@yahoo.com');
INSERT INTO Instructors(teacherID,name,email) VALUES (7,'Matty Castanie','mcastanie6@ow.ly');
INSERT INTO Instructors(teacherID,name,email) VALUES (8,'Morgan Jowling','mjowling7@indiatimes.com');
INSERT INTO Instructors(teacherID,name,email) VALUES (9,'Anissa Borkett','aborkett8@lulu.com');
INSERT INTO Instructors(teacherID,name,email) VALUES (10,'Cacilia Golder','cgolder9@blogs.com');
INSERT INTO Instructors(teacherID,name,email) VALUES (11,'Hans Pedrick','hpedricka@tamu.edu');
INSERT INTO Instructors(teacherID,name,email) VALUES (12,'Waldemar Giannazzo','wgiannazzob@unicef.org');
INSERT INTO Instructors(teacherID,name,email) VALUES (13,'Kathrine Letertre','kletertrec@mayoclinic.com');
INSERT INTO Instructors(teacherID,name,email) VALUES (14,'Jedediah Hek','jhekd@vistaprint.com');
INSERT INTO Instructors(teacherID,name,email) VALUES (15,'Angus Thorbon','athorbone@slashdot.org');
INSERT INTO Instructors(teacherID,name,email) VALUES (16,'Pancho Lineen','plineenf@utexas.edu');
INSERT INTO Instructors(teacherID,name,email) VALUES (17,'Audi Rembrant','arembrantg@yale.edu');
INSERT INTO Instructors(teacherID,name,email) VALUES (18,'Mason Spaule','mspauleh@google.com.au');
INSERT INTO Instructors(teacherID,name,email) VALUES (19,'Katherina Corrie','kcorriei@walmart.com');
INSERT INTO Instructors(teacherID,name,email) VALUES (20,'Isidro McShee','imcsheej@squarespace.com');
INSERT INTO Instructors(teacherID,name,email) VALUES (21,'Lind Brand','lbrandk@cnbc.com');
INSERT INTO Instructors(teacherID,name,email) VALUES (22,'Dag Maddick','dmaddickl@yellowpages.com');
INSERT INTO Instructors(teacherID,name,email) VALUES (23,'Magnum Tierney','mtierneym@netvibes.com');
INSERT INTO Instructors(teacherID,name,email) VALUES (24,'Melisa Banfield','mbanfieldn@dailymail.co.uk');
INSERT INTO Instructors(teacherID,name,email) VALUES (25,'Graham Gerckens','ggerckenso@patch.com');
INSERT INTO Instructors(teacherID,name,email) VALUES (26,'Isa Nicholl','inichollp@yale.edu');
INSERT INTO Instructors(teacherID,name,email) VALUES (27,'Friedrich Littefair','flittefairq@ebay.com');
INSERT INTO Instructors(teacherID,name,email) VALUES (28,'Justin Vittel','jvittelr@google.ca');
INSERT INTO Instructors(teacherID,name,email) VALUES (29,'Jermaine Lattimore','jlattimores@google.nl');
INSERT INTO Instructors(teacherID,name,email) VALUES (30,'Helen Vedenyapin','hvedenyapint@dot.gov');
INSERT INTO Instructors(teacherID,name,email) VALUES (31,'Izaak Deshon','ideshonu@pbs.org');
INSERT INTO Instructors(teacherID,name,email) VALUES (32,'Cinderella Devanny','cdevannyv@cocolog-nifty.com');
INSERT INTO Instructors(teacherID,name,email) VALUES (33,'Hilde Sandes','hsandesw@123-reg.co.uk');
INSERT INTO Instructors(teacherID,name,email) VALUES (34,'Madison Tunney','mtunneyx@dropbox.com');
INSERT INTO Instructors(teacherID,name,email) VALUES (35,'Vida Wooles','vwoolesy@springer.com');
INSERT INTO Instructors(teacherID,name,email) VALUES (36,'Adelbert Ciciari','aciciariz@canalblog.com');
INSERT INTO Instructors(teacherID,name,email) VALUES (37,'Morty Bennen','mbennen10@miibeian.gov.cn');
INSERT INTO Instructors(teacherID,name,email) VALUES (38,'Lamont Maudett','lmaudett11@prlog.org');
INSERT INTO Instructors(teacherID,name,email) VALUES (39,'Jessamyn Bucke','jbucke12@mapquest.com');
INSERT INTO Instructors(teacherID,name,email) VALUES (40,'Laura Bortoluzzi','lbortoluzzi13@alexa.com');



INSERT INTO Instructor_Ratings(teacherID,rating) VALUES (24,3);
INSERT INTO Instructor_Ratings(teacherID,rating) VALUES (40,6);
INSERT INTO Instructor_Ratings(teacherID,rating) VALUES (4,4);
INSERT INTO Instructor_Ratings(teacherID,rating) VALUES (32,8);
INSERT INTO Instructor_Ratings(teacherID,rating) VALUES (31,1);
INSERT INTO Instructor_Ratings(teacherID,rating) VALUES (37,3);
INSERT INTO Instructor_Ratings(teacherID,rating) VALUES (5,5);
INSERT INTO Instructor_Ratings(teacherID,rating) VALUES (24,10);
INSERT INTO Instructor_Ratings(teacherID,rating) VALUES (13,1);
INSERT INTO Instructor_Ratings(teacherID,rating) VALUES (14,1);
INSERT INTO Instructor_Ratings(teacherID,rating) VALUES (27,8);
INSERT INTO Instructor_Ratings(teacherID,rating) VALUES (36,8);
INSERT INTO Instructor_Ratings(teacherID,rating) VALUES (16,8);
INSERT INTO Instructor_Ratings(teacherID,rating) VALUES (3,1);
INSERT INTO Instructor_Ratings(teacherID,rating) VALUES (33,5);
INSERT INTO Instructor_Ratings(teacherID,rating) VALUES (12,3);
INSERT INTO Instructor_Ratings(teacherID,rating) VALUES (10,3);
INSERT INTO Instructor_Ratings(teacherID,rating) VALUES (29,5);
INSERT INTO Instructor_Ratings(teacherID,rating) VALUES (11,6);
INSERT INTO Instructor_Ratings(teacherID,rating) VALUES (5,8);
INSERT INTO Instructor_Ratings(teacherID,rating) VALUES (1,2);
INSERT INTO Instructor_Ratings(teacherID,rating) VALUES (19,2);
INSERT INTO Instructor_Ratings(teacherID,rating) VALUES (3,9);
INSERT INTO Instructor_Ratings(teacherID,rating) VALUES (18,6);
INSERT INTO Instructor_Ratings(teacherID,rating) VALUES (7,4);
INSERT INTO Instructor_Ratings(teacherID,rating) VALUES (9,7);
INSERT INTO Instructor_Ratings(teacherID,rating) VALUES (29,6);
INSERT INTO Instructor_Ratings(teacherID,rating) VALUES (14,4);
INSERT INTO Instructor_Ratings(teacherID,rating) VALUES (22,10);
INSERT INTO Instructor_Ratings(teacherID,rating) VALUES (14,5);
INSERT INTO Instructor_Ratings(teacherID,rating) VALUES (33,4);
INSERT INTO Instructor_Ratings(teacherID,rating) VALUES (13,9);
INSERT INTO Instructor_Ratings(teacherID,rating) VALUES (14,10);
INSERT INTO Instructor_Ratings(teacherID,rating) VALUES (23,6);
INSERT INTO Instructor_Ratings(teacherID,rating) VALUES (18,4);
INSERT INTO Instructor_Ratings(teacherID,rating) VALUES (13,10);
INSERT INTO Instructor_Ratings(teacherID,rating) VALUES (5,1);
INSERT INTO Instructor_Ratings(teacherID,rating) VALUES (37,9);
INSERT INTO Instructor_Ratings(teacherID,rating) VALUES (16,2);
INSERT INTO Instructor_Ratings(teacherID,rating) VALUES (23,4);
INSERT INTO Instructor_Ratings(teacherID,rating) VALUES (24,1);
INSERT INTO Instructor_Ratings(teacherID,rating) VALUES (7,1);
INSERT INTO Instructor_Ratings(teacherID,rating) VALUES (9,5);
INSERT INTO Instructor_Ratings(teacherID,rating) VALUES (38,1);
INSERT INTO Instructor_Ratings(teacherID,rating) VALUES (38,6);
INSERT INTO Instructor_Ratings(teacherID,rating) VALUES (28,7);
INSERT INTO Instructor_Ratings(teacherID,rating) VALUES (39,5);
INSERT INTO Instructor_Ratings(teacherID,rating) VALUES (8,9);
INSERT INTO Instructor_Ratings(teacherID,rating) VALUES (24,7);
INSERT INTO Instructor_Ratings(teacherID,rating) VALUES (32,6);
INSERT INTO Instructor_Ratings(teacherID,rating) VALUES (13,4);
INSERT INTO Instructor_Ratings(teacherID,rating) VALUES (12,1);
INSERT INTO Instructor_Ratings(teacherID,rating) VALUES (5,8);
INSERT INTO Instructor_Ratings(teacherID,rating) VALUES (28,2);
INSERT INTO Instructor_Ratings(teacherID,rating) VALUES (30,8);
INSERT INTO Instructor_Ratings(teacherID,rating) VALUES (36,4);
INSERT INTO Instructor_Ratings(teacherID,rating) VALUES (23,3);
INSERT INTO Instructor_Ratings(teacherID,rating) VALUES (27,4);
INSERT INTO Instructor_Ratings(teacherID,rating) VALUES (36,1);
INSERT INTO Instructor_Ratings(teacherID,rating) VALUES (31,3);
INSERT INTO Instructor_Ratings(teacherID,rating) VALUES (38,8);
INSERT INTO Instructor_Ratings(teacherID,rating) VALUES (3,1);
INSERT INTO Instructor_Ratings(teacherID,rating) VALUES (5,1);
INSERT INTO Instructor_Ratings(teacherID,rating) VALUES (7,1);
INSERT INTO Instructor_Ratings(teacherID,rating) VALUES (4,8);
INSERT INTO Instructor_Ratings(teacherID,rating) VALUES (13,4);
INSERT INTO Instructor_Ratings(teacherID,rating) VALUES (38,6);
INSERT INTO Instructor_Ratings(teacherID,rating) VALUES (28,4);
INSERT INTO Instructor_Ratings(teacherID,rating) VALUES (23,7);
INSERT INTO Instructor_Ratings(teacherID,rating) VALUES (24,6);
INSERT INTO Instructor_Ratings(teacherID,rating) VALUES (6,1);
INSERT INTO Instructor_Ratings(teacherID,rating) VALUES (19,8);
INSERT INTO Instructor_Ratings(teacherID,rating) VALUES (1,7);
INSERT INTO Instructor_Ratings(teacherID,rating) VALUES (3,6);
INSERT INTO Instructor_Ratings(teacherID,rating) VALUES (17,8);
INSERT INTO Instructor_Ratings(teacherID,rating) VALUES (12,5);
INSERT INTO Instructor_Ratings(teacherID,rating) VALUES (16,1);
INSERT INTO Instructor_Ratings(teacherID,rating) VALUES (6,1);
INSERT INTO Instructor_Ratings(teacherID,rating) VALUES (37,1);
INSERT INTO Instructor_Ratings(teacherID,rating) VALUES (8,1);



INSERT INTO Transcript_Nupathreqs(transcriptID,nupathNeeded) VALUES (1,'Engaging Differences and Diversity');
INSERT INTO Transcript_Nupathreqs(transcriptID,nupathNeeded) VALUES (2,'Integrating Knowledge and Skills Through Experience');
INSERT INTO Transcript_Nupathreqs(transcriptID,nupathNeeded) VALUES (3,'Engaging Differences and Diversity');
INSERT INTO Transcript_Nupathreqs(transcriptID,nupathNeeded) VALUES (4,'Integrating Knowledge and Skills Through Experience');
INSERT INTO Transcript_Nupathreqs(transcriptID,nupathNeeded) VALUES (5,'Interpreting Culture');
INSERT INTO Transcript_Nupathreqs(transcriptID,nupathNeeded) VALUES (6,'Understanding Societies and Institutions');
INSERT INTO Transcript_Nupathreqs(transcriptID,nupathNeeded) VALUES (7,'Understanding Societies and Institutions');
INSERT INTO Transcript_Nupathreqs(transcriptID,nupathNeeded) VALUES (8,'Conducting Formal and Quantitative Reasoning');
INSERT INTO Transcript_Nupathreqs(transcriptID,nupathNeeded) VALUES (9,'Exploring Creative Expression and Innovation');
INSERT INTO Transcript_Nupathreqs(transcriptID,nupathNeeded) VALUES (10,'Writing Across Audiences and Genres');
INSERT INTO Transcript_Nupathreqs(transcriptID,nupathNeeded) VALUES (11,'Interpreting Culture');
INSERT INTO Transcript_Nupathreqs(transcriptID,nupathNeeded) VALUES (12,'Engaging with the Natural and Designed World');
INSERT INTO Transcript_Nupathreqs(transcriptID,nupathNeeded) VALUES (13,'Understanding Societies and Institutions');
INSERT INTO Transcript_Nupathreqs(transcriptID,nupathNeeded) VALUES (14,'Analyzing and Using Data');
INSERT INTO Transcript_Nupathreqs(transcriptID,nupathNeeded) VALUES (15,'Analyzing and Using Data');
INSERT INTO Transcript_Nupathreqs(transcriptID,nupathNeeded) VALUES (16,'Engaging Differences and Diversity');
INSERT INTO Transcript_Nupathreqs(transcriptID,nupathNeeded) VALUES (17,'Interpreting Culture');
INSERT INTO Transcript_Nupathreqs(transcriptID,nupathNeeded) VALUES (18,'Writing Across Audiences and Genres');
INSERT INTO Transcript_Nupathreqs(transcriptID,nupathNeeded) VALUES (19,'Writing Across Audiences and Genres');
INSERT INTO Transcript_Nupathreqs(transcriptID,nupathNeeded) VALUES (20,'Engaging Differences and Diversity');
INSERT INTO Transcript_Nupathreqs(transcriptID,nupathNeeded) VALUES (21,'Interpreting Culture');
INSERT INTO Transcript_Nupathreqs(transcriptID,nupathNeeded) VALUES (22,'Conducting Formal and Quantitative Reasoning');
INSERT INTO Transcript_Nupathreqs(transcriptID,nupathNeeded) VALUES (23,'Conducting Formal and Quantitative Reasoning');
INSERT INTO Transcript_Nupathreqs(transcriptID,nupathNeeded) VALUES (24,'Interpreting Culture');
INSERT INTO Transcript_Nupathreqs(transcriptID,nupathNeeded) VALUES (25,'Integrating Knowledge and Skills Through Experience');
INSERT INTO Transcript_Nupathreqs(transcriptID,nupathNeeded) VALUES (26,'Analyzing and Using Data');
INSERT INTO Transcript_Nupathreqs(transcriptID,nupathNeeded) VALUES (27,'Integrating Knowledge and Skills Through Experience');
INSERT INTO Transcript_Nupathreqs(transcriptID,nupathNeeded) VALUES (28,'Integrating Knowledge and Skills Through Experience');
INSERT INTO Transcript_Nupathreqs(transcriptID,nupathNeeded) VALUES (29,'Engaging Differences and Diversity');
INSERT INTO Transcript_Nupathreqs(transcriptID,nupathNeeded) VALUES (30,'Exploring Creative Expression and Innovation');
INSERT INTO Transcript_Nupathreqs(transcriptID,nupathNeeded) VALUES (31,'Employing Ethical Reasoning');
INSERT INTO Transcript_Nupathreqs(transcriptID,nupathNeeded) VALUES (32,'Understanding Societies and Institutions');
INSERT INTO Transcript_Nupathreqs(transcriptID,nupathNeeded) VALUES (33,'Writing Across Audiences and Genres');
INSERT INTO Transcript_Nupathreqs(transcriptID,nupathNeeded) VALUES (34,'Integrating Knowledge and Skills Through Experience');
INSERT INTO Transcript_Nupathreqs(transcriptID,nupathNeeded) VALUES (35,'Employing Ethical Reasoning');
INSERT INTO Transcript_Nupathreqs(transcriptID,nupathNeeded) VALUES (36,'Conducting Formal and Quantitative Reasoning');
INSERT INTO Transcript_Nupathreqs(transcriptID,nupathNeeded) VALUES (37,'Writing Across Audiences and Genres');
INSERT INTO Transcript_Nupathreqs(transcriptID,nupathNeeded) VALUES (38,'Demonstrating Thought and Action in a Capstone');
INSERT INTO Transcript_Nupathreqs(transcriptID,nupathNeeded) VALUES (39,'Engaging with the Natural and Designed World');
INSERT INTO Transcript_Nupathreqs(transcriptID,nupathNeeded) VALUES (40,'Writing Across Audiences and Genres');
INSERT INTO Transcript_Nupathreqs(transcriptID,nupathNeeded) VALUES (1,'Engaging Differences and Diversity');
INSERT INTO Transcript_Nupathreqs(transcriptID,nupathNeeded) VALUES (2,'Employing Ethical Reasoning');
INSERT INTO Transcript_Nupathreqs(transcriptID,nupathNeeded) VALUES (3,'Integrating Knowledge and Skills Through Experience');
INSERT INTO Transcript_Nupathreqs(transcriptID,nupathNeeded) VALUES (4,'Engaging with the Natural and Designed World');
INSERT INTO Transcript_Nupathreqs(transcriptID,nupathNeeded) VALUES (5,'Conducting Formal and Quantitative Reasoning');
INSERT INTO Transcript_Nupathreqs(transcriptID,nupathNeeded) VALUES (6,'Engaging with the Natural and Designed World');
INSERT INTO Transcript_Nupathreqs(transcriptID,nupathNeeded) VALUES (7,'Exploring Creative Expression and Innovation');
INSERT INTO Transcript_Nupathreqs(transcriptID,nupathNeeded) VALUES (8,'Engaging Differences and Diversity');
INSERT INTO Transcript_Nupathreqs(transcriptID,nupathNeeded) VALUES (9,'Demonstrating Thought and Action in a Capstone');
INSERT INTO Transcript_Nupathreqs(transcriptID,nupathNeeded) VALUES (10,'Employing Ethical Reasoning');
INSERT INTO Transcript_Nupathreqs(transcriptID,nupathNeeded) VALUES (11,'Analyzing and Using Data');
INSERT INTO Transcript_Nupathreqs(transcriptID,nupathNeeded) VALUES (12,'Conducting Formal and Quantitative Reasoning');
INSERT INTO Transcript_Nupathreqs(transcriptID,nupathNeeded) VALUES (13,'Engaging Differences and Diversity');
INSERT INTO Transcript_Nupathreqs(transcriptID,nupathNeeded) VALUES (14,'Engaging Differences and Diversity');
INSERT INTO Transcript_Nupathreqs(transcriptID,nupathNeeded) VALUES (15,'Engaging Differences and Diversity');
INSERT INTO Transcript_Nupathreqs(transcriptID,nupathNeeded) VALUES (16,'Writing Across Audiences and Genres');
INSERT INTO Transcript_Nupathreqs(transcriptID,nupathNeeded) VALUES (17,'Exploring Creative Expression and Innovation');
INSERT INTO Transcript_Nupathreqs(transcriptID,nupathNeeded) VALUES (18,'Analyzing and Using Data');
INSERT INTO Transcript_Nupathreqs(transcriptID,nupathNeeded) VALUES (19,'Exploring Creative Expression and Innovation');
INSERT INTO Transcript_Nupathreqs(transcriptID,nupathNeeded) VALUES (20,'Analyzing and Using Data');
INSERT INTO Transcript_Nupathreqs(transcriptID,nupathNeeded) VALUES (21,'Understanding Societies and Institutions');
INSERT INTO Transcript_Nupathreqs(transcriptID,nupathNeeded) VALUES (22,'Employing Ethical Reasoning');
INSERT INTO Transcript_Nupathreqs(transcriptID,nupathNeeded) VALUES (23,'Exploring Creative Expression and Innovation');
INSERT INTO Transcript_Nupathreqs(transcriptID,nupathNeeded) VALUES (24,'Exploring Creative Expression and Innovation');
INSERT INTO Transcript_Nupathreqs(transcriptID,nupathNeeded) VALUES (25,'Understanding Societies and Institutions');
INSERT INTO Transcript_Nupathreqs(transcriptID,nupathNeeded) VALUES (26,'Employing Ethical Reasoning');
INSERT INTO Transcript_Nupathreqs(transcriptID,nupathNeeded) VALUES (27,'Writing Across Audiences and Genres');
INSERT INTO Transcript_Nupathreqs(transcriptID,nupathNeeded) VALUES (28,'Engaging with the Natural and Designed World');
INSERT INTO Transcript_Nupathreqs(transcriptID,nupathNeeded) VALUES (29,'Analyzing and Using Data');
INSERT INTO Transcript_Nupathreqs(transcriptID,nupathNeeded) VALUES (30,'Interpreting Culture');
INSERT INTO Transcript_Nupathreqs(transcriptID,nupathNeeded) VALUES (31,'Interpreting Culture');
INSERT INTO Transcript_Nupathreqs(transcriptID,nupathNeeded) VALUES (32,'Engaging Differences and Diversity');
INSERT INTO Transcript_Nupathreqs(transcriptID,nupathNeeded) VALUES (33,'Employing Ethical Reasoning');
INSERT INTO Transcript_Nupathreqs(transcriptID,nupathNeeded) VALUES (34,'Understanding Societies and Institutions');
INSERT INTO Transcript_Nupathreqs(transcriptID,nupathNeeded) VALUES (35,'Engaging with the Natural and Designed World');
INSERT INTO Transcript_Nupathreqs(transcriptID,nupathNeeded) VALUES (36,'Writing Across Audiences and Genres');
INSERT INTO Transcript_Nupathreqs(transcriptID,nupathNeeded) VALUES (37,'Demonstrating Thought and Action in a Capstone');
INSERT INTO Transcript_Nupathreqs(transcriptID,nupathNeeded) VALUES (38,'Conducting Formal and Quantitative Reasoning');
INSERT INTO Transcript_Nupathreqs(transcriptID,nupathNeeded) VALUES (39,'Analyzing and Using Data');
INSERT INTO Transcript_Nupathreqs(transcriptID,nupathNeeded) VALUES (40,'Conducting Formal and Quantitative Reasoning');



INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (2,'Fall 2023',10,1,3172);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (4,'Spring 2024',5,43,2978);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (1,'Spring 2024',27,48,3020);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (4,'Fall 2023',35,36,1005);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (3,'Fall 2023',14,39,2966);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (3,'Spring 2024',16,36,2626);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (1,'Fall 2023',22,18,2837);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (2,'Spring 2024',35,41,2778);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (2,'Spring 2024',6,45,1146);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (3,'Spring 2024',12,37,2323);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (3,'Spring 2024',29,17,1964);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (1,'Spring 2024',1,6,3753);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (3,'Spring 2024',1,17,1833);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (3,'Spring 2024',23,35,2268);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (5,'Spring 2024',33,39,2992);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (5,'Fall 2023',5,43,1740);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (3,'Fall 2023',3,36,2242);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (1,'Fall 2023',38,1,3371);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (3,'Fall 2023',36,48,1267);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (2,'Fall 2023',39,0,3142);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (4,'Spring 2024',25,31,2410);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (3,'Spring 2024',40,42,3134);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (4,'Spring 2024',12,8,2734);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (4,'Fall 2023',20,26,3904);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (3,'Fall 2023',23,36,1404);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (5,'Fall 2023',11,7,1555);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (4,'Spring 2024',19,7,2583);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (3,'Fall 2023',24,10,3741);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (2,'Spring 2024',7,11,2389);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (2,'Fall 2023',4,17,1412);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (3,'Fall 2023',28,9,3581);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (1,'Fall 2023',16,36,2764);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (3,'Fall 2023',9,50,2083);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (2,'Fall 2023',30,39,2338);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (3,'Spring 2024',7,20,1477);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (4,'Spring 2024',25,11,3776);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (3,'Fall 2023',10,20,2051);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (4,'Spring 2024',12,13,1707);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (1,'Spring 2024',38,32,1849);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (2,'Spring 2024',28,38,1331);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (2,'Fall 2023',21,41,1418);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (3,'Spring 2024',9,3,2374);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (1,'Spring 2024',39,30,3618);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (2,'Fall 2023',35,35,1547);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (1,'Spring 2024',6,42,2524);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (3,'Fall 2023',9,27,3367);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (1,'Spring 2024',32,3,3748);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (2,'Spring 2024',10,47,1846);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (5,'Spring 2024',40,47,3404);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (4,'Fall 2023',15,49,1197);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (2,'Spring 2024',11,37,3664);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (1,'Spring 2024',30,22,1614);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (2,'Spring 2024',10,47,1426);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (2,'Spring 2024',5,1,2760);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (4,'Fall 2023',5,49,3207);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (5,'Fall 2023',10,13,1679);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (3,'Fall 2023',17,45,3492);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (4,'Spring 2024',28,44,3933);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (4,'Fall 2023',23,45,3330);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (1,'Spring 2024',3,27,2617);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (1,'Fall 2023',36,9,1591);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (1,'Spring 2024',16,39,1179);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (1,'Spring 2024',13,7,1560);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (3,'Spring 2024',8,8,2662);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (2,'Spring 2024',18,33,2302);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (2,'Spring 2024',22,31,1571);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (4,'Fall 2023',39,1,3796);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (2,'Fall 2023',36,3,3149);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (3,'Spring 2024',3,38,3871);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (2,'Fall 2023',10,47,1964);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (1,'Spring 2024',12,43,3967);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (2,'Fall 2023',11,14,2210);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (2,'Spring 2024',27,23,1907);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (2,'Fall 2023',26,13,2773);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (2,'Fall 2023',5,46,3496);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (3,'Fall 2023',37,4,3319);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (3,'Fall 2023',40,42,3155);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (4,'Spring 2024',1,49,3883);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (2,'Fall 2023',37,46,3224);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (4,'Spring 2024',18,48,1160);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (2,'Spring 2024',26,50,3172);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (5,'Spring 2024',28,20,2978);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (5,'Fall 2023',10,31,3020);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (2,'Spring 2024',16,27,1005);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (1,'Fall 2023',25,7,2966);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (4,'Spring 2024',3,45,2626);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (2,'Fall 2023',30,40,2837);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (3,'Fall 2023',29,2,2778);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (2,'Fall 2023',17,16,1146);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (1,'Fall 2023',28,25,2323);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (5,'Fall 2023',35,32,1964);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (5,'Spring 2024',1,39,3753);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (4,'Fall 2023',22,29,1833);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (3,'Fall 2023',26,33,2268);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (1,'Spring 2024',33,35,2992);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (3,'Fall 2023',7,30,1740);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (3,'Spring 2024',13,27,2242);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (3,'Fall 2023',21,12,3371);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (1,'Fall 2023',19,39,1267);
INSERT INTO Sections(secNumber,semester,teacherID,enrollmentSlots,courseID) VALUES (5,'Spring 2024',32,48,3142);



INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (3172,55);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (2978,743);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (3020,863);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (1005,110);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (2966,941);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (2626,138);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (2837,857);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (2778,668);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (1146,692);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (2323,863);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (1964,471);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (3753,731);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (1833,235);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (2268,610);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (2992,873);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (1740,661);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (2242,538);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (3371,138);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (1267,204);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (3142,120);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (2410,731);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (3134,701);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (2734,210);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (3904,521);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (1404,678);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (1555,138);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (2583,857);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (3741,863);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (2389,953);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (1412,726);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (3581,726);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (2764,663);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (2083,208);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (2338,873);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (1477,984);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (3776,521);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (2051,390);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (1707,55);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (1849,678);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (1331,138);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (1418,701);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (2374,873);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (3618,726);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (1547,138);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (2524,863);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (3367,471);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (3748,610);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (1846,857);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (3404,210);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (1197,703);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (3664,743);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (1614,138);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (1426,110);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (2760,610);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (3207,31);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (1679,953);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (3492,701);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (3933,31);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (3330,204);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (2617,813);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (1591,668);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (1179,514);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (1560,521);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (2662,663);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (2302,471);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (1571,390);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (3796,31);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (3149,210);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (3871,857);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (1964,678);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (3967,390);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (2210,953);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (1907,668);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (2773,464);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (3496,204);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (3319,464);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (3155,701);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (3883,743);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (3224,731);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (1160,120);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (3172,208);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (2978,458);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (3020,678);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (1005,120);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (2966,538);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (2626,873);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (2837,678);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (2778,701);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (1146,731);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (2323,31);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (1964,703);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (3753,859);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (1833,208);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (2268,69);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (2992,771);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (1740,69);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (2242,873);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (3371,726);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (1267,771);
INSERT INTO Courses_Textbooks(courseID,bookID) VALUES (3142,471);