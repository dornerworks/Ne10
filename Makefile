LIBNAME:=libNE10_x86_64.a
LIBSRC:=modules/dsp/NE10_fft_int16.c \
        modules/dsp/NE10_fft.c \
        modules/dsp/NE10_fft_float32.c \
        modules/dsp/NE10_fft_generic_float32.c \
        modules/dsp/NE10_fft_int32.c \
        modules/dsp/NE10_fft_generic_int32.cpp \
        modules/NE10_init.c

LIBCOBJS:=$(LIBSRC:.c=.o)
LIBOBJS:=$(LIBCOBJS:.cpp=.o)

all: $(LIBNAME)

$(LIBNAME): $(LIBOBJS)
	ar rs $@ $^

%.o: %.c
	gcc -c -o $@ -m64 -O2 -g -Iinc $^

%.o: %.cpp
	g++ -c -o $@ -m64 -O2 -g -Iinc $^

clean:
	rm -f $(LIBNAME) $(LIBOBJS)

