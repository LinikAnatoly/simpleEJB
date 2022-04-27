//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.lists;

/**
 * Short List for ENTechAgreement2ServicesObject;
 */

import java.io.Serializable;
import java.util.Vector;

import com.ksoe.energynet.valueobject.brief.ENTechAgreement2ServicesObjectShort;

public class ENTechAgreement2ServicesObjectShortList implements Serializable {

	public int totalCount = 0;
	public Vector<ENTechAgreement2ServicesObjectShort> list = new Vector<ENTechAgreement2ServicesObjectShort>();

	public final int getTotalCount() {
		return totalCount;
	}

	public final void setTotalCount(int aValue) {
		totalCount = aValue;
	}

	public final Vector<ENTechAgreement2ServicesObjectShort> getList() {
		return list;
	}

	public final void setList(Vector<ENTechAgreement2ServicesObjectShort> aValue) {
		list = aValue;
	}

	public final com.ksoe.energynet.valueobject.brief.ENTechAgreement2ServicesObjectShort get(
			int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null) ? 0 : list.size();
	}

} // end of List for ENTechAgreement2ServicesObject

