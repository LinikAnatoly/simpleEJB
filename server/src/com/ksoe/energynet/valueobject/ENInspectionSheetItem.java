
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2022 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENInspectionSheetItem;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENInspectionSheetRef;
    import  com.ksoe.techcard.valueobject.references.TKClassificationTypeRef;
    import  com.ksoe.energynet.valueobject.references.ENElementRef;

public class ENInspectionSheetItem implements Serializable {

	public static final int ISDETECTING_NO = 0;
	public static final int ISDETECTING_YES = 1;



    public int  code = Integer.MIN_VALUE;
    public String  defectCode; 
    public String  defectName; 
    public String  commentGen; 
    public int  isDetecting = Integer.MIN_VALUE;
    public BigDecimal  countGen; 
    public BigDecimal  countDefects; 
    public BigDecimal  defectLength; 
    public BigDecimal  coefficientKi; 
    public BigDecimal  pointsPi; 
    public BigDecimal  weightXi; 
    public String  userGen; 
    public Date dateEdit;
    public long  modify_time = Long.MIN_VALUE;

    public ENInspectionSheetRef sheetRef = new ENInspectionSheetRef();
    public TKClassificationTypeRef classificationTypeRef = new TKClassificationTypeRef();
    public ENElementRef elementRef = new ENElementRef();

    public static final String tableName = "ENINSPECTIONSHEETITEM";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENINSPECTIONSHEETITEM.CODE";
    public static final String defectCode_Attr = "defectCode";
    public static final String defectCode_Field = "DEFECTCODE";
    public static final String defectCode_QFielld = "ENINSPECTIONSHEETITEM.DEFECTCODE";
    public static final String defectName_Attr = "defectName";
    public static final String defectName_Field = "DEFECTNAME";
    public static final String defectName_QFielld = "ENINSPECTIONSHEETITEM.DEFECTNAME";
    public static final String commentGen_Attr = "commentGen";
    public static final String commentGen_Field = "COMMENTGEN";
    public static final String commentGen_QFielld = "ENINSPECTIONSHEETITEM.COMMENTGEN";
    public static final String isDetecting_Attr = "isDetecting";
    public static final String isDetecting_Field = "ISDETECTING";
    public static final String isDetecting_QFielld = "ENINSPECTIONSHEETITEM.ISDETECTING";
    public static final String countGen_Attr = "countGen";
    public static final String countGen_Field = "COUNTGEN";
    public static final String countGen_QFielld = "ENINSPECTIONSHEETITEM.COUNTGEN";
    public static final String countDefects_Attr = "countDefects";
    public static final String countDefects_Field = "COUNTDEFECTS";
    public static final String countDefects_QFielld = "ENINSPECTIONSHEETITEM.COUNTDEFECTS";
    public static final String defectLength_Attr = "defectLength";
    public static final String defectLength_Field = "DEFECTLENGTH";
    public static final String defectLength_QFielld = "ENINSPECTIONSHEETITEM.DEFECTLENGTH";
    public static final String coefficientKi_Attr = "coefficientKi";
    public static final String coefficientKi_Field = "COEFFICIENTKI";
    public static final String coefficientKi_QFielld = "ENINSPECTIONSHEETITEM.COEFFICIENTKI";
    public static final String pointsPi_Attr = "pointsPi";
    public static final String pointsPi_Field = "POINTSPI";
    public static final String pointsPi_QFielld = "ENINSPECTIONSHEETITEM.POINTSPI";
    public static final String weightXi_Attr = "weightXi";
    public static final String weightXi_Field = "WEIGHTXI";
    public static final String weightXi_QFielld = "ENINSPECTIONSHEETITEM.WEIGHTXI";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENINSPECTIONSHEETITEM.USERGEN";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENINSPECTIONSHEETITEM.DATEEDIT";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENINSPECTIONSHEETITEM.MODIFY_TIME";

    public static final String sheetRef_Attr = "sheetRef";
    public static final String sheetRef_Field = "SHEETREFCODE";
    public static final String  sheetRef_QFielld = "ENINSPECTIONSHEETITEM.SHEETREFCODE";
    public static final String classificationTypeRef_Attr = "classificationTypeRef";
    public static final String classificationTypeRef_Field = "CLASSIFICATIONTYPERFCD";
    public static final String  classificationTypeRef_QFielld = "ENINSPECTIONSHEETITEM.CLASSIFICATIONTYPERFCD";
    public static final String elementRef_Attr = "elementRef";
    public static final String elementRef_Field = "ELEMENTREFCODE";
    public static final String  elementRef_QFielld = "ENINSPECTIONSHEETITEM.ELEMENTREFCODE";



    public int getCode(){
       return code;
    }
    
    public void setCode(int code){
       this.code = code;
    }


    public String getDefectCode(){
       return defectCode;
    }
    
    public void setDefectCode(String defectCode){
       this.defectCode = defectCode;
    }


    public String getDefectName(){
       return defectName;
    }
    
    public void setDefectName(String defectName){
       this.defectName = defectName;
    }


    public String getCommentGen(){
       return commentGen;
    }
    
    public void setCommentGen(String commentGen){
       this.commentGen = commentGen;
    }


    public int getIsDetecting(){
       return isDetecting;
    }
    
    public void setIsDetecting(int isDetecting){
       this.isDetecting = isDetecting;
    }


    public BigDecimal getCountGen(){
       return countGen;
    }
    
    public void setCountGen(BigDecimal countGen){
       this.countGen = countGen;
    }


    public BigDecimal getCountDefects(){
       return countDefects;
    }
    
    public void setCountDefects(BigDecimal countDefects){
       this.countDefects = countDefects;
    }


    public BigDecimal getDefectLength(){
       return defectLength;
    }
    
    public void setDefectLength(BigDecimal defectLength){
       this.defectLength = defectLength;
    }


    public BigDecimal getCoefficientKi(){
       return coefficientKi;
    }
    
    public void setCoefficientKi(BigDecimal coefficientKi){
       this.coefficientKi = coefficientKi;
    }


    public BigDecimal getPointsPi(){
       return pointsPi;
    }
    
    public void setPointsPi(BigDecimal pointsPi){
       this.pointsPi = pointsPi;
    }


    public BigDecimal getWeightXi(){
       return weightXi;
    }
    
    public void setWeightXi(BigDecimal weightXi){
       this.weightXi = weightXi;
    }


    public String getUserGen(){
       return userGen;
    }
    
    public void setUserGen(String userGen){
       this.userGen = userGen;
    }


    public Date getDateEdit(){
       return dateEdit;
    }

    public void setDateEdit(Date dateEdit){
       this.dateEdit = dateEdit;
    }


    public long getModify_time(){
       return modify_time;
    }
    
    public void setModify_time(long modify_time){
       this.modify_time = modify_time;
    }

    public ENInspectionSheetRef getSheetRef(){
       return sheetRef;
    }
    
    public void setSheetRef(ENInspectionSheetRef sheetRef){
       this.sheetRef = sheetRef;
    }
    public TKClassificationTypeRef getClassificationTypeRef(){
       return classificationTypeRef;
    }
    
    public void setClassificationTypeRef(TKClassificationTypeRef classificationTypeRef){
       this.classificationTypeRef = classificationTypeRef;
    }
    public ENElementRef getElementRef(){
       return elementRef;
    }
    
    public void setElementRef(ENElementRef elementRef){
       this.elementRef = elementRef;
    }

} // end of ENInspectionSheetItemValueObject

