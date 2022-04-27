
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENServicesDelivery;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.ENServicesDeliveryShort;

public class ENServicesDeliveryShortList implements Serializable {

	private static final long serialVersionUID = 1L;

	public int totalCount = 0;
	public Vector<ENServicesDeliveryShort> list = new Vector<ENServicesDeliveryShort>();

	public final int getTotalCount() {return totalCount;}
	public final void setTotalCount(int aValue) {totalCount = aValue;}

	public final Vector<ENServicesDeliveryShort> getList() {return list;}
	public final void setList(Vector<ENServicesDeliveryShort> aValue) {list = aValue;}

	public final com.ksoe.energynet.valueobject.brief.ENServicesDeliveryShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null)?0:list.size();
	}

} // end of List for ENServicesDelivery

