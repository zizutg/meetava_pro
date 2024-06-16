class MathUtils {
  static double calculatePercentage(int value, int total) {
    if (total == 0) return 0; // Avoid division by zero
    return (value / total) * 100;
  }
}
