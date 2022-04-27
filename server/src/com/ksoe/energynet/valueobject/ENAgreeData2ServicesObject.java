
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2017 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENAgreeData2ServicesObject;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENServicesObjectRef;
    import  com.ksoe.energynet.valueobject.references.ENWarrantRef;

public class ENAgreeData2ServicesObject implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public String  numberDoc; 
    public String  rights; 
    public String  connectionObj; 
    public int  buildersArea = Integer.MIN_VALUE; 
    public String  voltage; 
    public String  amperage; 
    public String  add1_1; 
    public String  add1_2; 
    public String  add2; 
    public String  add3; 
    public String  add4; 
    public String  userGen; 
    public Date dateEdit ;
    public int  printHolder = Integer.MIN_VALUE; 
    public ENServicesObjectRef servicesObjectRef = new ENServicesObjectRef();
    public ENWarrantRef warrantRef = new ENWarrantRef();
    public static final String tableName = "ENAGREEDATA2SERVCSBJCT";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENAGREEDATA2SERVCSBJCT.CODE";
    public static final String numberDoc_Attr = "numberDoc";
    public static final String numberDoc_Field = "NUMBERDOC";
    public static final String numberDoc_QFielld = "ENAGREEDATA2SERVCSBJCT.NUMBERDOC";
    public static final String rights_Attr = "rights";
    public static final String rights_Field = "RIGHTS";
    public static final String rights_QFielld = "ENAGREEDATA2SERVCSBJCT.RIGHTS";
    public static final String connectionObj_Attr = "connectionObj";
    public static final String connectionObj_Field = "CONNECTIONOBJ";
    public static final String connectionObj_QFielld = "ENAGREEDATA2SERVCSBJCT.CONNECTIONOBJ";
    public static final String buildersArea_Attr = "buildersArea";
    public static final String buildersArea_Field = "BUILDERSAREA";
    public static final String buildersArea_QFielld = "ENAGREEDATA2SERVCSBJCT.BUILDERSAREA";
    public static final String voltage_Attr = "voltage";
    public static final String voltage_Field = "VOLTAGE";
    public static final String voltage_QFielld = "ENAGREEDATA2SERVCSBJCT.VOLTAGE";
    public static final String amperage_Attr = "amperage";
    public static final String amperage_Field = "AMPERAGE";
    public static final String amperage_QFielld = "ENAGREEDATA2SERVCSBJCT.AMPERAGE";
    public static final String add1_1_Attr = "add1_1";
    public static final String add1_1_Field = "ADD1_1";
    public static final String add1_1_QFielld = "ENAGREEDATA2SERVCSBJCT.ADD1_1";
    public static final String add1_2_Attr = "add1_2";
    public static final String add1_2_Field = "ADD1_2";
    public static final String add1_2_QFielld = "ENAGREEDATA2SERVCSBJCT.ADD1_2";
    public static final String add2_Attr = "add2";
    public static final String add2_Field = "ADD2";
    public static final String add2_QFielld = "ENAGREEDATA2SERVCSBJCT.ADD2";
    public static final String add3_Attr = "add3";
    public static final String add3_Field = "ADD3";
    public static final String add3_QFielld = "ENAGREEDATA2SERVCSBJCT.ADD3";
    public static final String add4_Attr = "add4";
    public static final String add4_Field = "ADD4";
    public static final String add4_QFielld = "ENAGREEDATA2SERVCSBJCT.ADD4";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENAGREEDATA2SERVCSBJCT.USERGEN";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENAGREEDATA2SERVCSBJCT.DATEEDIT";
    public static final String printHolder_Attr = "printHolder";
    public static final String printHolder_Field = "PRINTHOLDER";
    public static final String printHolder_QFielld = "ENAGREEDATA2SERVCSBJCT.PRINTHOLDER";
    public static final String servicesObjectRef_Attr = "servicesObjectRef";
    public static final String servicesObjectRef_Field = "SERVICESOBJECTREFCODE";
    public static final String  servicesObjectRef_QFielld = "ENAGREEDATA2SERVCSBJCT.SERVICESOBJECTREFCODE";
    public static final String warrantRef_Attr = "warrantRef";
    public static final String warrantRef_Field = "WARRANTREFCODE";
    public static final String  warrantRef_QFielld = "ENAGREEDATA2SERVCSBJCT.WARRANTREFCODE";



    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }


    public void setNumberDoc(String aValue){
       numberDoc = aValue;
    }

    public String getNumberDoc(){
       return numberDoc;
    }


    public void setRights(String aValue){
       rights = aValue;
    }

    public String getRights(){
       return rights;
    }


    public void setConnectionObj(String aValue){
       connectionObj = aValue;
    }

    public String getConnectionObj(){
       return connectionObj;
    }


    public void setBuildersArea(int aValue){
       buildersArea = aValue;
    }

    public int getBuildersArea(){
       return buildersArea;
    }


    public void setVoltage(String aValue){
       voltage = aValue;
    }

    public String getVoltage(){
       return voltage;
    }


    public void setAmperage(String aValue){
       amperage = aValue;
    }

    public String getAmperage(){
       return amperage;
    }


    public void setAdd1_1(String aValue){
       add1_1 = aValue;
    }

    public String getAdd1_1(){
       return add1_1;
    }


    public void setAdd1_2(String aValue){
       add1_2 = aValue;
    }

    public String getAdd1_2(){
       return add1_2;
    }


    public void setAdd2(String aValue){
       add2 = aValue;
    }

    public String getAdd2(){
       return add2;
    }


    public void setAdd3(String aValue){
       add3 = aValue;
    }

    public String getAdd3(){
       return add3;
    }


    public void setAdd4(String aValue){
       add4 = aValue;
    }

    public String getAdd4(){
       return add4;
    }


    public void setUserGen(String aValue){
       userGen = aValue;
    }

    public String getUserGen(){
       return userGen;
    }


    public void setDateEdit(Date aValue){
       dateEdit = aValue;
    }

    public Date getDateEdit(){
       return dateEdit;
    }


    public void setPrintHolder(int aValue){
       printHolder = aValue;
    }

    public int getPrintHolder(){
       return printHolder;
    }

    public void setServicesObjectRef(ENServicesObjectRef aValue){
       servicesObjectRef = aValue;
    }

    public ENServicesObjectRef getServicesObjectRef(){
       return servicesObjectRef;
    }
    public void setWarrantRef(ENWarrantRef aValue){
       warrantRef = aValue;
    }

    public ENWarrantRef getWarrantRef(){
       return warrantRef;
    }

} // end of ENAgreeData2ServicesObjectValueObject

