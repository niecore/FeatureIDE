/* FeatureIDE - A Framework for Feature-Oriented Software Development
 * Copyright (C) 2005-2015  FeatureIDE team, University of Magdeburg, Germany
 *
 * This file is part of FeatureIDE.
 * 
 * FeatureIDE is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * 
 * FeatureIDE is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 * 
 * You should have received a copy of the GNU Lesser General Public License
 * along with FeatureIDE.  If not, see <http://www.gnu.org/licenses/>.
 *
 * See http://featureide.cs.ovgu.de/ for further information.
 */
package de.ovgu.featureide.fm.core.base.impl;

import java.io.File;
import java.util.List;

import org.prop4j.Node;

import de.ovgu.featureide.fm.core.FMCorePlugin;
import de.ovgu.featureide.fm.core.base.IFeatureModel;
import de.ovgu.featureide.fm.core.base.IFeatureModelFactory;
import de.ovgu.featureide.fm.core.io.ModelWarning;

/**
 * @author Sebastian Krieter
 */
public class ExtendedFeatureModelFactory implements IFeatureModelFactory {

	public static final String ID = FMCorePlugin.PLUGIN_ID + ".ExtendedFeatureModelFactory";

	public static ExtendedFeatureModelFactory getInstance() {
		return new ExtendedFeatureModelFactory();
	}

	private ExtendedFeatureModelFactory() {
	}

	@Override
	public String getId() {
		return ID;
	}

	@Override
	public ExtendedConstraint createConstraint(IFeatureModel featureModel, Node propNode) {
		return new ExtendedConstraint(featureModel, propNode);
	}

	@Override
	public ExtendedFeature createFeature(IFeatureModel featureModel, String name) {
		return new ExtendedFeature(featureModel, name);
	}

	@Override
	public ExtendedFeatureModel createFeatureModel() {
		return new ExtendedFeatureModel();
	}

	@Override
	public List<ModelWarning> loadFeatureModel(IFeatureModel featureModel, File file) {
		return null;
	}

	@Override
	public List<ModelWarning> loadFeatureModel(IFeatureModel featureModel, String content) {
		return null;
	}

}
