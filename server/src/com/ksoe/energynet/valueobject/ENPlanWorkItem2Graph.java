
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENPlanWorkItem2Graph;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENPlanWorkItemRef;
    import  com.ksoe.energynet.valueobject.references.ENPlanWorkRef;

public class ENPlanWorkItem2Graph implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public Date dayWork ;
    public long  modify_time = Long.MIN_VALUE;
    public String  userGen; 
    public Date dateEdit ;
    public BigDecimal  countgen; 
    public ENPlanWorkItemRef planWorkItemRef = new ENPlanWorkItemRef();
    public ENPlanWorkRef planWorkRef = new ENPlanWorkRef();
    public static final String tableName = "ENPLANWORKITEM2GRAPH";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENPLANWORKITEM2GRAPH.CODE";
    public static final String dayWork_Attr = "dayWork";
    public static final String dayWork_Field = "DAYWORK";
    public static final String dayWork_QFielld = "ENPLANWORKITEM2GRAPH.DAYWORK";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENPLANWORKITEM2GRAPH.MODIFY_TIME";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENPLANWORKITEM2GRAPH.USERGEN";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENPLANWORKITEM2GRAPH.DATEEDIT";
    public static final String countgen_Attr = "countgen";
    public static final String countgen_Field = "COUNTGEN";
    public static final String countgen_QFielld = "ENPLANWORKITEM2GRAPH.COUNTGEN";
    public static final String planWorkItemRef_Attr = "planWorkItemRef";
    public static final String planWorkItemRef_Field = "PLANWORKITEMREFCODE";
    public static final String  planWorkItemRef_QFielld = "ENPLANWORKITEM2GRAPH.PLANWORKITEMREFCODE";
    public static final String planWorkRef_Attr = "planWorkRef";
    public static final String planWorkRef_Field = "PLANWORKREFCODE";
    public static final String  planWorkRef_QFielld = "ENPLANWORKITEM2GRAPH.PLANWORKREFCODE";
    
    
    

	public int  month = Integer.MIN_VALUE;
    public int  year = Integer.MIN_VALUE;
    



    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }


    public void setDayWork(Date aValue){
       dayWork = aValue;
    }

    public Date getDayWork(){
       return dayWork;
    }


    public void setModify_time(long aValue){
       modify_time = aValue;
    }

    public long getModify_time(){
       return modify_time;
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


    public void setCountgen(BigDecimal aValue){
       countgen = aValue;
    }

    public BigDecimal getCountgen(){
       return countgen;
    }

    public void setPlanWorkItemRef(ENPlanWorkItemRef aValue){
       planWorkItemRef = aValue;
    }

    public ENPlanWorkItemRef getPlanWorkItemRef(){
       return planWorkItemRef;
    }
    public void setPlanWorkRef(ENPlanWorkRef aValue){
       planWorkRef = aValue;
    }

    public ENPlanWorkRef getPlanWorkRef(){
       return planWorkRef;
    }
    
    public int getMonth() {
		return month;
	}

	public void setMonth(int month) {
		this.month = month;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

} // end of ENPlanWorkItem2GraphValueObject

