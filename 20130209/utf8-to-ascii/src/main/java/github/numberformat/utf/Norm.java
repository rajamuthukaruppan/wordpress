package github.numberformat.utf;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.Label;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.text.Normalizer;
import java.util.HashMap;
import java.util.Iterator;

import javax.swing.BoxLayout;
import javax.swing.JComboBox;
import javax.swing.JComponent;
import javax.swing.JFrame;
import javax.swing.JPanel;

public class Norm extends JFrame {
	private static final long serialVersionUID = 1L;

	private JComboBox normalizationTemplate;
	private JComboBox formComboBox;
	private JComponent paintingComponent;
	private HashMap<String, Normalizer.Form> formValues = new HashMap<String, Normalizer.Form>();
	private HashMap<String, String> templateValues = new HashMap<String, String>();

	public Norm() {
		init();
	}
	
	public void init() {
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setTitle("UTF-8 to ASCII");
		
		formValues.put("NFC", Normalizer.Form.NFC);
		formValues.put("NFD", Normalizer.Form.NFD);
		formValues.put("NFKC", Normalizer.Form.NFKC);
		formValues.put("NFKD", Normalizer.Form.NFKD);
		
		formComboBox = new JComboBox();
		for (Iterator it = formValues.keySet().iterator(); it.hasNext();) {
			formComboBox.addItem((String) it.next());
		}
		templateValues.put("acute accent", "\u2039touch" + "\u00e9\u2035");

		// text with ligature
		templateValues.put("ligature", "a" + "\ufb03" + "ance");

		// text with the cedilla
		templateValues.put("cedilla", "fa" + "\u00e7" + "ade");

		
		templateValues.put("half-width katakana",
				"\uff81\uff6e\uff7a\uff9a\uff70\uff84");

		normalizationTemplate = new JComboBox();

		for (Iterator it = templateValues.keySet().iterator(); it.hasNext();) {
			normalizationTemplate.addItem((String) it.next());
		}
		
		JPanel controls = new JPanel();

		controls.setLayout(new BoxLayout(controls, BoxLayout.X_AXIS));
		controls.add(new Label("Normalization Form: "));
		controls.add(formComboBox);
		controls.add(new Label("Normalization Template:"));
		controls.add(normalizationTemplate);
		formComboBox.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				paintingComponent.repaint();
			}
		});

		normalizationTemplate.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				paintingComponent.repaint();
			}
		});

		
		getContentPane().add(getCenter(), BorderLayout.CENTER);
		getContentPane().add(controls, BorderLayout.SOUTH);
		pack();
		setVisible(true);

	}

	private JComponent getCenter() {
		if(paintingComponent != null) return paintingComponent;
		
		paintingComponent = new JComponent() {
			static final long serialVersionUID = -3725620407788489160L;

			public Dimension getSize() {
				return new Dimension(550, 200);
			}

			public Dimension getPreferredSize() {
				return new Dimension(550, 200);
			}

			public Dimension getMinimumSize() {
				return new Dimension(550, 200);
			}

			public void paint(Graphics g) {
				Graphics2D g2 = (Graphics2D) g;

				g2.setFont(new Font("Serif", Font.PLAIN, 20));
				g2.setColor(Color.BLACK);
				g2.drawString("Original string:", 100, 80);
				g2.drawString("Normalized string:", 100, 120);
				g2.setFont(new Font("Serif", Font.BOLD, 24));

				// output of the original sample selected from the ComboBox

				String original_string = templateValues
						.get(normalizationTemplate.getSelectedItem());
				g2.drawString(original_string, 320, 80);

				// normalization and output of the normalized string

				String normalized_string = utf8ToLatin1(original_string);

				g2.drawString(normalized_string, 320, 120);
			}

			private String utf8ToLatin1(String original_string) {
				String normalized_string;
				java.text.Normalizer.Form currentForm = formValues
						.get(formComboBox.getSelectedItem());
				normalized_string = Normalizer.normalize(original_string,
						currentForm);

				normalized_string = normalized_string.replaceAll(
						"\\p{InCombiningDiacriticalMarks}+", "");

				String str = normalized_string;
				str = str
						.replaceAll(
								"[\u00AB\u2034\u2037\u00BB\u02BA\u030B\u030E\u201C\u201D\u201E\u201F\u2033\u2036\u3003\u301D\u301E]",
								"\"");
				str = str.replaceAll("[\u02CB\u0300\u2035]", "`");
				str = str.replaceAll("[\u02C4\u02C6\u0302\u2038\u2303]", "^");
				str = str.replaceAll("[\u02CD\u0331\u0332\u2017]", "_");
				str = str.replaceAll(
						"[\u00AD\u2010\u2011\u2012\u2013\u2014\u2212\u2015]",
						"-");
				str = str.replaceAll("[\u201A]", ",");
				str = str.replaceAll("[\u0589\u05C3\u2236]", ":");
				str = str.replaceAll("[\u01C3\u2762]", "!");
				str = str.replaceAll("[\u203D]", "?");
				str = str
						.replaceAll(
								"[\u00B4\u02B9\u02BC\u02C8\u0301\u200B\u2018\u2019\u201B\u2032]",
								"'");
				str = str.replaceAll("[\u27E6]", "[");
				str = str.replaceAll("[\u301B]", "]");
				str = str.replaceAll("[\u2983]", "{");
				str = str.replaceAll("[\u2984]", "}");
				str = str.replaceAll("[\u066D\u204E\u2217\u2731]", "*");
				str = str.replaceAll("[\u00F7\u0338\u2044\u2060\u2215]", "/");
				str = str.replaceAll("[\u20E5\u2216]", "\\");
				str = str.replaceAll("[\u266F]", "#");
				str = str.replaceAll("[\u066A\u2052]", "%");
				str = str.replaceAll("[\u2039\u2329\u27E8\u3008]", "<");
				str = str.replaceAll("[\u203A\u232A\u27E9\u3009]", ">");
				str = str.replaceAll("[\u01C0\u05C0\u2223\u2758]", "|");
				str = str.replaceAll("[\u02DC\u0303\u2053\u223C\u301C]", "~");
				normalized_string = str;
				return normalized_string;
			}
		}; 
				
				
		return paintingComponent;
	}
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		new Norm();
	}

}
