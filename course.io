// Online Course Management System


#include<iostream>
#include<iomanip>
#include<string>
#include<windows.h>
#include<time.h>
#include<fstream>
#include<conio.h>
#include<exception>


using namespace std;

void logo();
bool stlogin();
void streg();
void student();
void admin();
void start();
void adreg();
bool adlog();
void stmainpage();
void admainpage();
void teacher();
void treg();
bool tlogin();

static int count = 0;
static string currentn;
static const int maxCourses = 12;



class Course;

class personInfo
{
protected:

	string name;
	int ID;

public:


	personInfo()
	{
		name = "";
		ID = 0;
	}

	personInfo(string n, int i)
	{
		name = n;
		ID = i;
	}
	void setname(string n)
	{
		name = n;
	}

	void setID(int i)
	{
		ID = i;
	}

	string getname()
	{
		return name;
	}

	int getId()
	{
		return ID;
	}

};




class Course
{
protected:
	string courseCode[maxCourses];
	string courseName[maxCourses];
	string instructor[maxCourses];
	static int courseNum;
	double price;

public:
	Course()
	{
		courseNum = 7;
		courseCode[0] = "CS 101";
		courseName[0] = "Computer Science";
		instructor[0] = "Mr. Ahmad Aslam";
		courseCode[1] = "E 211";
		courseName[1] = "Functional English";
		instructor[1] = "Mrs. Shaista Lodhi";
		courseCode[2] = "CA 422";
		courseName[2] = "Calculus";
		instructor[2] = "Mr. Aabudin";
		courseCode[3] = "POM 230";
		courseName[3] = "Marketing";
		instructor[3] = "Mr.Ahsam Ahmad";
		courseCode[4] = "OOP 11";
		courseName[4] = "Object-Oriented Programming";
		instructor[4] = "Mr. Arslan Ahmad";
		courseCode[5] = "DM 231";
		courseName[5] = "Discrete Mathematics";
		instructor[5] = "Mr. Aslam";
		courseCode[6] = "C 236";
		courseName[6] = "Communication Skills";
		instructor[6] = "Mrs. Nargis Fakhri";

		ofstream file("Courses.txt", ios::trunc);
		for (int i = 0; i < courseNum; i++)
		{
			file << courseCode[i] << endl << courseName[i] << endl;
		}
		file.close();
	}

	virtual void showAllCourses()
	{
		system("cls");
		for (int i = 0; i < courseNum; i++)
		{
			cout << "Course " << i + 1 << endl;
			cout << "Course Code: " << courseCode[i] << endl;
			cout << "Course Name: " << courseName[i] << endl;
			cout << "Course Instructor: " << instructor[i] << endl << endl;
		}
	}

	bool isValidCourse(string c)
	{
		for (int i = 0; i < courseNum; i++)
		{
			if (c == courseCode[i])
				return true;
		}
		return false;
	}




};


int Course::courseNum = 7;

class Student :public personInfo, public Course
{

protected:

	string enrolledCourse[maxCourses];
	string enrolledCourseCode[maxCourses];
	static int numCourse;

public:

	Student()
	{

		enrolledCourseCode[0] = "CS 101";
		enrolledCourse[0] = "Computer Science";
		enrolledCourseCode[1] = "E 211";
		enrolledCourse[1] = "Functional English";
		enrolledCourseCode[2] = "CA 422";
		enrolledCourse[2] = "Calculus";
		enrolledCourseCode[3] = "POM 230";
		enrolledCourse[3] = "Marketing";
		enrolledCourseCode[4] = "OOP 11";
		enrolledCourse[4] = "Object-Oriented Programming";
		enrolledCourseCode[5] = "DM 231";
		enrolledCourse[5] = "Discrete Mathematics";
	}

	Student(string n)
	{
		name = n;
	}
	bool alreadyExists(string c)
	{
		bool a;

		for (int i = 0; i < courseNum; i++)
		{
			if (c == enrolledCourseCode[i])
			{
				return false;
			}
			else
			{
				continue;
			}
			return true;
		}


	}



	void viewenrolledCourses()
	{
		system("cls");
		for (int i = 0; i < numCourse; i++)
		{
			cout << "Course Number " << i + 1 << endl;
			cout << "Course Code: " << enrolledCourseCode[i] << endl;
			cout << "Course Name: " << enrolledCourse[i] << endl << endl;
		}
	}


