
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENDocAttachmentType;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.ENDocAttachmentTypeShort;

public class ENDocAttachmentTypeShortList implements Serializable {

	private static final long serialVersionUID = 1L;

	public int totalCount = 0;
	public Vector<ENDocAttachmentTypeShort> list = new Vector<ENDocAttachmentTypeShort>();

	public final int getTotalCount() {return totalCount;}
	public final void setTotalCount(int aValue) {totalCount = aValue;}

	public final Vector<ENDocAttachmentTypeShort> getList() {return list;}
	public final void setList(Vector<ENDocAttachmentTypeShort> aValue) {list = aValue;}

	public final com.ksoe.energynet.valueobject.brief.ENDocAttachmentTypeShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null)?0:list.size();
	}

} // end of List for ENDocAttachmentType

