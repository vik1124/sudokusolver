from bottle import Bottle,route, run, template, static_file,request,redirect,response
from sudoku import recurSudoku
import os, sched, time, sys, json, string, socket, webbrowser
Port = 20001
app = Bottle()

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
	#return render_template("sudoku.html", doku=genBlankSudoku())
	doku = genBlankSudoku()
	return template('sudoku',**doku)

@app.route("/solve")
def solve():
	ra = request.query
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
		#return render_template("sudoku.html",doku=doku)
		return template('sudoku', **doku)
	else:
		print "Sudoku Failed"
		return "Sudoku could not be solved !"

if __name__ == "__main__":
	sock = socket.socket(socket.AF_INET,socket.SOCK_STREAM)
	sock.connect(("gmail.com",80))
	hostip= sock.getsockname()[0]
	sock.close()
	print "hostip:",hostip
	webbrowser.open_new_tab('http://'+hostip+':'+str(Port))
	run(app,host=hostip, port=Port)