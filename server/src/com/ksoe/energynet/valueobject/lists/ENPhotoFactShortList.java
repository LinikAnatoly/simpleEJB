
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.lists;

import java.io.Serializable;

/**
* Short List for ENPhotoFact;
*/

import java.util.Vector;

import com.ksoe.energynet.valueobject.brief.ENPhotoFactShort;

public class ENPhotoFactShortList implements Serializable {

	private static final long serialVersionUID = 1L;

	public int totalCount = 0;
	public Vector<ENPhotoFactShort> list = new Vector<ENPhotoFactShort>();

	public final int getTotalCount() {
		return totalCount;
	}

	public final void setTotalCount(int aValue) {
		totalCount = aValue;
	}

	public final Vector<ENPhotoFactShort> getList() {
		return list;
	}

	public final void setList(Vector<ENPhotoFactShort> aValue) {
		list = aValue;
	}

	public final com.ksoe.energynet.valueobject.brief.ENPhotoFactShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null) ? 0 : list.size();
	}

} // end of List for ENPhotoFact
