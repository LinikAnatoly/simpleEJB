
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENAct2OSTable;  	
  */

import java.util.Vector;

import com.ksoe.energynet.valueobject.brief.ENAct2OSTableShort;

import java.io.Serializable;

public class ENAct2OSTableShortList implements Serializable {

  /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
public int totalCount = 0;
  public Vector<ENAct2OSTableShort> list = new Vector<ENAct2OSTableShort>();

  public final int getTotalCount() {return totalCount;}
  public final void setTotalCount(int aValue) {totalCount = aValue;}

  public final Vector<ENAct2OSTableShort> getList() {return list;}
  public final void setList(Vector<ENAct2OSTableShort> aValue) {list = aValue;}

  public final com.ksoe.energynet.valueobject.brief.ENAct2OSTableShort get(int anIndex)
  {
    return (com.ksoe.energynet.valueobject.brief.ENAct2OSTableShort)list.get(anIndex);
  }

  public final int size()
  {
    return (list == null)?0:list.size();
  }

} // end of List for ENAct2OSTable

