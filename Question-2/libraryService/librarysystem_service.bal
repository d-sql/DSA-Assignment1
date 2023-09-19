import ballerina/grpc;

listener grpc:Listener ep = new (9090);

@grpc:Descriptor {value: LIBRARYSYSTEM_DESC}
service "LibrarySystem" on ep {

    remote function add_book(book value) returns string|error {
    }
    remote function update_book(book value) returns string|error {
    }
    remote function borrow_book(StudentRequest value) returns string|error {
    }
    remote function return_book(StudentRequest value) returns string|error {
    }
    remote function locate_book(string value) returns book|error {
    }
    remote function create_users(stream<UserRequest, grpc:Error?> clientStream) returns string|error {
    }
    remote function remove_book(string value) returns stream<book, error?>|error {
    }
    remote function get_borrowed_book() returns stream<book, error?>|error {
    }
    remote function list_available_book() returns stream<book, error?>|error {
    }
}

