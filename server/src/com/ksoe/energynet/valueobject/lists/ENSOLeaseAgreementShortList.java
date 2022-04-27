
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENSOLeaseAgreement;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.ENSOLeaseAgreementShort;

public class ENSOLeaseAgreementShortList implements Serializable {

	private static final long serialVersionUID = 1L;

	public int totalCount = 0;
	public Vector<ENSOLeaseAgreementShort> list = new Vector<ENSOLeaseAgreementShort>();

	public final int getTotalCount() {return totalCount;}
	public final void setTotalCount(int aValue) {totalCount = aValue;}

	public final Vector<ENSOLeaseAgreementShort> getList() {return list;}
	public final void setList(Vector<ENSOLeaseAgreementShort> aValue) {list = aValue;}

	public final com.ksoe.energynet.valueobject.brief.ENSOLeaseAgreementShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null)?0:list.size();
	}

} // end of List for ENSOLeaseAgreement

