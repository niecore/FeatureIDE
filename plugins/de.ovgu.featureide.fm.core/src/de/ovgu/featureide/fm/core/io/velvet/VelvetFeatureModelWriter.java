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
package de.ovgu.featureide.fm.core.io.velvet;

import static de.ovgu.featureide.fm.core.localization.StringTable.USE;

import java.util.HashSet;
import java.util.LinkedList;

import de.ovgu.featureide.fm.core.ExtendedConstraint;
import de.ovgu.featureide.fm.core.ExtendedFeature;
import de.ovgu.featureide.fm.core.ExtendedFeatureModel;
import de.ovgu.featureide.fm.core.ExtendedFeatureModel.UsedModel;
import de.ovgu.featureide.fm.core.base.IConstraint;
import de.ovgu.featureide.fm.core.base.IFeature;
import de.ovgu.featureide.fm.core.base.IFeatureModel;
import de.ovgu.featureide.fm.core.io.AbstractFeatureModelWriter;

/**
 * Writes the feature model to a string in velvet syntax.
 * 
 * @author Sebastian Krieter
 */
public class VelvetFeatureModelWriter extends AbstractFeatureModelWriter {

	private static final String[] SYMBOLS = { "!", "&&", "||", "->", "<->",
			", ", "choose", "atleast", "atmost" };
	private static final String NEWLINE = System.getProperty("line.separator", "\n");
	private final StringBuilder sb = new StringBuilder();

	/**
	 * If true an interface will be created. Otherwise it is named CONCEPT
	 */
	private boolean isInterface = false;
	private ExtendedFeatureModel extFeatureModel = null;
	private final HashSet<String> usedVariables = new HashSet<String>();

	public VelvetFeatureModelWriter(IFeatureModel featureModel) {
		setFeatureModel(featureModel);
	}

	public VelvetFeatureModelWriter(IFeatureModel featureModel,
			boolean isInterface) {
		this(featureModel);
		this.isInterface = true;
	}

	@Override
	public String writeToString() {
		if (featureModel instanceof ExtendedFeatureModel) {
			extFeatureModel = (ExtendedFeatureModel) featureModel;
			isInterface = isInterface || extFeatureModel.isInterface();
		}
		IFeature root = featureModel.getRoot();
		sb.delete(0, sb.length());

		if (isInterface) {
			sb.append("cinterface ");
		} else {
			sb.append("concept ");
		}
		sb.append(root.getName());
		if (extFeatureModel != null) {
			usedVariables.clear();
			LinkedList<ExtendedFeatureModel.UsedModel> inheritedModels = new LinkedList<ExtendedFeatureModel.UsedModel>();
			LinkedList<ExtendedFeatureModel.UsedModel> instanceModels = new LinkedList<ExtendedFeatureModel.UsedModel>();
			LinkedList<ExtendedFeatureModel.UsedModel> interfaceModels = new LinkedList<ExtendedFeatureModel.UsedModel>();
			for (UsedModel usedModel : extFeatureModel.getExternalModels().values()) {
				switch (usedModel.getType()) {
				case ExtendedFeature.TYPE_INHERITED:
					inheritedModels.add(usedModel);
					break;
				case ExtendedFeature.TYPE_INSTANCE:
					instanceModels.add(usedModel);
					break;
				case ExtendedFeature.TYPE_INTERFACE:
					interfaceModels.add(usedModel);
					break;
				}
			}
			
			if (!inheritedModels.isEmpty()) {
				sb.append(" : ");
				sb.append(inheritedModels.removeFirst().getModelName());
				for (UsedModel usedModel : inheritedModels) {
					sb.append(", ");
					sb.append(usedModel.getModelName());
				}
			}
			
			if (!instanceModels.isEmpty()) {
				sb.append(NEWLINE);
				sb.append("\tinstance ");
				sb.append(instanceModels.removeFirst());
				for (UsedModel usedModel : instanceModels) {
					sb.append(", ");
					sb.append(usedModel);
				}
			}
			
			if (!interfaceModels.isEmpty()) {
				sb.append(NEWLINE);
				sb.append("\tinterface ");
				sb.append(interfaceModels.removeFirst());
				for (UsedModel usedModel : interfaceModels) {
					sb.append(", ");
					sb.append(usedModel);
				}
			}
		}
		sb.append(" {");
		sb.append(NEWLINE);

		if (extFeatureModel != null && !isInterface) {
			for (IFeature child : root.getChildren()) {
				writeNewDefined(child, 1);
			}
			
			for (IConstraint constraint : featureModel.getConstraints()) {
				if (((ExtendedConstraint) constraint).getType() == ExtendedFeature.TYPE_INTERN) {
					sb.append("\tconstraint ");
					sb.append(constraint.getNode().toString(SYMBOLS));
					sb.append(";");
					sb.append(NEWLINE);
				}
			}
		} else {
			writeFeatureGroup(root, 1);
			
			for (IConstraint constraint : featureModel.getConstraints()) {
				sb.append("\tconstraint ");
				sb.append(constraint.getNode().toString(SYMBOLS));
				sb.append(";");
				sb.append(NEWLINE);
			}
		}
		
		sb.append("}");

		return sb.toString();
	}
	
