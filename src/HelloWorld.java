class HelloWorld {
    public native void print();

    static {
        System.loadLibrary("HelloWorld");
    }
}