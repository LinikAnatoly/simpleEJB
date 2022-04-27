
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENActInvestType2DFDoc;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.ENActInvestType2DFDocShort;

public class ENActInvestType2DFDocShortList implements Serializable {

	private static final long serialVersionUID = 1L;

	public int totalCount = 0;
	public Vector<ENActInvestType2DFDocShort> list = new Vector<ENActInvestType2DFDocShort>();

	public final int getTotalCount() {return totalCount;}
	public final void setTotalCount(int aValue) {totalCount = aValue;}

	public final Vector<ENActInvestType2DFDocShort> getList() {return list;}
	public final void setList(Vector<ENActInvestType2DFDocShort> aValue) {list = aValue;}

	public final com.ksoe.energynet.valueobject.brief.ENActInvestType2DFDocShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null)?0:list.size();
	}

} // end of List for ENActInvestType2DFDoc

