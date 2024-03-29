
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2020 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENBuilding2ActTypeWork;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.ENBuilding2ActTypeWorkShort;

public class ENBuilding2ActTypeWorkShortList implements Serializable {

	private static final long serialVersionUID = 1L;

	public int totalCount = 0;
	public Vector<ENBuilding2ActTypeWorkShort> list = new Vector<ENBuilding2ActTypeWorkShort>();

	public final int getTotalCount() {return totalCount;}
	public final void setTotalCount(int aValue) {totalCount = aValue;}

	public final Vector<ENBuilding2ActTypeWorkShort> getList() {return list;}
	public final void setList(Vector<ENBuilding2ActTypeWorkShort> aValue) {list = aValue;}

	public final com.ksoe.energynet.valueobject.brief.ENBuilding2ActTypeWorkShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null)?0:list.size();
	}

} // end of List for ENBuilding2ActTypeWork

