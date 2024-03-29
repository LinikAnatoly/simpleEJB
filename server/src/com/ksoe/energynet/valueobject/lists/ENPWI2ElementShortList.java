
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2016 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENPWI2Element;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.ENPWI2ElementShort;

public class ENPWI2ElementShortList implements Serializable {

  public int totalCount = 0;
  public Vector<ENPWI2ElementShort> list = new Vector<ENPWI2ElementShort>();

  public final int getTotalCount() {return totalCount;}
  public final void setTotalCount(int aValue) {totalCount = aValue;}

  public final Vector getList() {return list;}
  public final void setList(Vector aValue) {list = aValue;}

  public final com.ksoe.energynet.valueobject.brief.ENPWI2ElementShort get(int anIndex)
  {
    return (com.ksoe.energynet.valueobject.brief.ENPWI2ElementShort)list.get(anIndex);
  }

  public final int size()
  {
    return (list == null)?0:list.size();
  }

} // end of List for ENPWI2Element

