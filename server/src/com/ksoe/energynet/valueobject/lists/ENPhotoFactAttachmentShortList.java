
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2018 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.lists;

import java.io.Serializable;

/**
* Short List for ENPhotoFactAttachment;
*/

import java.util.Vector;

import com.ksoe.energynet.valueobject.brief.ENPhotoFactAttachmentShort;

public class ENPhotoFactAttachmentShortList implements Serializable {

	private static final long serialVersionUID = 1L;

	public int totalCount = 0;
	public Vector<ENPhotoFactAttachmentShort> list = new Vector<ENPhotoFactAttachmentShort>();

	public final int getTotalCount() {
		return totalCount;
	}

	public final void setTotalCount(int aValue) {
		totalCount = aValue;
	}

	public final Vector<ENPhotoFactAttachmentShort> getList() {
		return list;
	}

	public final void setList(Vector<ENPhotoFactAttachmentShort> aValue) {
		list = aValue;
	}

	public final com.ksoe.energynet.valueobject.brief.ENPhotoFactAttachmentShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null) ? 0 : list.size();
	}

} // end of List for ENPhotoFactAttachment
