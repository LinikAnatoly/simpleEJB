
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENDocAttachmentAction;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.ENDocAttachmentActionShort;

public class ENDocAttachmentActionShortList implements Serializable {

	private static final long serialVersionUID = 1L;

	public int totalCount = 0;
	public Vector<ENDocAttachmentActionShort> list = new Vector<ENDocAttachmentActionShort>();

	public final int getTotalCount() {return totalCount;}
	public final void setTotalCount(int aValue) {totalCount = aValue;}

	public final Vector<ENDocAttachmentActionShort> getList() {return list;}
	public final void setList(Vector<ENDocAttachmentActionShort> aValue) {list = aValue;}

	public final com.ksoe.energynet.valueobject.brief.ENDocAttachmentActionShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null)?0:list.size();
	}

} // end of List for ENDocAttachmentAction