	void enrollCourses()
	{
		system("cls");
		string c;
		bool flag = true;
		cin.ignore();
		logo();
		showAllCourses();

		while (flag)
		{

			int index = 0;
			cout << "Enter The Course Code For The Course You Want To Enroll" << endl << endl;
			cout << "Type In 'exit' Or 'EXIT' to Go Back to Main Page" << endl;
			getline(cin, c);

			if (c == "Exit" || c == "EXIT")
			{
				flag = 0;
			}
			else
			{
				for (int i = 0; i < courseNum; i++)
				{
					if (c == courseCode[i])
					{
						index = i;
						break;
					}
					else
					{
						continue;
					}
				}
				string a;

				a = courseName[index];


				if (isValidCourse(c))
				{
					if (alreadyExists(c))
					{
						cout << "Course Has Been Enrolled Succesfully" << endl << endl;
						enrolledCourseCode[numCourse] = c;
						enrolledCourse[numCourse] = a;
						numCourse++;
						flag = false;
					}
					else
					{
						cout << "Course Is Already Enrolled" << endl << endl;
						flag = true;
					}

				}
				else
				{
					cout << "Invalid course code. Please enter a valid course code." << endl << endl;
					flag = true;
				}
			}
		}


	}

	void discardCourse()
	{
		system("cls");
		string c;
		bool flag = true;
		cin.ignore();
		logo();
		showAllCourses();

		while (flag == true)
		{

			int index = 0;
			cout << "Enter The Course Code For The Course You Want To Discard" << endl << endl;
			cout << "Type In 'exit' Or 'EXIT' to Go Back to Main Page" << endl;
			getline(cin, c);

			if (c == "exit" || c == "EXIT")
			{
				flag = 0;
			}
			else
			{
				for (int i = 0; i < courseNum; i++)
				{
					if (c == courseCode[i])
					{
						index = i;
						break;
					}
					else
					{
						continue;
					}
				}
				string a;

				a = courseName[index];


				if (isValidCourse(c))
				{
					if (alreadyExists(c))
					{
						cout << "Course Has Been Enrolled Succesfully" << endl << endl;
						enrolledCourseCode[numCourse] = c;
						enrolledCourse[numCourse] = a;
						numCourse++;
						flag = false;
					}
					else
					{
						cout << "Course Is Already Enrolled" << endl << endl;
						flag = true;
					}

				}
				else
				{
					cout << "Invalid course code. Please enter a valid course code." << endl << endl;
					flag = true;
				}
			}
		}



	}
};

int Student::numCourse = 6;



class Admin :public personInfo, public Course
{

protected:
	string avCourseName[maxCourses];
	string avCourseCode[maxCourses];
	string avSem[maxCourses];
	static int avnum;

public:

	Admin()
	{
		avCourseCode[0] = "DLD";
		avCourseName[0] = "Digital Logic Design";
		avSem[0] = "BSCS 2A";

		avCourseCode[1] = "E 31";
		avCourseName[1] = "Economics";
		avSem[1] = "BSCS 2A";

		avCourseCode[2] = "PM 21";
		avCourseName[2] = "Project Management";
		avSem[2] = "BSCS 2B";


	}

	void showAvailableCourses()
	{
		system("cls");
		for (int i = 0; i < avnum; i++)
		{
			cout << "Course Number " << i + 1 << endl;
			cout << "Course Code: " << avCourseCode[i] << endl;
			cout << "Course Name: " << avCourseName[i] << endl << endl;
		}
	}
	void addNewCourse()
	{
		system("cls");
		logo();
		string n, id;
		bool check = true;
		cin.ignore();
		cout << "Enter The Name For Course: " << endl;
		getline(cin, n);
		cout << "Enter The Code For Course: " << endl;
		getline(cin, id);

		for (int i = 0; i < courseNum; i++)
		{
			if (courseCode[i] == id)
			{
				check = false;
				break;
			}
		}
		if (check == true)
		{
			cout << "Course Has been Succesfully Added" << endl << endl;
			courseCode[courseNum] = id;
			courseName[courseNum] = n;
			courseNum++;
		}
		else
		{
			cout << "The Course Has Already Been Added" << endl << endl;
		}

	}

	bool ValidCourse(string c)
	{
		for (int i = 0; i < avnum; i++)
		{
			if (c == avCourseCode[i])
				return true;
		}
		return false;
	}

