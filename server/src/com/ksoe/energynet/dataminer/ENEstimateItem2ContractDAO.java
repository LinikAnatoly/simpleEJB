
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.Vector;

import com.ksoe.authorization.valueobject.DataAccessType;
import com.ksoe.energynet.dataminer.generated.ENEstimateItem2ContractDAOGen;
import com.ksoe.energynet.valueobject.ENEstimateItem2Contract;
import com.ksoe.energynet.valueobject.brief.ENEstimateItem2ContractShort;
import com.ksoe.energynet.valueobject.lists.ENEstimateItem2ContractShortList;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;
import com.ksoe.lla.persistence.SequenceKey;
import com.ksoe.lla.persistence.SequenceValue;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.segregation.SegregationProcessor;

  /**
  *  DAO Object for ENEstimateItem2Contract;
  *
  */

public class ENEstimateItem2ContractDAO extends ENEstimateItem2ContractDAOGen {
	
	
	public void _collectAutoIncrementFields(ENEstimateItem2Contract anObject,
            Connection connection) throws PersistenceException {

        SequenceKey hashKey = new SequenceKey("ENESTIMATEITEM2CONTRCT", "CODE");
        Integer nextSeqValue = null;
        SequenceValue sequenceValue;
        synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
            if (sequenceValue == null) {
                sequenceValue = getNewSequenceValue("ENESTIMATEITEM2CONTRCT", "CODE");
                _sequenceTable.put(hashKey, sequenceValue);
            }
            if (!sequenceValue.isNextValueAvailable()) {
                sequenceValue = getNewSequenceValue("ENESTIMATEITEM2CONTRCT", "CODE");
                _sequenceTable.put(hashKey, sequenceValue);
            }
        }

