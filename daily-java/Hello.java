class Hello {
  public static void main(String... args) {
    System.out.println(sayHello());
    int a = 10;
    int b = 5;
    int min = (a < b) ? a : b;
    a++;
    System.out.println(min);

    if (a > b) {
      System.out.println("A, Jim, A!");
    } else {
      System.out.println("B, Jim, B!");
    }
  }

  public static String sayHello() {
    return "Hello";
  }
}
