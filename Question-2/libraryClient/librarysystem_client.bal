import ballerina/io;

LibrarySystemClient ep = check new ("http://localhost:9090");

public function main() returns error? {
    book add_bookRequest = {ISBN: "ballerina", name: "ballerina", authors: [{first_name: "ballerina", middle_name: "ballerina", last_name: "ballerina"}], publisher: "ballerina", genre: "ballerina", year_published: 1, edition: 1, status: "AVAILABLE"};
    string add_bookResponse = check ep->add_book(add_bookRequest);
    io:println(add_bookResponse);

    book update_bookRequest = {ISBN: "ballerina", name: "ballerina", authors: [{first_name: "ballerina", middle_name: "ballerina", last_name: "ballerina"}], publisher: "ballerina", genre: "ballerina", year_published: 1, edition: 1, status: "AVAILABLE"};
    string update_bookResponse = check ep->update_book(update_bookRequest);
    io:println(update_bookResponse);

    StudentRequest borrow_bookRequest = {student_number: "ballerina", ISBN: "ballerina"};
    string borrow_bookResponse = check ep->borrow_book(borrow_bookRequest);
    io:println(borrow_bookResponse);

    StudentRequest return_bookRequest = {student_number: "ballerina", ISBN: "ballerina"};
    string return_bookResponse = check ep->return_book(return_bookRequest);
    io:println(return_bookResponse);

    string locate_bookRequest = "ballerina";
    book locate_bookResponse = check ep->locate_book(locate_bookRequest);
    io:println(locate_bookResponse);

    string remove_bookRequest = "ballerina";
    stream<book, error?> remove_bookResponse = check ep->remove_book(remove_bookRequest);
    check remove_bookResponse.forEach(function(book value) {
        io:println(value);
    });
    stream<

book, error?> get_borrowed_bookResponse = check ep->get_borrowed_book();
    check get_borrowed_bookResponse.forEach(function(book value) {
        io:println(value);
    });
    stream<

book, error?> list_available_bookResponse = check ep->list_available_book();
    check list_available_bookResponse.forEach(function(book value) {
        io:println(value);
    });

    UserRequest create_usersRequest = {student: {student_number: "ballerina", first_name: "ballerina", last_name: "ballerina"}, librarian: {staff_id: "ballerina", first_name: "ballerina", last_name: "ballerina"}};
    Create_usersStreamingClient create_usersStreamingClient = check ep->create_users();
    check create_usersStreamingClient->sendUserRequest(create_usersRequest);
    check create_usersStreamingClient->complete();
    string? create_usersResponse = check create_usersStreamingClient->receiveString();
    io:println(create_usersResponse);
}

