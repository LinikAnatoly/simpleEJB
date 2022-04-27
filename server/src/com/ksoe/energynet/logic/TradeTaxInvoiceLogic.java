package com.ksoe.energynet.logic;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.energypro.logic.LogicModule;
import com.ksoe.lla.security.UserProfile;


public class TradeTaxInvoiceLogic extends LogicModule {


	public class TradeTaxInvoiceLogicLock{
		public int isLock=Integer.MIN_VALUE;
	}

	public TradeTaxInvoiceLogic(Connection connection, UserProfile userProfile) {
		super(connection, userProfile);
	}

	public int [] getNextTaxinvoiceInfo(Date date, String department){

		synchronized (TradeTaxInvoiceLogicLock.class){

		int [] taxInvoiceInfo = {Integer.MIN_VALUE,Integer.MIN_VALUE};

		String sql = "select trade.maxnumnaclad   (? , ?),  trade.salebook_seq.nextval  from dual ";

		String insertStr = "insert into trade.salebook (code, num, numadd, saller, DateV, taxwage, included, booknum, bookkind, pay_nds, use_dateop, make_type, sendprov, dohod, sendprovnds, adjusted, unitname, doc_type) "+
			      "values ( ? , ?, ?, '0000', ? , 1, 0, ?, 0, 0, 0, 'M', 0, 1, 1, 0, 'ENERGY', 0) ";

		String 	selectCheckStr=" select sum (cnt) "+
		  " from "+
		  " ( "+
		  " select count(*) cnt "+
		  " from trade.SaleBook s "+
		  " where ltrim(Num) = ? "+ //номер налоговой
		  " and ltrim(numAdd) = ? "+ //номер подразделения
		  " and trunc(DateV, 'mm') = trunc(to_date(?), 'mm') "+ //дата НН
		  " and (   Code <> ?) "+  //номер из трейда
		  " "+
		  " union all "+
		  " "+
		  " select count(*) cnt "+
		  " from trade.korr_sale ks "+
		  " where ltrim(ks.Num) = ? "+
		  " and ltrim (ks.num_korrect) = ? "+
		  " and trunc(dt_korrect, 'mm') = trunc(to_date(?), 'mm') "+
		  " and (   ks.id <> ?) "+
		  " )                  ";

		int checkResult=Integer.MIN_VALUE ;

        PreparedStatement statement = null;
        PreparedStatement statementInsert=null;
        PreparedStatement statementCheck = null ;
        ResultSet set = null;
        ResultSet resultCheckSet = null ;

        String newTaxInvoiceNumber = "";
        int tradeTaxInvoiceCode = Integer.MIN_VALUE;
        try  {
            statement = connection.prepareStatement(sql);
            statement.setDate(1,new java.sql.Date(date.getTime()));
            statement.setInt(2, Integer.parseInt(department));
            set = statement.executeQuery();
            if (set.next()){
            	newTaxInvoiceNumber = set.getString(1);
            	tradeTaxInvoiceCode = set.getInt(2);
            }
            if(set.wasNull())
            		throw new EnergyproSystemException("Ошибка при получении номера налоговой накладной добавленой в Trade!");

            if (newTaxInvoiceNumber.equals("")) {
				throw new EnergyproSystemException("Ошибка при получении нового номера налоговой накладной из Trade!");
			}
            if (tradeTaxInvoiceCode==Integer.MIN_VALUE){
				throw new EnergyproSystemException("Ошибка при получении кода налоговой накладной добавленой в Trade!");
            }

            set.close();
            statement.close();

            // делаем вставку в Trade
            statementInsert = connection.prepareStatement(insertStr);
            statementInsert.setInt(1, tradeTaxInvoiceCode);
            statementInsert.setInt(2, Integer.parseInt(newTaxInvoiceNumber));
            statementInsert.setString(3, ("0"+department));
			statementInsert.setDate(4,new java.sql.Date(date.getTime()) );
			statementInsert.setInt(5,Integer.parseInt(department));

			statementInsert.executeUpdate();
			statementInsert.close();
			 //проверка
            statementCheck = connection.prepareStatement(selectCheckStr);

            statementCheck.setInt(1, Integer.parseInt(newTaxInvoiceNumber));
            statementCheck.setString(2,("0"+department) );
            statementCheck.setDate(3,new java.sql.Date(date.getTime()) );
            statementCheck.setInt(4, tradeTaxInvoiceCode);
            statementCheck.setInt(5, Integer.parseInt(newTaxInvoiceNumber));
            statementCheck.setString(6,("0"+department) );
            statementCheck.setDate(7,new java.sql.Date(date.getTime()) );
            statementCheck.setInt(8, tradeTaxInvoiceCode);
	        resultCheckSet = statementCheck.executeQuery();
			if (resultCheckSet.next()) {
				 checkResult = resultCheckSet.getInt(1);
				 if (checkResult>0) throw new EnergyproSystemException("Ошибка при создании налоговой накладной в Trade! Повторите операцию позже!");
				 if (checkResult==Integer.MIN_VALUE) throw new EnergyproSystemException("Ошибка при создании налоговой накладной в Trade! Повторите операцию позже!");
			}
			if (resultCheckSet.wasNull()) {
				throw new EnergyproSystemException("Ошибка при создании налоговой накладной в Trade! Повторите операцию позже!");
			}
			resultCheckSet.close();
			statementCheck.close();


			taxInvoiceInfo[0] = Integer.parseInt(newTaxInvoiceNumber);
			taxInvoiceInfo[1] = tradeTaxInvoiceCode;

        return taxInvoiceInfo;
        }
        catch(SQLException e)
        {
            System.out.println(e.getMessage()+"\nstatement - " + sql);
            //EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
            throw new EnergyproSystemException(e);
        }
        finally
        {
        try {if (set != null) set.close();} catch (SQLException e) {}
        try {if (resultCheckSet != null) resultCheckSet.close();} catch (SQLException e) {}
        try {if (statement != null) statement.close();} catch (SQLException e) {}
        try {if (statementInsert != null) statementInsert.close();} catch (SQLException e) {}
        try {if (statementCheck != null) statementCheck.close();} catch (SQLException e) {}
        statement = null;
        statementInsert=null;
        statementCheck = null;
        }

	}

	}


