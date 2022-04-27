
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2021 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENSheets4SOItemsTemplate;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.ENSheets4SOItemsTemplateShort;

public class ENSheets4SOItemsTemplateShortList implements Serializable {

	private static final long serialVersionUID = 1L;

	public int totalCount = 0;
	public Vector<ENSheets4SOItemsTemplateShort> list = new Vector<ENSheets4SOItemsTemplateShort>();

	public final int getTotalCount() {return totalCount;}
	public final void setTotalCount(int aValue) {totalCount = aValue;}

	public final Vector<ENSheets4SOItemsTemplateShort> getList() {return list;}
	public final void setList(Vector<ENSheets4SOItemsTemplateShort> aValue) {list = aValue;}

	public final com.ksoe.energynet.valueobject.brief.ENSheets4SOItemsTemplateShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null)?0:list.size();
	}

} // end of List for ENSheets4SOItemsTemplate

