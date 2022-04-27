
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENTransportDep2User;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.ENTransportDep2UserShort;

public class ENTransportDep2UserShortList implements Serializable {

	private static final long serialVersionUID = 1L;

	public int totalCount = 0;
	public Vector<ENTransportDep2UserShort> list = new Vector<ENTransportDep2UserShort>();

	public final int getTotalCount() {return totalCount;}
	public final void setTotalCount(int aValue) {totalCount = aValue;}

	public final Vector<ENTransportDep2UserShort> getList() {return list;}
	public final void setList(Vector<ENTransportDep2UserShort> aValue) {list = aValue;}

	public final com.ksoe.energynet.valueobject.brief.ENTransportDep2UserShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null)?0:list.size();
	}

} // end of List for ENTransportDep2User

