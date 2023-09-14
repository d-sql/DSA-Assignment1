# Question 1: Restful APIs
The problem centers on developing a Restful API for effectively managing staff, their offices, and allocated courses within the Faculty of Computing and Informatics. These offices can accommodate multiple lecturers. A lecturer is characterized by essential attributes, including a staff number, office number, staff name, title, and a list of the courses they are teaching.

Additionally, a course is characterized by specific details such as the course name, course code, and NQF (National Qualifications Framework) level.

## The API should include the following functionalities:
- Add a new lecturer
- Retrieve a list of all lecturers within the faculty.
- Update an existing lecturer's information.
- Retrieve the details of a specific lecturer by their staff number.
- Delete a lecturer's record by their staff number.
- Retrieve all the lecturers that teach a certain course.
- Retrieve all the lecturers that sit in the same office.

Note that the staff number should serve as a unique identifier for a lecturer.

Your task is to define the API following the OpenAPI standard and implement the client and service in the Ballerina language.

## Deliverables:
- OpenAPI specification in YAML or JSON format.(15 marks)
- Client Implementation in a Ballerina that effectively interacts with the designed API. (**10 marks**)
- Service Implementation (**25 Marks**)
