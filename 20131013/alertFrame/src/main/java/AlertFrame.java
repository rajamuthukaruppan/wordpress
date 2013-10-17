import java.awt.BorderLayout;
import java.awt.Dimension;
import java.awt.GraphicsDevice;
import java.awt.GraphicsEnvironment;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;

import javax.swing.DefaultListModel;
import javax.swing.JFrame;
import javax.swing.JList;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import javax.swing.ListSelectionModel;
import javax.swing.event.DocumentEvent;
import javax.swing.event.DocumentListener;
import javax.swing.event.ListSelectionEvent;
import javax.swing.event.ListSelectionListener;
import javax.swing.table.AbstractTableModel;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.PropertyUtils;


/**
 * Displays List, Properties, and Table data depending on which constructor is
 * called. Constructors for Strings, Array of Strings, Maps of Strings and List
 * of Maps are available.
 */
public class AlertFrame extends JFrame {
	private static final long serialVersionUID = 1L;

	private static final GraphicsDevice gd = GraphicsEnvironment
			.getLocalGraphicsEnvironment().getDefaultScreenDevice();

	private JTextField selectedRowIndex;
	private JTextField selectedColIndex;
	private MapListTableModel mapListTableModel;
	private JTextArea textArea = new JTextArea();
	
	private void initCommon() {
        setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
	}
	
	//	TODO: modify to handle enumerations.
	public <T> AlertFrame(List<T> list) {
        initCommon();
		final JTextArea jTextArea = new JTextArea();
		final DefaultListModel listModel = new DefaultListModel();
		int i = 0;
		for (Object value : list) {
			listModel.add(i++, value);
		}
		JList jList = new JList(listModel);
		getContentPane().add(new JScrollPane(jList),
				BorderLayout.CENTER);
		final JScrollPane scrollPane = new JScrollPane(jTextArea);
		scrollPane.setPreferredSize(new Dimension(300, 300));
		getContentPane().add(scrollPane,BorderLayout.SOUTH);
		setSize(gd.getDisplayMode().getWidth() / 2, gd.getDisplayMode()
				.getWidth() / 2);

		jList.addListSelectionListener(new ListSelectionListener() {
			public void valueChanged(ListSelectionEvent e) {
				for (int i = e.getFirstIndex(); i <= e.getLastIndex(); i++) {
					if (((JList) e.getSource()).isSelectedIndex(i)) {
						jTextArea.setText(String.valueOf(listModel.get(i)));
						scrollPane.invalidate(); // TODO: fix this.
					}
				}
			}
		});
		
		jList.addMouseListener(new MouseAdapter() {
		    public void mouseClicked(MouseEvent evt) {
		        JList list = (JList)evt.getSource();
		        if (evt.getClickCount() == 2) {
		            int index = list.locationToIndex(evt.getPoint());
		            Object obj = listModel.get(index);
		            new AlertFrame(obj);
		        } 
		    }
		});	
		
		showCentered(this);		
	}
	public <T> AlertFrame(Set<T> set) {
		this(new ArrayList<T>(set));
	}
	/**
	 * Tabular data (simple text) with an ordered list of columns.
	 */
	public <T> AlertFrame(List<Map<String, T>> mapList,
			List<String> colNameList) {
        initCommon();
		this.mapListTableModel = new MapListTableModel<T>(mapList, colNameList);

		selectedRowIndex = new JTextField();
		selectedRowIndex.getDocument().addDocumentListener(new DL(this));
		selectedColIndex = new JTextField();
		selectedColIndex.getDocument().addDocumentListener(new DL(this));
		// textArea.setPreferredSize()
		setSize(800, 600);

		JTable jTable = new JTable(mapListTableModel);
		// handle selection events and callbacks here.
		jTable.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		ListSelectionModel rsm = jTable.getSelectionModel();
		rsm.addListSelectionListener(new SelectionDebugger(selectedRowIndex,
				rsm));

		ListSelectionModel csm = jTable.getColumnModel().getSelectionModel();
		csm.addListSelectionListener(new SelectionDebugger(selectedColIndex,
				csm));

		jTable.setRowSelectionAllowed(false);
		jTable.setColumnSelectionAllowed(false);
		jTable.setCellSelectionEnabled(true);

		getContentPane().add(new JScrollPane(jTable), BorderLayout.CENTER);
		getContentPane().add(new JScrollPane(textArea), BorderLayout.SOUTH);

		pack();
		showCentered(this);
		setVisible(true);
	}
	public AlertFrame(Number value) {
		this(String.valueOf(value));
	}
	public AlertFrame(Object obj) {
        initCommon();
		try {
			Map<String,Object> beanMap = BeanUtils.describe(obj);
		for(String key : beanMap.keySet()) {
			beanMap.put(key, PropertyUtils.getSimpleProperty(obj, key));
		}
			processMap(beanMap);
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		} catch (NoSuchMethodException e) {
			e.printStackTrace();
		}
	}
	public AlertFrame(String value) {
        initCommon();
		textArea.setText(value);
		getContentPane().add(new JScrollPane(textArea));
		setSize(gd.getDisplayMode().getWidth() / 2, gd.getDisplayMode()
				.getWidth() / 2);
		showCentered(this);
	}

