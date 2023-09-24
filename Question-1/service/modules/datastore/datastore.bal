import 'service.types as Types;

public table<Types:Course> key(course_code) courses = table[
    {course_code: "DSA611S", name: "Distributed Systems and Applications", nqf: 8},
    {course_code: "WAD611S", name: "Web Application Development", nqf: 8}
];

public table<Types:Office> key(office_number) offices = table[
    {office_number: 12, building: "Faculty of Computing and Informatics", floor: 1, room: "A001"},
    {office_number: 13, building: "Faculty of Computing and Informatics", floor: 1, room: "A002"},
    {office_number: 14, building: "Faculty of Computing and Informatics", floor: 1, room: "A003"}
];

public table<Types:Lecturer> key(staff_number) lecturers = table[
    {staff_number: 123, name: "Ndinelago Nashandi", title: "Lecturer", email: "nnashandi@nust.na", phone_number: "+264 61 207 2000", office_number: {office_number: 12}, courses: []}
];