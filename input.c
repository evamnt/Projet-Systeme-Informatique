main() {
    int b = 5;
    int a = 30;
    if (b < 10) {
        int a = 10;
        b = b + a;
    }
    else {
        int a = 26;
        a = a + b;
    }
    printf(b);
}
