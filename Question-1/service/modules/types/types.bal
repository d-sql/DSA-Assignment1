import ballerina/http;

public type CreatedInlineResponse201 record {|
    *http:Created;
    InlineResponse201 body;
|};

public type CreatedInlineResponse2012 record {|
    *http:Created;
    InlineResponse2012 body;
|};

public type CreatedInlineResponse2011 record {|
    *http:Created;
    InlineResponse2011 body;
|};

public type Office record {
    # The office number of the office
    readonly int office_number;
    # The building the office is in
    string building?;
    # The floor the office is on
    int floor?;
    # The room number of the office
    string room?;
};

public type InlineResponse201 record {
    # the lecturer number of the newly created lecturer
    int lecturerid?;
};

public type InlineResponse2012 record {
    # the office number of the newly created office
    int officeid?;
};

public type Error record {
    # The type of error
    string errorType?;
    # The error message
    string message?;
};

public type InlineResponse2011 record {
    # the course number of the newly created course
    string courseid?;
};

public type Lecturer record {
    # The staff number of the lecturer
    readonly int staff_number;
    # The name of the lecturer
    string name?;
    # The title of the lecturer
    string title?;
    # The email of the lecturer
    string email?;
    # The phone number of the lecturer
    string phone_number?;
    Office office_number?;
    # The courses the lecturer teaches
    Course[] courses?;
};

public type Course record {
    # The course code of the course
    readonly string course_code;
    # The name of the course
    string name?;
    # The NQF level of the course
    anydata nqf?;
};