	void removeCourseByCode(string code)
	{
		int index = -1;

		for (int i = 0; i < avnum; i++)
		{
			if (avCourseCode[i] == code)
			{
				index = i;
				break;
			}
		}

		if (index != -1)
		{
			for (int i = index; i < avnum - 1; i++)
			{
				avCourseCode[i] = avCourseCode[i + 1];
				avCourseName[i] = avCourseName[i + 1];
				avSem[i] = avSem[i + 1];
			}
			avnum--;

			cout << "Course removed from available courses." << endl;
		}
		else
		{
			cout << "The Course Code Is Not Valid. The Course Does Not Exist!" << endl;
		}
	}
	void removeCourse()
	{
		system("cls");
		string code;
		logo();
		showAllCourses();
		cout << endl << endl;

		cout << "Enter the Course Code of the Course You Want to Remove: ";
		cin.ignore();
		getline(cin, code);

		int index = -1;


		for (int i = 0; i < courseNum; i++)
		{
			if (courseCode[i] == code)
			{
				index = i;
				break;
			}
		}

		if (index != -1)
		{

			for (int i = index; i < courseNum - 1; i++)
			{
				courseCode[i] = courseCode[i + 1];
				courseName[i] = courseName[i + 1];
			}
			courseNum--;

			cout << "Course removed." << endl;
		}
		else
		{
			cout << "The Course Code Is Not Valid. The Course Does Not Exist!" << endl;
		}
	}


};


int Admin::avnum = 3;
class Teacher : public Course, public Admin, public personInfo
{
private:

	string unCourseName[maxCourses];
	string unCourseCode[maxCourses];
	string sem[maxCourses];
	static int tnum;

public:

	Teacher()
	{


		unCourseCode[0] = "OP 101";
		unCourseName[0] = "Operating system";
		sem[0] = "BSCS 6A";

		unCourseCode[1] = "DM 211";
		unCourseName[1] = "Discrete Maths";
		sem[1] = "BSCS 2A";

		unCourseCode[2] = "AI 69";
		unCourseName[2] = "Artificial Intelligense";
		sem[2] = "BSCS 8B";

		unCourseCode[3] = "POM 230";
		unCourseName[3] = "Principles Of Marketing";
		sem[3] = "BSCS 2B";

		unCourseCode[4] = "OOP 11";
		unCourseName[4] = "Object-Oriented Programming";
		sem[4] = "BSCS 2A";


	}
	Teacher(string n)
	{
		personInfo::name = n;
	}
	void showTakenCourses()
	{
		for (int i = 0; i < tnum; i++)
		{
			cout << "Course Number " << i + 1 << endl;
			cout << "Course Code: " << unCourseCode[i] << endl;
			cout << "Course Name: " << unCourseName[i] << endl << endl;
		}
	}

	bool alreadyTeaching(string c)
	{
		bool a = false;
		for (int i = 0; i < tnum; i++)
		{
			if (unCourseCode[i] == c)
			{
				a = true;
			}
			else
				continue;
		}
		return a;
	}

	void intakeNewCourse()
	{
		system("cls");
		string c;
		bool flag = true;
		cin.ignore();
		logo();
		Admin::showAvailableCourses();

		while (flag)
		{

			int index = 0;
			cout << "Enter The Course Code For The Course You Want To Intake" << endl;

			getline(cin, c);

			if (Admin::ValidCourse(c))
			{
				for (int i = 0; i < avnum; i++)
				{
					if (c == Admin::avCourseCode[i])
					{
						index = i;
						break;
					}
					else
					{
						continue;
					}
				}
				if (alreadyTeaching(c))
				{
					cout << "You Are Already Teaching The Course" << endl << endl;
					flag = true;
				}
				else
				{
					unCourseCode[tnum] = c;
					unCourseName[tnum] = Admin::avCourseName[index];
					sem[tnum] = Admin::avSem[index];
					tnum++;

					cout << "Course Has Been Registered" << endl << endl;
					flag = false;
					Admin::removeCourseByCode(c);
				}
			}
			else
			{
				cout << "Course Code Is Not Valid" << endl;
				flag = false;
			}
		}
	}






	void viewUnCourses()
	{
		for (int i = 0; i < tnum; i++)
		{
			cout << "Course Number " << i + 1 << endl;
			cout << "Course Code: " << unCourseCode[i] << endl;
			cout << "Course Name: " << unCourseName[i] << endl << endl;
		}
	}

