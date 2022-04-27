
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENElement2ENElement;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.ENElement2ENElementShort;

public class ENElement2ENElementShortList implements Serializable {

	public int totalCount = 0;
	public Vector<ENElement2ENElementShort> list = new Vector<ENElement2ENElementShort>();

	public final int getTotalCount() {return totalCount;}
	public final void setTotalCount(int aValue) {totalCount = aValue;}

	public final Vector<ENElement2ENElementShort> getList() {return list;}
	public final void setList(Vector<ENElement2ENElementShort> aValue) {list = aValue;}

	public final com.ksoe.energynet.valueobject.brief.ENElement2ENElementShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null)?0:list.size();
	}

} // end of List for ENElement2ENElement

