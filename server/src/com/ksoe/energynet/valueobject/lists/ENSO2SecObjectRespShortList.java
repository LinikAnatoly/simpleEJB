
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENSO2SecObjectResp;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.ENSO2SecObjectRespShort;

public class ENSO2SecObjectRespShortList implements Serializable {

	private static final long serialVersionUID = 1L;

	public int totalCount = 0;
	public Vector<ENSO2SecObjectRespShort> list = new Vector<ENSO2SecObjectRespShort>();

	public final int getTotalCount() {return totalCount;}
	public final void setTotalCount(int aValue) {totalCount = aValue;}

	public final Vector<ENSO2SecObjectRespShort> getList() {return list;}
	public final void setList(Vector<ENSO2SecObjectRespShort> aValue) {list = aValue;}

	public final com.ksoe.energynet.valueobject.brief.ENSO2SecObjectRespShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null)?0:list.size();
	}

} // end of List for ENSO2SecObjectResp

