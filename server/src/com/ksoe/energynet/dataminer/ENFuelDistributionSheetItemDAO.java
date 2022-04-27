
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.Vector;

import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENFuelDistributionSheetItemDAOGen;
import com.ksoe.energynet.logic.ENConsts;
import com.ksoe.energynet.valueobject.ENFuelDistributionSheet;
import com.ksoe.energynet.valueobject.ENFuelDistributionSheetItem;
import com.ksoe.energynet.valueobject.brief.ENFuelDistributionSheetItemShort;
import com.ksoe.energynet.valueobject.lists.ENFuelDistributionSheetItemShortList;

/**
 * DAO Object for ENFuelDistributionSheetItem;
 *
 */

public class ENFuelDistributionSheetItemDAO extends ENFuelDistributionSheetItemDAOGen {

    public ENFuelDistributionSheetItemDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENFuelDistributionSheetItemDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }
    
    
    public int add(ENFuelDistributionSheetItem anObject) throws PersistenceException
    {
    	anObject.userGen = getUserProfile().userName;
    	anObject.dateEdit = new Date();
     return super.add(anObject);
    }
    
    public void save(ENFuelDistributionSheetItem anObject) throws PersistenceException
    {
    	anObject.userGen = getUserProfile().userName;
    	anObject.dateEdit = new Date();
        super.save(anObject);
    }
    
    /*доступное топливо по декадам для видов деятельности*/
    public ENFuelDistributionSheetItemShortList getFreePMM(int ENFuelDistributionSheetCode) throws PersistenceException
    {
     ENFuelDistributionSheetItemShortList result = new ENFuelDistributionSheetItemShortList();
     ENFuelDistributionSheetItemShort anObject;
     result.list = new Vector();

     String     selectStr;
     Connection connection = getConnection();
     PreparedStatement statement = null;
     ResultSet  set = null;
    
     selectStr = "      select  \n" +
    		 "         case when freecount1 < 0 then 0 else freecount1 end as freecount1 \n" +
    		 "       , case when freecount2 < 0 then 0 else freecount2 end as freecount2 \n" +
    		 "       , case when freecount3 < 0 then 0 else freecount3 end as freecount3 \n" +
    		 "       , case when freecount4 < 0 then 0 else freecount4 end as freecount4 \n" +
    		 "       , case when freecount5 < 0 then 0 else freecount5 end as freecount5 \n" +
    		 "       , case when freecount6 < 0 then 0 else freecount6 end as freecount6 \n" +   	
    		 "       , case when freecount7 < 0 then 0 else freecount7 end as freecount7 \n" +      		 
    		 "       , dec  \n" +
    		 " from (  \n" +
    		 "  \n" +
    		 "      select  \n" +
    		 "         (sum1dec1/costpmmwithnds)::numeric(15,2)-approvecount1  as freecount1 \n" +
    		 "       , (sum2dec1/costpmmwithnds)::numeric(15,2)-approvecount2 as freecount2 \n" +
    		 "       , (sum3dec1/costpmmwithnds)::numeric(15,2)-approvecount3 as freecount3 \n" +
    		 "       , (sum4dec1/costpmmwithnds)::numeric(15,2)-approvecount4 as freecount4 \n" +
    		 "       , (sum5dec1/costpmmwithnds)::numeric(15,2)-approvecount5 as freecount5 \n" +
    		 "       , (sum6dec1/costpmmwithnds)::numeric(15,2)-approvecount6 as freecount6 \n" +
    		 "       , (sum7dec1/costpmmwithnds)::numeric(15,2)-approvecount7 as freecount7 \n" +    		 
    		 "       , dec1 as dec  \n" +
    		 "  \n" +
    		 "       from ( \n" +
    		 "         select fs.sum1dec1 , fs.sum2dec1 , fs.sum3dec1 , fs.sum4dec1 , fs.sum5dec1 , fs.sum6dec1 , fs.sum7dec1, fs.fueltyperefcode \n" +
    		 "         ,(select(m.cost*1.2)::numeric(15,3) from tkfueltype ft , tkmaterials m where ft.code  = fs.fueltyperefcode and ft.materialrefcode = m.code limit 1 ) as  \n" +
    		 " costpmmwithnds \n" +
    		 "         , 1 as dec1  \n" +
    		 "         , sum(fsi.count1) as approvecount1  , sum(fsi.count2) as approvecount2 , sum(fsi.count3) as approvecount3 , sum(fsi.count4) as approvecount4 , sum \n" +
    		 " (fsi.count5) as approvecount5 , sum(fsi.count6) as approvecount6 , sum(fsi.count7) as approvecount7  \n" +
    		 "         from enfueldistributionshet fs ,enfueldistributinshttm fsi \n" +
    		 "         where fs.code = "+ENFuelDistributionSheetCode+"  \n" +
    		 "         and fsi.fueldistributionrefcod = fs.code \n" +
    		 "         and fsi.decadenumber = 1 \n" +
    		 "         group by  fs.sum1dec1 , fs.sum2dec1 , fs.sum3dec1 , fs.sum4dec1 , fs.sum5dec1 , fs.sum6dec1 , fs.sum7dec1 , fs.fueltyperefcode \n" +
    		 "       ) as q1 \n" +
    		 "        UNION  \n" +
    		 "         \n" +
    		 "        select  \n" +
    		 "         (sum1dec2/costpmmwithnds)::numeric(15,2)-approvecount1  as freecount1 \n" +
    		 "       , (sum2dec2/costpmmwithnds)::numeric(15,2)-approvecount2 as freecount2 \n" +
    		 "       , (sum3dec2/costpmmwithnds)::numeric(15,2)-approvecount3 as freecount3 \n" +
    		 "       , (sum4dec2/costpmmwithnds)::numeric(15,2)-approvecount4 as freecount4 \n" +
    		 "       , (sum5dec2/costpmmwithnds)::numeric(15,2)-approvecount5 as freecount5 \n" +
    		 "       , (sum6dec2/costpmmwithnds)::numeric(15,2)-approvecount6 as freecount6 \n" +
    		 "       , (sum7dec2/costpmmwithnds)::numeric(15,2)-approvecount7 as freecount7 \n" +    		 
    		 "       , dec2 as dec  \n" +
    		 "  \n" +
    		 "       from ( \n" +
    		 "         select fs.sum1dec2 , fs.sum2dec2 , fs.sum3dec2 , fs.sum4dec2 , fs.sum5dec2 , fs.sum6dec2 , fs.sum7dec2, fs.fueltyperefcode \n" +
    		 "         ,(select (m.cost*1.2)::numeric(15,3) from tkfueltype ft , tkmaterials m where ft.code  = fs.fueltyperefcode and ft.materialrefcode = m.code limit 1 ) as  \n" +
    		 " costpmmwithnds \n" +
    		 "         , 2 as dec2  \n" +
    		 "         , sum(fsi.count1) as approvecount1  , sum(fsi.count2) as approvecount2 , sum(fsi.count3) as approvecount3 , sum(fsi.count4) as approvecount4 , sum \n" +
    		 " (fsi.count5) as approvecount5 , sum(fsi.count6) as approvecount6, sum(fsi.count7) as approvecount7 \n" +
    		 "         from enfueldistributionshet fs ,enfueldistributinshttm fsi \n" +
    		 "         where fs.code = "+ENFuelDistributionSheetCode+"  \n" +
    		 "         and fsi.fueldistributionrefcod = fs.code \n" +
    		 "         and fsi.decadenumber = 2 \n" +
    		 "         group by  fs.sum1dec2 , fs.sum2dec2 , fs.sum3dec2 , fs.sum4dec2 , fs.sum5dec2 ,  fs.sum6dec2 , fs.sum7dec2 , fs.fueltyperefcode \n" +
    		 "       ) as q2 \n" +
    		 "  \n" +
    		 "       UNION  \n" +
    		 "  \n" +
    		 "        select  \n" +
    		 "         (sum1dec3/costpmmwithnds)::numeric(15,2)-approvecount1  as freecount1 \n" +
    		 "       , (sum2dec3/costpmmwithnds)::numeric(15,2)-approvecount2 as freecount2 \n" +
    		 "       , (sum3dec3/costpmmwithnds)::numeric(15,2)-approvecount3 as freecount3 \n" +
    		 "       , (sum4dec3/costpmmwithnds)::numeric(15,2)-approvecount4 as freecount4 \n" +
    		 "       , (sum5dec3/costpmmwithnds)::numeric(15,2)-approvecount5 as freecount5 \n" +
    		 "       , (sum6dec3/costpmmwithnds)::numeric(15,2)-approvecount6 as freecount6 \n" +
    		 "       , (sum7dec3/costpmmwithnds)::numeric(15,2)-approvecount7 as freecount7 \n" +    		 
    		 "       , dec3 as dec  \n" +
    		 "  \n" +
    		 "       from ( \n" +
    		 "         select fs.sum1dec3 , fs.sum2dec3 , fs.sum3dec3 , fs.sum4dec3 , fs.sum5dec3 , fs.sum6dec3 , fs.sum7dec3 , fs.fueltyperefcode \n" +
    		 "         ,(select (m.cost*1.2)::numeric(15,3) from tkfueltype ft , tkmaterials m where ft.code  = fs.fueltyperefcode and ft.materialrefcode = m.code limit 1 ) as  \n" +
    		 " costpmmwithnds \n" +
    		 "         , 3 as dec3  \n" +
    		 "         , sum(fsi.count1) as approvecount1  , sum(fsi.count2) as approvecount2 , sum(fsi.count3) as approvecount3 , sum(fsi.count4) as approvecount4 , sum \n" +
    		 " (fsi.count5) as approvecount5 , sum(fsi.count6) as approvecount6 , sum(fsi.count7) as approvecount7 \n" +
    		 "         from enfueldistributionshet fs ,enfueldistributinshttm fsi \n" +
    		 "         where fs.code = "+ENFuelDistributionSheetCode+" \n" +
    		 "         and fsi.fueldistributionrefcod = fs.code \n" +
    		 "         and fsi.decadenumber = 3 \n" +
    		 "         group by  fs.sum1dec3 , fs.sum2dec3 , fs.sum3dec3 , fs.sum4dec3 , fs.sum5dec3 , fs.sum6dec3 , fs.sum7dec3 , fs.fueltyperefcode \n" +
    		 "       ) as q3 \n" +
    		 "  \n" +
    		 " ) q_all \n" +
    		 "  \n" +
    		 " order by dec \n" +
    		 "  \n" ;




     try
      {
       statement = connection.prepareStatement(selectStr);
       int number = 0;
       

       set = statement.executeQuery();
       int i;
       for (i = 0; set.next(); i++) {
        
         anObject = new ENFuelDistributionSheetItemShort();
         
         anObject.count1 = set.getBigDecimal(1);
         if(anObject.count1 != null)
             anObject.count1 = anObject.count1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
         
         anObject.count2 = set.getBigDecimal(2);
         if(anObject.count2 != null)
             anObject.count2 = anObject.count2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
         
         anObject.count3 = set.getBigDecimal(3);
         if(anObject.count3 != null)
             anObject.count3 = anObject.count3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
         
         anObject.count4 = set.getBigDecimal(4);
         if(anObject.count4 != null)
             anObject.count4 = anObject.count4.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
         
         anObject.count5 = set.getBigDecimal(5);
         if(anObject.count5 != null)
             anObject.count5 = anObject.count5.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
         
         anObject.count6 = set.getBigDecimal(6);
         if(anObject.count6 != null)
             anObject.count6 = anObject.count6.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
         
         anObject.count7 = set.getBigDecimal(7);
         if(anObject.count7 != null)
             anObject.count7 = anObject.count7.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
         
         anObject.decadeNumber = set.getInt(8);
         if ( set.wasNull() )
             anObject.decadeNumber = Integer.MIN_VALUE;
         

          result.list.add(anObject);
        }

       result.setTotalCount(i);
       return result;
      }
     catch(SQLException e)
      {
       System.out.println(e.getMessage()+"\nstatement - "+selectStr);
       throw new SystemException(e.getMessage(), e);
       
      }
     finally
      {
       try {if (set != null) set.close();}             catch (SQLException e) {}
       try {if (statement != null) statement.close();} catch (SQLException e) {}
       if(connection != getConnection())
        {
         try{connection.close();} catch(SQLException e){}
        }
      }
    }

  

} // end of ENFuelDistributionSheetItemDAO
