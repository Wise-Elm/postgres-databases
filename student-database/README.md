# Students database using PostgreSQL

# Description

The student-database repo was created to partially fullfil the Relational Database Certification offered through freecodecamp.org, 
and demenstrates profiency in PostgreSQL, SQL Queries, and shell scripting.

To create the database run insert_data.sh

To view query and scripting demenstration run student_info.sh. student_info.sh will produce the following result 
on the students database:

	~~ My Computer Science Students ~~


	First name, last name, and GPA of students with a 4.0 GPA:
	Casares|Hijo|4.0
	Vanya|Hassanah|4.0
	Dejon|Howell|4.0

	All course names whose first letter is before 'D' in the alphabet:
	Computer Networks
	Computer Systems
	Artificial Intelligence
	Calculus
	Algorithms

	First name, last name, and GPA of students whose last name begins with an 'R' or after and have a GPA greater than 3.8 or less than 2.0:
	Efren|Reilly|3.9
	Mariana|Russel|1.8
	Mehdi|Vandenberghe|1.9

	Last name of students whose last name contains a case insensitive 'sa' or have an 'r' as the second to last letter:
	Gilbert
	Savage
	Saunders
	Hilpert
	Hassanah

	First name, last name, and GPA of students who have not selected a major and either their first name begins with 'D' or they have a GPA greater than 3.0:
	Noe|Savage|3.6
	Danh|Nhung|2.4
	Hugo|Duran|3.8

	Course name of the first five courses, in reverse alphabetical order, that have an 'e' as the second letter or end with an 's':
	Web Programming
	Web Applications
	Server Administration
	Network Security
	Database Systems

	Average GPA of all students rounded to two decimal places:
	3.09

	Major ID, total number of students in a column named 'number_of_students', and average GPA rounded to two decimal places in a column name 'average_gpa', for each major ID in the students table having a student count greater than 1:
	|8|2.97
	41|6|3.53
	38|4|2.73
	36|6|2.92
	37|6|3.38

	List of majors, in alphabetical order, that either no student is taking or has a student whose first name contains a case insensitive 'ma':
	Computer Programming
	Database Administration
	Network Engineering
	Web Development

	List of unique courses, in reverse alphabetical order, that no student or 'Obie Hilpert' is taking:
	Web Programming
	Web Applications
	Python
	Object-Oriented Programming
	Network Security
	Data Structures and Algorithms
	Computer Systems
	Computer Networks
	Algorithms

	List of courses, in alphabetical order, with only one student enrolled:
	Computer Networks
	Computer Systems
	Server Administration
	UNIX

# Context

This repo has courses.csv, and students.csv containing data on student information such as majors,
names, gpa, majors. insert_data.sh contains a script that will write the csv data into a 
PostgreSQL database named students with the following tables:
	
	Table courses
	+-----------+------------------------+-----------+----------+--------------------------------------------+
	|  Column   |          Type          | Collation | Nullable |                  Default                   |
	+-----------+------------------------+-----------+----------+--------------------------------------------+
	| course_id | integer                |           | not null | nextval('courses_course_id_seq'::regclass) |
	| course    | character varying(100) |           | not null |                                            |
	+-----------+------------------------+-----------+----------+--------------------------------------------+
	Indexes:
    	"courses_pkey" PRIMARY KEY, btree (course_id)
	Referenced by:
    	TABLE "majors_courses" CONSTRAINT "majors_courses_course_id_fkey" FOREIGN KEY (course_id) REFERENCES courses(course_id)

	Table majors
	+----------+-----------------------+-----------+----------+------------------------------------------+
	|  Column  |         Type          | Collation | Nullable |                 Default                  |
	+----------+-----------------------+-----------+----------+------------------------------------------+
	| major_id | integer               |           | not null | nextval('majors_major_id_seq'::regclass) |
	| major    | character varying(50) |           | not null |                                          |
	+----------+-----------------------+-----------+----------+------------------------------------------+
	Indexes:
    	"majors_pkey" PRIMARY KEY, btree (major_id)
	Referenced by:
    	TABLE "majors_courses" CONSTRAINT "majors_courses_major_id_fkey" FOREIGN KEY (major_id) REFERENCES majors(major_id)
    	TABLE "students" CONSTRAINT "students_major_id_fkey" FOREIGN KEY (major_id) REFERENCES majors(major_id)

	Table majors_courses
	+-----------+---------+-----------+----------+---------+
	|  Column   |  Type   | Collation | Nullable | Default |
	+-----------+---------+-----------+----------+---------+
	| major_id  | integer |           | not null |         |
	| course_id | integer |           | not null |         |
	+-----------+---------+-----------+----------+---------+
	Indexes:
    	"majors_courses_pkey" PRIMARY KEY, btree (major_id, course_id)
	Foreign-key constraints:
    	"majors_courses_course_id_fkey" FOREIGN KEY (course_id) REFERENCES courses(course_id)
    	"majors_courses_major_id_fkey" FOREIGN KEY (major_id) REFERENCES majors(major_id)

	Table students
	+------------+-----------------------+-----------+----------+----------------------------------------------+
	|   Column   |         Type          | Collation | Nullable |                   Default                    |
	+------------+-----------------------+-----------+----------+----------------------------------------------+
	| student_id | integer               |           | not null | nextval('students_student_id_seq'::regclass) |
	| first_name | character varying(50) |           | not null |                                              |
	| last_name  | character varying(50) |           | not null |                                              |
	| major_id   | integer               |           |          |                                              |
	| gpa        | numeric(2,1)          |           |          |                                              |
	+------------+-----------------------+-----------+----------+----------------------------------------------+
	Indexes:
    	"students_pkey" PRIMARY KEY, btree (student_id)
	Foreign-key constraints:
    	"students_major_id_fkey" FOREIGN KEY (major_id) REFERENCES majors(major_id)

students.sql will reconstruct the database.
