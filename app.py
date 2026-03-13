from flask import Flask, render_template, request, send_file
import sqlite3
import random
from fpdf import FPDF

app = Flask(__name__)

# Database connection
def get_db():
    conn = sqlite3.connect("database.db")
    conn.row_factory = sqlite3.Row
    return conn


# Home page
@app.route("/")
def home():
    return render_template("index.html")


# Find schemes
@app.route("/find", methods=["POST"])
def find():

    category = request.form.get("category")
    scheme_type = request.form.get("scheme_type")
    state = request.form.get("state")
    gender = request.form.get("gender")
    caste = request.form.get("caste")
    education = request.form.get("education")
    age = request.form.get("age")

    conn = get_db()

    query = """
    SELECT * FROM schemes
    WHERE category = ?
    AND (scheme_type = ? OR scheme_type = 'Central')
    AND (state = ? OR state = 'All')
    AND (gender = ? OR gender = 'All')
    AND (caste = ? OR caste = 'All')
    AND (education = ? OR education = 'Any' OR education = 'All')
    AND min_age <= ?
    AND max_age >= ?
    """

    rows = conn.execute(
        query,
        (category, scheme_type, state, gender, caste, education, age, age)
    ).fetchall()

    conn.close()

    schemes = []
    for r in rows:
        s = dict(r)
        s["score"] = random.randint(70,95)
        schemes.append(s)

    best_scheme = schemes[0] if schemes else None

    total = len(schemes)
    central = len([s for s in schemes if s["scheme_type"]=="Central"])
    state_s = len([s for s in schemes if s["scheme_type"]=="State"])

    return render_template(
        "results.html",
        schemes=schemes,
        best=best_scheme,
        total=total,
        central=central,
        state=state_s
    )


# PDF download
@app.route("/download")
def download():

    conn = get_db()
    rows = conn.execute("SELECT * FROM schemes").fetchall()
    conn.close()

    pdf = FPDF()
    pdf.add_page()

    pdf.set_font("Arial",size=12)

    pdf.cell(0,10,"Eligible Government Schemes",ln=True)

    for r in rows:
        pdf.cell(0,10,r["scheme_name"],ln=True)

    file="schemes_report.pdf"
    pdf.output(file)

    return send_file(file,as_attachment=True)


# Simple chatbot
@app.route("/chat",methods=["POST"])
def chat():

    user_msg=request.json.get("message","").lower()

    if "farmer" in user_msg:
        reply="You may be eligible for PM Kisan Scheme."

    elif "student" in user_msg:
        reply="You may check First Graduate Scholarship."

    elif "documents" in user_msg:
        reply="Usually Aadhaar, income certificate and community certificate are required."

    else:
        reply="Please fill the form to find suitable government schemes."

    return {"reply":reply}


if __name__=="__main__":
    app.run(debug=True) 