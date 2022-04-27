
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENServicesObject2FKInfo;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.ENServicesObject2FKInfoShort;

public class ENServicesObject2FKInfoShortList implements Serializable {

	public int totalCount = 0;
	public Vector<ENServicesObject2FKInfoShort> list = new Vector<ENServicesObject2FKInfoShort>();

	public final int getTotalCount() {return totalCount;}
	public final void setTotalCount(int aValue) {totalCount = aValue;}

	public final Vector<ENServicesObject2FKInfoShort> getList() {return list;}
	public final void setList(Vector<ENServicesObject2FKInfoShort> aValue) {list = aValue;}

	public final com.ksoe.energynet.valueobject.brief.ENServicesObject2FKInfoShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null)?0:list.size();
	}

} // end of List for ENServicesObject2FKInfo

