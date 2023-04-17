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
