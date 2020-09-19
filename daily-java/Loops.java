public class Loops {
  /** The Loop class is used to demonstrate the 3 loop types (for, while, do-while) */
  public static void main(String... args) {
    for (int i = 0; i <= 10; i++ ) {
      System.out.println(i);
    }

    int j = 0;
    while (j <= 10) {
      System.out.println(j);
      j++;
    }

    int k = 0;
    do {
      System.out.println(k);
      k++;
    } while (k <= 10);
    int arr[] = { 1, 2, 3, 4, 5 };
    for (int i:arr) {
    System.out.println(i);
    }
  }
}
