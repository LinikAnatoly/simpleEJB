
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENAct2Prov;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.ENAct2ProvShort;

public class ENAct2ProvShortList implements Serializable {

	private static final long serialVersionUID = 1L;

	public int totalCount = 0;
	public Vector<ENAct2ProvShort> list = new Vector<ENAct2ProvShort>();

	public final int getTotalCount() {return totalCount;}
	public final void setTotalCount(int aValue) {totalCount = aValue;}

	public final Vector<ENAct2ProvShort> getList() {return list;}
	public final void setList(Vector<ENAct2ProvShort> aValue) {list = aValue;}

	public final com.ksoe.energynet.valueobject.brief.ENAct2ProvShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null)?0:list.size();
	}

} // end of List for ENAct2Prov

