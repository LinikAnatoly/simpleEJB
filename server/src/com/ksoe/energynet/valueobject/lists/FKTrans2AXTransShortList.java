
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2017 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for FKTrans2AXTrans;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.FKTrans2AXTransShort;

public class FKTrans2AXTransShortList implements Serializable {

	public int totalCount = 0;
	public Vector<FKTrans2AXTransShort> list = new Vector<FKTrans2AXTransShort>();

	public final int getTotalCount() {return totalCount;}
	public final void setTotalCount(int aValue) {totalCount = aValue;}

	public final Vector<FKTrans2AXTransShort> getList() {return list;}
	public final void setList(Vector<FKTrans2AXTransShort> aValue) {list = aValue;}

	public final com.ksoe.energynet.valueobject.brief.FKTrans2AXTransShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null)?0:list.size();
	}

} // end of List for FKTrans2AXTrans

