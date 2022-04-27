
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2017 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENServices2CalcAdditionalItems;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.ENServices2CalcAdditionalItemsShort;

public class ENServices2CalcAdditionalItemsShortList implements Serializable {

	public int totalCount = 0;
	public Vector<ENServices2CalcAdditionalItemsShort> list = new Vector<ENServices2CalcAdditionalItemsShort>();

	public final int getTotalCount() {return totalCount;}
	public final void setTotalCount(int aValue) {totalCount = aValue;}

	public final Vector<ENServices2CalcAdditionalItemsShort> getList() {return list;}
	public final void setList(Vector<ENServices2CalcAdditionalItemsShort> aValue) {list = aValue;}

	public final com.ksoe.energynet.valueobject.brief.ENServices2CalcAdditionalItemsShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null)?0:list.size();
	}

} // end of List for ENServices2CalcAdditionalItems

