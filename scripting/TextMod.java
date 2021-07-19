package com.mmsiegel;

import java.io.*;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Arrays;
import java.util.List;

//Referenced solution here: https://stackoverflow.com/a/20040289
public class Main {

    public static final String CARDANO = "cardano";
    public static final String ETHEREUM = "ethereum";
    public static final String FILE_NAME = "opinion.txt";

    public static void main(String[] args) throws IOException {
	    //Create initial file first
        List<String> lines = Arrays.asList("ethereum is the best");
        Path origFile = Paths.get(FILE_NAME);
        Files.write(origFile, lines, StandardCharsets.UTF_8);

        try {
            BufferedReader file = new BufferedReader(new FileReader(FILE_NAME));
            StringBuffer inputBuffer = new StringBuffer();
            String line;

            //Replace the word if found in the file
            while ((line = file.readLine()) != null) {
                if (line.contains(ETHEREUM)) {
                    line = line.replaceAll(ETHEREUM, CARDANO);
                    System.out.println("Ethereum text found and replaced");
                }
                inputBuffer.append(line);
            }
            file.close();

            //Write out the modified line into the file
            FileOutputStream fileOut = new FileOutputStream(FILE_NAME);
            fileOut.write(inputBuffer.toString().getBytes());
            fileOut.close();

        } catch (Exception e) {
            System.out.println("Error modifying file!");
        }
    }
}