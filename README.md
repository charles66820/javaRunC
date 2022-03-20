# Java App run C code

## Build and Run

Build all Java app.

```bash
make javaApp
```

Generate header file from java class. This java class need to represent `.c` file (Ex: `HelloWord.java` represent `HelloWord.c`).

```bash
make generateH
```

Make the C file (`libHelloWorld.so`).

```bash
make
```

Run the java app.

```bash
make run
```

> or manually

``` bash
cd build/class
java -cp . -Djava.library.path=../obj Main
```

Clean all `.class` and `.so` files.

``` bash
make clean
```

Clean all files and clean C header file generate by java (Ex: `HelloWorld.h`).

``` bash
make cleanAll
```
