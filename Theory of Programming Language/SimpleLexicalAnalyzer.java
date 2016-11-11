package com.d3rty.langtheory;

import java.io.IOException;
import java.util.ArrayList;

import static com.d3rty.langtheory.Condition.*;
import static java.lang.Character.isDigit;
import static java.lang.Character.isLetter;

enum Condition {beginning, keywordsOrIdentifiers, constant, comment, colon, space, operator, end, error}

public class SimpleLexicalAnalyzer {

    static boolean isSpace(char c) {
        return c == ' ';
    }

    public static void main(String[] args) throws IOException {

        ArrayList keywords = new ArrayList();
        keywords.add("program");
        keywords.add("var");
        keywords.add("int");
        keywords.add("real");
        keywords.add("begin");
        keywords.add("if");
        keywords.add("then");
        keywords.add("print");
        keywords.add("end");

        ArrayList operators = new ArrayList();
        operators.add('+');
        operators.add('=');
        operators.add('>');
        operators.add('<');
        operators.add('-');
        operators.add('*');
        operators.add('/');
        operators.add('{');
        operators.add('}');

        ArrayList curIdentifiers = new ArrayList();
        ArrayList curConstants = new ArrayList();
        ArrayList curOperators = new ArrayList();
        ArrayList curKeywords = new ArrayList();

        String programText = "program abc var a:int b:int c:real begin a:=1 b:=2 c:=a+b if c>0 then print c end~";
        String buffer = new String();
        char c = 0;
        int i = 0;

        Condition currentCondition = beginning;
        while (i < programText.length() && currentCondition != error) {
            c = programText.charAt(i);
            switch (currentCondition) {

                case beginning:
                    buffer = "";

                    System.out.print("<beginning:> " + c + " ");
                    if (isLetter(c)) {
                        buffer += c;
                        i++;
                        currentCondition = keywordsOrIdentifiers;
                        System.out.print("  >>keywordsOrIdentifiers>>\n\n");
                    } else if (isDigit(c)) {
                        buffer += c;
                        i++;
                        currentCondition = constant;
                        System.out.print("  >>constant>>\n\n");
                    } else if (c == '{') {
                        buffer += c;
                        i++;
                        currentCondition = comment;
                        System.out.print("  >>comment>>\n\n");
                    } else if (operators.contains(c)) {
                        if (!curOperators.contains(String.valueOf(c))) {
                            buffer += c;
                            curOperators.add(buffer);
                        }
                        i++;
                        currentCondition = beginning;
                        System.out.print("  >>beginning>>\n\n");
                    } else if (c == ':') {
                        buffer += c;
                        i++;
                        currentCondition = colon;
                        System.out.print("  >>colon>>\n\n");
                    } else if (isSpace(c)) {
                        buffer += c;
                        i++;
                        currentCondition = beginning;
                        System.out.print("  >>beginning>>\n\n");
                    } else if (c == '~') {
                        buffer += c;
                        i++;
                        currentCondition = end;
                        System.out.print("  >>end>>\n\n");
                    } else {
                        currentCondition = error;
                        System.out.print("  >>error>>\n\n");
                    }
                    break;

                case keywordsOrIdentifiers:
                    System.out.print("<keywordsOrIdentifiers:> " + c + " ");
                    if (isLetter(c) || isDigit(c)) {
                        buffer += c;
                        i++;
                        currentCondition = keywordsOrIdentifiers;
                        System.out.print("  >>keywordsOrIdentifiers>>\n\n");
                    } else {
                        if (keywords.contains(buffer)) {
                            curKeywords.add(buffer);
                        } else if (!curIdentifiers.contains(buffer)) {
                            curIdentifiers.add(buffer);
                        }
                        currentCondition = beginning;
                        System.out.print("  >>beginning>>\n\n");
                    }
                    break;

                case constant:
                    System.out.print("<constant:> " + c + " ");
                    if (isDigit(c)) {
                        buffer += c;
                        i++;
                        curConstants.add(buffer);
                        currentCondition = constant;
                        System.out.print("  >>constant>>\n\n");
                    } else if (isSpace(c)) {
                        curConstants.add(buffer);
                        currentCondition = beginning;
                        System.out.print("  >>beginning>>\n\n");
                    } else {
                        currentCondition = error;
                        System.out.print("  >>error>>\n\n");
                    }
                    break;

                case comment:
                    System.out.print("<comment:> " + c + " ");
                    if (c == '}') {
                        i++;
                        currentCondition = beginning;
                        System.out.print("  >>beginning>>\n\n");
                    } else {
                        i++;
                        currentCondition = comment;
                        System.out.print("  >>comment>>\n\n");
                    }
                    break;

                case colon:
                    System.out.print("<colon:> " + c + "");
                    if (c == '=') {
                        buffer += c;
                        if (!curOperators.contains(buffer)) {
                            curOperators.add(buffer);
                        }
                        i++;
                        currentCondition = beginning;
                        System.out.print("  >>beginning>>\n\n");
                    } else {
                        if (!curOperators.contains(buffer)) {
                            curOperators.add(buffer);
                        }
                        currentCondition = beginning;
                        System.out.print("  >>beginning>>\n\n");
                    }
                    break;

                case end:
                    System.out.print("<end:> " + c + " ");
                    break;
            }
        }

        System.out.print("\nThere are identifiers of current program:\n");
        for (int j = 0; j < curIdentifiers.size(); j++) {
            System.out.print(curIdentifiers.get(j) + "\n");
        }
        System.out.print("\nThere are constants of current program:\n");
        for (int j = 0; j < curConstants.size(); j++) {
            System.out.print(curConstants.get(j) + "\n");
        }
        System.out.print("\nThere are operators of current program:\n");
        for (int j = 0; j < curOperators.size(); j++) {
            System.out.print(curOperators.get(j) + "\n");
        }
        System.out.print("\nThere are keywords of current program:\n");
        for (int j = 0; j < curKeywords.size(); j++) {
            System.out.print(curKeywords.get(j) + "\n");
        }
    }

}
