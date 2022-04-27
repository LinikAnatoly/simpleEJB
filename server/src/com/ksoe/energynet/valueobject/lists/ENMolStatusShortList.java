
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2011 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENMolStatus;  	
  */

import java.io.Serializable;
import java.util.Vector;

import com.ksoe.energynet.valueobject.brief.ENMolStatusShort;

public class ENMolStatusShortList implements Serializable {
	private static final long serialVersionUID = 1L;
	
public int totalCount = 0;
  public Vector<ENMolStatusShort> list = new Vector<ENMolStatusShort>();

  public final int getTotalCount() {return totalCount;}
  public final void setTotalCount(int aValue) {totalCount = aValue;}

  public final Vector<ENMolStatusShort> getList() {return list;}
  public final void setList(Vector<ENMolStatusShort> aValue) {list = aValue;}

  public final ENMolStatusShort get(int anIndex)
  {
    return list.get(anIndex);
  }

  public final int size()
  {
    return (list == null)?0:list.size();
  }

} // end of List for ENMolStatus