	void removeUnCourses()
	{
		system("cls");
		string c;
		bool flag = true;
		bool al = true;
		int index = 0;
		cin.ignore();
		logo();
		viewUnCourses();
		while (flag)
		{
			cout << "Enter The Course Code For The Course You Want To Remove" << endl << endl;
			getline(cin, c);


			index = -1;
			for (int i = 0; i < tnum; i++)
			{
				if (unCourseCode[i] == c)
				{
					al = false;
					index = i;
				}
				else continue;
			}

			if (index != -1)
			{


				for (int i = index; i < tnum - 1; i++)
				{
					unCourseCode[i] = unCourseCode[i + 1];
					unCourseName[i] = unCourseName[i + 1];
				}
				tnum--;

				cout << "Course removed." << endl;
				flag = false;
			}
			else
			{
				cout << "The Course Code Is Not Valid. The Course Does Not Exist!" << endl;
			}

		}

	}

};

int Teacher::tnum = 5;



class FileHandlingException :public exception
{
private:

	const char* err;

public:

	FileHandlingException(const char* error)
	{
		err = error;
	}
	const char* what()const
	{
		return err;
	}

};

static Course C;
static Admin A;
static Student S;
static Teacher T;

void stmainpage()
{
	system("cls");
	logo();

	int a;
	int b;
	bool flag = true;
	while (flag = true)
	{
		cout << setw(65) << "Welcome to Course.IO's Main Page, " << currentn << "." << endl << endl;
		cout << setw(65) << "Press 1 To View Your Courses" << endl;
		cout << setw(65) << "Press 2 To View All Available Courses" << endl;
		cout << setw(65) << "Press 3 To Enroll New Courses" << endl;
		cout << setw(65) << "Press 4 To Access Account Information" << endl;
		cout << setw(65) << "Press 5 To Logout" << endl;

		cin >> a;
		if (a == 1)
		{
			S.viewenrolledCourses();
			cout << endl;
			cout << "Press 1 To Go Back To Mainpage" << endl;
			cout << "Press 2 To Exit" << endl;
			cin >> b;
			if (b == 1)
			{
				flag = true;
			}
			else if (b == 2)
			{
				exit;
			}
		}
		else if (a == 2)
		{
			C.showAllCourses();
			cout << endl;
			cout << "Press 1 To Go Back To Mainpage" << endl;
			cout << "Press 2 To Exit" << endl;
			cin >> b;
			if (b == 1)
			{
				flag = true;
			}
			else if (b == 2)
			{
				exit;
			}
		}
		else if (a == 3)
		{

			S.enrollCourses();
			cout << endl;
			cout << "Press 1 To Go Back To Mainpage" << endl;
			cout << "Press 2 To Exit" << endl;
			cin >> b;
			if (b == 1)
			{
				flag = true;
			}
			else if (b == 2)
			{
				exit;
			}
		}
		else if (a == 4)
		{
			string n, p;

			ifstream read("course.txt" + currentn);

			getline(read, n);
			getline(read, p);

			cout << setw(64) << "Name: " << n << endl;
			cout << setw(64) << "Password: " << p << endl;

			cout << endl;
			cout << "Press 1 To Go Back To Mainpage" << endl;
			cout << "Press 2 To Exit" << endl;
			cin >> b;
			if (b == 1)
			{
				flag = true;
			}
			else if (b == 2)
			{
				exit;
			}
		}
		else if (a == 5)
		{
			student();
		}
		else
		{
			cout << "Invalid Input!" << endl << endl;
			flag = 1;
		}
	}
}

