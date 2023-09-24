import ballerina/grpc;
import ballerina/io;

listener grpc:Listener ep = new (9090);

@grpc:Descriptor {value: LIBRARYSYSTEM_DESC}
service "LibrarySystem" on ep {

    table<admin> key(staff_id) admin;
    table<student> key(student_number) students;
    table<librarian> key(staff_id) librarians;
    table<book> key(ISBN) books;
    table<borrowed_book> key(id) borrowed_books;

    function init() {
        self.students = testStudents;
        self.librarians = testLibrarians;
        self.books = testBooks;
        self.admin = testAdmins;
        self.borrowed_books = table [];
    }

    // Librarian methods 
    remote function add_book(book newBook) returns string|error {
        book? bookRes = self.books.clone()[newBook.ISBN];
        if (bookRes == ()) {
            self.books.add(newBook);
            return newBook.ISBN;
        }
        return error("A book with ISBN: " + newBook.ISBN + " already exists in our system");
    }
    remote function update_book(book updatedBook) returns string|error {
        book? bookRes = self.books.clone()[updatedBook.ISBN];
        if (bookRes != ()) {
            self.books.put(updatedBook);
            return updatedBook.ISBN;
        }
        return error("The book with ISBN: " + updatedBook.ISBN + " does not exist in our system");
    }
    // removes a book with a specific ISBN and returns the remaining books
    remote function remove_book(string ISBN) returns stream<book, error?>|error {
        book? bookRes = self.books.clone()[ISBN];
        if (bookRes != ()) {

            _ = self.books.remove(ISBN);
            return stream from book b in self.books.clone()
                select b;
        }
        return error("The book with ISBN: " + ISBN + " does not exist in our system");
    }
    // Student methods
    remote function locate_book(string ISBN) returns location|error {

        book? bookRes = self.books.clone()[ISBN];
        if (bookRes != ()) {
            if (bookRes.status == AVAILABLE) {
                return bookRes.book_location;
            }
            return error("This book is currently unavailable");
        }
        return error("The book with ISBN: " + ISBN + " does not exist in our system");

    }
    remote function borrow_book(StudentRequest req) returns string|error {
        var book = self.books.clone()[req.ISBN];

        if (book != ()) {
            if (book.status == AVAILABLE) {
                // change book status and update the table
                book.status = UNAVAILABLE;
                self.books.put(book);
                // create the borrowed book
                borrowed_book borrowedBook = {
                    id: req.ISBN + req.student_number,
                    ISBN: req.ISBN,
                    student_number: req.student_number
                };
                // add it to borrowed_books table
                self.borrowed_books.add(borrowedBook);
                return string `ISBN: ${req.ISBN} has been borrowed successfully`;
            }
            return error("Sorry this book is currently unavailable at the moment");
        }
        return error("Sorry this book does not exist in our system");

    }
    remote function return_book(StudentRequest req) returns string|error {
        var book = self.books.clone()[req.ISBN];
        // check if the book exists
        if (book != ()) {
            // check if the book has been borrowed
            var borrowedBook = self.borrowed_books.clone()[req.ISBN + req.student_number];
            io:print(borrowedBook.toString());
            if (borrowedBook != ()) {
                // set status to available
                book.status = AVAILABLE;
                self.books.put(book);
                // remove the book from borrowed books
                _ = self.borrowed_books.remove(borrowedBook.id);
                return string `ISBN: ${req.ISBN} has been returned successfully`;
            }
            return error("This book is currently available at the moment");
        }
        return error("Sorry this book does not exist in our system");
    }
    remote function get_borrowed_book() returns stream<book, error?>|error {
        if (self.borrowed_books.clone().length() == 0) {
            return error("No books have been borrowed");
        }
        var borrowedBookStream = stream from book b in self.books.clone()
            join borrowed_book borrowedBook in self.borrowed_books on b.ISBN equals borrowedBook.ISBN
            select b;
        return borrowedBookStream;
    }
    remote function list_available_book() returns stream<book, error?>|error {
        if (self.books.clone().length() == 0) {
            return error("No books are currently available");
        }

        var bookStream = stream from var book in self.books.clone()
            where book.status == AVAILABLE
            select book;

        return bookStream;
    }
    // Admin function
    remote function create_users(stream<UserRequest, grpc:Error?> userStream) returns string|error {
        check userStream.forEach(function(UserRequest req) {
            var student = req.student;
            var librarian = req.librarian;

            if (student != ()) {
                self.students.add(student);
            }

            if (librarian != ()) {
                self.librarians.add(librarian);
            }
        });
        return "users added successfully";
    }
}

