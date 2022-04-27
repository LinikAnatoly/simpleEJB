
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2021 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENActIncome2Prov;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.ENActIncome2ProvShort;

public class ENActIncome2ProvShortList implements Serializable {

	private static final long serialVersionUID = 1L;

	public int totalCount = 0;
	public Vector<ENActIncome2ProvShort> list = new Vector<ENActIncome2ProvShort>();

	public final int getTotalCount() {return totalCount;}
	public final void setTotalCount(int aValue) {totalCount = aValue;}

	public final Vector<ENActIncome2ProvShort> getList() {return list;}
	public final void setList(Vector<ENActIncome2ProvShort> aValue) {list = aValue;}

	public final com.ksoe.energynet.valueobject.brief.ENActIncome2ProvShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null)?0:list.size();
	}

} // end of List for ENActIncome2Prov

