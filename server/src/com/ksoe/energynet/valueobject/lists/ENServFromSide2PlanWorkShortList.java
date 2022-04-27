
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENServFromSide2PlanWork;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.ENServFromSide2PlanWorkShort;

public class ENServFromSide2PlanWorkShortList implements Serializable {

	private static final long serialVersionUID = 1L;

	public int totalCount = 0;
	public Vector<ENServFromSide2PlanWorkShort> list = new Vector<ENServFromSide2PlanWorkShort>();

	public final int getTotalCount() {return totalCount;}
	public final void setTotalCount(int aValue) {totalCount = aValue;}

	public final Vector<ENServFromSide2PlanWorkShort> getList() {return list;}
	public final void setList(Vector<ENServFromSide2PlanWorkShort> aValue) {list = aValue;}

	public final com.ksoe.energynet.valueobject.brief.ENServFromSide2PlanWorkShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null)?0:list.size();
	}

} // end of List for ENServFromSide2PlanWork

