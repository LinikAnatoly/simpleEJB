
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENAct2DFDocDecree;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENActRef;

public class ENAct2DFDocDecree implements Serializable {

    public int  code = Integer.MIN_VALUE;
    public String  commentGen; 
    public String  userAdd; 
    public Date dateAdd ;
    public String  userGen; 
    public Date dateEdit ;
    public long  modify_time = Long.MIN_VALUE;
    public String  specifications; 
    public int  numberHours = Integer.MIN_VALUE;
    public int  DFDocDecreeCode = Integer.MIN_VALUE;
    public int  dfDocCode = Integer.MIN_VALUE;
    public String  responsFIO; 
    public String  responsPosition; 
    public String  responsGenitiveFIO; 
    public String  responsGenitivePosition; 
    public String  responsSurname; 
    public String  responsSurnameGenitive; 
    public String  responsName; 
    public String  responsNameGenitive; 
    public String  responsPatronimic; 
    public String  responsPatronimicGenitive; 
    public String  departmentName; 
    public String  departmentNameGenitive; 
    public ENActRef actRef = new ENActRef();
    public int settingDecreeCode = Integer.MIN_VALUE; 
    public static final String tableName = "ENACT2DFDOCDECREE";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENACT2DFDOCDECREE.CODE";
    public static final String commentGen_Attr = "commentGen";
    public static final String commentGen_Field = "COMMENTGEN";
    public static final String commentGen_QFielld = "ENACT2DFDOCDECREE.COMMENTGEN";
    public static final String userAdd_Attr = "userAdd";
    public static final String userAdd_Field = "USERADD";
    public static final String userAdd_QFielld = "ENACT2DFDOCDECREE.USERADD";
    public static final String dateAdd_Attr = "dateAdd";
    public static final String dateAdd_Field = "DATEADD";
    public static final String dateAdd_QFielld = "ENACT2DFDOCDECREE.DATEADD";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENACT2DFDOCDECREE.USERGEN";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENACT2DFDOCDECREE.DATEEDIT";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENACT2DFDOCDECREE.MODIFY_TIME";
    public static final String specifications_Attr = "specifications";
    public static final String specifications_Field = "SPECIFICATIONS";
    public static final String specifications_QFielld = "ENACT2DFDOCDECREE.SPECIFICATIONS";
    public static final String numberHours_Attr = "numberHours";
    public static final String numberHours_Field = "NUMBERHOURS";
    public static final String numberHours_QFielld = "ENACT2DFDOCDECREE.NUMBERHOURS";
    public static final String DFDocDecreeCode_Attr = "DFDocDecreeCode";
    public static final String DFDocDecreeCode_Field = "DFDOCDECREECODE";
    public static final String DFDocDecreeCode_QFielld = "ENACT2DFDOCDECREE.DFDOCDECREECODE";
    public static final String dfDocCode_Attr = "dfDocCode";
    public static final String dfDocCode_Field = "DFDOCCODE";
    public static final String dfDocCode_QFielld = "ENACT2DFDOCDECREE.DFDOCCODE";
    public static final String responsFIO_Attr = "responsFIO";
    public static final String responsFIO_Field = "RESPONSFIO";
    public static final String responsFIO_QFielld = "ENACT2DFDOCDECREE.RESPONSFIO";
    public static final String responsPosition_Attr = "responsPosition";
    public static final String responsPosition_Field = "RESPONSPOSITION";
    public static final String responsPosition_QFielld = "ENACT2DFDOCDECREE.RESPONSPOSITION";
    public static final String responsGenitiveFIO_Attr = "responsGenitiveFIO";
    public static final String responsGenitiveFIO_Field = "RESPONSGENITIVEFIO";
    public static final String responsGenitiveFIO_QFielld = "ENACT2DFDOCDECREE.RESPONSGENITIVEFIO";
    public static final String responsGenitivePosition_Attr = "responsGenitivePosition";
    public static final String responsGenitivePosition_Field = "RESPONSGENITIVEPOSITION";
    public static final String responsGenitivePosition_QFielld = "ENACT2DFDOCDECREE.RESPONSGENITIVEPOSITIN";
    public static final String responsSurname_Attr = "responsSurname";
    public static final String responsSurname_Field = "RESPONSSURNAME";
    public static final String responsSurname_QFielld = "ENACT2DFDOCDECREE.RESPONSSURNAME";
    public static final String responsSurnameGenitive_Attr = "responsSurnameGenitive";
    public static final String responsSurnameGenitive_Field = "RESPONSSURNAMEGENITIVE";
    public static final String responsSurnameGenitive_QFielld = "ENACT2DFDOCDECREE.RESPONSSURNAMEGENITIVE";
    public static final String responsName_Attr = "responsName";
    public static final String responsName_Field = "RESPONSNAME";
    public static final String responsName_QFielld = "ENACT2DFDOCDECREE.RESPONSNAME";
    public static final String responsNameGenitive_Attr = "responsNameGenitive";
    public static final String responsNameGenitive_Field = "RESPONSNAMEGENITIVE";
    public static final String responsNameGenitive_QFielld = "ENACT2DFDOCDECREE.RESPONSNAMEGENITIVE";
    public static final String responsPatronimic_Attr = "responsPatronimic";
    public static final String responsPatronimic_Field = "RESPONSPATRONIMIC";
    public static final String responsPatronimic_QFielld = "ENACT2DFDOCDECREE.RESPONSPATRONIMIC";
    public static final String responsPatronimicGenitive_Attr = "responsPatronimicGenitive";
    public static final String responsPatronimicGenitive_Field = "RESPONSPATRONIMICGENITIVE";
    public static final String responsPatronimicGenitive_QFielld = "ENACT2DFDOCDECREE.RESPONSPATRONIMICGENTV";
    public static final String departmentName_Attr = "departmentName";
    public static final String departmentName_Field = "DEPARTMENTNAME";
    public static final String departmentName_QFielld = "ENACT2DFDOCDECREE.DEPARTMENTNAME";
    public static final String departmentNameGenitive_Attr = "departmentNameGenitive";
    public static final String departmentNameGenitive_Field = "DEPARTMENTNAMEGENITIVE";
    public static final String departmentNameGenitive_QFielld = "ENACT2DFDOCDECREE.DEPARTMENTNAMEGENITIVE";
    public static final String actRef_Attr = "actRef";
    public static final String actRef_Field = "ACTREFCODE";
    public static final String  actRef_QFielld = "ENACT2DFDOCDECREE.ACTREFCODE";