        nextSeqValue = sequenceValue.getNextValue();
        if (nextSeqValue == null) {
            throw new PersistenceException(
                    "Can't obtain auto increment value from: ENESTIMATEITEM2CONTRCT");
        } else {
            anObject.code = nextSeqValue.intValue();
            return;
        }
    }

	public ENEstimateItem2ContractDAO(UserProfile anUserProfile,
			Connection aConnection) {
		super(anUserProfile, aConnection);
	}

	public ENEstimateItem2ContractDAO(Connection aConnection,
			UserProfile anUserProfile) {
		super(aConnection, anUserProfile);
	}

	@Override
	public int add(ENEstimateItem2Contract anObject)
			throws PersistenceException {

		anObject.dateEdit = new Date();
		anObject.userGen = getUserProfile().userName;

		return super.add(anObject);
	}


  /**
   * Получить кол-во материала по ТЕНДЕРНОМУ договору, еще не подвязанное под планы
   *
   * @param finDocCode - код договора из ФК
   * @param materialCode - код материала
   *
   * @return Кол-во материала
   */
  public BigDecimal getRestCountByContract(String finDocCode, int materialCode) throws PersistenceException
  {

    BigDecimal result = new BigDecimal(0);

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;


    selectStr =
        " select (counttotal - countbinded) as dif \n" +
        " from \n" +
        " ( \n" +
        " select m.name, ci.countgen as counttotal,  \n" +
        "        (select coalesce(sum(ec.countfact), 0) \n" +
        "         from enestimateitem2contrct ec, enestimateitem ei \n" +
        "         where ec.estimateitemcode = ei.code \n" +
        "           and ei.materialrefcode = m.code \n" +
        "           and ec.findocid = c.findocid \n" +
        "           and ec.findoccode = c.findoccode) as countbinded, \n" +
        "        ci.price, ci.cost,  \n" +
        "        c.contractnumber, c.contractdate, c.findocid, c.findoccode \n" +
        " from encontract c, encontractitem ci, tkmaterials m \n" +
        " where ci.contractcode = c.code \n" +
        "   and ci.materialcode = m.code  \n" +
        "   and c.findoccode = ? \n" +
        "   and m.code = ? \n" +
        "  \n" +
        " union all   \n" +
        "    \n" +
        " select m.name, 0 as counttotal,  \n" +
        "        coalesce(round(cast(sum(ec.countfact) as numeric), 6), 0) as countbinded, \n" +
        "        m.cost as price,  \n" +
        "        coalesce(round(cast(sum(ec.countfact) * m.cost as numeric), 2), 0) as cost, \n" +
        "        ec.contractnumber, ec.contractdate, ec.findocid, ec.findoccode \n" +
        " from enestimateitem2contrct ec, enestimateitem ei, tkmaterials m \n" +
        " where ec.estimateitemcode = ei.code \n" +
        "   and ei.materialrefcode = m.code \n" +
        "   and ((ec.findoccode not in (select c.findoccode from encontract c)) or \n" +
        "        (ei.materialrefcode not in (select ci.materialcode from encontractitem ci))) \n" +
        "   and ec.findoccode = ? \n" +
        "   and m.code = ? \n" +
        " group by m.name, m.cost,  \n" +
        "          ec.contractnumber, ec.contractdate, ec.findocid, ec.findoccode   \n" +
        " ) as qq \n" +
        "  \n";


    try
        {
        statement = connection.prepareStatement(selectStr);

        statement.setString(1, finDocCode);
        statement.setInt(2, materialCode);
        statement.setString(3, finDocCode);
        statement.setInt(4, materialCode);

        set = statement.executeQuery();

        if (set.next())
        {
            result = set.getBigDecimal(1);
            if (result != null)
            {
                result = result.setScale(6, BigDecimal.ROUND_HALF_UP);
            }
        }

        return result;

        }
    catch(SQLException e)
        {
        System.out.println(e.getMessage()+"\nstatement - "+selectStr);
        EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
        return null;
        }
    finally
        {
        try {if (set != null) set.close();}             catch (SQLException e) {}
        try {if (statement != null) statement.close();} catch (SQLException e) {}
        if(connection != super.getConnection())
        {
        try{connection.close();} catch(SQLException e){}
        }
        }


  }


  /**
   * Получить кол-во материала по ТЕНДЕРНОМУ договору  подвязанное под материалы плана
   *
   * @param finDocCode - код договора из ФК
   * @param materialCode - код материала
   *
   * @return Кол-во материала
   */
  public BigDecimal getCountBindedMaterialsByContract(String finDocCode, int materialCode) throws PersistenceException
  {

    BigDecimal result = new BigDecimal(0);

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;


    selectStr =

        " select coalesce(round(cast(sum(ec.countfact) as numeric), 6), 0) as countbinded  \n" +
        " from enestimateitem2contrct ec, enestimateitem ei, tkmaterials m \n" +
        " where ec.estimateitemcode = ei.code \n" +
        "   and ei.materialrefcode = m.code \n" +
        "   and ec.findoccode = ? \n" +
        "   and m.code = ? \n" ;


    try
        {
        statement = connection.prepareStatement(selectStr);

        statement.setString(1, finDocCode);
        statement.setInt(2, materialCode);

        set = statement.executeQuery();

        if (set.next())
        {
            result = set.getBigDecimal(1);
            if (result != null)
            {
                result = result.setScale(6, BigDecimal.ROUND_HALF_UP);
            }
        }

        return result;

        }
    catch(SQLException e)
        {
        System.out.println(e.getMessage()+"\nstatement - "+selectStr);
        EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
        return null;
        }
    finally
        {
        try {if (set != null) set.close();}             catch (SQLException e) {}
        try {if (statement != null) statement.close();} catch (SQLException e) {}
        if(connection != super.getConnection())
        {
        try{connection.close();} catch(SQLException e){}
        }
        }


  }


  @Override