void admainpage()
{
	system("cls");
	logo();

	int a;
	int b;
	bool flag = true;

	while (flag = true)
	{
		cout << setw(65) << "Welcome to Course.IO's Main Page, " << currentn << "." << endl << endl;
		cout << setw(65) << "Press 1 To View All Courses" << endl;
		cout << setw(65) << "Press 2 To Add A New Course" << endl;
		cout << setw(65) << "Press 3 To Remove A Course" << endl;
		cout << setw(65) << "Press 4 To Access Account Information" << endl;
		cout << setw(65) << "Press 5 To Logout" << endl;


		cin >> a;
		if (a == 1)
		{
			A.showAllCourses();
			cout << endl;
			cout << "Press 1 To Go Back To Mainpage" << endl;
			cout << "Press 2 To Exit" << endl;
			cin >> b;
			if (b == 1)
			{
				flag = true;
			}
			else if (b == 2)
			{
				exit;
			}
		}
		else if (a == 2)
		{
			A.addNewCourse();
			cout << endl;
			cout << "Press 1 To Go Back To Mainpage" << endl;
			cout << "Press 2 To Exit" << endl;
			cin >> b;
			if (b == 1)
			{
				flag = true;
			}
			else if (b == 2)
			{
				exit;
			}
		}
		else if (a == 3)
		{
			A.removeCourse();
			cout << endl;
			cout << "Press 1 To Go Back To Mainpage" << endl;
			cout << "Press 2 To Exit" << endl;
			cin >> b;
			if (b == 1)
			{
				flag = true;
			}
			else if (b == 2)
			{
				exit;
			}
		}
		else if (a == 4)
		{
			string n, p;

			ifstream read("course.txt" + currentn);

			getline(read, n);
			getline(read, p);

			cout << setw(64) << "Name: " << n << endl;
			cout << setw(64) << "Password: " << p << endl;

			cout << endl;
			cout << "Press 1 To Go Back To Mainpage" << endl;
			cout << "Press 2 To Exit" << endl;
			cin >> b;
			if (b == 1)
			{
				flag = true;
			}
			else if (b == 2)
			{
				exit;
			}
		}
		else if (a == 5)
		{
			admin();
		}
		else
		{
			cout << "Invalid Input!" << endl << endl;
			flag = true;
		}
	}
}


void temainpage()
{
	system("cls");
	logo();

	int a;
	int b;
	bool flag = true;

	while (flag = true)
	{
		cout << setw(65) << "Welcome to Course.IO's Main Page, " << currentn << "." << endl << endl;
		cout << setw(65) << "Press 1 To View All Courses" << endl;
		cout << setw(65) << "Press 2 To Intake A New Course" << endl;
		cout << setw(65) << "Press 3 To Remove A Course" << endl;
		cout << setw(65) << "Press 4 To Access Account Information" << endl;
		cout << setw(65) << "Press 5 To View Courses That You've Intook" << endl;
		cout << setw(65) << "Press 6 To Logout" << endl;


		cin >> a;
		if (a == 1)
		{
			T.Course::showAllCourses();
			cout << endl;
			cout << "Press 1 To Go Back To Mainpage" << endl;
			cout << "Press 2 To Exit" << endl;
			cin >> b;
			if (b == 1)
			{
				flag = true;
			}
			else if (b == 2)
			{
				exit;
			}
		}
		else if (a == 2)
		{
			T.intakeNewCourse();
			cout << endl;
			cout << "Press 1 To Go Back To Mainpage" << endl;
			cout << "Press 2 To Exit" << endl;
			cin >> b;
			if (b == 1)
			{
				flag = true;
			}
			else if (b == 2)
			{
				exit;
			}
		}
		else if (a == 3)
		{
			T.removeUnCourses();
			cout << endl;
			cout << "Press 1 To Go Back To Mainpage" << endl;
			cout << "Press 2 To Exit" << endl;
			cin >> b;
			if (b == 1)
			{
				flag = true;
			}
			else if (b == 2)
			{
				exit;
			}
		}
		else if (a == 4)
		{
			string n, p;

			ifstream read("course.txt" + currentn);

			getline(read, n);
			getline(read, p);

			cout << setw(64) << "Name: " << n << endl;
			cout << setw(64) << "Password: " << p << endl;

			cout << endl;
			cout << "Press 1 To Go Back To Mainpage" << endl;
			cout << "Press 2 To Exit" << endl;
			cin >> b;
			if (b == 1)
			{
				flag = true;
			}
			else if (b == 2)
			{
				exit;
			}
		}
		else if (a == 5)
		{
			T.showTakenCourses();
			cout << endl;
			cout << endl;
			cout << "Press 1 To Go Back To Mainpage" << endl;
			cout << "Press 2 To Exit" << endl;
			cin >> b;
			if (b == 1)
			{
				flag = true;
			}
			else if (b == 2)
			{
				exit;
			}

		}
		else if (a == 6)
		{
			teacher();
		}
		else
		{
			cout << "Invalid Input!" << endl << endl;
			flag = true;
		}
	}
}



void start()
{
	system("cls");
	logo();
	int choice;
	cout << "\t\t\t\t\t\t Welcome to Course.io" << endl;
	cout << "\t\t\t\t\t    Press 1 If You Are A Student" << endl;
	cout << "\t\t\t\t\t Press 2 If You Are An Administrator" << endl;
	cout << "\t\t\t\t\t    Press 3 If You Are An Teacher" << endl;

	cin >> choice;
	if (choice == 1)
	{
		student();
	}
	else if (choice == 2)
	{
		admin();
	}
	else if (choice == 3)
	{
		teacher();
	}
}



