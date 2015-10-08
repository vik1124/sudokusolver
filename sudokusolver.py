from flask import Flask, request
from flask import render_template
from sudoku import recurSudoku
import webbrowser
app = Flask(__name__)

def genSudokuDict(d):
	doku = {}
	for i in range(0,9):
		for j in range(0,9):
			doku['n'+str(i)+str(j)] = str(d[i][j])
	return doku

def genBlankSudoku():
	doku = {}
	for i in range(0,9):
		for j in range(0,9):
			doku['n'+str(i)+str(j)] = ''
	return doku

@app.route("/")
def hello():
	return render_template("sudoku.html", doku=genBlankSudoku())

@app.route("/solve")
def solve():
	ra = request.args
	doku = []
	for i in range(0,9):
		d = []
		for j in range(0,9):
			s = ra.getlist('n'+str(i)+str(j))[0]
			if s == '':
				d.append(0)
			else:
				d.append(int(s))
		doku.append(d)
	(d,f) = recurSudoku(doku)
	if f:
		print "Solved Sudoku:", d
		doku = genSudokuDict(d)
		return render_template("sudoku.html",doku=doku)
	else:
		print "Sudoku Failed"
		return "Sudoku could not be solved !"

if __name__ == "__main__":
	webbrowser.open_new_tab('http://127.0.0.1:5000')
	app.run(debug=True)