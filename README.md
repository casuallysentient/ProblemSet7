# Problem Set 7

It's time to put your skills to the test. Rather than solving a disjointed set of exercises, this problem set focuses on building a persistent application backed by a real database. Portions of the application are already implemented for you. It's your job to fill in the pieces. I hope you remember those SQL skills you learned last year!

## Getting Started

To get started, create a [GitHub](https://github.com/) repository to store your code. When you're finished, clone my skeleton to get all of the starter code and instructions. Setup a remote to push your code to your repository instead of mine.

### Setup

1. Login to your GitHub account and create a new repository named `pset-7`.
2. In the terminal, navigate to your `APCSA` directory on the `Desktop`.
```
$ cd ~/Desktop/APCSA
```
3. Clone my skeleton repository into a directory named `pset-7`.
```
$ git clone git@github.com:ap-java-ucvts/pset-7-skeleton.git pset-7
```
4. Change into your newly created `pset-7` directory.
```
$ cd pset-7
```
5. Overwrite the remote, which originally points at my skeleton repository.
```
$ git remote rename origin upstream
```
6. Add a new remote that points at your `pset-7` repository. Replace `YOUR-USERNAME` with your actual username.
```
$ git remote add origin git@github.com:YOUR-USERNAME/pset-7.git
```
7. Open Eclipse. Click `File > Import...`.
8. Choose `General > Projects from Folder or Archive` and click `Next >`.
9. Click `Directory...` and navigate to the `pset-7` folder.
10. Click `Open`, and then `Finish`.
11. Right-click the `pset-7` project and click `New > Folder`.
12. Type `data` and click `Finish`.

Although there are unresolved compilation errors, you can now launch the application. It won't do a whole lot yet, but it will build the database.

## Overview

You'll be creating a grading system much like the PowerSchool application we all know and love. You'll need to implement the application for four separate access levels: root, school administrator, teacher, and student. The features and functionalities available in the application will depend on the type of account with which a user logs in.

### Use Cases

Many of these use cases will familiar to you based on your own experiences with PowerSchool. Naturally, those specific to school administators and teachers will be quite different. We'll separate use cases based on students, teachers, administrators, and the all-powerful root user.

#### Student

* Login to an account
* View course grades
* View assignment grades by course
* Change password
* Logout of an account

#### Teacher

* Login to an account
* View enrollment by course
* Add assignment
* Delete assignment
* Enter grade for assignment
* Change password
* Logout of an account

#### Administrator

* Login to an account
* View faculty
* View faculty by department
* View enrollment
* View enrollment by grade
* View enrollment by course
* Change password
* Logout of an account

#### Root

* Login to an account
* Reset password for another account
* Factory reset database
* Logout of an account
* Shutdown application

As you begin to test your code, which you should do early, thoroughly, and often, these use cases should give you a very good starting point. There's a lot of functionality to implement here, so I'd recommend focusing on one user type (and one use case for that user type!) at a time.

## Requirements

In developing this application, you'll need to meet specific requirements for each user. The features and options available to you depend entirely on the type of user that is logged in. It's your job to make this distinction.

### User Interface

You'll be creating a command line interface (CLI) for the application. Each user will be presented with standard menu-style options. The details of those menus, of course, will largely depend on the type of user currently logged into the system.

While the broad strokes are outlined below, the finer details can be found in the demo application in the `samples` directory. To run the application, download the `demo.zip` file and run the following commands from the terminal.

```
$ unzip demo.zip
$ cd demo
$ java -jar powerschool.jar
```

#### Root

After logging in as the root user, you will be presented with a welcome message and a standard menu of options.

```
Hello, again, Root!

[1] Reset user password.
[2] Factory reset database.
[3] Logout.
[4] Shutdown.

:::
```

If you choose the first option, you'll need to enter the username whose password needs to be reset and confirm your selection.

```
Username: rwilson

Are you sure you want to reset the password for rwilson? (y/n)
```

You'll need to enter `y` or `n` (case-insensitive). Anything else causes the prompt to repeat. If you enter `y`, the user's password is reset to its default value (i.e., his or her username, in this case `rwilson`). The last login timestamp is also reset to `0000-00-00 00:00:00.000`.

You'll receive a status message indicating the success of the operation, before seeing the original menu options again.

```
Successfully reset password for rwilson.
```

If you choose the second option, you'll need to confirm your desire to reset the database. This operation is irreversible, and you'll lose any and all changes previously made.

```
Are you sure you want to reset all settings and data? (y/n)
```

As always, you'll receive a status message after entering `y`.

```
Successfully reset database.
```

If you choose the third option, you'll need to confirm your intent to logout of the application.

```
Are you sure you want to logout? (y/n)
```

After entering `y`, you'll be returned to the initial login screen.

```
Username: 
```

If you choose the fourth option, you'll be asked to confirm your selection.

```
Are you sure? (y/n)
```

After entering `y`, the system shuts down.

```
Goodbye!
```

The root user is the only user who isn't be prompted to reset their password on the initial login (more on this later).

#### Administrator

When an administrator logs into the system for the first time, he or she should be prompted to set a new password.

```
Username: cgialanella
Password: cgialanella

Enter new password: newPassword
```

First-time logins are determined by the user's last login value. If it is `0000-00-00 00:00:00.000`, then it is the user's first time loggin in; otherwise, it is not.

A successful status message is printed after entering a new password.

```
Successfully changed password.
```

After all logins, you'll be presented with a welcome message and a standard menu of options.

```
Hello, again, Colleen!

[1] View faculty.
[2] View faculty by department.
[3] View student enrollment.
[4] View student enrollment by grade.
[5] View student enrollment by course.
[6] Change password.
[7] Logout.

:::
```

If you choose the first option, you'll see a list of faculty members (along with departments) in alphabetical order.

```
1. Cohen, Moriah / English
2. Colasanti, Andrew / Science
3. Delmonaco, Tara / Physical Education
4. Miranda, Lawrence / Mathematics
5. Paul, Savage / History
6. Wilson, Ryan / Computer Science
```

If you choose the second option, you'll be asked to select a department before getting a list of teachers in that department.

```
Choose a department.

[1] Computer Science.
[2] English.
[3] History.
[4] Mathematics.
[5] Physical Education.
[6] Science.

::: 1

1. Wilson, Ryan / Computer Science
```

If you choose the third option, you'll see a list of students along with the years in which they are set to graduate.

```
1. Ahang, Paniz / 2021
2. Bashay, Zaviay / 2021
3. Betancur, Lukas / 2019
4. Blechinger-Slocum, Jaedan / 2019
5. Cadet, Sarah / 2021
```

If you choose the fourth option, you'll be asked to select a grade level before getting a list of students in that grade. The number next to each name is the student's class rank, which defaults to `#0` if the student doesn't yet have a GPA (more on this later).

```
Choose a grade level.

[1] Freshman.
[2] Sophomore.
[3] Junior.
[4] Senior.

::: 4

1. Betancur, Lukas / #0
2. Blechinger-Slocum, Jaedan / #0
3. Chahil, Neil / #0
4. Cheung, Kyle / #0
5. Dwivedi, Sambhavi / #0
```

If you choose the fifth option, you'll be asked to enter a course by course number before getting a list of students enrolled in that course. The value next to each name is the student's GPA, which defaults to `--` if the student doesn't yet have a GPA.

```
Course No.: CS4000

1. Betancur, Lukas / --
2. Blechinger-Slocum, Jaedan / --
3. Chahil, Neil / --
4. Cheung, Kyle / --
5. Dwivedi, Sambhavi / --
```

If you enter an invalid course number, you'll be promtped to try again.

```
Course No.: CS1234

Course not found.

Course No.: 
```

If you choose the sixth option, you'll be asked to enter your current password and a new password.

```
Enter current password: newPassword
Enter new password: evenNewerPassword
```

You'll receive a status message after changing your password.

```
Successfully changed password.
```

If you current password doesn't match the stored value, you'll receive an error message indicating that the password change failed.

```
Enter current password: invalidPassword
Enter new password: myNewPassword

Invalid current password.
```

If you choose the seventh option, you'll need to confirm your intent to logout of the application.

```
Are you sure you want to logout? (y/n)
```

After entering `y`, you'll be returned to the initial login screen.

```
Username: 
```

#### Teacher

When a teacher logs into the system for the first time, he or she should be prompted to set a new password.

```
Username: rwilson
Password: rwilson

Enter new password: newPassword
```

First-time logins are determined by the user's last login value. If it is `0000-00-00 00:00:00.000`, then it is the user's first time loggin in; otherwise, it is not.

A successful status message is printed after entering a new password.

```
Successfully changed password.
```

After all logins, you'll be presented with a welcome message and a standard menu of options.

```
Hello, again, Ryan!

[1] View enrollment by course.
[2] Add assignment.
[3] Delete assignment.
[4] Enter grade.
[5] Change password.
[6] Logout.

:::
```

If you choose the first option, you'll be asked to choose from a list of courses you're teaching. Ater selecting a course, you'll get a list of students in your class. The value next to each name is the student's current grade in your class, which defaults to `--` if you haven't graded any assignments for that student.

```
Choose a course.

[1] CS1000
[2] CS2000
[3] CS3000
[4] CS4000

::: 4

1. Betancur, Lukas / --
2. Blechinger-Slocum, Jaedan / --
3. Chahil, Neil / --
4. Cheung, Kyle / --
5. Dwivedi, Sambhavi / --
```

If you choose the second option, you'll be asked to choose a course and term for the assignment.

```
Choose a course.

[1] CS1000
[2] CS2000
[3] CS3000
[4] CS4000

::: 4

Choose a marking period or exam status.

[1] MP1 assignment.
[2] MP2 assignment.
[3] MP3 assignment.
[4] MP4 assignment.
[5] Midterm exam.
[6] Final exam.

:::
```

Next, you'll be asked for an assignment title and point value.

```
Assignment Title: Quiz 1
Point Value: 25
```

After confirming your decision to create the assignment, you'll receive a status message.

```
Are you sure you want to create this assignment? (y/n) y

Successfully created assignment.
```

Assignment point values must be between `1` and `100`, and invalid values cause the system to prompt you to try again.

```
Point Value: 150

Point values must be between 1 and 100.

Point Value: 
```

If you choose the third option, you'll be asked to choose a course and term.

```
Choose a course.

[1] CS1000
[2] CS2000
[3] CS3000
[4] CS4000

::: 4

Choose a marking period or exam status.

[1] MP1 assignment.
[2] MP2 assignment.
[3] MP3 assignment.
[4] MP4 assignment.
[5] Midterm exam.
[6] Final exam.

:::
```

After choosing a term, you'll get a list of assignments.

```
Choose an assignment.

[1] Quiz 1 (25 pts)
[2] Quiz 2 (25 pts)
[3] Problem Set 1 (50 pts)
[4] Test 1 (100 pts)

:::
```

After choosing an assignment and confirming your intention to delete it, you'll get a status message.

```
Are you sure you want to delete this assignment? (y/n) y

Successfully deleted Quiz 1.
```

If you choose the fourth option, you'll be asked to choose a course and term.

```
Choose a course.

[1] CS1000
[2] CS2000
[3] CS3000
[4] CS4000

::: 4

Choose a marking period or exam status.

[1] MP1 assignment.
[2] MP2 assignment.
[3] MP3 assignment.
[4] MP4 assignment.
[5] Midterm exam.
[6] Final exam.

:::
```

Next, you'll choose an assignment and a student.

```
Choose an assignment.

[1] Problem Set 1 (50 pts)

:: 1

Choose a student.

[1] Betancur, Lukas
[2] Blechinger-Slocum, Jaedan
[3] Chahil, Neil
[4] Cheung, Kyle
[5] Dwivedi, Sambhavi

:::
```

Lastly, you'll enter a grade for that student and assignment.

```
Assignment: Problem Set 1 (50 pts)
Student: Betancur, Lukas
Current Grade: --

New Grade: 47

Are you sure you want to enter this grade? (y/n) y

Successfully entered grade.
```

If you choose the fifth option, you'll be asked to enter your current password and a new password.

```
Enter current password: newPassword
Enter new password: evenNewerPassword
```

You'll receive a status message after changing your password.

```
Successfully changed password.
```

If you current password doesn't match the stored value, you'll receive an error message indicating that the password change failed.

```
Enter current password: invalidPassword
Enter new password: myNewPassword

Invalid current password.
```

If you choose the sixth option, you'll need to confirm your intent to logout of the application.

```
Are you sure you want to logout? (y/n)
```

After entering `y`, you'll be returned to the initial login screen.

```
Username: 
```

#### Student

When a student logs into the system for the first time, he or she should be prompted to set a new password.

```
Username: rwilson
Password: rwilson

Enter new password: newPassword
```

First-time logins are determined by the user's last login value. If it is `0000-00-00 00:00:00.000`, then it is the user's first time loggin in; otherwise, it is not.

A successful status message is printed after entering a new password.

```
Successfully changed password.
```

After all logins, you'll be presented with a welcome message and a standard menu of options.

```
Hello, again, Lukas!

[1] View course grades.
[2] View assignment grades by course.
[3] Change password.
[4] Logout.

:::
```

If you choose the first option, you'll see a list of courses in which you're enrolled along with your current grade in those courses. If you haven't yet received any grades in a course, the current grade defaults to `--`.

```
1. AP Computer Science A / 94.0
2. AP English Literature and Composition / --
3. AP United States History / --
4. AP Calculus AB / --
5. Fitness IV / --
6. AP Biology / --
```

If you choose the second option, you'll be asked to choose a course and a reporting term.

```
Choose a course.

[1] CS4000
[2] EN4000
[3] HI4000
[4] MA4000
[5] PE4000
[6] SC4100

::: 1

Choose a marking period or exam status.

[1] MP1 assignment.
[2] MP2 assignment.
[3] MP3 assignment.
[4] MP4 assignment.
[5] Midterm exam.
[6] Final exam.
```

After selecting a term, you'll see a list of assignments along with your grades for those assignments.

```
1. Problem Set 1 / 47 (out of 50 pts)
2. Problem Set 2 / 48 (out of 50 pts)
```

If you choose the third option, you'll be asked to enter your current password and a new password.

```
Enter current password: newPassword
Enter new password: evenNewerPassword
```

You'll receive a status message after changing your password.

```
Successfully changed password.
```

If you current password doesn't match the stored value, you'll receive an error message indicating that the password change failed.

```
Enter current password: invalidPassword
Enter new password: myNewPassword

Invalid current password.
```

If you choose the fourth option, you'll need to confirm your intent to logout of the application.

```
Are you sure you want to logout? (y/n)
```

After entering `y`, you'll be returned to the initial login screen.

```
Username: 
```

### Data Persistence

All changes must persist between separate logins (across all user account types) and application shutdowns and startups. The only instance in which data persistence is acceptably lost is in the case of a root-authorized factory reset.

Rather than a flat file, we're persisting all changes to an embedded SQLite database. Many (but not all!) of the database methods have been written for you. You'll need to finish up the data access layer of the application, as well as integrate the provided methods what your own code.

To make your lives a little easier, I recommend downloading a browser application for the SQLite database. [DB Browser for SQLite](https://sqlitebrowser.org/) is a pretty good option. Plus, it's free. There are others out there (some free, some not) if you aren't a fan of that one.

### Fields

Let's walk through each of the field requirements as defined in the various classes, but most importantly as stored in the embedded database tables.

#### Users

The table structure, including any table- column-level constraints, are clearly defined in the `setup.sql` file. Time to brush up on those SQL skills! Aside from that, though, there are few formatting issues you'll need to understand.

* The `userId` field is an autoincremented integer, starting from 1. Nothing to see here.
* The `account_type` field is either `root`, `administrator`, `teacher`, or `student`. This is how you'll determine which interface to display and which features to offer.
* The `username` field is always formatted as *firstinitiallastname*, like so: `rwilson`. This field needs to be unique, so you can add numbers (starting with 1 and incrementing by 1 from there) to remedy this as needed (i.e., `rwilson1`).
* The `auth` field is a 32-character MD5 hash representing the user's password. The default password for every user is their username. This needs to be changed upon their first login. Always use the `Utils.getHash` function to hash plaintext passwords.
* The `last_login` field is a timestamp (formatted as `YYYY-MM-DD HH:MM:SS.FFF`) representing the last time the user logged into the system. By default, this is `0000-00-00 00:00:00.000`, which is how you'll know if you need to prompt first-time users to change their default passwords).

#### Departments

The table structure, including any table- column-level constraints, are clearly defined in the `setup.sql` file. Time to brush up on those SQL skills! There's not a whole lot going on here of interest.

* The `department_id` field is an autoincremented integer, starting from 1.
* The `title` field is the name of the department, which can be `Computer Science`, `English`, `History`, `Mathematics`, `Phyiscal Education`, or `Science`.

#### Administrators

The table structure, including any table- column-level constraints, are clearly defined in the `setup.sql` file. Time to brush up on those SQL skills! Aside from that, though, there are few formatting issues you'll need to understand.

* The `teacher_id` field is an autoincremented integer, starting from 1.
* The `first_name` field is the administrator's first name.
* The `last_name` field is the administrator's last name.
* The `job_title` field is the position the administrator holds within the school. This can be either `Principal` or `Supervisor`.
* The `user_id` field is a reference (called a *foreign key*) to the `user` table. It's a way of associating each administrator with exactly one user account.

As you might've noticed, the `Administrator` class extends the `User` class. This means, in practice, the `activeUser` (when that user is an admnistrator) will store the attibutes of both an `Administrator` and a `User`.

#### Teachers

The table structure, including any table- column-level constraints, are clearly defined in the `setup.sql` file. Time to brush up on those SQL skills! Aside from that, though, there are few formatting issues you'll need to understand.

* The `administrator_id` field is an autoincremented integer, starting from 1.
* The `first_name` field is the administrator's first name.
* The `last_name` field is the administrator's last name.
* The `department_id` field is a reference (called a *foreign key*) to the `departments` table. It's a way of associating each teacher with exactly one department.
* The `user_id` field is a reference (called a *foreign key*) to the `user` table. It's a way of associating each teacher with exactly one user account.

As you might've noticed, the `Teacher` class extends the `User` class. This means, in practice, the `activeUser` (when that user is a teacher) will store the attibutes of both an `Teacher` and a `User`.

#### Students

The table structure, including any table- column-level constraints, are clearly defined in the `setup.sql` file. Time to brush up on those SQL skills! Aside from that, though, there are few formatting issues you'll need to understand.

* The `student_id` field is an autoincremented integer, starting from 1.
* The `first_name` field is the administrator's first name.
* The `last_name` field is the administrator's last name.
* The `graduation` field is the year in which the student is set to graduate. This is always a four-digit year.
* The `grade_level` field is the numeric representation of freshman, sophomore, junior, or senior. This translates into either `9`, `10`, `11`, or `12`.
* The `gpa` is the computed grade point average, always rounded to four digits of precision. This is calcuated with each grade entry; prior to any grade entries, it defaults to `0.0`.
* The `class_rank` is the numeric ranking based on `gpa`. This, too, is calculated iwth each grade entry; prior to any grade entries, it defaults to `0`.
* The `user_id` field is a reference (called a *foreign key*) to the `user` table. It's a way of associating each student with exactly one user account.

As you might've noticed, the `Student` class extends the `User` class. This means, in practice, the `activeUser` (when that user is a student) will store the attibutes of both an `Student` and a `User`.

#### Courses

The table structure, including any table- column-level constraints, are clearly defined in the `setup.sql` file. Time to brush up on those SQL skills! Aside from that, though, there are few formatting issues you'll need to understand.

* The `course_id` field is an autoincremented integer, starting from 1. Every time you add a course, this number increases.
* The `department_id` field is a reference (called a *foreign key*) to the `departments` table. It's a way of associating each course with exactly one department.
* The `course_no` field is a unique, text-based course identification system. Each course number starts with a two-character identifier (`CS` for `Computer Science`, `EN` for `English`, `HI` for `History`, `MA` for `Mathematics`, `PE` for `Physical Education`, and `SC` for `Science`) followed by a four-digit number. Higher numbers indicate more advanced courses.
* The `title` field is the name of the course.
* The `credit_hours` field is the number of credits the course is worth.
* The `weight` field indicates how the course is weighted in terms of GPA calculations. Standard courses have a `1.0` weighting, while AP courses have a `1.5` weighting.
* The `enrollment` field tracks how many students are currently enrolled in the course.
* The `capacity` field is the the maximum number of students who may enroll in a course at any given time.

#### Course Grades

The table structure, including any table- column-level constraints, are clearly defined in the `setup.sql` file. Time to brush up on those SQL skills! Aside from that, though, there are few formatting issues you'll need to understand.

* The `course_id` field is a reference (called a *foreign key*) to the `courses` table. It's a way of associating each grade with exactly one course.
* The `student_id` field is a reference (called a *foreign key*) to the `students` table. It's a way of associating each grade with exactly one student.
The `mp1` field is the first marking period grade.
The `mp2` field is the second marking period grade.
The `midterm_exam` field is the midterm exam grade.
The `mp3` field is the third marking period grade.
The `mp4` field is the fourth marking period grade.
The `final_exam` field is the final exam grade.
The `grade` field is the calculated course grade based on the marking period and exam grades (20% per marking period, 10% per exam).

Until now, all of our tables have used a single primary key column. The `course_grades` table uses the `course_id` and `student_id` columns as a composite primary key. This means that every row in the table must have a unique combination of these two column values.

#### Assignments

The table structure, including any table- column-level constraints, are clearly defined in the `setup.sql` file. Time to brush up on those SQL skills! Aside from that, though, there are few formatting issues you'll need to understand.

* The `course_id` field is a reference (called a *foreign key*) to the `courses` table. It's a way of associating each assignment with exactly one course.
* The `assignment_id` field is an autogenerated integer by course.
* The `title` field is the name of the assignment.
* The `point_value` field is the number of points the assignment is worth. This must be between 1 and 100.

The `assignments` table uses the `course_id`, `assignment_id`, and `title` columns as a composite primary key. This means that every row in the table must have a unique combination of these three column values.

#### Assignment Grades

The table structure, including any table- column-level constraints, are clearly defined in the `setup.sql` file. Time to brush up on those SQL skills! Aside from that, though, there are few formatting issues you'll need to understand.

* The `course_id` field is a reference (called a *foreign key*) to the `courses` table. It's a way of associating each assignment grade with exactly one course.
* The `assignment_id` field is a reference (called a *foreign key*) to the `assignments` table. It's a way of associating each assignment grade with exactly one assignment.
* The `student_id` field is a reference (called a *foreign key*) to the `students` table. It's a way of associating each assignment grade with exactly one student.
* The `points_earned` field is the number of points the student earned on that assignment. This value must be between 0 and `points_possible`.
* The `points_possible` field is the total number of points a student could have possibly earned on this assignment. This must be between 1 and 100.

The `assignment_grades` table uses the `course_id`, `assignment_id`, and `assignment_id` columns as a composite primary key. This means that every row in the table must have a unique combination of these three column values.

### Teams

If you wish, you can work with one other person on this assignment. It is your responsibility to agree on a design, your development plan, the division of labor, and (perhaps, most importantly!) timelines. You'll submit your problem set as a team, and will receive a grade as a team.

If you elect to work in a pair, you are to create a single repository configured so that each of you has permission push and pull changes to and from it. Let me know if you need help setting this up, but it should be fairly straightforward to add a collaborator.

## Deadline

Please read very carefully. Historically, most students lose points on problem sets for simply failing to read the instructions and requirements.

* December 19, 2019, at 11:59pm.

If you submit your problem set at midnight (i.e., December 20, 2019, at 12:00am), it is considered **late**!

### Submission Requirements

* Your code **must** compile. Code that fails to meet this minimum requirement will not be accepted.
* There must be **at least** 50 unique commits to your repository.
* Your code must meet each requirement outlined in the *Overview* and *Requirements* sections.
* Your code must adhere to the course style guidelines.

Happy coding!