void logo()
{
	cout << endl << endl;
	cout << "                       * *    * *    *     *   * *      * * *   * * * *       * * * *    * *       " << endl;
	cout << "                      *      *   *   *     *   *  *    *        *                *      *   *      " << endl;
	cout << "                     *      *     *  *     *   *   *   *        *         *      *     *     *     " << endl;
	cout << "                     *      *     *  *     *   * * *    * * *   * * * *  ***     *     *     *     " << endl;
	cout << "                     *      *     *  *     *   *   *         *  *         *      *     *     *     " << endl;
	cout << "                      *      *   *    *   *    *    *        *  *                *      *   *      " << endl;
	cout << "                       * *    * *      * *     *     *  * * *   * * * *       * * * *    * *       " << endl;
	cout << endl << endl << endl << endl << endl << endl;

}

void admin()
{
	system("cls");
	logo();
	bool a;
	int cho;
	cout << "\t\t\t\t\t    Press 1 To Register" << endl;
	cout << "\t\t\t\t\t     Press 2 to Login" << endl;
	cout << "\t\t\t\t\t   Press 3 to Go Back To Start" << endl;

	cin >> cho;
	if (cho == 1)
	{
		adreg();
	}
	else if (cho == 2)
	{
		a = adlog();
		if (a == true)
		{
			admainpage();
		}
		else if (a == false)
		{
			cout << "Wrong Username Or Password" << endl;
			start();
		}
	}
	else if (cho == 3)
	{
		start();
	}
	else
	{
		cout << "Invalid Input! Try Again" << endl;
		admin();
	}
}


bool adlog()
{
	system("cls");
	logo();

	string n, p, e;
	string name;
	string pass;

	cin.ignore();
	cout << setw(64) << "Enter Your Name" << endl;
	getline(cin, n);

	cout << setw(65) << "Enter Your Password" << endl;
	char ch;
	while ((ch = _getch()) != '\r')
	{
		if (ch == '\b')
		{
			if (!p.empty())
			{
				cout << "\b \b";
				p.pop_back();
			}
		}
		else
		{
			cout << '*';
			p.push_back(ch);
		}
	}
	cout << endl;

	try {

		ifstream read("course.txt" + n);

		if (!read.is_open())
		{
			throw FileHandlingException("File Exception Encountered");
		}
		getline(read, name);
		getline(read, pass);


		if (n == name && pass == p)
		{
			currentn = name;
			return true;

		}
		else
		{
			return false;
		}

	}
	catch (const FileHandlingException& a) {

		a.what();
	}
}

void adreg()
{
	system("cls");
	logo();

	string n, p;

	cin.ignore();
	cout << setw(64) << "Enter Your Name" << endl;
	getline(cin, n);

	cout << setw(65) << "CHoose Your Password" << endl;
	char ch;
	while ((ch = _getch()) != '\r')
	{
		if (ch == '\b')
		{
			if (!p.empty())
			{
				cout << "\b \b";
				p.pop_back();
			}
		}
		else
		{
			cout << '*';
			p.push_back(ch);
		}
	}

	try {

		ofstream file("course.txt" + n);

		if (!file.is_open())
		{
			throw FileHandlingException("File Exception Encountered");
		}
		file << n << endl << p << endl;


	}
	catch (const FileHandlingException& a) {

		a.what();
	}

	admin();

}




void teacher()
{
	Teacher T(currentn);
	system("cls");
	int cho;
	bool st;
	logo();
	cout << "\t\t\t\t\t    Press 1 To Register" << endl;
	cout << "\t\t\t\t\t     Press 2 to Login" << endl;
	cout << "\t\t\t\t\t Press 3 to Go Back To Start" << endl;
	cin >> cho;
	cin.clear();

	if (cho == 1)
	{
		treg();
	}
	else if (cho == 2)
	{
		st = tlogin();
		if (st == true)
		{
			temainpage();
		}
		else if (st == false)
		{
			cout << "Wrong Username Or Password" << endl << endl;
			start();
		}
	}
	else if (cho == 3)
	{
		start();
	}
	else
	{
		cout << "Invalid Input! Try Again" << endl;
		teacher();
	}
}

