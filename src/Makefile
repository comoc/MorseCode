TARGET = test
SRCS = test.cpp MorseCodec.cpp

OBJS = $(SRCS:%.cpp=%.o)

CXXFLAGS = -g -Wall -Wunused -Werror -Wfloat-equal
LDFLAGS = -g

.cpp.o:
	$(CXX) -c $< $(CXXFLAGS)

$(TARGET): $(OBJS)
	$(CXX) -o $@ $^ $(LDFLAGS)

.PHONY: clean
clean:
	$(RM) $(OBJS) $(TARGET)
