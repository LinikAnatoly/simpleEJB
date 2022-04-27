
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2017 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for SCUsageInputItemOZ2Prov;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.SCUsageInputItemOZ2ProvShort;

public class SCUsageInputItemOZ2ProvShortList implements Serializable {

	public int totalCount = 0;
	public Vector<SCUsageInputItemOZ2ProvShort> list = new Vector<SCUsageInputItemOZ2ProvShort>();

	public final int getTotalCount() {return totalCount;}
	public final void setTotalCount(int aValue) {totalCount = aValue;}

	public final Vector<SCUsageInputItemOZ2ProvShort> getList() {return list;}
	public final void setList(Vector<SCUsageInputItemOZ2ProvShort> aValue) {list = aValue;}

	public final com.ksoe.energynet.valueobject.brief.SCUsageInputItemOZ2ProvShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null)?0:list.size();
	}

} // end of List for SCUsageInputItemOZ2Prov

