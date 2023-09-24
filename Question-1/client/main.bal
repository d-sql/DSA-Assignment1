import ballerina/io;
import 'client.types as Types;
import 'client.'client as Client;

public function main() returns error?{
    Client:Client staff_client = check new Client:Client();
    
    io:println("What would you like to \n1) Get All Lecturers \n2) Create a new lecturer \n3) Update an existing lecturer's information \n4) Retrieve the details of a specific lecturer \n5) Delete a lecturer \n6) Retrieve all the lecturers that teach a certain course \n7) Retrieve all the lecturers that sit in the same office");
    io:println("=========================================================");

    string choice =  io:readln();


    if choice == "1" {
        Types:LecturerArr lecturers = check staff_client->getAllLecturers();
        io:println(lecturers);
    }
    if choice == "2" {
        int staff_number = check int:fromString(io:readln("Enter the staff number: "));
        string name = io:readln("Enter the lecturers fullname: ");
        string title = io:readln("Enter the lecturer's title: ");
        string email = io:readln("Enter the lecturer's email address: ");
        string phone_number = io:readln("Enter the lecturer's phone number in the +264 format: ");

        Types:OfficeArr offices = check staff_client->getAllOffices();
        io:println(offices);

        int office = check int:fromString(io:readln("Please enter an office number for the lecturer: "));

        Types:Lecturer lecturer = {staff_number:staff_number, name:name, title:title, email:email, phone_number:phone_number, office_number: {office_number: office}};
        Types:InlineResponse201 lecturerResult = check staff_client->addLecturer(lecturer);
        io:println(lecturerResult);

    }
    if choice == "3" {
        int staff_number = check int:fromString(io:readln("Enter the staff number: "));
        Types:Lecturer lecturer = check staff_client->retrieveLecturer(staff_number);

        string change_to = io:readln("What would you like to change? (name, title, email, phone_number, office_number): ");
        if change_to == "name" {
            string name = io:readln("Change Name To: ");
            lecturer.name = name;
        }
        if change_to == "title" {
            string title = io:readln("Change Title To: ");
            lecturer.title = title;
        }
        if change_to == "email" {
            string email = io:readln("Change Email To: ");
            lecturer.email = email;
        }
        if change_to == "phone_number" {
            string phone_number = io:readln("Change Phone Number To: ");
            lecturer.phone_number = phone_number;
        }
        if change_to == "office_number" {
            Types:OfficeArr offices = check staff_client->getAllOffices();
            io:println(offices);

            int office = check int:fromString(io:readln("Change Office Number To: "));
            lecturer.office_number = {office_number: office};
        }

        Types:Lecturer lecturerResult = check staff_client->updateLecturer(staff_number, lecturer);
        io:println(lecturerResult);

    }
    if choice == "4"{
        int staff_number = check int:fromString(io:readln("Enter the staff number: "));
        Types:Lecturer lecturer = check staff_client->retrieveLecturer(staff_number);
        io:println(lecturer);
    }
    if choice == "5"{
        int staff_number = check int:fromString(io:readln("Enter the staff number: "));
        Types:InlineResponse201 lecturerResult = check staff_client->deleteLecturer(staff_number);
        io:println(lecturerResult);
    }
    if choice == "6"{
        string course_code = io:readln("Enter the course code: ");
        Types:LecturerArr lecturers = check staff_client->retrieveLecturersTeachingCourse(course_code);
        io:println(lecturers);
    }
    if choice == "7"{
        int office_number = check int:fromString(io:readln("Enter the office number: "));
        Types:LecturerArr lecturers = check staff_client->retrieveLecturersInOffice(office_number);
        io:println(lecturers);
    }
}