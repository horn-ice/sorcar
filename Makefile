.PHONY: clean

all: z3
	$(MAKE) -C src all

z3:
	cd z3-4.8.4 && python scripts/mk_make.py --prefix=./
	cd z3-4.8.4/build && $(MAKE) && $(MAKE) install
	find z3-4.8.4/build -type f -name "*.o" -print0 | xargs -0 ar -rs z3-4.8.4/build/lib/libz3.a

clean:
	rm -rf z3-4.8.4/build
	$(MAKE) -C src clean

