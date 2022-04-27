
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENFuelInventarizationItem;  	
  */

import java.util.Vector;

import com.ksoe.energynet.valueobject.brief.ENFuelInventarizationItemShort;

import java.io.Serializable;

public class ENFuelInventarizationItemShortList implements Serializable {

  public int totalCount = 0;
  public Vector<ENFuelInventarizationItemShort> list = new Vector<>();

  public final int getTotalCount() {return totalCount;}
  public final void setTotalCount(int aValue) {totalCount = aValue;}

  public final Vector<ENFuelInventarizationItemShort> getList() {return list;}
  public final void setList(Vector aValue) {list = aValue;}

  public final com.ksoe.energynet.valueobject.brief.ENFuelInventarizationItemShort get(int anIndex)
  {
    return (com.ksoe.energynet.valueobject.brief.ENFuelInventarizationItemShort)list.get(anIndex);
  }

  public final int size()
  {
    return (list == null)?0:list.size();
  }

} // end of List for ENFuelInventarizationItem

