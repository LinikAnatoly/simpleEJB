
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENAct2CostRecovery;  	
  */

import java.util.Vector;

import com.ksoe.energynet.valueobject.brief.ENAct2CostRecoveryShort;

import java.io.Serializable;

public class ENAct2CostRecoveryShortList implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	
public int totalCount = 0;
  public Vector<ENAct2CostRecoveryShort> list = new Vector<ENAct2CostRecoveryShort>();

  public final int getTotalCount() {return totalCount;}
  public final void setTotalCount(int aValue) {totalCount = aValue;}

  public final Vector<ENAct2CostRecoveryShort> getList() {return list;}
  public final void setList(Vector<ENAct2CostRecoveryShort> aValue) {list = aValue;}

  public final ENAct2CostRecoveryShort get(int anIndex)
  {
    return list.get(anIndex);
  }

  public final int size()
  {
    return (list == null)?0:list.size();
  }

} // end of List for ENAct2CostRecovery

