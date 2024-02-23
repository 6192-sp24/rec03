BINARY_NAME = fibonacci_top

all: clean $(BINARY_NAME)

clean:
	rm -f $(BINARY_NAME) *.ba *.bo *.cxx *.h *.o *.so
	rm -rf build sim

$(BINARY_NAME):
	# Make the build directories so things don't get messy
	mkdir -p build
	mkdir -p sim
	
	# Build the intermediate files
	bsc -bdir build -sim -u --show-schedule -g $(BINARY_NAME) $(BINARY_NAME).bsv 
	bsc -bdir build -simdir sim -sim -e $(BINARY_NAME) -o $(BINARY_NAME)