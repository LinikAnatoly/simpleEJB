
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENTechCond2PlanWork;  	
  */

import java.io.Serializable;
import java.util.Vector;

import com.ksoe.energynet.valueobject.brief.ENTechCond2PlanWorkShort;

public class ENTechCond2PlanWorkShortList implements Serializable {

  public int totalCount = 0;
  public Vector<ENTechCond2PlanWorkShort> list = new Vector<ENTechCond2PlanWorkShort>();

  public final int getTotalCount() {return totalCount;}
  public final void setTotalCount(int aValue) {totalCount = aValue;}

  public final Vector<ENTechCond2PlanWorkShort> getList() {return list;}
  public final void setList(Vector<ENTechCond2PlanWorkShort> aValue) {list = aValue;}

  public final ENTechCond2PlanWorkShort get(int anIndex)
  {
    return list.get(anIndex);
  }

  public final int size()
  {
    return (list == null)?0:list.size();
  }

} // end of List for ENTechCond2PlanWork

