package log4jCDI;

import org.jboss.weld.environment.se.Weld;
import org.jboss.weld.environment.se.WeldContainer;
import org.junit.Test;

import com.test.TestLogger;

public class TestApp {
	static WeldContainer weld=null;
	static {
        weld = new Weld().initialize();
	}
	@Test
	public void test() {
        TestLogger testLogger = weld.instance().select(TestLogger.class).get();
        testLogger.writeLogAllLevels();
	}

}
