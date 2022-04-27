
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENTransportOrder;  	
  */

import java.io.Serializable;
import java.util.Date;


public class ENTransportOrderShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public String numbergen;
    public Date timeStart ;
    public Date timeFinal ;
    public Date dateStart ;
    public Date dateFinal ;
    public Date dateEdit ;
    public String userGen;
    public int transportOrderStatusCode = Integer.MIN_VALUE;
    public String transportOrderStatusName;
    public int planRefCode = Integer.MIN_VALUE;
    public Date planRefDateGen;
    public Date planRefDateStart;
    public Date planRefDateFinal;
    public int planRefKindCode = Integer.MIN_VALUE;
    public String planRefKindName;
    public int planRefYearGen = Integer.MIN_VALUE;
    public int planRefMonthGen = Integer.MIN_VALUE;
    public int planRefYearOriginal = Integer.MIN_VALUE;
    public int planRefMonthOriginal = Integer.MIN_VALUE;
    public String planRefUserGen;
    public Date planRefDateEdit;
    public String planRefWorkOrderNumber;
    public Date planRefDateWorkOrder;
    public String planRefPriConnectionNumber;
    public int planRefServicesFSideFinId = Integer.MIN_VALUE;
    public String planRefServicesFSideCnNum;
    public int transportCode = Integer.MIN_VALUE;
    public String transportName;
    public int transportRealCode = Integer.MIN_VALUE;
    public String transportRealName;
    public String transportRealInvNumber;
    public String transportRealGosNumber;
    public int transportDepartmentCode = Integer.MIN_VALUE;
    public String transportDepartmentName;
    public String elementName;
    public String finMOLName;
    public String finExecutor;
    public int parentRefCode = Integer.MIN_VALUE;
    public String parentRefNumbergen;
    public Date parentRefTimeStart;
    public Date parentRefTimeFinal;
    public Date parentRefDateStart;
    public Date parentRefDateFinal;
    public Date parentRefDateEdit;
    public String parentRefUserGen;
    public String planRefDepartmentName;
    public int travelSheetCode;
    public String travelSheetNumber;
    public int unOrderedTransportQty = Integer.MIN_VALUE;
    public int orderedTransportQty = Integer.MIN_VALUE;
    public int isAssignment;
    public int isApproved = Integer.MIN_VALUE;
    public int isRejected = Integer.MIN_VALUE;
    public String finMolPhoneNumber;
	public String mechanicFinMolCode;
	
	public Date minRideOut;
	public Date maxRideIn;
    

    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }
    public void setNumbergen(String aValue){
       numbergen = aValue;
    }

    public String getNumbergen(){
       return numbergen;
    }
    public void setTimeStart(Date aValue){
       timeStart = aValue;
    }

    public Date getTimeStart(){
       return timeStart;
    }

    public void setTimeFinal(Date aValue){
       timeFinal = aValue;
    }

    public Date getTimeFinal(){
       return timeFinal;
    }

    public void setDateStart(Date aValue){
       dateStart = aValue;
    }

    public Date getDateStart(){
       return dateStart;
    }

    public void setDateFinal(Date aValue){
       dateFinal = aValue;
    }

    public Date getDateFinal(){
       return dateFinal;
    }
 public void setIsApproved(int aValue){
       isApproved = aValue;
    }

    public int getIsApproved(){
       return isApproved;
    }
    public void setIsRejected(int aValue){
       isRejected = aValue;
    }

    public int getIsRejected(){
       return isRejected;
    }

    public void setDateEdit(Date aValue){
       dateEdit = aValue;
    }

    public Date getDateEdit(){
       return dateEdit;
    }
    public void setUserGen(String aValue){
       userGen = aValue;
    }

    public String getUserGen(){
       return userGen;
    }


    public void setTransportOrderStatusCode(int aValue){
       transportOrderStatusCode = aValue;
    }
    public int getTransportOrderStatusCode(){
       return transportOrderStatusCode;
    }

    public void setTransportOrderStatusName(String aValue){
       transportOrderStatusName = aValue;
    }
    public String getTransportOrderStatusName(){
       return transportOrderStatusName;
    }
    public void setPlanRefCode(int aValue){
       planRefCode = aValue;
    }
    public int getPlanRefCode(){
       return planRefCode;
    }


    public void setPlanRefDateGen(Date aValue){
       planRefDateGen = aValue;
    }
    public Date getPlanRefDateGen(){
       return planRefDateGen;
    }


    public void setPlanRefDateStart(Date aValue){
       planRefDateStart = aValue;
    }
    public Date getPlanRefDateStart(){
       return planRefDateStart;
    }


    public void setPlanRefDateFinal(Date aValue){
       planRefDateFinal = aValue;
    }
    public Date getPlanRefDateFinal(){
       return planRefDateFinal;
    }

    public void setPlanRefYearGen(int aValue){
       planRefYearGen = aValue;
    }
    public int getPlanRefYearGen(){
       return planRefYearGen;
    }

    public void setPlanRefMonthGen(int aValue){
       planRefMonthGen = aValue;
    }
    public int getPlanRefMonthGen(){
       return planRefMonthGen;
    }

    public void setPlanRefYearOriginal(int aValue){
       planRefYearOriginal = aValue;
    }
    public int getPlanRefYearOriginal(){
       return planRefYearOriginal;
    }

    public void setPlanRefMonthOriginal(int aValue){
       planRefMonthOriginal = aValue;
    }
    public int getPlanRefMonthOriginal(){
       return planRefMonthOriginal;
    }

    public void setPlanRefUserGen(String aValue){
       planRefUserGen = aValue;
    }
    public String getPlanRefUserGen(){
       return planRefUserGen;
    }


    public void setPlanRefDateEdit(Date aValue){
       planRefDateEdit = aValue;
    }
    public Date getPlanRefDateEdit(){
       return planRefDateEdit;
    }

    public void setPlanRefWorkOrderNumber(String aValue){
       planRefWorkOrderNumber = aValue;
    }
    public String getPlanRefWorkOrderNumber(){
       return planRefWorkOrderNumber;
    }


    public void setPlanRefDateWorkOrder(Date aValue){
       planRefDateWorkOrder = aValue;
    }
    public Date getPlanRefDateWorkOrder(){
       return planRefDateWorkOrder;
    }

    public void setPlanRefPriConnectionNumber(String aValue){
       planRefPriConnectionNumber = aValue;
    }
    public String getPlanRefPriConnectionNumber(){
       return planRefPriConnectionNumber;
    }

    public void setPlanRefServicesFSideFinId(int aValue){
       planRefServicesFSideFinId = aValue;
    }
    public int getPlanRefServicesFSideFinId(){
       return planRefServicesFSideFinId;
    }

    public void setPlanRefServicesFSideCnNum(String aValue){
       planRefServicesFSideCnNum = aValue;
    }
    public String getPlanRefServicesFSideCnNum(){
       return planRefServicesFSideCnNum;
    }

    public void setTransportCode(int aValue){
       transportCode = aValue;
    }
    public int getTransportCode(){
       return transportCode;
    }

    public void setTransportName(String aValue){
       transportName = aValue;
    }
    public String getTransportName(){
       return transportName;
    }

    public void setTransportRealCode(int aValue){
       transportRealCode = aValue;
    }
    public int getTransportRealCode(){
       return transportRealCode;
    }

    public void setTransportRealName(String aValue){
       transportRealName = aValue;
    }
    public String getTransportRealName(){
       return transportRealName;
    }

    public void setTransportRealInvNumber(String aValue){
       transportRealInvNumber = aValue;
    }
    public String getTransportRealInvNumber(){
       return transportRealInvNumber;
    }

    public void setTransportRealGosNumber(String aValue){
       transportRealGosNumber = aValue;
    }
    public String getTransportRealGosNumber(){
       return transportRealGosNumber;
    }

    public void setTransportDepartmentCode(int aValue){
       transportDepartmentCode = aValue;
    }
    public int getTransportDepartmentCode(){
       return transportDepartmentCode;
    }

    public void setTransportDepartmentName(String aValue){
       transportDepartmentName = aValue;
    }
    public String getTransportDepartmentName(){
       return transportDepartmentName;
    }
    public void setElementName(String aValue){
       elementName = aValue;
    }
    public String getElementName(){
       return elementName;
    }
    
    public void setFinMOLName(String aValue){
        finMOLName = aValue;
     }
     public String getFinMOLName(){
        return finMOLName;
     }

     public void setFinExecutor(String aValue){
         finExecutor = aValue;
      }
      public String getFinExecutor(){
         return finExecutor;
      }

    public void setParentRefCode(int aValue){
       parentRefCode = aValue;
    }
    public int getParentRefCode(){
       return parentRefCode;
    }

    public void setParentRefNumbergen(String aValue){
       parentRefNumbergen = aValue;
    }
    public String getParentRefNumbergen(){
       return parentRefNumbergen;
    }


    public void setParentRefTimeStart(Date aValue){
       parentRefTimeStart = aValue;
    }
    public Date getParentRefTimeStart(){
       return parentRefTimeStart;
    }


    public void setParentRefTimeFinal(Date aValue){
       parentRefTimeFinal = aValue;
    }
    public Date getParentRefTimeFinal(){
       return parentRefTimeFinal;
    }


    public void setParentRefDateStart(Date aValue){
       parentRefDateStart = aValue;
    }
    public Date getParentRefDateStart(){
       return parentRefDateStart;
    }


    public void setParentRefDateFinal(Date aValue){
       parentRefDateFinal = aValue;
    }
    public Date getParentRefDateFinal(){
       return parentRefDateFinal;
    }

    public void setParentRefDateEdit(Date aValue){
       parentRefDateEdit = aValue;
    }
    public Date getParentRefDateEdit(){
       return parentRefDateEdit;
    }

    public void setParentRefUserGen(String aValue){
       parentRefUserGen = aValue;
    }
    public String getParentRefUserGen(){
       return parentRefUserGen;
    }
    
    public void setPlanRefKindName(String aValue){
    	planRefKindName = aValue;
     }
     public String getPlanRefKindName(){
        return planRefKindName;
     }
     
     public int getPlanRefKindCode(){
         return planRefKindCode;
      }

      public void setPlanRefKindCode(int aValue){
    	  planRefKindCode = aValue;
      }

      public void setPlanRefDepartmentName(String aValue){
          planRefDepartmentName = aValue;
       }
       public String getPlanRefDepartmentName(){
          return planRefDepartmentName;
       }
       
       public void setTravelSheetCode(int aValue){
           travelSheetCode = aValue;
        }
        public int getTravelSheetCode(){
           return travelSheetCode;
        }
      
        public void setTravelSheetNumber(String aValue){
            travelSheetNumber = aValue;
        }
         public String getTravelSheetNumber(){
            return travelSheetNumber;
        }
         
         public void setUnOrderedTransportQty(int aValue){
             unOrderedTransportQty = aValue;
          }
          public int getUnOrderedTransportQty(){
             return unOrderedTransportQty;
          }

          public void setorderedTransportQty(int aValue){
              orderedTransportQty = aValue;
           }
           public int getorderedTransportQty(){
              return orderedTransportQty;
           }
           
          public void setIsAssignment(int aValue){
               isAssignment = aValue;
            }

          public int getIsAssignment(){
               return isAssignment;
            }
          
          public void setFinMolPhoneNumber(String aValue){
              finMolPhoneNumber = aValue;
           }

           public String getFinMolPhoneNumber(){
              return finMolPhoneNumber;
           }

           public String getMechanicFinMolCode() {
       		return mechanicFinMolCode;
       	}

       	public void setMechanicFinMolCode(String mechanicFinMolCode) {
       		this.mechanicFinMolCode = mechanicFinMolCode;
       	}

		public Date getMinRideOut() {
			return minRideOut;
		}

		public void setMinRideOut(Date minRideOut) {
			this.minRideOut = minRideOut;
		}

		public Date getMaxRideIn() {
			return maxRideIn;
		}

		public void setMaxRideIn(Date maxRideIn) {
			this.maxRideIn = maxRideIn;
		}
}