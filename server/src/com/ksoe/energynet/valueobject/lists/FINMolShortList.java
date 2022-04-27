
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for FINMol;  	
  */

import java.io.Serializable;
import java.util.Vector;

import com.ksoe.energynet.valueobject.brief.FINMolShort;

public class FINMolShortList implements Serializable {
	private static final long serialVersionUID = 1L;
	
	public int totalCount = 0;
  public Vector<FINMolShort> list = new Vector<FINMolShort>();

  public final int getTotalCount() {return totalCount;}
  public final void setTotalCount(int aValue) {totalCount = aValue;}

  public final Vector<FINMolShort> getList() {return list;}
  public final void setList(Vector<FINMolShort> aValue) {list = aValue;}

  public final com.ksoe.energynet.valueobject.brief.FINMolShort get(int anIndex)
  {
    return (com.ksoe.energynet.valueobject.brief.FINMolShort)list.get(anIndex);
  }

  public final int size()
  {
    return (list == null)?0:list.size();
  }

} // end of List for FINMol

