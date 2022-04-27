
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENAct2DFDocDecree;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.ENAct2DFDocDecreeShort;

public class ENAct2DFDocDecreeShortList implements Serializable {

	private static final long serialVersionUID = 1L;

	public int totalCount = 0;
	public Vector<ENAct2DFDocDecreeShort> list = new Vector<ENAct2DFDocDecreeShort>();

	public final int getTotalCount() {return totalCount;}
	public final void setTotalCount(int aValue) {totalCount = aValue;}

	public final Vector<ENAct2DFDocDecreeShort> getList() {return list;}
	public final void setList(Vector<ENAct2DFDocDecreeShort> aValue) {list = aValue;}

	public final com.ksoe.energynet.valueobject.brief.ENAct2DFDocDecreeShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null)?0:list.size();
	}

} // end of List for ENAct2DFDocDecree

