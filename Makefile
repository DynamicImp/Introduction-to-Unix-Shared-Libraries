  CC		=	gcc
  CFLAGS	=	-Wall -fPIC
  BUILD		=	libpkg1.so usepkg1

  all:	$(BUILD)

  clean:
	/bin/rm -f $(BUILD) *.o lib*so core a.out
  
  usepkg1:	usepkg1.o libpkg1.so
	$(CC) -o usepkg1 usepkg1.o -L. -lpkg1

  libpkg1.so:	pkg1.o
	$(CC) -shared -Wl,-soname,libpkg1.so -o libpkg1.so pkg1.o