import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class AlertFrameTest {
	public static void main(String args[]) throws Exception {
//		testValue();
//		testValueSet();
//		testValueList();
//		testValueMap();
		testValueListMap();		
	}

	/**
	 * Displays a single dialog with the value displayed. 
	 * 
	 * @throws Exception
	 */
	private static void testValue() throws Exception {
//		new AlertFrame(123);
//		new AlertFrame(123.5);
//		new AlertFrame(new Integer(123));
		// Strings
//		new AlertFrame("Testing Single String");
		// beans 
		// uses reflection to get a map of all the getters.
		// displays a jListbox with the getters.
		// clicking displays toString on bottom jTextArea.
		// double clicking opens new AlertFrame (value).
//		new AlertFrame(new UserBean(1, "Bob", new UserBean(0, "Manager", null)));
	}

	/**
	 * Displays Dialog with a JListbox.
	 */
	private static void testValueSet() {
		// wrapped numbers 
		// clicking displays toString on bottom jTextArea.
		// double clicking does nothing.
		Set<Integer> intSet = new HashSet<Integer>();
		intSet.add(1);
		intSet.add(2);
		new AlertFrame(intSet);
		// Strings
		// clicking displays toString on bottom jTextArea.
		// double clicking does nothing.
		Set<String> set = new HashSet<String>();
		set.add("a");
		set.add("b");
		new AlertFrame(set);
		// beans 
		// clicking displays toString on bottom jTextArea.
		// double clicking opens new AlertFrame (value).
		Set<UserBean> userSet = new HashSet<UserBean>();
		userSet.add(new UserBean(1, "Bob", new UserBean(0, "Manager", null)));
		userSet.add(new UserBean(1, "Ted", new UserBean(0, "Manager", null)));
		new AlertFrame(userSet);
	}
	public static void testValueList() {	
		// Strings
		// clicking displays toString on bottom jTextArea.
		// double clicking does nothing.
		List<String> set = new ArrayList<String>();
		set.add("a");
		set.add("b");
		new AlertFrame(set);
		// beans 
		// clicking displays toString on bottom jTextArea.
		// double clicking opens new AlertFrame (value).
		List<UserBean> userSet = new ArrayList<UserBean>();
		userSet.add(new UserBean(1, "Bob", new UserBean(0, "Manager", null)));
		userSet.add(new UserBean(1, "Ted", new UserBean(0, "Manager", null)));
		new AlertFrame(userSet);
	}
	/**
	 * This is for properties. It displays a list box with the map keys with
	 * details displayed in a text area on the bottom.
	 */
	public static void testValueMap() {	
		// wrapped numbers (as map values)
		// clicking displays toString on bottom jTextArea.		
		// double clicking does nothing.
		Map <String, Integer> numericMap = new HashMap<String,Integer>();
		numericMap.put("a", 123);
		numericMap.put("b", 456);
		new AlertFrame(numericMap);
		// Strings (as map values)
		// clicking displays toString on bottom jTextArea.
		// double clicking does nothing.
		Map <String, String> stringMap = new HashMap<String,String>();
		stringMap.put("a", "string a");
		stringMap.put("b", "String b");
		new AlertFrame(stringMap);
		// beans (as map values)		
		// clicking displays toString on bottom jTextArea.
		// double clicking opens new AlertFrame (value).
		Map <String, UserBean> beanMap = new HashMap<String,UserBean>();
		beanMap.put("a", new UserBean(1, "Bob", new UserBean(0, "Manager", null)));
		beanMap.put("b", new UserBean(1, "Ted", new UserBean(0, "Manager", null)));
		new AlertFrame(beanMap);
	}
	/**
	 * This displays a table with columns that are based on map keys with 
	 * details displayed in the text area on the bottom.
	 */
	public static void testValueListMap() {	
		{
			// wrapped numbers (as table cell values)
			// clicking displays toString on bottom jTextArea.
			// double clicking does nothing.
			List<Map<String,Integer>> mapList = new ArrayList<Map<String,Integer>>();
			mapList.add(Collections.singletonMap("key", 123));
			mapList.add(Collections.singletonMap("key", 456));
			new AlertFrame(mapList, Arrays.asList(new String[] {"key"}));
		}{
			// Strings (as table cell values)
			// clicking displays toString on bottom jTextArea.
			// double clicking does nothing.
			List<Map<String,String>> mapList = new ArrayList<Map<String,String>>();
			mapList.add(Collections.singletonMap("key", "String-123"));
			mapList.add(Collections.singletonMap("key", "String-456"));			
			new AlertFrame(mapList, Arrays.asList(new String[] {"key"}));
		}{
			// beans (have beans as table cells)		
			// clicking displays toString on bottom jTextArea.
			// double clicking opens new AlertFrame (value).
			List<Map<String,Object>> mapList = new ArrayList<Map<String,Object>>();
			Map<String,Object> hmap = new HashMap<String,Object>();
			hmap.put("key", new UserBean(1, "Bob", new UserBean(0, "Manager", null)));
			hmap.put("key2", "test");
			hmap.put("key3", 123);
			mapList.add(hmap);
			hmap = new HashMap<String,Object>();
			hmap.put("key", new UserBean(1, "Ted", new UserBean(0, "Manager", null)));
			hmap.put("key2", "test");
			hmap.put("key3", 123);
			mapList.add(hmap);
			new AlertFrame(mapList, new ArrayList<String>(hmap.keySet()));
		}
	}
}