    public int getSettingDecreeCode() {
		return settingDecreeCode;
	}

	public void setSettingDecreeCode(int settingDecreeCode) {
		this.settingDecreeCode = settingDecreeCode;
	}


    
    
    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }


    public void setCommentGen(String aValue){
       commentGen = aValue;
    }

    public String getCommentGen(){
       return commentGen;
    }


    public void setUserAdd(String aValue){
       userAdd = aValue;
    }

    public String getUserAdd(){
       return userAdd;
    }


    public void setDateAdd(Date aValue){
       dateAdd = aValue;
    }

    public Date getDateAdd(){
       return dateAdd;
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


    public void setModify_time(long aValue){
       modify_time = aValue;
    }

    public long getModify_time(){
       return modify_time;
    }


    public void setSpecifications(String aValue){
       specifications = aValue;
    }

    public String getSpecifications(){
       return specifications;
    }


    public void setNumberHours(int aValue){
       numberHours = aValue;
    }

    public int getNumberHours(){
       return numberHours;
    }


    public void setDFDocDecreeCode(int aValue){
       DFDocDecreeCode = aValue;
    }

    public int getDFDocDecreeCode(){
       return DFDocDecreeCode;
    }


    public void setDfDocCode(int aValue){
       dfDocCode = aValue;
    }

    public int getDfDocCode(){
       return dfDocCode;
    }


    public void setResponsFIO(String aValue){
       responsFIO = aValue;
    }

    public String getResponsFIO(){
       return responsFIO;
    }


    public void setResponsPosition(String aValue){
       responsPosition = aValue;
    }

    public String getResponsPosition(){
       return responsPosition;
    }


    public void setResponsGenitiveFIO(String aValue){
       responsGenitiveFIO = aValue;
    }

    public String getResponsGenitiveFIO(){
       return responsGenitiveFIO;
    }


    public void setResponsGenitivePosition(String aValue){
       responsGenitivePosition = aValue;
    }

    public String getResponsGenitivePosition(){
       return responsGenitivePosition;
    }


    public void setResponsSurname(String aValue){
       responsSurname = aValue;
    }

    public String getResponsSurname(){
       return responsSurname;
    }


    public void setResponsSurnameGenitive(String aValue){
       responsSurnameGenitive = aValue;
    }

    public String getResponsSurnameGenitive(){
       return responsSurnameGenitive;
    }


    public void setResponsName(String aValue){
       responsName = aValue;
    }

    public String getResponsName(){
       return responsName;
    }


    public void setResponsNameGenitive(String aValue){
       responsNameGenitive = aValue;
    }

    public String getResponsNameGenitive(){
       return responsNameGenitive;
    }


    public void setResponsPatronimic(String aValue){
       responsPatronimic = aValue;
    }

    public String getResponsPatronimic(){
       return responsPatronimic;
    }


    public void setResponsPatronimicGenitive(String aValue){
       responsPatronimicGenitive = aValue;
    }

    public String getResponsPatronimicGenitive(){
       return responsPatronimicGenitive;
    }


    public void setDepartmentName(String aValue){
       departmentName = aValue;
    }

    public String getDepartmentName(){
       return departmentName;
    }


    public void setDepartmentNameGenitive(String aValue){
       departmentNameGenitive = aValue;
    }

    public String getDepartmentNameGenitive(){
       return departmentNameGenitive;
    }

    public void setActRef(ENActRef aValue){
       actRef = aValue;
    }

    public ENActRef getActRef(){
       return actRef;
    }

} // end of ENAct2DFDocDecreeValueObject

