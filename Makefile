PROG	=	alopex
LIBS	=	-lX11 -lXrandr
PREFIX	?=	/usr
MANDIR	?=	/usr/share/man
VER		=	2.0
HEADERS	=	config.h icons.h theme.h
MOLT	?=	WinterCoat

${PROG}: ${PROG}.c ${HEADERS}
	@${CC} -D${MOLT} ${CFLAGS} ${LIBS} -o ${PROG} ${PROG}.c
	@strip ${PROG}

clean:
	@rm -f ${PROG}

tarball: clean
	@rm -f ${PROG}-${VER}.tar.gz
	@tar -czf ${PROG}-${VER}.tar.gz *

install: ${PROG}
	@install -Dm755 ${PROG} ${DESTDIR}${PREFIX}/bin/${PROG}
	@install -Dm666 ${PROG}.1 ${DESTDIR}${MANDIR}/man1/${PROG}.1
	@install -Dm666 ${PROG}.config.5 ${DESTDIR}${MANDIR}/man5/${PROG}.config.5
	@install -Dm666 ${PROG}.icons.5 ${DESTDIR}${MANDIR}/man5/${PROG}.icons.5



