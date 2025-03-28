from flask import Flask, render_template, request, jsonify
import mysql.connector

app = Flask(__name__)

# Function to create a connection to the MySQL database 
def create_connection():
    conn = None
    try:
        conn = mysql.connector.connect(
            host='localhost',
            user='root',
            password='navyasree@1432',
            database='moodstalker'
        )
    except mysql.connector.Error as e:
        print(e)
    return conn

def get_user_details(username,email,password):
    conn = create_connection()
    if conn is not None:
        cursor = conn.cursor()
        cursor.execute('SELECT * FROM users WHERE uname = %s And email = %s And passkey = %s', (username,email,password))
        user_details = cursor.fetchone()
        conn.close()
        return user_details
    else:
        return None

# Function to retrieve user details and mood information
def get_user_mood_details(username):
    conn = create_connection()
    print("yes hurray")
    if conn is not None:
        cursor = conn.cursor()
        cursor.execute('''
            SELECT users.uname, feels.day, feels.scale, feels.cause, moods.mname, moods.type, moods.booster, moods.activity
            FROM users
            JOIN feels ON users.uid = feels.uid
            JOIN moods ON feels.mid = moods.mid
            WHERE users.uname = %s
        ''', (username,))
        user_mood_details = cursor.fetchall()
        conn.close()
        return user_mood_details
    else:
        return None
    
@app.route('/')
def index():
    return render_template('login.html')

# Route to handle username submission and render user details
@app.route('/get_user_details', methods=['POST'])
def get_user_details_submit():
    username = request.form['username']
    email = request.form['email']
    password = request.form['password']    
    user_details = get_user_details(username,email,password)
    
    user_mood_details = get_user_mood_details(username)
    if user_details and user_mood_details:
        return render_template('user_details.html', user_details=user_details, user_mood_details=user_mood_details)
    else:
        return render_template('user_not_found.html')
    
@app.route('/record_mood_page', methods=['GET'])
def record_mood_page():
    return render_template('record_mood.html')

# Route to handle mood data submission and insert into the database
@app.route('/record_mood', methods=['POST'])
def record_mood():
    date = request.form['date']
    mood = request.form['mood']
    scale = request.form['scale']
    cause = request.form['cause']
    username = request.form['username']

    conn = create_connection()
    if conn is not None:
        cursor = conn.cursor()
        # Retrieve user ID based on username
        cursor.execute('SELECT uid FROM users WHERE uname = %s', (username,))
        user = cursor.fetchone()
        if user is None:
            return 'User not found.'

        user_id = user[0]
        
        # Retrieve mood ID based on mood name
        cursor.execute('SELECT mid FROM moods WHERE mname = %s', (mood,))
        mood_data = cursor.fetchone()
        if mood_data is None:
            return 'Mood not found.'

        mood_id = mood_data[0]

        # Insert mood data into the feels table
        cursor.execute('''
            INSERT INTO feels (uid, mid, day, scale, cause)
            VALUES (%s, %s, %s, %s, %s)
        ''', (user_id, mood_id, date, scale, cause))
        conn.commit()
        conn.close()
        return 'Mood recorded successfully!'
    else:
        return 'Failed to connect to the database.'
def handler(event, context):
    return app(event, context)

if __name__ == '__main__':
    app.run(debug=True, port=5001)  # or any other available port


    
