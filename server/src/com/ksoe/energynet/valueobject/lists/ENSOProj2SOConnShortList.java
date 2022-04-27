
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENSOProj2SOConn;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.ENSOProj2SOConnShort;

public class ENSOProj2SOConnShortList implements Serializable {

	public int totalCount = 0;
	public Vector<ENSOProj2SOConnShort> list = new Vector<ENSOProj2SOConnShort>();

	public final int getTotalCount() {return totalCount;}
	public final void setTotalCount(int aValue) {totalCount = aValue;}

	public final Vector<ENSOProj2SOConnShort> getList() {return list;}
	public final void setList(Vector<ENSOProj2SOConnShort> aValue) {list = aValue;}

	public final com.ksoe.energynet.valueobject.brief.ENSOProj2SOConnShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null)?0:list.size();
	}

} // end of List for ENSOProj2SOConn

