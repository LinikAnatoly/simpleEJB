
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENTravelSheetItem;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.ENTravelSheetItemShort;

public class ENTravelSheetItemShortList implements Serializable {

	private static final long serialVersionUID = 1L;

	public int totalCount = 0;
	public Vector<ENTravelSheetItemShort> list = new Vector<ENTravelSheetItemShort>();

	public final int getTotalCount() {return totalCount;}
	public final void setTotalCount(int aValue) {totalCount = aValue;}

	public final Vector<ENTravelSheetItemShort> getList() {return list;}
	public final void setList(Vector<ENTravelSheetItemShort> aValue) {list = aValue;}

	public final com.ksoe.energynet.valueobject.brief.ENTravelSheetItemShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null)?0:list.size();
	}

} // end of List for ENTravelSheetItem

