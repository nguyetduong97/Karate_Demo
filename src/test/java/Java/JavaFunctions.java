package Java;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class JavaFunctions {

    public static String getEmail(Map<String, Object> map) {
        return  map.get("email").toString();
    }

    public static List<String> getEmails(List<Map<String, Object>> list) {
        List<String> temp = new ArrayList(list.size());
        for (Map<String, Object> map : list) {
            temp.add((String) map.get("email"));
        }
        return temp;
    }
}