	public void deleteTaxInvoiceInTrade(int tradeTaxIncoideCode){
		if (tradeTaxIncoideCode==Integer.MIN_VALUE) throw new EnergyproSystemException("Невозможно удалить налоговую накладную! Отсутствует код из Trade для этой налоговой накладной");

		String deleteStr, selectStr, unitname;
		  unitname="";
		  PreparedStatement statement = null;
		  deleteStr = "DELETE from trade.salebook where code = ? ";
		  selectStr = "SELECT unitname from trade.salebook where code = ? ";

		  try {
			    statement = connection.prepareStatement(selectStr);
			    statement.setInt(1,tradeTaxIncoideCode);
	            ResultSet resultSet = statement.executeQuery();
				if (resultSet.next()) {
					unitname = resultSet.getString(1);
				}
				if (resultSet.wasNull()) {
					throw new EnergyproSystemException("В Trade отсутствует накладная с номером !"+tradeTaxIncoideCode);
				}
				resultSet.close();
				statement.close();

				if(!unitname.equals("ENERGY")){
					throw new EnergyproSystemException("В налоговой накладной неверная ссылка на накладную в Trade! Код из Trade "+tradeTaxIncoideCode);
				}

				statement = null;
	            statement = connection.prepareStatement(deleteStr);
	            statement.setInt(1, tradeTaxIncoideCode);
	            statement.executeUpdate();
				statement.close();


	        } catch (SQLException e) {
	            e.printStackTrace();
	            throw new EnergyproSystemException("Ошибка при удалении накладной в Trade! Код из Trade - "+tradeTaxIncoideCode);
	        } catch (Exception e) {
	        	e.printStackTrace();
	        	throw new EnergyproSystemException("Ошибка при удалении накладной в Trade! Код из Trade - "+tradeTaxIncoideCode);
	        } finally {
	            try {
	                if (statement != null)
	                    statement.close();
	            } catch (SQLException e) {
	            }

	        }

	}

}
