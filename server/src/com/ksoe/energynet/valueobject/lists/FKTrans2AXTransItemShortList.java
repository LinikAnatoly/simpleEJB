
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2017 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for FKTrans2AXTransItem;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.FKTrans2AXTransItemShort;

public class FKTrans2AXTransItemShortList implements Serializable {

	public int totalCount = 0;
	public Vector<FKTrans2AXTransItemShort> list = new Vector<FKTrans2AXTransItemShort>();

	public final int getTotalCount() {return totalCount;}
	public final void setTotalCount(int aValue) {totalCount = aValue;}

	public final Vector<FKTrans2AXTransItemShort> getList() {return list;}
	public final void setList(Vector<FKTrans2AXTransItemShort> aValue) {list = aValue;}

	public final com.ksoe.energynet.valueobject.brief.FKTrans2AXTransItemShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null)?0:list.size();
	}

} // end of List for FKTrans2AXTransItem

