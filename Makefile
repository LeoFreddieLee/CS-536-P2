###############################################################################
##
## Title:		Project2
## File:		Makefile
## 
## Semester:		CS536 Spring 2022
##
## Author:		Yi Xiao
## Email:		yxiao84@wisc.edu
## CS Login:		yix
## Lecturer's Name:	Beck Hasti
##
###############################################################################
##
## Pair Partner:	Qidong Li
## Email:		yli994@wisc.edu
## CS Login:		leofreddielee
## Lecturer's Name:	Beck Hasti
##
###############################################################################

###
# This Makefile can be used to make a scanner for the b language
# (Yylex.class) and to make a program that tests the scanner (P2.class).
#
# The default makes both the scanner and the test program.
#
# make clean removes all generated files.
#
# Note: P2.java will not compile unless Yylex.class exists.
#
###

# define the java compiler to be used and the flags
JC = javac
FLAGS = -g -cp $(CP)
CP = ./deps:.

P2.class: P2.java Yylex.class sym.class
	$(JC) $(FLAGS) P2.java

Yylex.class: minim.jlex.java ErrMsg.class sym.class
	$(JC) $(FLAGS) minim.jlex.java

minim.jlex.java: minim.jlex sym.class
	java -cp $(CP) JLex.Main minim.jlex

sym.class: sym.java
	$(JC) $(FLAGS) sym.java

ErrMsg.class: ErrMsg.java
	$(JC) $(FLAGS) ErrMsg.java

	
###
# testing - add more here to run your tester and compare its results
# to expected results
###
test:
	java -cp $(CP) P2
	diff allTokens.in allTokens.out
	diff exceptions.out exceptions.test
	diff eof.out eof.test
###
# clean up
###

clean:
	rm -f *~ *.class minim.jlex.java

cleantest:
	rm -f allTokens.out
	rm -f exceptions.out
	rm -f eof.out
