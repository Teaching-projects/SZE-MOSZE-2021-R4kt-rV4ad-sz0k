OBJS := JSON.o Computer.o Console.o Phone.o Product.o typeSelection.o Warehouse.o main.o 
CFLAGS := -std=c++17 -Wall -Wextra 
COMPILER := g++-9

CPPS := JSON.cpp Computer.cpp Console.cpp Phone.cpp Product.cpp typeSelection.cpp Warehouse.cpp main.cpp 

JSON.o: JSON.cpp JSON.hpp
	$(COMPILER) $(CFLAGS) -c JSON.cpp

Computer.o: Computer.cpp Computer.hpp Product.hpp
	$(COMPILER) $(CFLAGS) -c Computer.cpp

Console.o: Console.cpp Console.hpp JSON.hpp Product.hpp
	$(COMPILER) $(CFLAGS) -c Console.cpp

Phone.o: Phone.cpp Phone.hpp JSON.hpp Product.hpp
	$(COMPILER) $(CFLAGS) -c Phone.cpp

Product.o: Product.cpp Product.hpp
	$(COMPILER) $(CFLAGS) -c Product.cpp

Warehouse.o: Warehouse.cpp Warehouse.hpp JSON.hpp Product.hpp
	$(COMPILER) $(CFLAGS) -c Hero.cpp

typeSelection.o: typeSelection.cpp typeSelection.h 
	$(COMPILER) $(CFLAGS) -c typeSelection.cpp

main.o: main.cpp 
	$(COMPILER) $(CFLAGS) -c main.cpp

build: $(OBJS)
	$(COMPILER) $(CFLAGS) -o a.out $(OBJS)

static_code_analysis:
	cppcheck $(CPPS) --output-file=cppcheck_output.txt && chmod +x tests/warningcheck.sh && ./tests/warningcheck.sh && chmod +x tests/errorcheck.sh && ./tests/errorcheck.sh

leakcheck:
	valgrind $(VFLAGS) $(VPARAMETER) ./tests/forrun.sh