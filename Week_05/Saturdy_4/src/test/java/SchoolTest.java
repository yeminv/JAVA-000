import com.task.autoconfig.School;
import com.task.autoconfig.SchoolConfiguration;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit.jupiter.SpringExtension;

/**
 * @className: SchoolTest
 * @description: TODO 类描述
 * @author: YM
 * @date: 11/18/2020
 **/
@ExtendWith(SpringExtension.class)
@SpringBootTest(classes = SchoolConfiguration.class)
public class SchoolTest {

    @Autowired
    private School school;

    @Test
    public void test(){
        school.ding();
    }
}
