.PHONY: clean

OBJS = boogie_io.o \
	   datapoint.o \
       horn_constraint.o

Z3_INCLUDE ?= ../z3-4.8.4/build/include
Z3_BINARY ?= ../z3-4.8.4/build/lib


CPPFLAGS += -I ../include -I $(Z3_INCLUDE)
CPPFLAGS += -std=c++14 -Wall -Ofast

LDFLAGS += -L $(Z3_BINARY)


all: sorcar-static sorcar

sorcar: $(OBJS)
	$(CXX) $(CPPFLAGS) $(LDFLAGS) -o $@ sorcar.cpp $(OBJS) -lz3

sorcar-static: $(OBJS)
	$(CXX) $(CPPFLAGS) $(LDFLAGS) -o $@ -fopenmp sorcar.cpp $(OBJS) -static -lz3

%.o: %.cpp
	$(CXX) $(CPPFLAGS) -c $< -o $@

clean:
	rm -f *.o
	rm -f *.exe
	rm -f sorcar sorcar-static

