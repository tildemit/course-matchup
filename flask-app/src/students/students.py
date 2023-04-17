from flask import Blueprint, request, jsonify, make_response
import json
from src import db


students = Blueprint('students', __name__)

# Add a new interest the student has developed


@students.route('/addInterest', methods=['POST'])
def add_interest():
    # get a cursor object from the database
    cursor = db.get_db().cursor()

    # grab the data from the request object
    userID = request.json['userID']
    academic = request.json['academic']
    personal = request.json['personal']
    professional = request.json['professional']

    # build the query string
    query = "INSERT INTO Interests(userID,academic,personal,professional) VALUES ('" + \
        str(userID) + "', '" + academic + "', '" + \
        personal + "', '" + professional + "')"

    # execute and commit
    cursor.execute(query)
    db.get_db().commit()

    return 'Success!'

#Get a list of professors who have given rating

@students.route('/getprofessors', methods=['GET'])
def get_professors():
    # get a cursor object from the database
    cursor = db.get_db().cursor()

    # grab the data from the request object
    the_data = request.json['rating']

    # build the query string
    query = "select teacherID from Instructor_Ratings where rating = '" + the_data + "'"

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

#Get a list of courses in given department

@students.route('/getCoursesDep', methods=['GET'])
def get_courses_dep():
    # get a cursor object from the database
    cursor = db.get_db().cursor()

    # grab the data from the request object
    the_data = request.json['department']

    # build the query string
    query = "select name, courseID, numcredits from Courses natural join Departments where name = '" + the_data + "'"

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

#Get the name of the course that matches with a given courseID

@students.route('/getCourseName', methods=['GET'])
def get_course_name():
    # get a cursor object from the database
    cursor = db.get_db().cursor()

    # grab the data from the request object
    the_data = request.json['name']

    # build the query string
    query = "select name from Courses where courseID = '" + the_data + "'"

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


#Update a students address

@students.route('/updateadd', methods=['PUT'])
def update_add():
    # get a cursor object from the database
    cursor = db.get_db().cursor()

    # grab the data from the request object
    user_id = request.json['userID']
    address = request.json['address']

    # build the query string
    query = "UPDATE Students SET address = '" + address + \
        "' WHERE userID = '" + str(user_id) + "'"

    # execute and commit
    cursor.execute(query)
    db.get_db().commit()

    return 'Success!'
