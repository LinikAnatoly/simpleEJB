
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENActIncomeTech2DFDoc;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.ENActIncomeTech2DFDocShort;

public class ENActIncomeTech2DFDocShortList implements Serializable {

	private static final long serialVersionUID = 1L;

	public int totalCount = 0;
	public Vector<ENActIncomeTech2DFDocShort> list = new Vector<ENActIncomeTech2DFDocShort>();

	public final int getTotalCount() {return totalCount;}
	public final void setTotalCount(int aValue) {totalCount = aValue;}

	public final Vector<ENActIncomeTech2DFDocShort> getList() {return list;}
	public final void setList(Vector<ENActIncomeTech2DFDocShort> aValue) {list = aValue;}

	public final com.ksoe.energynet.valueobject.brief.ENActIncomeTech2DFDocShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null)?0:list.size();
	}

} // end of List for ENActIncomeTech2DFDoc

