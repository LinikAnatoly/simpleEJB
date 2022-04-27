
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENElement2ENElementType;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.ENElement2ENElementTypeShort;

public class ENElement2ENElementTypeShortList implements Serializable {

	public int totalCount = 0;
	public Vector<ENElement2ENElementTypeShort> list = new Vector<ENElement2ENElementTypeShort>();

	public final int getTotalCount() {return totalCount;}
	public final void setTotalCount(int aValue) {totalCount = aValue;}

	public final Vector<ENElement2ENElementTypeShort> getList() {return list;}
	public final void setList(Vector<ENElement2ENElementTypeShort> aValue) {list = aValue;}

	public final com.ksoe.energynet.valueobject.brief.ENElement2ENElementTypeShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null)?0:list.size();
	}

} // end of List for ENElement2ENElementType

