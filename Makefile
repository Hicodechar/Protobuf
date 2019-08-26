CC = g++
CFLAG = -std=c++11 
DEPS = addressbook.pb.h

.PHONY: all read write clean
all : write read

%.o : %.cc $(DEPS)
	$(CC) -c -o $@ $< $(CFLAG)


# 注意：需要使用到参数：`pkg-config --cflags --libs protobuf`
write : addressbook.pb.o write.o
	$(CC) -o write_client $^ $(CFLAG) `pkg-config --cflags --libs protobuf`

read : addressbook.pb.o read.o
	$(CC) -o read_client $^ $(CFLAG) `pkg-config --cflags --libs protobuf`

clean:
	rm -rf *.o write_client read_client *~ 