public ENEstimateItem2ContractShortList getScrollableFilteredList(ENEstimateItem2Contract aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
  {
   ENEstimateItem2ContractShortList result = new ENEstimateItem2ContractShortList();
   ENEstimateItem2ContractShort anObject;
   result.list = new Vector();

   String     selectStr;
   Connection connection = getConnection();
   PreparedStatement statement = null;
   ResultSet  set = null;
   String     whereStr = "";
   String     condition = processCondition(anCondition);
   String     orderBy = processCondition(anOrderBy);

   if(orderBy.length() == 0)
    orderBy = "ENESTIMATEITEM2CONTRCT.CODE";

   if(quantity < 0)
    quantity = Integer.MAX_VALUE/2;

   if(getUserProfile() == null)
    throw new PersistenceException("Internal Error (User Profile Is Undefined)");

   selectStr = "SELECT "+
    "ENESTIMATEITEM2CONTRCT.CODE"+
    ",ENESTIMATEITEM2CONTRCT.COUNTFACT"+
    ",ENESTIMATEITEM2CONTRCT.CONTRACTNUMBER"+
    ",ENESTIMATEITEM2CONTRCT.CONTRACTDATE"+
    ",ENESTIMATEITEM2CONTRCT.FINDOCCODE"+
    ",ENESTIMATEITEM2CONTRCT.FINDOCID"+

     ", ENESTIMATEITEM.CODE " +
     ", ENESTIMATEITEM.COUNTGEN " +
     ", ENESTIMATEITEM.COUNTFACT " +

     ///// 27.03.14 NET-4345 Выбираем цену (без НДС) из позиции тендерного договора
     //", ENESTIMATEITEM.PRICE " +
     ", COALESCE((select ci.price from encontractitem ci, encontract c " +
     "            where ci.contractcode = c.code " +
     "              and c.findocid = ENESTIMATEITEM2CONTRCT.findocid " +
     "              and ci.materialcode = ENESTIMATEITEM.materialrefcode " +
     "            limit 1), 0) as price_tender " +
     /////

     ", ENESTIMATEITEM.COST " +
     ", ENESTIMATEITEM.ISUSEVAT " +
     ", ENESTIMATEITEM.DELIVERYTIME " +
     ", ENESTIMATEITEM.USEWORKTIME " +
     ", ENESTIMATEITEM.USERGEN " +
     ", ENESTIMATEITEM.DATEEDIT " +
    ", ENESTIMATEITEM2CONTRCT.ORGCODE" +
    ", RQPURCHASEITEM2ESTMTTM.CODE " +
	", RQPURCHASEITEM2ESTMTTM.COUNTGEN " +
	", RQPURCHASEITEM2ESTMTTM.COUNTPURCHASE " +
	", RQPURCHASEITEM2ESTMTTM.STATUSCOMMENT " +
	", ENESTIMATEITEM2CONTRCT.GENERALCONTRACTREFCODE " +

	" FROM ENESTIMATEITEM2CONTRCT LEFT JOIN RQPURCHASEITEM2ESTMTTM  ON ( RQPURCHASEITEM2ESTMTTM.CODE = ENESTIMATEITEM2CONTRCT.RQPURCHITM2ESTIMATECOD )" +
    ", ENESTIMATEITEM " +

   	"";
    whereStr = " ENESTIMATEITEM.CODE = ENESTIMATEITEM2CONTRCT.ESTIMATEITEMCODE" ; //+
       //selectStr = selectStr + " ${s} ENESTIMATEITEM2CONTRCT.CODE IN ( SELECT ENESTIMATEITEM2CONTRCT.CODE FROM ENESTIMATEITEM2CONTRCT ";

     if(aFilterObject != null)
     {
       if(aFilterObject.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENESTIMATEITEM2CONTRCT.CODE = ?";
       }
       if(aFilterObject.countFact != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENESTIMATEITEM2CONTRCT.COUNTFACT = ?";
       }
        if (aFilterObject.contractNumber != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.contractNumber.indexOf('*',0) < 0 && aFilterObject.contractNumber.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENESTIMATEITEM2CONTRCT.CONTRACTNUMBER) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENESTIMATEITEM2CONTRCT.CONTRACTNUMBER) LIKE UPPER(?)";
        }
       if(aFilterObject.contractDate != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENESTIMATEITEM2CONTRCT.CONTRACTDATE = ?";
       }
        if (aFilterObject.finDocCode != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.finDocCode.indexOf('*',0) < 0 && aFilterObject.finDocCode.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENESTIMATEITEM2CONTRCT.FINDOCCODE) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENESTIMATEITEM2CONTRCT.FINDOCCODE) LIKE UPPER(?)";
        }
       if(aFilterObject.finDocID != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENESTIMATEITEM2CONTRCT.FINDOCID = ?";
       }
       if(aFilterObject.estimateItem.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENESTIMATEITEM2CONTRCT.ESTIMATEITEMCODE = ? ";
       }
       if(aFilterObject.org.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENESTIMATEITEM2CONTRCT.ORGCODE = ? ";
       }

       if(aFilterObject.generalContractRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + " ENESTIMATEITEM2CONTRCT.GENERALCONTRACTREFCODE = ? ";
       }

     }



     if(condition.length() != 0)
     {
        if(whereStr.length() != 0)
           whereStr = whereStr + " AND ";

        whereStr = whereStr + " (" + condition + ")";
     }
