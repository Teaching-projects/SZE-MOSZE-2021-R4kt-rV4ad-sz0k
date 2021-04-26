OBJS := JSON.o Computer.o Console.o Phone.o Product.o typeSelection.o Warehouse.o main.o 
CFLAGS := -std=c++17 -Wall -Wextra 
COMPILER := g++-9

CPPS := JSON.cpp Computer.cpp Console.cpp Phone.cpp Product.cpp typeSelection.cpp Warehouse.cpp main.cpp 

build: $(OBJS)
	$(COMPILER) $(CFLAGS) -o a.out $(OBJS)

static_code_analysis:
	cppcheck $(CPPS) --output-file=cppcheck_output.txt 

leakcheck:
	valgrind $(VFLAGS) $(VPARAMETER) ./tests/forrun.sh