
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENServicesObject2Prov;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.ENServicesObject2ProvShort;

public class ENServicesObject2ProvShortList implements Serializable {

	public int totalCount = 0;
	public Vector<ENServicesObject2ProvShort> list = new Vector<ENServicesObject2ProvShort>();

	public final int getTotalCount() {return totalCount;}
	public final void setTotalCount(int aValue) {totalCount = aValue;}

	public final Vector<ENServicesObject2ProvShort> getList() {return list;}
	public final void setList(Vector<ENServicesObject2ProvShort> aValue) {list = aValue;}

	public final com.ksoe.energynet.valueobject.brief.ENServicesObject2ProvShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null)?0:list.size();
	}

} // end of List for ENServicesObject2Prov

