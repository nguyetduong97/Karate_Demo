//package Request;
//
//import java.io.BufferedReader;
//import java.io.File;
//import java.io.IOException;
//import java.nio.charset.Charset;
//import java.nio.file.Files;
//import java.nio.file.Path;
//import java.nio.file.Paths;
//import java.util.ArrayList;
//import java.util.*;
//import java.util.stream.Collectors;
//
//public class DataReader {
//    private static final String FILE_NAME = "data.csv";
//    private static String jsonTemplate = "{'firstName': '%s','lastName': '%s','email': '%s','password': '%s'}";
//
//    public static String getCsvData(){
//        List<String> jsonObject = new ArrayList<String >();
//        try (BufferedReader reader = Files.newReader(getDataFile(), Charset.forName("UTF-8"))) {
//            reader.lines().forEach(line -> {
//                String[] account = line.split(",");
//                jsonObject.add(String.format(jsonTemplate, account[0], account[1]));
//            });
//            return String.format("[%s]", jsonObject.stream().collect(Collectors.joining(",")));
//        } catch (IOException e) {
//            throw new RuntimeException(e);
//        }
//    }
//
//    private static File getDataFile(){
//        String projectPath = System.getProperty("user.dir");
//        Path path = Paths.get(projectPath, "src", "test", "java", "Request", FILE_NAME);
//        return path.toFile();
//
//    }
//}
