
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for SCUsageInputItemOZ2ENAct;  	
  */

import java.io.Serializable;
import java.util.Vector;

import com.ksoe.energynet.valueobject.brief.SCUsageInputItemOZ2ENActShort;

public class SCUsageInputItemOZ2ENActShortList implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
public int totalCount = 0;
  public Vector<SCUsageInputItemOZ2ENActShort> list = new Vector<SCUsageInputItemOZ2ENActShort>();

  public final int getTotalCount() {return totalCount;}
  public final void setTotalCount(int aValue) {totalCount = aValue;}

  public final Vector<SCUsageInputItemOZ2ENActShort> getList() {return list;}
  public final void setList(Vector<SCUsageInputItemOZ2ENActShort> aValue) {list = aValue;}

  public final SCUsageInputItemOZ2ENActShort get(int anIndex)
  {
    return list.get(anIndex);
  }

  public final int size()
  {
    return (list == null)?0:list.size();
  }

} // end of List for SCUsageInputItemOZ2ENAct

