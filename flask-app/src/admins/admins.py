from flask import Blueprint, request, jsonify, make_response, current_app
import json
from src import db


admins = Blueprint('admins', __name__)

# Get all the students in the given department


@admins.route('/getStudents', methods=['GET'])
def get_students():
    # get a cursor object from the database
    cursor = db.get_db().cursor()

    # grab the data from the request object
    the_data = request.json['department']

    # build the query string
    query = "select userID, firstN, lastN from Students natural join Departments where college = '" + the_data + "'"

    # use cursor to query the database for a list of products
    cursor.execute(query)

    # grab the column headers from the returned data
    column_headers = [x[0] for x in cursor.description]

    # create an empty dictionary object to use in
    # putting column headers together with data
    json_data = []

    # fetch all the data from the cursor
    theData = cursor.fetchall()

    # for each of the rows, zip the data elements together with
    # the column headers.
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))

    return jsonify(json_data)


# Update a professor's name

@admins.route('/updateName', methods=['PUT'])
def update_name():
    # get a cursor object from the database
    cursor = db.get_db().cursor()

    # grab the data from the request object
    teacher_id = request.json['teacher_id']
    name = request.json['name']

    # build the query string
    query = "UPDATE Instructors SET name = '" + name + \
        "' WHERE teacherID = '" + str(teacher_id) + "'"

    # execute and commit
    cursor.execute(query)
    db.get_db().commit()

    return 'Success!'


# Add a new course to the database

@admins.route('/addCourse', methods=['POST'])
def add_course():
    # get a cursor object from the database
    cursor = db.get_db().cursor()

    # grab the data from the request object
    courseID = request.json['courseID']
    numCredits = request.json['numCredits']
    name = request.json['name']
    department_code = request.json['department_code']

    # build the query string
    query = "INSERT INTO Courses(courseID,numCredits,name,department_code) VALUES ('" + str(
        courseID) + "', '" + str(numCredits) + "', '" + name + "', '" + str(department_code) + "')"

    # execute and commit
    cursor.execute(query)
    db.get_db().commit()

    return 'Success!'
