
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENCountersStateVerification;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.ENCountersStateVerificationShort;

public class ENCountersStateVerificationShortList implements Serializable {

	public int totalCount = 0;
	public Vector<ENCountersStateVerificationShort> list = new Vector<ENCountersStateVerificationShort>();

	public final int getTotalCount() {return totalCount;}
	public final void setTotalCount(int aValue) {totalCount = aValue;}

	public final Vector<ENCountersStateVerificationShort> getList() {return list;}
	public final void setList(Vector<ENCountersStateVerificationShort> aValue) {list = aValue;}

	public final com.ksoe.energynet.valueobject.brief.ENCountersStateVerificationShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null)?0:list.size();
	}

} // end of List for ENCountersStateVerification

