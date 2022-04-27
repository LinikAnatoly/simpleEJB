
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENAct2FinKodIst;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.ENAct2FinKodIstShort;

public class ENAct2FinKodIstShortList implements Serializable {

	public int totalCount = 0;
	public Vector<ENAct2FinKodIstShort> list = new Vector<ENAct2FinKodIstShort>();

	public final int getTotalCount() {return totalCount;}
	public final void setTotalCount(int aValue) {totalCount = aValue;}

	public final Vector<ENAct2FinKodIstShort> getList() {return list;}
	public final void setList(Vector<ENAct2FinKodIstShort> aValue) {list = aValue;}

	public final com.ksoe.energynet.valueobject.brief.ENAct2FinKodIstShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null)?0:list.size();
	}

} // end of List for ENAct2FinKodIst