	public AlertFrame(String[] values) {
        initCommon();
		final JTextArea jTextArea = new JTextArea();
		final DefaultListModel listModel = new DefaultListModel();
		int i = 0;
		for (Object value : values) {
			listModel.add(i++, String.valueOf(value));
		}
		JList jList = new JList(listModel);
		getContentPane().add(new JScrollPane(jList),
				BorderLayout.SOUTH);
		final JScrollPane scrollPane = new JScrollPane(jTextArea);
		scrollPane.setPreferredSize(new Dimension(300, 300));
		getContentPane().add(scrollPane,BorderLayout.CENTER);
		setSize(gd.getDisplayMode().getWidth() / 2, gd.getDisplayMode()
				.getWidth() / 2);

		jList.addListSelectionListener(new ListSelectionListener() {
			public void valueChanged(ListSelectionEvent e) {
				for (int i = e.getFirstIndex(); i <= e.getLastIndex(); i++) {
					if (((JList) e.getSource()).isSelectedIndex(i)) {
						jTextArea.setText(String.valueOf(listModel.get(i)));
					}
				}
			}
		});
		showCentered(this);
	}

	public <T> AlertFrame(final Map<String, T> map) {
        initCommon();
		processMap(map);
	}

	private <T> void processMap(final Map<String, T> map) {
		final DefaultListModel listModel = new DefaultListModel();

		int i = 0;
		for (Object value : new TreeSet<Object>(map.keySet())) {
			listModel.add(i++, value);
		}
		JList jList = new JList(listModel);
		jList.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		jList.addListSelectionListener(new ListSelectionListener() {
			public void valueChanged(ListSelectionEvent e) {
				for (int i = e.getFirstIndex(); i <= e.getLastIndex(); i++) {
					if (((JList) e.getSource()).isSelectedIndex(i)) {
						textArea.setText(String.valueOf(map.get(listModel.get(i))));
					}
				}
			}
		});
		jList.addMouseListener(new MouseAdapter() {
		    public void mouseClicked(MouseEvent evt) {
		        JList list = (JList)evt.getSource();
		        if (evt.getClickCount() == 2) {
		            int index = list.locationToIndex(evt.getPoint());
		            Object obj = map.get(listModel.get(index));
		            new AlertFrame(obj);
		        } 
		    }
		});		
		
		// jList.add
		getContentPane().add(new JScrollPane(jList), BorderLayout.NORTH);
		getContentPane().add(new JScrollPane(textArea), BorderLayout.CENTER);
		setSize(gd.getDisplayMode().getWidth() / 2, gd.getDisplayMode()
				.getWidth() / 2);
		showCentered(this);
	}
	public JTextArea getTextArea() {
		return textArea;
	}

	class DL implements DocumentListener {
		private AlertFrame parent;

		public DL(AlertFrame parent) {
			this.parent = parent;
		}

		public void removeUpdate(DocumentEvent event) {
			changed(event);
		}

		public void insertUpdate(DocumentEvent event) {
			changed(event);
		}

		public void changedUpdate(DocumentEvent event) {
			changed(event);
		}

		private void changed(DocumentEvent event) {
			if (!"".equals(parent.selectedRowIndex.getText())
					&& !"".equals(parent.selectedColIndex.getText())) {
				int intSelectedRowIndex = Integer
						.parseInt(parent.selectedRowIndex.getText());
				int intSelectedColIndex = Integer
						.parseInt(parent.selectedColIndex.getText());
				textArea.setText(String.valueOf(mapListTableModel.getValueAt(
						intSelectedRowIndex, intSelectedColIndex)));
			}
		}
	}
	public static void showCentered(JFrame frame) {
		GraphicsDevice gd = GraphicsEnvironment.getLocalGraphicsEnvironment().getDefaultScreenDevice();
		final int x = (gd.getDisplayMode().getWidth() - frame.getWidth()) / 2;
		final int y = (gd.getDisplayMode().getHeight() - frame.getHeight()) / 2;
		frame.setLocation(x, y);
		frame.setVisible(true);
	}	

}

class SelectionDebugger implements ListSelectionListener {
	private ListSelectionModel listModel;
	private JTextField target;

	public SelectionDebugger(JTextField target, ListSelectionModel lsm) {
		this.listModel = lsm;
		this.target = target;
	}

	public void valueChanged(ListSelectionEvent lse) {
		if (!lse.getValueIsAdjusting()) {
			int[] selection = getSelectedIndices(
					listModel.getMinSelectionIndex(),
					listModel.getMaxSelectionIndex());
			if (selection.length == 0) {
			} else {
				for (int i = 0; i < selection.length; i++) {
					String text = String.valueOf(selection[i]);
					if (!"".equals(text.trim())) {
						target.setText(text);
					}
				}
			}

		}
	}

	protected int[] getSelectedIndices(int start, int stop) {
		if ((start == -1) || (stop == -1)) {
			// no selection, so return an empty array
			return new int[0];
		}
		int guesses[] = new int[stop - start + 1];
		int index = 0;
		// manually walk thru these
		for (int i = start; i <= stop; i++) {
			if (listModel.isSelectedIndex(i)) {
				guesses[index++] = i;
			}
		}
		int realthing[] = new int[index];
		System.arraycopy(guesses, 0, realthing, 0, index);
		return realthing;
	}
}

class MapListTableModel <T> extends AbstractTableModel {
	private static final long serialVersionUID = 1L;
	private List<Map<String, T>> mapList = new ArrayList<Map<String, T>>();
	private List<String> colNameList = new ArrayList<String>();

	public MapListTableModel(List<Map<String, T>> mapList,
			List<String> colNameList) {
		super();
		this.mapList = mapList;
		this.colNameList = colNameList;
	}

	public int getColumnCount() {
		return colNameList.size();
	}

	public String getColumnName(int columnIndex) {
		return colNameList.get(columnIndex);
	}

	public int getRowCount() {
		return mapList.size();
	}

	public Object getValueAt(int rowIndex, int columnIndex) {
		String columnName = getColumnName(columnIndex);
		Map<String, T> map = mapList.get(rowIndex);
		if (map == null)
			return null;
		return map.get(columnName);
	}
}
