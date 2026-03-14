from flask import Flask, render_template, request, send_file, jsonify
import sqlite3
import random
from fpdf import FPDF
from googletrans import Translator

app = Flask(__name__)

translator = Translator()


def get_db():
    conn = sqlite3.connect("database.db")
    conn.row_factory = sqlite3.Row
    return conn


@app.route("/")
def home():
    return render_template("index.html")


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


# SMART MULTI LANGUAGE CHATBOT
@app.route("/chat",methods=["POST"])
def chat():

    data=request.get_json()

    user_msg=data.get("message","").lower()
    lang=data.get("lang","en")

    reply_en="Please ask about government schemes."

    if "scholarship" in user_msg or "student" in user_msg:
        reply_en="Students can apply for National Scholarship Portal, INSPIRE Scholarship and AICTE scholarships."

    elif "farmer" in user_msg or "kisan" in user_msg:
        reply_en="Farmers can benefit from PM Kisan Samman Nidhi, PM Fasal Bima Yojana and Kisan Credit Card."

    elif "loan" in user_msg or "business" in user_msg:
        reply_en="Business owners can apply for Mudra Loan, Startup India scheme or MSME loan schemes."

    elif "job" in user_msg or "worker" in user_msg:
        reply_en="Workers can register in eShram portal or apply for MGNREGA employment scheme."

    elif "documents" in user_msg:
        reply_en="Most schemes require Aadhaar card, income certificate, caste certificate and bank account."

    elif "health" in user_msg:
        reply_en="You can apply for Ayushman Bharat health insurance scheme."

    try:
        if lang!="en":
            translated=translator.translate(reply_en,dest=lang).text
        else:
            translated=reply_en
    except:
        translated=reply_en

    return jsonify({"reply":translated})
@app.route("/translate", methods=["POST"])
def translate():

    data = request.get_json()

    text = data.get("text","")
    lang = data.get("lang","en")

    try:
        if lang == "en":
            translated = text
        else:
            translated = translator.translate(text, dest=lang).text

        return jsonify({"translated": translated})

    except:
        return jsonify({"translated": text})


if __name__=="__main__":
    app.run(debug=True)