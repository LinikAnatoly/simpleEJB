
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENSORentItems;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.ENSORentItemsShort;

public class ENSORentItemsShortList implements Serializable {

	public int totalCount = 0;
	public Vector<ENSORentItemsShort> list = new Vector<ENSORentItemsShort>();

	public final int getTotalCount() {return totalCount;}
	public final void setTotalCount(int aValue) {totalCount = aValue;}

	public final Vector<ENSORentItemsShort> getList() {return list;}
	public final void setList(Vector<ENSORentItemsShort> aValue) {list = aValue;}

	public final com.ksoe.energynet.valueobject.brief.ENSORentItemsShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null)?0:list.size();
	}

} // end of List for ENSORentItems

