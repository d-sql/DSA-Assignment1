import ballerina/grpc;

listener grpc:Listener ep = new (9090);

@grpc:Descriptor {value: LIBRARYSYSTEM_DESC}
service "LibrarySystem" on ep {
    table<admin> key(staff_id) admin;
    table<student> key(student_number) students;
    table<librarian> key(staff_id) librarians;
    table<book> key(ISBN) books;

    function init() {
        self.students = table [];
        self.librarians = table [];
        self.books = table [];
        self.admin = table [];
    }

    // Librarian methods 
    remote function add_book(book value) returns string|error {
    }
    remote function update_book(book value) returns string|error {
    }
    remote function borrow_book(StudentRequest value) returns string|error {
    }
    remote function remove_book(string value) returns stream<book, error?>|error {
    }
    // Student methods
    remote function locate_book(string value) returns location|error {

        book? bookRes = self.books.clone()[value];
        if (bookRes != ()) {
            return bookRes.book_location;
        }
        return error("book does not exist");
    }
    remote function return_book(StudentRequest value) returns string|error {
    }
    remote function get_borrowed_book() returns stream<book, error?>|error {
    }
    remote function list_available_book() returns stream<book, error?>|error {
    }
    // Admin function
    remote function create_users(stream<UserRequest, grpc:Error?> clientStream) returns string|error {
    }
}

