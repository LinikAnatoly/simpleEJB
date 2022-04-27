
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2019 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENBankingDetails;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.ENBankingDetailsShort;

public class ENBankingDetailsShortList implements Serializable {

	private static final long serialVersionUID = 1L;

	public int totalCount = 0;
	public Vector<ENBankingDetailsShort> list = new Vector<ENBankingDetailsShort>();

	public final int getTotalCount() {return totalCount;}
	public final void setTotalCount(int aValue) {totalCount = aValue;}

	public final Vector<ENBankingDetailsShort> getList() {return list;}
	public final void setList(Vector<ENBankingDetailsShort> aValue) {list = aValue;}

	public final com.ksoe.energynet.valueobject.brief.ENBankingDetailsShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null)?0:list.size();
	}

} // end of List for ENBankingDetails

