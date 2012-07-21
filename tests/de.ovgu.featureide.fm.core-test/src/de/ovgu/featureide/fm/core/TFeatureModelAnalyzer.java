/* FeatureIDE - An IDE to support feature-oriented software development
 * Copyright (C) 2005-2011  FeatureIDE Team, University of Magdeburg
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see http://www.gnu.org/licenses/.
 *
 * See http://www.fosd.de/featureide/ for further information.
 */
package de.ovgu.featureide.fm.core;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import java.io.File;
import java.io.FileFilter;
import java.io.FileNotFoundException;
import java.util.HashMap;

import org.junit.Test;

import de.ovgu.featureide.fm.core.io.UnsupportedModelException;
import de.ovgu.featureide.fm.core.io.xml.XmlFeatureModelReader;

/**
 * Tests for {@link FeatureModelAnalyser} 
 * 
 * @author Jens Meinicke
 */
public class TFeatureModelAnalyzer {
	
	protected static File MODEL_FILE_FOLDER = getFolder();
	
	private static final FileFilter filter = new FileFilter() {
		@Override
		public boolean accept(File pathname) {
			return pathname.getName().endsWith(".xml");
		}
	};
	
	private FeatureModel FM_test_1 = init("test_1.xml");
	private Feature FM1_F1 = FM_test_1.getFeature("F1");
	private Feature FM1_F2 = FM_test_1.getFeature("F2");
	private Constraint FM1_C1 = FM_test_1.getConstraints().get(0);
	private HashMap<Object, Object> FM1_DATA = FM_test_1.getAnalyser().analyzeFeatureModel(null);
	
	private FeatureModel FM_test_2 = init("test_2.xml");
	private Feature FM2_F1 = FM_test_2.getFeature("F1");
	private Feature FM2_F2 = FM_test_2.getFeature("F2");
	private Feature FM2_F3 = FM_test_2.getFeature("F3");
	private Constraint FM2_C1 = FM_test_2.getConstraints().get(0);
	private Constraint FM2_C2 = FM_test_2.getConstraints().get(1);
	private Constraint FM2_C3 = FM_test_2.getConstraints().get(2);
	private HashMap<Object, Object> FM2_DATA = FM_test_2.getAnalyser().analyzeFeatureModel(null);
	
	private FeatureModel FM_test_3 = init("test_3.xml");
	private Feature FM3_F2 = FM_test_3.getFeature("F2");
	private Feature FM3_F3 = FM_test_3.getFeature("F3");
	private Constraint FM3_C1 = FM_test_3.getConstraints().get(0);
	private HashMap<Object, Object> FM3_DATA = FM_test_3.getAnalyser().analyzeFeatureModel(null);
	
	/** 
     * @return 
	 */ 
	private static File getFolder() { 
		File folder =  new File("/vol1/teamcity_itidb/TeamCity/buildAgent/work/featureide/tests/de.ovgu.featureide.fm.core-test/src/analyzefeaturemodels/"); 
		if (!folder.canRead()) { 
			folder =  new File(ClassLoader.getSystemResource("analyzefeaturemodels").getPath()); 
		} 
		return folder; 
	}
	
	private final FeatureModel init(String name) {
		FeatureModel fm = new FeatureModel();
		for (File f : MODEL_FILE_FOLDER.listFiles(filter)) {
			if (f.getName().equals(name)) {
				try {
					new XmlFeatureModelReader(fm).readFromFile(f);
					break;
				} catch (FileNotFoundException e) {
					e.printStackTrace();
				} catch (UnsupportedModelException e) {
					e.printStackTrace();
				}
			}
		}
		return fm;
	}
	
	@Test
	public void TFalseOptional_FM1_F1() {
		assertEquals(FM1_DATA.get(FM1_F1), FeatureStatus.FALSE_OPTIONAL);
	}
	
	@Test
	public void TFalseOptional_FM1_F2() {
		assertEquals(FM1_DATA.get(FM1_F2), FeatureStatus.FALSE_OPTIONAL);
	}
	
	@Test
	public void TFalseOptional_FM1_C1() {
		assertEquals(FM1_DATA.get(FM1_C1), ConstraintAttribute.UNSATISFIABLE);
	}
	
	@Test
	public void TFalseOptional_FM1_C1_F1() {
		assertTrue(FM1_C1.getFalseOptional().contains(FM1_F1));
	}
	
	@Test
	public void TFalseOptional_FM1_C1_F2() {
		assertTrue(FM1_C1.getFalseOptional().contains(FM1_F2));
	}
	
	
	@Test
	public void TFalseOptional_FM2_F1() {
		assertEquals(FM2_DATA.get(FM2_F1), FeatureStatus.FALSE_OPTIONAL);
	}
	
	@Test
	public void TFalseOptional_FM2_F2() {
		assertEquals(FM2_DATA.get(FM2_F2), FeatureStatus.FALSE_OPTIONAL);
	}
	
	@Test
	public void TFalseOptional_FM2_F3() {
		assertEquals(FM2_DATA.get(FM2_F3), null);
	}
	
	@Test
	public void TFalseOptional_FM2_C1() {
		assertEquals(FM2_DATA.get(FM2_C1), ConstraintAttribute.UNSATISFIABLE);
	}
	
	@Test
	public void TFalseOptional_FM2_C1_F1() {
		assertTrue(FM2_C1.getFalseOptional().contains(FM2_F1));
	}
	
	@Test
	public void TFalseOptional_FM2_C1_F2() {
		assertTrue(FM2_C1.getFalseOptional().contains(FM2_F2));
	}
	
	@Test
	public void TFalseOptional_FM2_C1_F3() {
		assertTrue(!FM2_C1.getFalseOptional().contains(FM2_F3));
	}
	
	@Test
	public void TFalseOptional_FM2_C2() {
		assertEquals(FM2_DATA.get(FM2_C2), ConstraintAttribute.REDUNDANT);
	}
	
	@Test
	public void TFalseOptional_FM2_C2_F() {
		assertTrue(FM2_C2.getFalseOptional().isEmpty());
	}
	
	@Test
	public void TFalseOptional_FM2_C3() {
		assertEquals(FM2_DATA.get(FM2_C3), ConstraintAttribute.REDUNDANT);
	}
	
	@Test
	public void TFalseOptional_FM2_C3_F() {
		assertTrue(FM2_C3.getFalseOptional().isEmpty());
	}
	
	@Test
	public void TFalseOptional_FM3_F2() {
		assertEquals(FM3_DATA.get(FM3_F2), FeatureStatus.FALSE_OPTIONAL);
	}
	
	@Test
	public void TDead_FM3_F2() {
		assertEquals(FM3_DATA.get(FM3_F3), FeatureStatus.DEAD);
	}
	
	@Test
	public void TFalseOptional_FM3_C1() {
		assertEquals(FM3_DATA.get(FM3_C1), ConstraintAttribute.DEAD);
	}
	
	@Test
	public void TFalseOptional_FM3_C1_contains() {
		assertTrue(FM3_C1.getFalseOptional().contains(FM3_F2));
	}
	
	@Test
	public void TDead_FM3_C1_contains() {
		assertTrue(FM3_C1.getDeadFeatures().contains(FM3_F3));
	}
	
}