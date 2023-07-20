package uz.pdp.sanoq_sistemas.utils;

public class DecimalUtil {
    public static int fromAnyToDecimal(String baseIndex, String number) {
        int length = number.length();
        int multiplier = number.length() - 1;
        double result = 0;
        for (int i = 0; i < length; i++)
            result += getAnInt(number.charAt(i)) * Math.pow(Double.parseDouble(baseIndex), multiplier--);
        return (int) result;
    }

    private static int getAnInt(char number) {
        return switch (number) {
            case 'A', 'a' -> 10;
            case 'B', 'b' -> 11;
            case 'C', 'c' -> 12;
            case 'D', 'd' -> 13;
            case 'E', 'e' -> 14;
            case 'F', 'f' -> 15;
            default -> number - '0';
        };
    }


    private static int getAnIntAsChar(int number) {
        return switch (number) {
            case 10 -> 'A';
            case 11 -> 'B';
            case 12 -> 'C';
            case 13 -> 'D';
            case 14 -> 'E';
            case 15 -> 'F';
            default -> (char) number + '0';
        };
    }

    public static String fromDecimalToAny(int number, String toIndex) {
        int toIndexInt = Integer.parseInt(toIndex);
        String str = "";
        while (number >= toIndexInt) {
            int remainder = number % toIndexInt;
            number = number / toIndexInt;
            str += getAnIntAsChar(remainder);
        }
        if (number != 0)
            str += getAnIntAsChar(number);
        return str;
    }

}
