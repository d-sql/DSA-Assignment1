table<book> key(ISBN) testBooks = table [
    {
        "authors": [
            {
                "first_name": "Luce",
                "middle_name": "Gunter",
                "last_name": "Westcarr"
            }
        ],
        "book_location": {
            "aisle": 2,
            "floor": 1,
            "section": "Biography"
        },
        "edition": 4,
        "genre": "Comedy",
        "ISBN": "924553871-0",
        "name": "The Great Gatsby",
        "publisher": "Cambridge University Press",
        "status": AVAILABLE,
        "year_published": 2000
    },
    {
        "authors": [
            {
                "first_name": "Diane-marie",
                "middle_name": "Karoly",
                "last_name": "Chark"
            }
        ],
        "book_location": {
            "aisle": 8,
            "floor": 1,
            "section": "Fiction"
        },
        "edition": 6,
        "genre": "Action",
        "ISBN": "232575710-2",
        "name": "The Catcher in the Rye",
        "publisher": "Elsevier",
        "status": AVAILABLE,
        "year_published": 1990
    },
    {
        "authors": [
            {
                "first_name": "Leta",
                "middle_name": "Lari",
                "last_name": "Jenking"
            }
        ],
        "book_location": {
            "aisle": 0,
            "floor": 2,
            "section": "Biography"
        },
        "edition": 15,
        "genre": "Drama",
        "ISBN": "177081748-4",
        "name": "The Hobbit",
        "publisher": "Scholastic",
        "status": AVAILABLE,
        "year_published": 1940
    },
    {
        "authors": [
            {
                "first_name": "Bron",
                "middle_name": "Richart",
                "last_name": "Tschierasche"
            }
        ],
        "book_location": {
            "aisle": 10,
            "floor": 3,
            "section": "History"
        },
        "edition": 20,
        "genre": "Drama|Mystery|Thriller",
        "ISBN": "172341205-8",
        "name": "Pride and Prejudice",
        "publisher": "Pearson",
        "status": AVAILABLE,
        "year_published": 1933
    },
    {
        "authors": [
            {
                "first_name": "Parrnell",
                "middle_name": "Neilla",
                "last_name": "Gilding"
            }
        ],
        "book_location": {
            "aisle": 10,
            "floor": 1,
            "section": "Fiction"
        },
        "edition": 7,
        "genre": "Comedy|Drama|Romance",
        "ISBN": "285171508-9",
        "name": "The Da Vinci Code",
        "publisher": "Hachette Book Group",
        "status": AVAILABLE,
        "year_published": 1923
    }
];

table<student> key(student_number) testStudents = table [
    {
        "first_name": "Profiliu",
        "last_name": "Nandjebo",
        "student_number": "220129223"
    },
    {
        "first_name": "Sigridus",
        "last_name": "Amwaalwa",
        "student_number": "222029412"
    }
];
table<librarian> key(staff_id) testLibrarians = table [
    {
        "first_name": "Azor",
        "last_name": "Hijarunguru",
        "staff_id": "212401"
    },
    {
        "first_name": "Xamira",
        "last_name": "Hangara",
        "staff_id": "212601"
    }
];

table<admin> key(staff_id) testAdmins = table [
     {
        "first_name": "skotanni",
        "last_name": "eternal",
        "staff_id": "21240121"
    }
];
