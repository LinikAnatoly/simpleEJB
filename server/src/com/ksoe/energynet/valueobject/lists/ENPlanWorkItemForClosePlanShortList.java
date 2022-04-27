package com.ksoe.energynet.valueobject.lists;

import java.io.Serializable;
import java.util.Vector;

import com.ksoe.energynet.valueobject.brief.ENPlanWorkItemForClosePlanShort;

public class ENPlanWorkItemForClosePlanShortList implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	public int totalCount = 0;
	public Vector<ENPlanWorkItemForClosePlanShort> list = new Vector<ENPlanWorkItemForClosePlanShort>();

	public final int getTotalCount() {
		return totalCount;
	}

	public final void setTotalCount(int aValue) {
		totalCount = aValue;
	}

	public final Vector<ENPlanWorkItemForClosePlanShort> getList() {
		return list;
	}

	public final void setList(Vector<ENPlanWorkItemForClosePlanShort> aValue) {
		list = aValue;
	}

	public final com.ksoe.energynet.valueobject.brief.ENPlanWorkItemForClosePlanShort get(
			int anIndex) {
		return (com.ksoe.energynet.valueobject.brief.ENPlanWorkItemForClosePlanShort) list
				.get(anIndex);
	}

	public final int size() {
		return (list == null) ? 0 : list.size();
	}

}
