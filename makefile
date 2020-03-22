pin: pin.l
	lex pin.l
	gcc -o pin lex.yy.c -ll

clean:
	rm pin lex.yy.c
