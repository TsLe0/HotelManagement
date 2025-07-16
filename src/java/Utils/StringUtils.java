/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Utils;

/**
 *
 * @author Admin
 */
public class StringUtils {
     public static String shorten(String input, int maxLength) {
        if (input == null) return "";
        if (input.length() <= maxLength) {
            return input;
        } else {
            return input.substring(0, maxLength - 3) + "...";
        }
    }
}
