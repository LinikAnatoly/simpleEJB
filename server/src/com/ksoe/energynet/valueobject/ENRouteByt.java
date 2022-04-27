
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENRouteByt;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.ENElement;

public class ENRouteByt implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public String  name; 
    public String  numbergen; 
    public int  routeCode = Integer.MIN_VALUE; 
    public String  domain_info; 
    public long  modify_time = Long.MIN_VALUE;
    public ENElement element = new ENElement();
    public static final String tableName = "ENROUTEBYT";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENROUTEBYT.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENROUTEBYT.NAME";
    public static final String numbergen_Attr = "numbergen";
    public static final String numbergen_Field = "NUMBERGEN";
    public static final String numbergen_QFielld = "ENROUTEBYT.NUMBERGEN";
    public static final String routeCode_Attr = "routeCode";
    public static final String routeCode_Field = "ROUTECODE";
    public static final String routeCode_QFielld = "ENROUTEBYT.ROUTECODE";
    public static final String domain_info_Attr = "domain_info";
    public static final String domain_info_Field = "DOMAIN_INFO";
    public static final String domain_info_QFielld = "ENROUTEBYT.DOMAIN_INFO";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENROUTEBYT.MODIFY_TIME";
    public static final String element_Attr = "element";
    public static final String element_Field = "ELEMENTCODE";
    public static final String  element_QFielld = "ENROUTEBYT.ELEMENTCODE";


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

    public void setNumbergen(String aValue){
       numbergen = aValue;
    }

    public String getNumbergen(){
       return numbergen;
    }

    public void setRouteCode(int aValue){
       routeCode = aValue;
    }

    public int getRouteCode(){
       return routeCode;
    }

    public void setDomain_info(String aValue){
       domain_info = aValue;
    }

    public String getDomain_info(){
       return domain_info;
    }

    public void setModify_time(long aValue){
       modify_time = aValue;
    }

    public long getModify_time(){
       return modify_time;
    }

    public void setElement(ENElement aValue){
       element = aValue;
    }

    public ENElement getElement(){
       return element;
    }

} // end of ENRouteBytValueObject

