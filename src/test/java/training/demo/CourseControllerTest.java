package training.demo;

import static org.mockito.Mockito.*;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import training.demo.CourseController;
import training.demo.dao.CourseDao;
import training.demo.entities.Course;

public class CourseControllerTest {

    @InjectMocks
    private CourseController courseController;

    @Mock
    private CourseDao courseDao;

    @BeforeEach
    public void init() {
        MockitoAnnotations.openMocks(this);
    }

    @Test
    public void testAddCourse() {
        Course mockCourse = new Course(); // Create a mock course
        when(courseDao.insertCourse(mockCourse)).thenReturn(1); // Assuming insertCourse returns 1 on success

        String viewName = courseController.addCourse(mockCourse);

        // Add your assertions here to validate the behavior of the controller method
        // For example, you can check the view name and any other expected behavior
        // assertEquals("ExpectedViewName", viewName);
        // Verify any other behavior, e.g., that the DAO's insertCourse method was called
        // verify(courseDao).insertCourse(mockCourse);
    }

    // Add more test cases for other controller methods as needed
}
