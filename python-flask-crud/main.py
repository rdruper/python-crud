import pymysql
from app import app
from db import mysql
from flask import flash, render_template, request, redirect
from tables import Results
from werkzeug.security import generate_password_hash


@app.route('/user', defaults={'id': None}, methods=['GET', 'POST'])
@app.route('/user/<int:id>', methods=['GET', 'POST'])
def user(id):
    conn = mysql.connect()
    cursor = conn.cursor()
    if request.method == "POST":
        _name = request.form['name']
        _email = request.form['email']
        _password = request.form['password']
        # validate the received values
        if _name and _email and _password:
            try:
                # do not save password as a plain text
                _hashed_password = generate_password_hash(_password)
                if id:
                    # edit
                    sql = "UPDATE users SET name=%s, email=%s, password=%s WHERE id=%s"
                    data = (_name, _email, _hashed_password, id,)
                    cursor.execute(sql, data)
                    conn.commit()
                    flash('User updated successfully!')
                else:
                    # insert
                    sql = "INSERT INTO users(name, email, password) VALUES(%s, %s, %s)"
                    data = (_name, _email, _hashed_password,)
                    cursor.execute(sql, data)
                    conn.commit()
                    flash('User added successfully!')
            except Exception as e:
                return f"{e.__class__.__name__}: {e}"
            finally:
                return redirect('/')

    row = None
    if id:
        try:
            cursor = conn.cursor(pymysql.cursors.DictCursor)
            cursor.execute("SELECT id,name,email FROM users WHERE id=%s", id)
            row = cursor.fetchone()
        except Exception as e:
            return f"{e.__class__.__name__}: {e}"
        finally:
            cursor.close()
            conn.close()

    return render_template('user.html', row=row)


@app.route('/')
def users():
    conn = mysql.connect()
    cursor = conn.cursor(pymysql.cursors.DictCursor)
    try:
        cursor.execute("SELECT * FROM users")
        rows = cursor.fetchall()
        table = Results(rows)
        table.border = True
        return render_template('users.html', table=table)
    except Exception as e:
        return f"{e.__class__.__name__}: {e}"
    finally:
        cursor.close()
        conn.close()


@app.route('/user/delete/<int:id>')
def user_delete(id):
    conn = None
    cursor = None
    try:
        conn = mysql.connect()
        cursor = conn.cursor()
        cursor.execute("DELETE FROM users WHERE id=%s", (id,))
        conn.commit()
        flash('User deleted successfully!')
        return redirect('/')
    except Exception as e:
        return f"{e.__class__.__name__}: {e}"
    finally:
        cursor.close()
        conn.close()


if __name__ == "__main__":
    app.run(debug=True)