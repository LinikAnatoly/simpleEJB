
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENIPItem2Plan;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.ENIPItem2PlanShort;

public class ENIPItem2PlanShortList implements Serializable {

	private static final long serialVersionUID = 1L;

	public int totalCount = 0;
	public Vector<ENIPItem2PlanShort> list = new Vector<ENIPItem2PlanShort>();

	public final int getTotalCount() {return totalCount;}
	public final void setTotalCount(int aValue) {totalCount = aValue;}

	public final Vector<ENIPItem2PlanShort> getList() {return list;}
	public final void setList(Vector<ENIPItem2PlanShort> aValue) {list = aValue;}

	public final com.ksoe.energynet.valueobject.brief.ENIPItem2PlanShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null)?0:list.size();
	}

} // end of List for ENIPItem2Plan

