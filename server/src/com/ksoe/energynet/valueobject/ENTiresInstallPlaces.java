
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENTiresInstallPlaces;
  */

import java.io.Serializable;


public class ENTiresInstallPlaces implements Serializable {

	public static final int ZAPAS = 9;

    public int code = Integer.MIN_VALUE;
    public String  name;
    public static final String tableName = "ENTIRESINSTALLPLACES";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENTIRESINSTALLPLACES.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENTIRESINSTALLPLACES.NAME";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setName(String aValue){
       name = aValue;
    }

    public String getName(){
       return name;
    }

;

} // end of ENTiresInstallPlacesValueObject

