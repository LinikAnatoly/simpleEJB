
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2017 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENAgreeData2ServicesObject;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.ENAgreeData2ServicesObjectShort;

public class ENAgreeData2ServicesObjectShortList implements Serializable {

	public int totalCount = 0;
	public Vector<ENAgreeData2ServicesObjectShort> list = new Vector<ENAgreeData2ServicesObjectShort>();

	public final int getTotalCount() {return totalCount;}
	public final void setTotalCount(int aValue) {totalCount = aValue;}

	public final Vector<ENAgreeData2ServicesObjectShort> getList() {return list;}
	public final void setList(Vector<ENAgreeData2ServicesObjectShort> aValue) {list = aValue;}

	public final com.ksoe.energynet.valueobject.brief.ENAgreeData2ServicesObjectShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null)?0:list.size();
	}

} // end of List for ENAgreeData2ServicesObject

