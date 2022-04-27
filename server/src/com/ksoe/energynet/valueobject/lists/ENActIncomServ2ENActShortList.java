
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENActIncomServ2ENAct;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.ENActIncomServ2ENActShort;

public class ENActIncomServ2ENActShortList implements Serializable {

	private static final long serialVersionUID = 1L;

	public int totalCount = 0;
	public Vector<ENActIncomServ2ENActShort> list = new Vector<ENActIncomServ2ENActShort>();

	public final int getTotalCount() {return totalCount;}
	public final void setTotalCount(int aValue) {totalCount = aValue;}

	public final Vector<ENActIncomServ2ENActShort> getList() {return list;}
	public final void setList(Vector<ENActIncomServ2ENActShort> aValue) {list = aValue;}

	public final com.ksoe.energynet.valueobject.brief.ENActIncomServ2ENActShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null)?0:list.size();
	}

} // end of List for ENActIncomServ2ENAct

