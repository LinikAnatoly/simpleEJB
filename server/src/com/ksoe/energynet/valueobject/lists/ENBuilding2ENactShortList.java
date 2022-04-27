
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENBuilding2ENact;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.ENBuilding2ENactShort;

public class ENBuilding2ENactShortList implements Serializable {

	private static final long serialVersionUID = 1L;

	public int totalCount = 0;
	public Vector<ENBuilding2ENactShort> list = new Vector<ENBuilding2ENactShort>();

	public final int getTotalCount() {return totalCount;}
	public final void setTotalCount(int aValue) {totalCount = aValue;}

	public final Vector<ENBuilding2ENactShort> getList() {return list;}
	public final void setList(Vector<ENBuilding2ENactShort> aValue) {list = aValue;}

	public final com.ksoe.energynet.valueobject.brief.ENBuilding2ENactShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null)?0:list.size();
	}

} // end of List for ENBuilding2ENact

