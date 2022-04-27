
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENActIncomServ2Prov;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.ENActIncomServ2ProvShort;

public class ENActIncomServ2ProvShortList implements Serializable {

	private static final long serialVersionUID = 1L;

	public int totalCount = 0;
	public Vector<ENActIncomServ2ProvShort> list = new Vector<ENActIncomServ2ProvShort>();

	public final int getTotalCount() {return totalCount;}
	public final void setTotalCount(int aValue) {totalCount = aValue;}

	public final Vector<ENActIncomServ2ProvShort> getList() {return list;}
	public final void setList(Vector<ENActIncomServ2ProvShort> aValue) {list = aValue;}

	public final com.ksoe.energynet.valueobject.brief.ENActIncomServ2ProvShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null)?0:list.size();
	}

} // end of List for ENActIncomServ2Prov