//+ " WHERE" +  сделано выше ????
    if(whereStr.length() != 0)
        selectStr = selectStr + " WHERE " + whereStr;

   // selectStr = selectStr + ") ";

   selectStr = selectStr + " ORDER BY " + orderBy;

   try
    {
     statement = connection.prepareStatement(selectStr);
     int number = 0;
     if(aFilterObject != null){
        if(aFilterObject.code != Integer.MIN_VALUE){
            number++;
            statement.setInt(number,aFilterObject.code);
        }
       if(aFilterObject.countFact != null){
           number++;
           aFilterObject.countFact = aFilterObject.countFact.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
           statement.setBigDecimal(number,aFilterObject.countFact);
       }

          if(aFilterObject.contractNumber != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.contractNumber);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }
       if(aFilterObject.contractDate != null){
           number++;
           statement.setDate(number,new java.sql.Date(aFilterObject.contractDate.getTime()));
       }

          if(aFilterObject.finDocCode != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.finDocCode);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }
        if(aFilterObject.finDocID != Integer.MIN_VALUE){
            number++;
            statement.setInt(number,aFilterObject.finDocID);
        }
      if(aFilterObject.estimateItem.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.estimateItem.code);
      }
      if(aFilterObject.org.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.org.code);
      }

      if(aFilterObject.generalContractRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.generalContractRef.code);
      }

     }

     if(condition.length() > 0 && aBindObjects != null)
      _bindObjectsToPreparedStatement(statement,aBindObjects,number);

     set = statement.executeQuery();
     int i;
     for(i = 0;set.next();i++)
      {
       if(i < fromPosition)
        continue;
       else if(i >= fromPosition + quantity)
        {
         i++;
         break;
        }

       anObject = new ENEstimateItem2ContractShort();

       anObject.code = set.getInt(1);
       if ( set.wasNull() )
           anObject.code = Integer.MIN_VALUE;
       anObject.countFact = set.getBigDecimal(2);
       if(anObject.countFact != null)
           anObject.countFact = anObject.countFact.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.contractNumber = set.getString(3);
       anObject.contractDate = set.getDate(4);
       anObject.finDocCode = set.getString(5);
       anObject.finDocID = set.getInt(6);
       if ( set.wasNull() )
           anObject.finDocID = Integer.MIN_VALUE;

       anObject.estimateItemCode = set.getInt(7);
       if(set.wasNull())
       anObject.estimateItemCode = Integer.MIN_VALUE;

       anObject.priceByContract = set.getBigDecimal(10);
       if (anObject.priceByContract != null)
    	   anObject.priceByContract = anObject.priceByContract.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);

       anObject.orgCode = set.getInt(17);
       if(set.wasNull())
       anObject.orgCode = Integer.MIN_VALUE;

       anObject.rqPurchItm2EstimateCode = set.getInt(18);
		if(set.wasNull()) {
			anObject.rqPurchItm2EstimateCode = Integer.MIN_VALUE;
		}
		anObject.rqPurchItm2EstimateCountGen = set.getBigDecimal(19);
		if(anObject.rqPurchItm2EstimateCountGen != null) {
			anObject.rqPurchItm2EstimateCountGen = anObject.rqPurchItm2EstimateCountGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
		}
		anObject.rqPurchItm2EstimateCountPurchase = set.getBigDecimal(20);
		if(anObject.rqPurchItm2EstimateCountPurchase != null) {
			anObject.rqPurchItm2EstimateCountPurchase = anObject.rqPurchItm2EstimateCountPurchase.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
		}
		anObject.rqPurchItm2EstimateStatusComment = set.getString(21);


		anObject.generalContractRefCode = set.getInt(22);
		if(set.wasNull())
			anObject.generalContractRefCode = Integer.MIN_VALUE;

        result.list.add(anObject);
      }

     result.setTotalCount(i);
     return result;
    }
   catch(SQLException e)
    {
     System.out.println(e.getMessage()+"\nstatement - "+selectStr);
     throw new SystemException(e.getMessage(), e);
     //return null;
    }
   finally
    {
     try {if (set != null) set.close();}             catch (SQLException e) {}
     try {if (statement != null) statement.close();} catch (SQLException e) {}
     if(connection != super.getConnection())
      {
       try{connection.close();} catch(SQLException e){}
      }
    }
  }


	public void removeByOrderitem(int oiCode) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();

		selectStr = "DELETE FROM  ENESTIMATEITEM2CONTRCT WHERE CODE in (select xxx.code from ENESTIMATEITEM2CONTRCT xxx where xxx.estimateitemcode \n " +   
       " in (select rqorderitem2enestimttm.estimateitemcode from rqorderitem2enestimttm where rqorderitem2enestimttm.orderitemcode = ? ) ) ";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		
		if(oiCode == Integer.MIN_VALUE) {
			throw new PersistenceException(" \n Не вказаний параметр строки заявки ");
		}

		
		if(new SegregationProcessor().getSegregationInfoForDataAccess(ENEstimateItem2Contract.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied()) {
			throw new PersistenceException("{%ENEstimateItem2Contract.remove%} access denied");
		}

		PreparedStatement statement = null;
		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,oiCode);
			statement.execute();
		} catch(SQLException e) {
			System.out.println(e.getMessage()+"\nstatement - "+selectStr);
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}
	
	public void add(Vector<ENEstimateItem2Contract> addei2ct, boolean useSequential,Connection connection) throws PersistenceException {

		String insertStr;
		StringBuffer itemsStr;
		//Connection connection = getConnection();
		PreparedStatement statement = null;

		String usergen = getUserProfile().userName;
		long modify_time = System.currentTimeMillis();
		long dategen = modify_time / 1000;


		for (int i = 0; i < addei2ct.size(); i++) {
			if ((useSequential) || (addei2ct.get(i).code == Integer.MIN_VALUE)) _collectAutoIncrementFields(addei2ct.get(i), connection);
		}

		insertStr = " INSERT INTO ENESTIMATEITEM2CONTRCT (CODE,COUNTFACT,CONTRACTNUMBER,CONTRACTDATE,FINDOCCODE,FINDOCID,USERGEN,DATEEDIT,ESTIMATEITEMCODE,ORGCODE,RQPURCHITM2ESTIMATECOD,GENERALCONTRACTREFCODE)  "
				+ " VALUES ";

		itemsStr = new StringBuffer("");


		for (int i = 0; i < addei2ct.size(); i++) {

			ENEstimateItem2Contract ei2ct = addei2ct.get(i);

			if (i!=0) itemsStr.append(", \n");
			itemsStr.append("(");

			if (ei2ct.code != Integer.MIN_VALUE ) {
				itemsStr.append(""+ei2ct.code);
			} else {
				itemsStr.append("null");
			}

			if (ei2ct.countFact != null) {
				ei2ct.countFact = ei2ct.countFact.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				itemsStr.append(","+ei2ct.countFact);
			} else {
				itemsStr.append(",null");
			}
			
			// ================================
					
			itemsStr.append(",'"+ei2ct.contractNumber+"'");
			itemsStr.append(",'"+ei2ct.contractDate+"'");
			itemsStr.append(",'"+ei2ct.finDocCode+"'");
			itemsStr.append(","+ei2ct.finDocID);
			itemsStr.append(",'"+ usergen+"'" );
			itemsStr.append(",'"+ new SimpleDateFormat("dd.MM.yyyy").format(new Date())+"'"  );
			itemsStr.append(","+ ei2ct.estimateItem.code );
			itemsStr.append(","+ ei2ct.org.code);
			itemsStr.append(", ( select qq.code from rqpurchaseitem2estmttm qq where qq.estimateitemrefcode = "+ ei2ct.estimateItem.code +" and qq.purchaseitemrefcode = " + ei2ct.purchaseitemСode + " limit 1   ) ");
			itemsStr.append(", null "); // !!!!!!!!!!1 добавить generalContract itemsStr.append(","+ ei2ct.generalContractRef.code );
			itemsStr.append(")");

		}

		try {

			statement = connection.prepareStatement(insertStr.concat(itemsStr.toString()));
			statement.execute();

			statement.close();


		} catch(SQLException e) {
			_sequenceTable.clear();
			throw new SystemException(e.getMessage(), e);
		} catch(Exception e) {
			_sequenceTable.clear();
			throw new PersistenceException("Error in method {%ENEstimateItem2Contract.add%}",e);
		} finally {
			try {
				if (statement != null)
					statement.close();
			} catch (SQLException e) {
			}
			
		}
	}
	
	public void removeByEstimateArray(String[] eiArrCodes , int rqPurchaseItemCode , int finDocID ) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();

		selectStr = " delete from enestimateitem2contrct "
				+ " where enestimateitem2contrct.rqpurchitm2estimatecod in ( select rqpurchaseitem2estmttm.code from rqpurchaseitem2estmttm where rqpurchaseitem2estmttm.purchaseitemrefcode = "+rqPurchaseItemCode+"  ) "
				+ " and enestimateitem2contrct.findocid = " + finDocID +  
                  " and enestimateitem2contrct.estimateitemcode = any (ARRAY " + new String( Arrays.toString(eiArrCodes)   ) + " ) ";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		
		PreparedStatement statement = null;
		try {
			statement = connection.prepareStatement(selectStr);
			statement.execute();
		} catch(SQLException e) {
			System.out.println(e.getMessage()+"\nstatement - "+selectStr);
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

} // end of ENEstimateItem2ContractDAO

