
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for FINMaterials;  	
  */

import java.io.Serializable;
import java.util.Vector;

import com.ksoe.energynet.valueobject.FINMaterials;

public class FINMaterialsList implements Serializable {

  /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
public int totalCount = 0;
  public Vector<FINMaterials> list = new Vector<FINMaterials>();

  public final int getTotalCount() {return totalCount;}
  public final void setTotalCount(int aValue) {totalCount = aValue;}

  public final Vector<FINMaterials> getList() {return list;}
  public final void setList(Vector<FINMaterials> aValue) {list = aValue;}

  public final FINMaterials get(int anIndex)
  {
    return list.get(anIndex);
  }

  public final int size()
  {
    return (list == null)?0:list.size();
  }

} // end of List for FINMaterials

