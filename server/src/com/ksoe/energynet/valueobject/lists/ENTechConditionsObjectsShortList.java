
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.lists;

import java.io.Serializable;

/**
* Short List for ENTechConditionsObjects;
*/

import java.util.Vector;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlRootElement;

import com.ksoe.energynet.valueobject.brief.ENTechConditionsObjectsShort;


@XmlRootElement(name = "ENTechConditionsObjectsShortList")
@XmlAccessorType(XmlAccessType.FIELD)
public class ENTechConditionsObjectsShortList implements Serializable {

	private static final long serialVersionUID = 1L;

	public int totalCount = 0;
	public Vector<ENTechConditionsObjectsShort> list = new Vector<>();

	public final int getTotalCount() {
		return totalCount;
	}

	public final void setTotalCount(int aValue) {
		totalCount = aValue;
	}

	public final Vector<ENTechConditionsObjectsShort> getList() {
		return list;
	}

	public final void setList(Vector<ENTechConditionsObjectsShort> aValue) {
		list = aValue;
	}

	public final com.ksoe.energynet.valueobject.brief.ENTechConditionsObjectsShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null) ? 0 : list.size();
	}

} // end of List for ENTechConditionsObjects