	private void writeFeatureGroup(IFeature curFeature, int depth) {
		if (curFeature.isAnd()) {
			for (IFeature feature : curFeature.getChildren()) {
				writeFeature(feature, depth + 1);
			}
		} else if (curFeature.isOr()) {
			writeTab(depth + 1);
			sb.append("someOf {");
			sb.append(NEWLINE);
			for (IFeature feature : curFeature.getChildren()) {
				writeFeature(feature, depth + 2);
			}
			writeTab(depth + 1);
			sb.append("}");
			sb.append(NEWLINE);
		} else if (curFeature.isAlternative()) {
			writeTab(depth + 1);
			sb.append("oneOf {");
			sb.append(NEWLINE);
			for (IFeature f : curFeature.getChildren()) {
				writeFeature(f, depth + 2);
			}
			writeTab(depth + 1);
			sb.append("}");
			sb.append(NEWLINE);
		}
	}

	private void writeFeature(IFeature curFeature, int depth) {
		writeTab(depth);
		if (curFeature.isAbstract()) {
			sb.append("abstract ");
		}
		if (curFeature.isMandatory() && (curFeature.getParent() == null || curFeature.getParent().isAnd())) {
			sb.append("mandatory ");
		}
		sb.append("feature ");
		sb.append(curFeature.getName());
		final String description = curFeature.getDescription();
		final boolean hasDescription = description != null && !description.isEmpty();

		if (curFeature.getChildrenCount() == 0 && !hasDescription) {
			sb.append(";");
		} else {
			sb.append(" {");
			sb.append(NEWLINE);
			if (hasDescription) {
				writeTab(depth + 1);
				sb.append("description \"");
				sb.append(description.replace("\"", "\\\""));
				sb.append("\";");
				sb.append(NEWLINE);
			}
			
			writeFeatureGroup(curFeature, depth);
			
			writeTab(depth);
			sb.append("}");
		}
		sb.append(NEWLINE);
	}
	
	private void writeNewDefined(IFeature curFeature, int depth) {
		if (curFeature instanceof ExtendedFeature) {
			final ExtendedFeature extFeature = (ExtendedFeature) curFeature;
			
			if (extFeature.getType() == ExtendedFeature.TYPE_INSTANCE || extFeature.getType() == ExtendedFeature.TYPE_INTERFACE) {
				if (usedVariables.add(extFeature.getExternalModelName())) {
					IFeature parent = curFeature.getParent();
					writeTab(depth);
					if (!parent.isRoot()) {
						sb.append("feature ");
						sb.append(parent.getName());
						sb.append(" {");
						sb.append(NEWLINE);
						writeTab(depth + 1);
					}
					sb.append(USE);
					sb.append(extFeature.getExternalModelName());
					sb.append(";");
					sb.append(NEWLINE);
					if (!parent.isRoot()) {
						writeTab(depth);
						sb.append("}");
						sb.append(NEWLINE);
					}
				}
			}
		}
		for (IFeature child : curFeature.getChildren()) {
			writeNewDefined(child, depth);
		}
	}

	private void writeTab(int times) {
		for (int i = 0; i < times; i++) {
			sb.append('\t');
		}
	}
}
