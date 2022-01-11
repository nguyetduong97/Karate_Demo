import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import cucumber.api.CucumberOptions;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;
import org.junit.Test;
import org.junit.runner.Result;

import java.io.File;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import static org.junit.Assert.*;


public class ParallelExecution {
    @Test
    public void testParallel(){
        Results results = Runner.path("classpath:feature").tags("@loginCSV").parallel(5);
        generateReport(results.getReportDir());
        assertTrue(results.getErrorMessages(), results.getFailCount()==0);


    }
    public static void generateReport(String karateOutputPath){
        Collection<File> jsonFiles;
        jsonFiles = FileUtils.listFiles(new File(karateOutputPath),
                new String[] {"json"},
                true);
        final List<String> jsonPaths = new ArrayList<>(jsonFiles.size());
        jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
        Configuration config = new Configuration(new File("target"),"demo");
        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();
    }
}
