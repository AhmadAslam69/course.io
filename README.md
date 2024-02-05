# course.io
course management system c++

Key Components:
Classes:

personInfo class: Represents basic information for a person, including name and ID.
Course class: Represents courses, including their codes, names, instructors, and prices.
Student class: Inherits from personInfo and Course. Represents a student, including enrolled courses.
Admin class: Inherits from personInfo and Course. Represents an administrator, handling available courses and registrations.
Teacher class: Inherits from personInfo, Admin, and Course. Represents a teacher, including courses they teach.
Exception Handling:

FileHandlingException class: Custom exception class for file-related errors.
Static Variables:

count: Static variable used for tracking login attempts.
currentn: Static variable to store the current user's name.
maxCourses: Constant variable representing the maximum number of courses.
Features:
User Authentication:

Separate login functionalities for students, administrators, and teachers.
Course Management:

Students can view, enroll, and discard courses.
Administrators can view, add, and remove courses.
Teachers can view, intake, and remove courses they teach.
File Handling:

Reading and writing user information to files.
Menu-Driven Interface:

Provides menu options for users to navigate and perform various actions.
Exception Handling:

Custom exception handling for file-related errors.
