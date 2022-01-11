import com.intuit.karate.KarateOptions;
import com.intuit.karate.junit4.Karate;
import org.junit.BeforeClass;
import org.junit.runner.RunWith;

@RunWith(Karate.class)
@KarateOptions (tags = {"@xml"})
public class TestRunner {
    /*@BeforeClass
    public static void before(){
        System.setProperty("karate.env", "local");
    }*/
}
