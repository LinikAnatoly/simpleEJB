
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENReconstrModernOZ2DFDoc;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.ENReconstrModernOZ2DFDocShort;

public class ENReconstrModernOZ2DFDocShortList implements Serializable {

	private static final long serialVersionUID = 1L;

	public int totalCount = 0;
	public Vector<ENReconstrModernOZ2DFDocShort> list = new Vector<ENReconstrModernOZ2DFDocShort>();

	public final int getTotalCount() {return totalCount;}
	public final void setTotalCount(int aValue) {totalCount = aValue;}

	public final Vector<ENReconstrModernOZ2DFDocShort> getList() {return list;}
	public final void setList(Vector<ENReconstrModernOZ2DFDocShort> aValue) {list = aValue;}

	public final com.ksoe.energynet.valueobject.brief.ENReconstrModernOZ2DFDocShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null)?0:list.size();
	}

} // end of List for ENReconstrModernOZ2DFDoc

