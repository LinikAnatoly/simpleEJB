
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENDocAttachment2ENElement;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.ENDocAttachment2ENElementShort;

public class ENDocAttachment2ENElementShortList implements Serializable {

	private static final long serialVersionUID = 1L;

	public int totalCount = 0;
	public Vector<ENDocAttachment2ENElementShort> list = new Vector<ENDocAttachment2ENElementShort>();

	public final int getTotalCount() {return totalCount;}
	public final void setTotalCount(int aValue) {totalCount = aValue;}

	public final Vector<ENDocAttachment2ENElementShort> getList() {return list;}
	public final void setList(Vector<ENDocAttachment2ENElementShort> aValue) {list = aValue;}

	public final com.ksoe.energynet.valueobject.brief.ENDocAttachment2ENElementShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null)?0:list.size();
	}

} // end of List for ENDocAttachment2ENElement

