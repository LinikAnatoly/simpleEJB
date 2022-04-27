
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENMarkEstimateENMarkEstimate;
  */

import java.io.Serializable;

public class ENMarkEstimate implements Serializable {

    public int code = Integer.MIN_VALUE;
    public String userName;
    public ENMark mark = new ENMark();
    public ENEstimateItem estimateItem = new ENEstimateItem();
    public static final String tableName = "ENMARKESTIMATE";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENMARKESTIMATE.CODE";
    public static final String userName_Attr = "userName";
    public static final String userName_Field = "USERNAME";
    public static final String userName_QFielld = "ENMARKESTIMATE.USERNAME";
    public static final String mark_Attr = "mark";
    public static final String mark_Field = "MARKCODE";
    public static final String  mark_QFielld = "ENMARKESTIMATE.MARKCODE";
    public static final String estimateItem_Attr = "estimateItem";
    public static final String estimateItem_Field = "ESTIMATEITEMCODE";
    public static final String  estimateItem_QFielld = "ENMARKESTIMATE.ESTIMATEITEMCODE";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setUserName(String aValue){
       userName = aValue;
    }

    public String getUserName(){
       return userName;
    }

    public void setMark(ENMark aValue){
       mark = aValue;
    }

    public ENMark getMark(){
       return mark;
    }
    public void setEstimateItem(ENEstimateItem aValue){
       estimateItem = aValue;
    }

    public ENEstimateItem getEstimateItem(){
       return estimateItem;
    }

} // end of ENMarkEstimateValueObject