void treg()
{
	system("cls");
	logo();


	cin.ignore();
	string n, p, e;
	cout << setw(64) << "Enter Your Name" << endl;
	getline(cin, n);
	cout << setw(65) << "Choose Your Password" << endl;
	char ch;
	while ((ch = _getch()) != '\r')
	{
		if (ch == '\b')
		{
			if (!p.empty())
			{
				cout << "\b \b";
				p.pop_back();
			}
		}
		else
		{
			cout << '*';
			p.push_back(ch);
		}
	}
	cout << endl;

	try {

		ofstream file("course.txt" + n);

		if (!file.is_open())
		{
			throw FileHandlingException("File Exception Encountered");
		}
		file << n << endl << p << endl;


	}
	catch (const FileHandlingException& a) {

		a.what();
	}

	teacher();
}

bool tlogin()
{
	system("cls");
	logo();

	cin.ignore();
	string n, p, e;
	string name;
	string pass;
	cout << setw(64) << "Enter Your Name" << endl;
	getline(cin, n);
	cout << setw(65) << "Enter Your Password" << endl;
	char ch;
	while ((ch = _getch()) != '\r')
	{
		if (ch == '\b')
		{
			if (!p.empty())
			{
				cout << "\b \b";
				p.pop_back();
			}
		}
		else
		{
			cout << '*';
			p.push_back(ch);
		}
	}
	cout << endl;

	try {

		ifstream read("course.txt" + n);

		if (!read.is_open())
		{
			throw FileHandlingException("File Exception Encountered");
		}
		getline(read, name);
		getline(read, pass);


		if (n == name && pass == p)
		{
			currentn = name;
			return true;

		}
		else
		{
			return false;
		}

	}
	catch (const FileHandlingException& a) {

		a.what();
	}


}
void student()
{
	system("cls");
	int cho;
	bool st;
	logo();
	cout << "\t\t\t\t\t    Press 1 To Register" << endl;
	cout << "\t\t\t\t\t     Press 2 to Login" << endl;
	cout << "\t\t\t\t\t   Press 3 to Go Back To Start" << endl;

	cin >> cho;

	if (cho == 1)
	{
		streg();
	}
	else if (cho == 2)
	{
		st = stlogin();
		if (st == true)
		{
			stmainpage();
		}
		else if (st == false)
		{
			cout << "Wrong Username Or Password" << endl << endl;
			start();
		}
	}
	else if (cho == 3)
	{
		start();
	}
	else
	{
		cout << "Invalid Input! Try Again" << endl;
		student();
	}
}

void streg()
{
	system("cls");
	logo();


	cin.ignore();
	string n, p, e;
	cout << setw(64) << "Enter Your Name" << endl;
	getline(cin, n);
	cout << setw(65) << "Choose Your Password" << endl;
	char ch;
	while ((ch = _getch()) != '\r')
	{
		if (ch == '\b')
		{
			if (!p.empty())
			{
				cout << "\b \b";
				p.pop_back();
			}
		}
		else
		{
			cout << '*';
			p.push_back(ch);
		}
	}
	cout << endl;

	try {

		ofstream file("course.txt" + n);

		if (!file.is_open())
		{
			throw FileHandlingException("File Exception Encountered");
		}
		file << n << endl << p << endl;


	}
	catch (const FileHandlingException& a) {

		a.what();
	}

	student();
}




bool stlogin()
{
	system("cls");
	logo();

	cin.ignore();
	string n, p, e;
	string name;
	string pass;
	cout << setw(64) << "Enter Your Name" << endl;
	getline(cin, n);
	cout << setw(65) << "Enter Your Password" << endl;
	char ch;
	while ((ch = _getch()) != '\r')
	{
		if (ch == '\b')
		{
			if (!p.empty())
			{
				cout << "\b \b";
				p.pop_back();
			}
		}
		else
		{
			cout << '*';
			p.push_back(ch);
		}
	}
	cout << endl;

	try {

		ifstream read("course.txt" + n);

		if (!read.is_open())
		{
			throw FileHandlingException("File Exception Encountered");
		}
		getline(read, name);
		getline(read, pass);


		if (n == name && pass == p)
		{
			currentn = name;
			return true;

		}
		else
		{
			return false;
		}

	}
	catch (const FileHandlingException& a) {

		a.what();
	}


}

int main()
{
	system("cls");
	system("color 9f");
	logo();
	start();

	return 0;
}