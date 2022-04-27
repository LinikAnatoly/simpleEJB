
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENAct2ENPlanWork;  	
  */

import java.io.Serializable;
import java.util.Vector;

import com.ksoe.energynet.valueobject.brief.ENAct2ENPlanWorkShort;

public class ENAct2ENPlanWorkShortList implements Serializable {

  public int totalCount = 0;
  public Vector<ENAct2ENPlanWorkShort> list = new Vector<ENAct2ENPlanWorkShort>();

  public final int getTotalCount() {return totalCount;}
  public final void setTotalCount(int aValue) {totalCount = aValue;}

  public final Vector getList() {return list;}
  public final void setList(Vector aValue) {list = aValue;}

  public final com.ksoe.energynet.valueobject.brief.ENAct2ENPlanWorkShort get(int anIndex)
  {
    return (com.ksoe.energynet.valueobject.brief.ENAct2ENPlanWorkShort)list.get(anIndex);
  }

  public final int size()
  {
    return (list == null)?0:list.size();
  }

} // end of List for ENAct2ENPlanWork

