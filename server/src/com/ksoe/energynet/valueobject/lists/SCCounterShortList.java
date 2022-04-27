
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2017 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for SCCounter;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.SCCounterShort;

public class SCCounterShortList implements Serializable {

	public int totalCount = 0;
	public Vector<SCCounterShort> list = new Vector<SCCounterShort>();

	public final int getTotalCount() {return totalCount;}
	public final void setTotalCount(int aValue) {totalCount = aValue;}

	public final Vector<SCCounterShort> getList() {return list;}
	public final void setList(Vector<SCCounterShort> aValue) {list = aValue;}

	public final com.ksoe.energynet.valueobject.brief.SCCounterShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null)?0:list.size();
	}

} // end of List for SCCounter

