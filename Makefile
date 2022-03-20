JAVA_SRC       := src
C_SRC          := c_src
BUILD          := build
JAVA_BUILD     := $(BUILD)/class
C_BUILD        := $(BUILD)/obj
JAVA_C_INCLUDE := include

JAVA_VERSION := 8
JAVA_HOME    := /usr/lib/jvm/java-$(JAVA_VERSION)-openjdk-amd64
JAVA         := $(JAVA_HOME)/bin/java
JAVAC        := $(JAVA_HOME)/bin/javac

CC     := gcc
CFLAGS := -shared -fPIC -I$(JAVA_HOME)/include -I$(JAVA_HOME)/include/linux -I$(JAVA_C_INCLUDE)

JAVA_MAIN        := Main
JAVA_C_INTERFACE := HelloWorld

all: cfiles

javaApp: # Compille all the java App
	$(JAVAC) -cp $(JAVA_SRC) $(JAVA_SRC)/$(JAVA_MAIN).java -d $(JAVA_BUILD)

generateH: javaApp
	$(JAVAC) -h $(JAVA_C_INCLUDE) $(JAVA_SRC)/$(JAVA_C_INTERFACE).java -d $(JAVA_BUILD)

cfiles: generateH
	$(CC) $(CFLAGS) $(C_SRC)/$(JAVA_C_INTERFACE).c -o $(C_BUILD)/lib$(JAVA_C_INTERFACE).so

run: cfiles
	$(JAVA) -cp $(JAVA_BUILD) -Djava.library.path=$(C_BUILD) $(JAVA_MAIN)

clean:
	rm -f $(C_BUILD)/*.so $(JAVA_BUILD)/*.class

cleanAll: clean
	rm -f $(JAVA_C_INCLUDE)/$(JAVA_C_INTERFACE).h