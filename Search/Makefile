SHELL   = /bin/sh

all: forum.swish oldforum.swish manual4.swish everything.swish manual3.swish website.swish

forum.swish: forum.conf 
	./swish -c forum.conf >forum.log

oldforum.swish: oldforum.conf 
	./swish -c oldforum.conf >oldforum.log

manual4.swish: manual4.conf 
	./swish -c manual4.conf >manual4.log

manual3.swish: manual3.conf
	./swish -c manual3.conf >manual3.log

everything.swish: everything.conf
	./swish -c everything.conf >everything.log

website.swish: website.conf
	./swish -c website.conf >website.log

clean:
	rm -rf *.swish *.swish.prop *.log
