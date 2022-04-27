package com.ksoe.energynet.dataminer;

import java.math.BigDecimal;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import java.util.Vector;

import com.ksoe.authorization.dataminer.BaseDAOUtils;
import com.ksoe.authorization.dataminer.BaseDAOUtils.Transformator;
import com.ksoe.energynet.util.Tools;
import com.ksoe.energynet.valueobject.SCUsageInputItemKind;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.fin.logic.FKConsts;
import com.ksoe.lla.persistence.GenericDataMiner;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;

public class SCLogicDAO extends GenericDataMiner{

    public SCLogicDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
    public SCLogicDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}


    /*
    * FUNCTION PRIHOD_BU
   (
P_KOD_NAKLAD Varchar2, -- ����� ���������
P_DATE_NAKLAD Date, -- ���� ���������
P_COUNT_NAKLAD Number, -- ���������� �� ���������
P_PODR Varchar2, -- ��� ���������� �������
P_MOL Varchar2, -- ��� ���������� �������
+P_USER_INS Varchar2, -- ������������ ���������� ���������
+P_DATE_INS Date, -- ������������ ������� ���������
+P_IS_ENERGYNET Varchar2 -- ��������� �� ���������� := 1

                    )
RETURN Number -- id ���������
    */
    
    /**
     * 
     * ������� ���������� ������� �� ����������� ����� � ������������� ��� ���
     * 
     * @param kod_inv ����������� �����
     * @return {@code true} - ���� ��������� ��� ��� � ����� ����������� ������ ��� 1 � false ���� �����.
     */
    public boolean getIsKodInvDoubledInCountersread(String kod_inv)
    {
    	if(kod_inv == null || kod_inv.equals("")) return false;
    	String sql = "select count(*) from countersread.ostable o where o.kod_inv = ? and show_= ?";
    	Vector<String> binded = new Vector<String>();
    	binded.add(kod_inv);
    	binded.add("Y");
    	int result = BaseDAOUtils.executeStatementAndReadObject(this.getConnection(), sql, binded
    			, new BaseDAOUtils.IntegerFromResultSetTransformator()
    			, false);
    	
    	return result > 1;
    	
    }
    
    public int transferInvoiceInSC(int kindCode, String P_KOD_NAKLAD, Date P_DATE_NAKLAD, int P_COUNT_NAKLAD, String P_PODR, String P_MOL)
    {
        int out = Integer.MIN_VALUE;

        CallableStatement stmt = null;

        String procName = "error";
        if (kindCode == SCUsageInputItemKind.UsageInput)
            procName = "vvod_expl";
        else
        if (kindCode == SCUsageInputItemKind.UsageOut)
            procName = "vvod_unexpl";//"vvod_expl_out";
        else
        if (kindCode == SCUsageInputItemKind.InputUsing)
            procName = "prihod_bu";
        else
            throw new EnergyproSystemException("������ � ���� ���� ��������� ...");

        //String constInfo = userProfile.userName + ", " + ;
        String query = "begin ? := countersread.pkg_doc." + procName + "(?, ?, ?, ?, ?, ?, ?, ?); end;";

        Connection connection = getConnection();

        try {

            stmt = connection.prepareCall(query);

        // register the type of the out param - an Oracle specific type

        stmt.registerOutParameter(1, java.sql.Types.INTEGER); //OracleTypes.NUMERIC);



        stmt.setString(2, P_KOD_NAKLAD);
        stmt.setDate(3, new java.sql.Date(P_DATE_NAKLAD.getTime()));
        stmt.setInt(4, P_COUNT_NAKLAD);
        stmt.setString(5, P_PODR);
        stmt.setString(6, P_MOL);

        stmt.setString(7, getUserProfile().userName);
        stmt.setTimestamp(8, new java.sql.Timestamp(new Date().getTime()));
        //stmt.setDate(8, new java.sql.Date(new Date().getTime()));
        stmt.setString(9, "1");

        // execute and retrieve the result set
        stmt.execute();

        out = stmt.getInt(1);

        return out;

        }
        catch (SQLException e) {
            throw new EnergyproSystemException("Error in addInvoice : " + e.getMessage() );
        }
        finally
        {
            try {if (stmt != null) stmt.close();} catch (SQLException e) {}
            if(connection != super.getConnection())
             {
              try{connection.close();} catch(SQLException e){}
             }
        }
    }
    
    /**
     * 
     * ����������� ����� ��������� �� ���� �����������
     * 
     * @param serialNumber ��������� � ��������
     * @param ����� ���������� ������ �� �������� ������������� �������
     * @param exceptionWhenNotFound �������� ������ ���� �� ������, ���� false �� � ����� ������ ������� ���������� null
     * @param isCloseConn ��������� �� ����������
     * @return ����������� ����� � ������� �����������
     */
    public String getInvNumberBySerialNumber(String serialNumber, String incomeOrderNumber, boolean exceptionWhenNotFound, boolean isCloseConn) {
    	String out = null;
    	if(serialNumber == null) throw new java.lang.NullPointerException("serialNumber must be not-null");
    	Vector<Object> bindedParams = new Vector<Object>();
    	String sql = "select a.kod_inv from countersread.ostable a where a.parent_num_un is null and a.kod_oborud = ?";
    	bindedParams.add(serialNumber);
    	if(incomeOrderNumber != null) {
    		sql += " and a.kod_nakl = ?";
    		bindedParams.add(incomeOrderNumber);
    	}
    	Transformator<String, ResultSet> transformator = new Transformator<String, ResultSet>() {
			@Override
			public String transform(ResultSet value) throws SQLException {
				return value.getString(1);
			}
    	};
    	List<String> list = BaseDAOUtils.executeStatementAndReadObjects(getConnection(), sql, bindedParams, transformator, isCloseConn);
    	if(list.size() == 1) {
    		out = list.get(0);
    	} else {
    		if(list.size() == 0 && exceptionWhenNotFound) {
    			throw new SystemException(String.format("�� �������� ������������ ������ ��� ��������� �� ���������� � %s", serialNumber));
    		}
    		if(list.size() > 1) {
    			throw new SystemException(String.format("������� ��� ������ ������������ ������ ��������� �� ���������� � %s", serialNumber));

    		}
    		out = null;
    	}
    	return out;
    }
    
    /**
     * 
     * �������� �� ���� �������� ��� ��������������
     * 
     * @param account ����
     * @return true - ��������, false - ���
     */
    public boolean isAccountForParametrization(String account) {
    	CallableStatement stmt = null;
    	Connection connection = getConnection();
    	try {
        	boolean out = false;
        	
        	String sql = "begin ? := COUNTERSREAD.PKG_DOC.IS_ACCOUNT_FOR_PARAMETRIZATION(?); end;";
        	stmt = connection.prepareCall(sql);
        	stmt.registerOutParameter(1, java.sql.Types.INTEGER);
        	stmt.setString(2, account);
        	
        	stmt.execute();
        	
        	switch(stmt.getInt(1)) {
        		case 0:
        			out = false;
        			break;
        		case 1:
        			out = true;
        			break;
        		default:
        			throw new SystemException(String.format("��������� ��������� ��������� �������������� ��� ������� %s", account));
        	}
        	return out;
    	} catch (SQLException e) {
    		throw new SystemException(e);
		} finally {
    		try {
				if(stmt != null) {
					stmt.close();
				}
			} catch (SQLException e) {
			}
    		try {
				if(connection != null && !connection.isClosed()) {
					connection.close();
				}
			} catch (SQLException e) {
			}
    	}
    }
    
    /**
     * 
     * ������ ������ ��� �������������� ����� �������
     * 
     * @return ������ ������ ��� �������������� ����� �������
     */
    public String getStringAccountsForParametrization() {
    	CallableStatement stmt = null;
    	Connection connection = getConnection();
    	try {
        	String out = null;
        	
        	String sql = "begin ? := COUNTERSREAD.PKG_DOC.STR_PARAMETRIZATION_ACCOUNTS; end;";
        	stmt = connection.prepareCall(sql);
        	stmt.registerOutParameter(1, java.sql.Types.VARCHAR);
        	
        	stmt.execute();
        	
        	out = stmt.getString(1);
        	
        	return out;
    	} catch (SQLException e) {
    		throw new SystemException(e);
		} finally {
    		try {
				if(stmt != null) {
					stmt.close();
				}
			} catch (SQLException e) {
			}
    		try {
				if(connection != null && !connection.isClosed()) {
					connection.close();
				}
			} catch (SQLException e) {
			}
    	}
    }


    /*
    * P_ID_NAKLAD Number, -- id ���������
    P_CODE_RAZNAR Varchar2, -- � ��-1
    P_DATE_RAZNAR Date, -- ���� ��-1
    P_KOD_MOL Varchar2, -- ��� ���������� �� ����������
    P_KOD_PODR Varchar2, -- ��� ���������� �� ����������
    P_KOLVO Number, --���������� �� ����������
    P_NAME_COUNTER Number, --������������ �������� � ��-1
    P_PRICE_COUNTER Number, --���� �������� � ��-1 (� ������ ������)
    P_SCHCOUNTER Number --���� �������� � ��-1
    */

        public int addOZSC(int kindCode, int P_ID_NAKLAD, String P_CODE_RAZNAR, Date P_DATE_RAZNAR, String P_KOD_MOL,
                String P_KOD_PODR, int P_KOLVO, String P_NAME_COUNTER,  BigDecimal P_PRICE_COUNTER, String P_SCHCOUNTER)
        {
            int out = Integer.MIN_VALUE;

            CallableStatement stmt = null;

            String procName = "error";
            if (kindCode == SCUsageInputItemKind.UsageInput)
                procName = "expl_raznar";
            else
            if (kindCode == SCUsageInputItemKind.UsageOut)
                procName = "unexpl_raznar";
            else
                throw new EnergyproSystemException("������ � ���� ���� ��������� ...");

            //String constInfo = userProfile.userName + ", " + ;
            String query = "begin ? := countersread.pkg_doc." + procName + "(?, ?, ?, ?, ?, ?, ?, ?, ?); end;";

            Connection connection = getConnection();

            try {


                stmt = connection.prepareCall(query);

            // register the type of the out param - an Oracle specific type

            stmt.registerOutParameter(1, java.sql.Types.INTEGER); //OracleTypes.NUMERIC);

            stmt.setInt(2, P_ID_NAKLAD);
            stmt.setString(3, P_CODE_RAZNAR);
            stmt.setDate(4, new java.sql.Date(P_DATE_RAZNAR.getTime()));

            stmt.setString(5, P_KOD_MOL);
            stmt.setString(6, P_KOD_PODR);
            stmt.setInt(7, P_KOLVO);
            stmt.setString(8, P_NAME_COUNTER);
            stmt.setBigDecimal(9, P_PRICE_COUNTER);
            stmt.setString(10, P_SCHCOUNTER);


            // execute and retrieve the result set
            stmt.execute();

            out = stmt.getInt(1);

            return out;

            }
            catch (SQLException e) {
                throw new EnergyproSystemException("Error in addOZSC " + procName + " : " + e.getMessage() );
            }
            finally
            {
                try {if (stmt != null) stmt.close();} catch (SQLException e) {}
                if(connection != super.getConnection())
                {
                try{connection.close();} catch(SQLException e){}
                }
            }
        }


        /*
        * PROCEDURE EXPL_COUNTERS
        (
        P_NAME Varchar2, -- ������������ ��������
        P_NOMER Varchar2, -- ��������� ����� ��������
        P_YEAR Varchar2, -- ��� �������
        P_ID_RAZNARYADKA Number, -- id ��-1
        P_KOD_INV Varchar2, -- ����������� ����� ��������
        P_PRIMECHANIE Varcha2, --���������� ��������� �������� � �������
        ������� : 0628245
        ����� : �.�. ������, �� �������, �.66�, ��.57
        �.�.�. : �������� �������� ����������
        P_DATE_UST Date, -- ���� ���������
        P_PLACE_UST Varchar2, -- ����� ���������
        P_LAST_CHECK_DATE Date, -- ���� ��������� �������
        P_KOD_NZ Varchar2, -- ����� �����-�������
        P_DATE_NZ Date -- ���� �����-�������

                            )
        */
            public void transferCounterMountInSC(String P_NAME, String P_NOMER, String P_YEAR, int P_ID_RAZNARYADKA, String P_KOD_INV,
                                                String P_PRIMECHANIE, Date P_DATE_UST, String P_PLACE_UST, Date P_LAST_CHECK_DATE, String P_KOD_NZ, Date P_DATE_NZ,String P_LSCHET)
            {
                CallableStatement stmt = null;

                String query = "begin countersread.pkg_doc.EXPL_COUNTERS(?, ?, ?, ?, ?, ?, ?, ?, ? ,? ,? ,?); end;";

                Connection connection = getConnection();

                try {

                    stmt = connection.prepareCall(query);

                    stmt.setString(1, P_NAME);
                    stmt.setString(2, P_NOMER);
                    stmt.setString(3, P_YEAR);
                    stmt.setInt(4, P_ID_RAZNARYADKA);
                    stmt.setString(5, P_KOD_INV);
                    stmt.setString(6, P_PRIMECHANIE);
                    stmt.setDate(7, new java.sql.Date(P_DATE_UST.getTime()));
                    stmt.setString(8, P_PLACE_UST);
                    if (P_LAST_CHECK_DATE != null){
                        stmt.setDate(9, new java.sql.Date(P_LAST_CHECK_DATE.getTime()));
                    }
                    else{
                        stmt.setNull(9, java.sql.Types.DATE);
                    }
                    stmt.setString(10, P_KOD_NZ);
                    stmt.setDate(11, new java.sql.Date(P_DATE_NZ.getTime()));
                    stmt.setString(12, P_LSCHET);
                    stmt.execute();
                }
                catch (SQLException e) {
                    throw new EnergyproSystemException("Error in transferCounterMountInSC : " + e.getMessage() );
                }
                finally
                {
                    try {if (stmt != null) stmt.close();} catch (SQLException e) {}
                    if(connection != super.getConnection())
                    {
                    try{connection.close();} catch(SQLException e){}
                    }
                }
            }


            /*
            *
            * FUNCTION EXPL_PROV_INS
            (
            P_ID_NAKLAD Number, -- id ���������
            P_KOD_INV Varchar2, -- ��� �
            P_TYPEREVISIONID Number, -- id �� ��� �������
            (energynet.entypeworkstate.code):= 3
            P_DATEOPERAC Date, -- ������������� ���� ����������
            P_NUMAKT Varchar2, -- ����� ���� ������������
            P_DATEAKT Date, -- ���� ���� ������������
            P_SUMAKT Number, -- ����� �� ����
            P_SUMAKTMATERIALS Number, -- ����� ����������     �� ����
            P_SUMAKTZARPLATA Number, -- ����� �������� �� ����
            P_SUMAKTPENSFOND Number, -- ����� ��� �� ����
            P_IS_PROV Number, -- ������� ���������� :=1
            P_OPER_USER Varchar2 -- ��� ������������ ��������������
            �����������
            P_OPER_DATE Date � ����/����� ���������
            P_PRIMECHAN Varchar2 -- �������� �������� := ���������������
            ���� � �����. Energynet.�

            )
            RETURN Number -- id
            */

	public int moveCounterDataInSC(int P_ID_NAKLAD, String P_KOD_INV,
			int P_TYPEREVISIONID, Date P_DATEOPERAC, String P_NUMAKT,
			Date P_DATEAKT, BigDecimal P_SUMAKT, BigDecimal P_SUMAKTMATERIALS,
			BigDecimal P_SUMAKTZARPLATA, BigDecimal P_SUMAKTPENSFOND,
			String priconnDoc, Date priconnDate, Boolean priconnIsStandard) {

		int out = Integer.MIN_VALUE;
        CallableStatement stmt = null;


        // String constInfo = userProfile.userName + ", " + ;
        // String query = "begin ? := countersread.pkg_doc.EXPL_PROV_INS(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?); end;";

        String query = "begin ? := countersread.pkg_doc.EXPL_PROV_INS(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? ,null,? ,?, ?); end;";

        Connection connection = getConnection();

        try {
        	stmt = connection.prepareCall(query);

        	// register the type of the out param - an Oracle specific type

            stmt.registerOutParameter(1, java.sql.Types.INTEGER); //OracleTypes.NUMERIC);

            stmt.setInt(2, P_ID_NAKLAD);
            stmt.setString(3, P_KOD_INV);
            stmt.setInt(4, P_TYPEREVISIONID);
            stmt.setDate(5, new java.sql.Date(P_DATEOPERAC.getTime()));
            stmt.setString(6, P_NUMAKT);
            stmt.setDate(7, new java.sql.Date(P_DATEAKT.getTime()));
            stmt.setBigDecimal(8, P_SUMAKT);
            stmt.setBigDecimal(9, P_SUMAKTMATERIALS);
            stmt.setBigDecimal(10, P_SUMAKTZARPLATA);
            stmt.setBigDecimal(11, P_SUMAKTPENSFOND);

            stmt.setInt(12, 1);
            stmt.setString(13, getUserProfile().userName);
            stmt.setTimestamp(14, new java.sql.Timestamp(new Date().getTime()));
            stmt.setString(15, "�������������� ���� � �����. Energynet.");

            stmt.setString(16, priconnDoc);

            if (priconnDate == null)
            	stmt.setDate(17,null);
              else
            	  stmt.setDate(17,new java.sql.Date(priconnDate.getTime()));
            
            if(priconnIsStandard == null) {
            	stmt.setNull(18, java.sql.Types.INTEGER);
            } else {
            	stmt.setInt(18, (priconnIsStandard) ? 1 : 0);
            }

            // execute and retrieve the result set
            stmt.execute();

            out = stmt.getInt(1);
            // SUPP-105396 21.10.2021 ��� �������� ��������� P_SUMAKT = 0 ������ �� ��������� � ������� ����������
            // �������� ������ null, ������ ���������� ������������ ����� �������� � ����������� �������� MIN_VALUE
            // � ��������� ������ ����������� 0
            if(stmt.wasNull()) {
            	out = Integer.MIN_VALUE;
            }

			return out;

		} catch (SQLException e) {
			throw new EnergyproSystemException(
					"Error in countersread.pkg_doc.EXPL_PROV_INS : " + e.getMessage());
		} finally {
			try {
				if (stmt != null)
					stmt.close();
			} catch (SQLException e) {
			}
			if (connection != super.getConnection()) {
				try {
					connection.close();
				} catch (SQLException e) {
				}
			}
		}
	}


public int moveCouterDataInSCZKU(int P_ID_NAKLAD , String P_KOD_INV, int P_TYPEREVISIONID, Date P_DATEOPERAC, String P_NUMAKT,
                        Date P_DATEAKT, BigDecimal P_SUMAKT, BigDecimal P_SUMAKTMATERIALS, BigDecimal P_SUMAKTZARPLATA, BigDecimal P_SUMAKTPENSFOND,BigDecimal P_NUM_UN_ZKU,String priconnDoc,Date priconnDate, Boolean priconnIsStandard)
 {
  int out = Integer.MIN_VALUE;

  CallableStatement stmt = null;


//String constInfo = userProfile.userName + ", " + ;
  String query = "begin ? := countersread.pkg_doc.EXPL_PROV_INS(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?); end;";
//String query = "begin ? := countersread.pkg_doc.EXPL_PROV_INS(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?); end;";

Connection connection = getConnection();

try {

    stmt = connection.prepareCall(query);

// register the type of the out param - an Oracle specific type

stmt.registerOutParameter(1, java.sql.Types.INTEGER); //OracleTypes.NUMERIC);

stmt.setInt(2, P_ID_NAKLAD);
stmt.setString(3, P_KOD_INV);
stmt.setInt(4, P_TYPEREVISIONID);
stmt.setDate(5, new java.sql.Date(P_DATEOPERAC.getTime()));
stmt.setString(6, P_NUMAKT);
stmt.setDate(7, new java.sql.Date(P_DATEAKT.getTime()));
stmt.setBigDecimal(8, P_SUMAKT);
stmt.setBigDecimal(9, P_SUMAKTMATERIALS);
stmt.setBigDecimal(10, P_SUMAKTZARPLATA);
stmt.setBigDecimal(11, P_SUMAKTPENSFOND);

stmt.setInt(12, 1);
stmt.setString(13, getUserProfile().userName);
stmt.setTimestamp(14, new java.sql.Timestamp(new Date().getTime()));
stmt.setString(15, "�������������� ���� � �����. Energynet.");

if (P_NUM_UN_ZKU == null) 
{stmt.setNull(16, java.sql.Types.DOUBLE); }
stmt.setBigDecimal(16, P_NUM_UN_ZKU);

stmt.setString(17, priconnDoc);

if (priconnDate == null)
	stmt.setDate(18,null);
  else
	  stmt.setDate(18,new java.sql.Date(priconnDate.getTime()));

if(priconnIsStandard == null) {
	stmt.setNull(19, java.sql.Types.INTEGER);
} else {
	stmt.setInt(19, (priconnIsStandard) ? 1 : 0);
}

// execute and retrieve the result set
stmt.execute();

out = stmt.getInt(1);

return out;

}
catch (SQLException e) {
    throw new EnergyproSystemException("Error in countersread.pkg_doc.EXPL_PROV_INS : " + e.getMessage() );
}
finally
{
    try {if (stmt != null) stmt.close();} catch (SQLException e) {}
    if(connection != super.getConnection())
    {
    try{connection.close();} catch(SQLException e){}
    }
}
}



                public void moveCounterAddDataInSC(int P_ID_REVISIONDATA, String P_TABN, String P_BALANS, BigDecimal P_SUMAKTZARPLATA, BigDecimal P_SUMAKTPENSFOND)
                {
                    String query = "begin countersread.pkg_doc.EXPL_PROV_SOTR_INS(?, ?, ?, ?, ?); end;";

                    CallableStatement stmt = null;

                    Connection connection = getConnection();

                    try {

                        stmt = connection.prepareCall(query);


                    stmt.setInt(1, P_ID_REVISIONDATA);
                    stmt.setString(2, P_TABN);
                    stmt.setString(3, P_BALANS);
                    stmt.setBigDecimal(4, P_SUMAKTZARPLATA);
                    stmt.setBigDecimal(5, P_SUMAKTPENSFOND);
                    stmt.execute();


                    }
                    catch (SQLException e) {
                        throw new EnergyproSystemException("Error in moveCouterAddDataInSC : " + e.getMessage() );
                    }
                    finally
                    {
                        try {if (stmt != null) stmt.close();} catch (SQLException e) {}
                        if(connection != super.getConnection())
                        {
                        try{connection.close();} catch(SQLException e){}
                        }
                    }
                }

                /*
                * PROCEDURE EXPL_OUT_COUNTERS
            (
            P_NAME Varchar2, -- ������������ ��������
            P_NOMER Varchar2, -- ��������� ����� ��������
            P_YEAR Varchar2, -- ��� �������
            P_ID_RAZNARYADKA Number, -- id ��-1
            P_KOD_INV Varchar2, -- ����������� ����� ��������

            PROCEDURE UNEXPL_COUNTERS
            (
            P_NAME Varchar2, -- ������������ ��������
            P_NOMER Varchar2, -- ��������� ����� ��������
            P_YEAR Varchar2, -- ��� �������
            P_PRICE Varchar2, -- ����
            P_KOD_SUBSCH_B Varchar2, -- ����
            P_ID_RAZNARYADKA Number, -- id ��-1
            P_KOD_INV Varchar2, -- ����������� ����� ��������


                                )
                */

            public void transferCounterUnMountInSC(String P_NAME, String P_NOMER, String P_YEAR, BigDecimal P_PRICE, String P_KOD_SUBSCH_B, int P_ID_RAZNARYADKA, String P_KOD_INV)
            {
                CallableStatement stmt = null;

                String query = "begin countersread.pkg_doc.UNEXPL_COUNTERS(?, ?, ?, ?, ?, ?, ? ); end;";

                Connection connection = getConnection();

                try {

                    stmt = connection.prepareCall(query);

                    stmt.setString(1, P_NAME);
                    stmt.setString(2, P_NOMER);
                    stmt.setString(3, P_YEAR);
                    stmt.setBigDecimal(4, P_PRICE);

                    stmt.setString(5, P_KOD_SUBSCH_B);
                    stmt.setInt(6, P_ID_RAZNARYADKA);
                    stmt.setString(7, P_KOD_INV);

                    stmt.execute();
                }
                catch (SQLException e) {
                    throw new EnergyproSystemException("Error in transferCounterUnMountInSC : " + e.getMessage() );
                }
                finally
                {
                    try {if (stmt != null) stmt.close();} catch (SQLException e) {}
                    if(connection != super.getConnection())
                    {
                    try{connection.close();} catch(SQLException e){}
                    }
                }

            }


            /*
            * 1.1.1.�������� ���������
        PROCEDURE PRIHOD_BU_COUNTERS
        (
        P_NAME Varchar2, -- ������������ ��������
        P_NOMER Varchar2, -- ��������� ����� ��������
        P_YEAR Varchar2, -- ��� �������
        P_ID_NAKLADNIE Number, --id �� ���������
        P_PRIMECHANIE Varcha2, --���������� ��������� �������� � �������
        ������� : 0628245
        ����� : �.�. ������, �� �������, �.66�, ��.57
        �.�.�. : �������� �������� ����������

                            )
            */

            public void transferCounterABUnMountInSC(String P_NAME, String P_NOMER, String P_YEAR, int P_ID_NAKLADNIE, String P_PRIMECHANIE)
            {
                CallableStatement stmt = null;

                String query = "begin countersread.pkg_doc.PRIHOD_BU_COUNTERS(?, ?, ?, ?, ?); end;";

                Connection connection = getConnection();

                try {

                    stmt = connection.prepareCall(query);

                    stmt.setString(1, P_NAME);
                    stmt.setString(2, P_NOMER);
                    stmt.setString(3, P_YEAR);
                    stmt.setInt(4, P_ID_NAKLADNIE);
                    stmt.setString(5, P_PRIMECHANIE);
                    stmt.execute();
                }
                catch (SQLException e) {
                    throw new EnergyproSystemException("Error in transferCounterABUnMountInSC : " + e.getMessage() );
                }
                finally
                {
                    try {if (stmt != null) stmt.close();} catch (SQLException e) {}
                    if(connection != super.getConnection())
                    {
                    try{connection.close();} catch(SQLException e){}
                    }
                }
            }

            /*
            * 1.1.1.���������� ���������
            PROCEDURE PRIHOD_BU_PROV_INS
            (
            P_ID_NAKLAD Number, -- id ���������
            P_KOD_SUBSCH_B varchar2, -- ����
            P_KOD_PODR varchar2, -- ��� �������������
            P_KOD_MOL varchar2, -- ��� ����
            P_KOD_IST varchar2, -- ��� ��������� �������
            P_KOD_ZATR varchar2, -- ��� ������
            P_TYPE_COUNTER varchar2, -- ��� ��������
            P_CHARACTERS varchar2, -- ����������
            P_KOD_NAKL varchar2, -- � ��������� �������
            P_DT_NAKL date, -- ���� ��������� �������
            P_DT_DOC date, -- ��� ���� �������
            P_SUM_ST_NDS number, -- ��������� � ���
            P_SUM_NDS number, -- ���
            P_SUM_ST_PERV number, -- ���.�����.������.
            P_PRIMECHAN varchar2 -- �������� �������� := ���������������
            ������ �/�. Energynet.�
            P_IS_ENERGYNET Varchar2 -- ��������� �� ���������� := 1
            */
                public void moveCounterABUnMountInSC(int P_ID_NAKLAD, String P_KOD_SUBSCH_B, String P_KOD_PODR, String P_KOD_MOL, String P_KOD_IST,
                            String P_KOD_ZATR, String P_TYPE_COUNTER, String P_CHARACTERS, String P_KOD_NAKL,
                            Date P_DT_NAKL, Date P_DT_DOC, BigDecimal P_SUM_ST_NDS, BigDecimal  P_SUM_NDS, BigDecimal P_SUM_ST_PERV)
                {
                    CallableStatement stmt = null;

                    String query = "begin countersread.pkg_doc.PRIHOD_BU_PROV_INS(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?); end;";

                    Connection connection = getConnection();

                    try {

                        stmt = connection.prepareCall(query);

                        stmt.setInt(1, P_ID_NAKLAD);
                        stmt.setString(2, P_KOD_SUBSCH_B);
                        stmt.setString(3, P_KOD_PODR);
                        stmt.setString(4, P_KOD_MOL);
                        stmt.setString(5, P_KOD_IST);
                        stmt.setString(6, P_KOD_ZATR);
                        stmt.setString(7, P_TYPE_COUNTER);
                        stmt.setString(8, P_CHARACTERS);
                        stmt.setString(9, P_KOD_NAKL);
                        stmt.setDate(10, new java.sql.Date(P_DT_NAKL.getTime()));
                        stmt.setDate(11, new java.sql.Date(P_DT_DOC.getTime()));

                        stmt.setBigDecimal(12, P_SUM_ST_NDS);
                        stmt.setBigDecimal(13, P_SUM_NDS);
                        stmt.setBigDecimal(14, P_SUM_ST_PERV);

                        stmt.setString(15, "�������������� ������ �/�. Energynet.");
                        stmt.setString(16, "1");


                        stmt.execute();
                    }
                    catch (SQLException e) {
                        throw new EnergyproSystemException("Error in moveCounterABUnMountInSC : " + e.getMessage() );
                    }
                    finally
                    {
                        try {if (stmt != null) stmt.close();} catch (SQLException e) {}
                        if(connection != super.getConnection())
                        {
                        try{connection.close();} catch(SQLException e){}
                        }
                    }
                }


                /*
                *
                * 1.1.1.���������� ���������.
            PROCEDURE EXPL_OUT_PROV_INS
            (
            P_ID_NAKLAD Number, -- id ���������
            P_KOD_INV Varchar2, -- ��� �
            P_OPER_USER Varchar2 -- ��� ������������ ��������������
            �����������
            P_OPER_DATE Date � ����/����� ���������
            P_PRIMECHAN Varchar2 -- �������� �������� := ���������������
            ���� �� �����. Energynet.�

            )
                */
                public void moveCounterUnMountInSC(int P_ID_NAKLAD, String P_KOD_INV, Date P_DATEOPERAC,int P_NUM_UN_ZKU, int P_IS_LIKVID, String P_ACT_INVITATION, Date P_DATE_INVITATION){
                    CallableStatement stmt = null;

                    String query = "begin countersread.pkg_doc.UNEXPL_PROV_INS(?, ?, ?, ?, ?, ?, ?, ?, ?); end;";

                    Connection connection = getConnection();

                    try {

                        stmt = connection.prepareCall(query);

                        stmt.setInt(1, P_ID_NAKLAD);
                        stmt.setString(2, P_KOD_INV);
                        stmt.setDate(3, new java.sql.Date(P_DATEOPERAC.getTime()));
                        stmt.setString(4, getUserProfile().userName);
                        stmt.setTimestamp(5, new java.sql.Timestamp(new Date().getTime()));
                        stmt.setString(6, "�������������� ����� �� �����. Energynet.");
                        
                        if(P_NUM_UN_ZKU == Integer.MIN_VALUE) {
                      	  stmt.setNull(7, java.sql.Types.INTEGER);
                        } else {
                      	  stmt.setInt(7, P_NUM_UN_ZKU);
                        }

                        stmt.setInt(8, P_IS_LIKVID);
                        stmt.setString(9, P_ACT_INVITATION);
//                        stmt.setDate(10, new java.sql.Date(P_DATE_INVITATION.getTime()));                        
                        stmt.execute();
                    }
                    catch (SQLException e) {
                        throw new EnergyproSystemException("Error in moveCounterUnMountInSC (UNEXPL_PROV_INS): " + e.getMessage() );
                    }
                    finally
                    {
                        try {if (stmt != null) stmt.close();} catch (SQLException e) {}
                        if(connection != super.getConnection())
                        {
                        try{connection.close();} catch(SQLException e){}
                        }
                    }
                }


public void updateStatusZKUInSC(int P_NUM_UN,boolean isShow)
{
    PreparedStatement stmt = null;
    Connection connection = getConnection();
    String query;
    try {
        if (isShow)
        {
        query=" update countersread.ostable set show_='Y',num_oper=0 where num_un="+P_NUM_UN;
        }
        else
        {
          query=" update countersread.ostable set show_='N',num_oper=8 where num_un="+P_NUM_UN;
        }
        stmt = connection.prepareStatement(query);
        stmt.execute();

    }

  catch (SQLException e) {
  throw new EnergyproSystemException("Error in transferCounterMountInSC : " + e.getMessage() );
  }
  finally
  {
  try {if (stmt != null) stmt.close();} catch (SQLException e) {}
  if(connection != super.getConnection())
  {
  try{connection.close();} catch(SQLException e){}
  }
  }
}

public void updateCostZKUInSC(int P_NUM_UN,BigDecimal value)
{
    PreparedStatement stmt = null;
    Connection connection = getConnection();
    String query;
    try {

    	//NET-4284 USE_NDS??? ����� �� ������������ ������ . ���� ����� ������� ����� ������ ������!!!
    	if (1==1){
    	throw new SystemException(" ������ NET-4284!!! ���������� ���������� � ������ ��. ");
    	}

    	double sum_st_perv=0;
        double sum_st_nds=0;
        double sum_nds=0;

        sum_st_perv=value.doubleValue();
        sum_st_nds=value.multiply(new BigDecimal(1.2)).setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
        sum_nds=sum_st_nds-sum_st_perv;

        query=" update countersread.ostable set sum_st_perv="+sum_st_perv+
        ",sum_st_nds="+sum_st_nds+",sum_nds="+sum_nds+
        " where num_un="+P_NUM_UN;

        stmt = connection.prepareStatement(query);
        stmt.execute();

    }

  catch (SQLException e) {
  throw new EnergyproSystemException("Error in transferCounterMountInSC : " + e.getMessage() );
  }
  finally
  {
  try {if (stmt != null) stmt.close();} catch (SQLException e) {}
  if(connection != super.getConnection())
  {
  try{connection.close();} catch(SQLException e){}
  }
  }
}


/*
public void removeZKU(int P_NUM_UN)
{
    PreparedStatement stmt = null;
    Connection connection = getConnection();
    String query;
    try {
    //����� �������� �� �-��� ������
        query=" delete from countersread.ostable where num_un="+P_NUM_UN;

        stmt = connection.prepareStatement(query);
        //stmt.execute();

    }

  catch (SQLException e) {
  throw new EnergyproSystemException("Error delete In SC : " + e.getMessage() );
  }
  finally
  {
  try {if (stmt != null) stmt.close();} catch (SQLException e) {}
  if(connection != super.getConnection())
  {
  try{connection.close();} catch(SQLException e){}
  }
  }
}

*/

 /**
  * 
  * ��������� �������� � ��� � �������������.
  * 
  * ������� ������ � ������������� ��� ��������� ��� � ����� �������� ������ 8 (�� ���� 
  * ���������). 
  * 
  * @param P_NUM_UN id �������� (���� ������ 0, �� ���������, ��� ��� ������� ��������)
  * @param P_KOD_NAKL ����� ���� ������� ���
  * @param P_DT_NAKL ���� ���� ������� ���
  * @param P_OPER_USER ��� ������������ �������������� ��������
  * @param P_OPER_DATE ����/����� ��������
  * @param P_PRIMECHAN ����������
  * @param P_PLACE_UST ����� ���������
  * @param P_DATE_UST ���� ���������
  * @param P_LSCHET ���.���� ��������
  * @param P_STR_NAME ������������ ���
  * @param P_TYPE_NAME ��� ���
  * @param molCode ��� ��� ������� ��� (������� ��������)
  * @param priconnDoc ����� �������� � �������������
  * @param priconnDate ���� �������� � �������������
  * @param priconnIsStandard ��� ������������� (�����������/�������������)
  * @return id ��� � �������������
  */
 public int transferCounterMountInSCZKU(
                        int P_NUM_UN,
                        String P_KOD_NAKL,
                        Date P_DT_NAKL,
                        String P_OPER_USER,
                        Date P_OPER_DATE,
                        String P_PRIMECHAN,
                        String P_PLACE_UST,
                        Date P_DATE_UST,
                        String P_LSCHET,
                        String P_STR_NAME,
                        String P_TYPE_NAME,
                        String molCode,
                        String priconnDoc,
                        Date priconnDate,
                        Boolean priconnIsStandard
                    )

        {
                int out=Integer.MIN_VALUE;

                CallableStatement stmt = null;

                String molCodeCounter=null;

                 if (P_NUM_UN<=0)
                 {
                	 molCodeCounter=molCode;
                 }

                  String query = "begin ? := countersread.pkg_doc.MOUNT_ZKU_INS(?, ?, ?, ?, ?, ?, ?, ?, ?, ? ,? ,?, ?, ?, ?)" +
                        "; end;";

                  Connection connection = getConnection();

                  try {

                  stmt = connection.prepareCall(query);

                  stmt.registerOutParameter(1, java.sql.Types.INTEGER);

                  stmt.setInt(2, P_NUM_UN);
                  stmt.setString(3, P_KOD_NAKL);


                  if (P_DT_NAKL != null){
                    stmt.setDate(4, new java.sql.Date(P_DT_NAKL.getTime()));
                    }
                    else{
                    stmt.setNull(4, java.sql.Types.DATE);
                    }


                  stmt.setString(5, P_OPER_USER);


                  if (P_OPER_DATE != null){
                    stmt.setDate(6, new java.sql.Date(P_OPER_DATE.getTime()));
                    }
                    else{
                    stmt.setNull(6, java.sql.Types.DATE);
                    }

                  stmt.setString(7, P_PRIMECHAN);

                  stmt.setString(8, P_PLACE_UST);

                  if (P_DATE_UST != null){
                    stmt.setDate(9, new java.sql.Date(P_DATE_UST.getTime()));
                    }
                    else{
                    stmt.setNull(9, java.sql.Types.DATE);
                    }

                  stmt.setString(10, P_LSCHET);
                  stmt.setString(11, P_STR_NAME);

                  stmt.setString(12, P_TYPE_NAME);

                  stmt.setString(13, molCodeCounter);

                  stmt.setString(14, priconnDoc);

                  if (priconnDate == null)
                  	stmt.setDate(15,null);
                    else
                  	  stmt.setDate(15,new java.sql.Date(priconnDate.getTime()));
                  
                  if(priconnIsStandard == null) {
                	  stmt.setNull(16, java.sql.Types.INTEGER);
                  } else {
                	  stmt.setInt(16, (priconnIsStandard) ? 1 : 0);
                  }

                  stmt.execute();

                  out = stmt.getInt(1);

                  return out;

                  }
                  catch (SQLException e) {
                  throw new EnergyproSystemException("Error in transferCounterMountInSC : " + e.getMessage() );
                  }
                  finally
                  {
                  try {if (stmt != null) stmt.close();} catch (SQLException e) {}
                  if(connection != super.getConnection())
                  {
                  try{connection.close();} catch(SQLException e){}
                  }
                  }

        }


 public void untransferCounterMountInSCZKU(int P_NUM_UN)

{

  CallableStatement stmt = null;

   String query = "begin countersread.pkg_doc.MOUNT_ZKU_DEL(?)" +
        "; end;";

   Connection connection = getConnection();

   try {

   stmt = connection.prepareCall(query);
   stmt.setInt(1, P_NUM_UN);
   stmt.execute();

   }
   catch (SQLException e) {
   throw new EnergyproSystemException("Error in transferCounterMountInSC : " + e.getMessage() );
   }
   finally
   {
   try {if (stmt != null) stmt.close();} catch (SQLException e) {}
   if(connection != super.getConnection())
   {
   try{connection.close();} catch(SQLException e){}
   }
   }

}


 public int provCounterMountInSCZKU(
        int P_NUM_UN_COU,
         int P_NUM_UN_ZKU,
         Date P_DATEOPERAC,
         BigDecimal P_SUMAKT,
         BigDecimal P_SUMAKTMATERIALS,
         BigDecimal P_SUMAKTMATERIALS_BU,
         BigDecimal P_SUMAKTZARPLATA,
         BigDecimal P_SUMAKTPENSFOND
    )


{

  int out=Integer.MIN_VALUE;

  CallableStatement stmt = null;

   String query = "begin ? := countersread.pkg_doc.MOUNT_ZKU_PROV_INS(?, ?, ?, ?, ?, ?, ?, ?)" +
        "; end;";

   Connection connection = getConnection();

   try {

   stmt = connection.prepareCall(query);

   stmt.registerOutParameter(1, java.sql.Types.INTEGER);

   stmt.setInt(2, P_NUM_UN_COU);
   stmt.setInt(3, P_NUM_UN_ZKU);


   if (P_DATEOPERAC != null){
    stmt.setDate(4, new java.sql.Date(P_DATEOPERAC.getTime()));
    }
    else{
    stmt.setNull(4, java.sql.Types.DATE);
    }


   if(P_SUMAKT != null)
    P_SUMAKT = P_SUMAKT.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       stmt.setBigDecimal(5,P_SUMAKT);

   if(P_SUMAKTMATERIALS != null)
       P_SUMAKTMATERIALS = P_SUMAKTMATERIALS.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       stmt.setBigDecimal(6,P_SUMAKTMATERIALS);

   if(P_SUMAKTMATERIALS_BU != null)
    P_SUMAKTMATERIALS_BU = P_SUMAKTMATERIALS_BU.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       stmt.setBigDecimal(7,P_SUMAKTMATERIALS_BU);

   if(P_SUMAKTZARPLATA != null)
    P_SUMAKTZARPLATA = P_SUMAKTZARPLATA.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       stmt.setBigDecimal(8,P_SUMAKTZARPLATA);

   if(P_SUMAKTPENSFOND != null)
    P_SUMAKTPENSFOND = P_SUMAKTPENSFOND.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       stmt.setBigDecimal(9,P_SUMAKTPENSFOND);

   stmt.execute();

   out = stmt.getInt(1);

   return out;

   }
   catch (SQLException e) {
   throw new EnergyproSystemException("Error in transferCounterMountInSC : " + e.getMessage() );
   }
   finally
   {
   try {if (stmt != null) stmt.close();} catch (SQLException e) {}
   if(connection != super.getConnection())
   {
   try{connection.close();} catch(SQLException e){}
   }
   }

}

 public void dovvodCounterMountInSCZKU(
        int P_ID_REVISIONDATA,
        String P_TABN,
        String P_BALANS,
        BigDecimal P_SUMAKTZARPLATA,
        BigDecimal P_SUMAKTPENSFOND
    )


{

  CallableStatement stmt = null;

   String query = "begin countersread.pkg_doc.EXPL_PROV_SOTR_INS(?, ?, ?, ?, ?)" +
        "; end;";

   Connection connection = getConnection();

   try {

   stmt = connection.prepareCall(query);

   stmt.setInt(1,P_ID_REVISIONDATA);
   stmt.setString(2, P_TABN);
   stmt.setString(3, P_BALANS);


   if(P_SUMAKTZARPLATA != null)
    P_SUMAKTZARPLATA = P_SUMAKTZARPLATA.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       stmt.setBigDecimal(4,P_SUMAKTZARPLATA);

   if(P_SUMAKTPENSFOND != null)
    P_SUMAKTPENSFOND = P_SUMAKTPENSFOND.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       stmt.setBigDecimal(5,P_SUMAKTPENSFOND);


   stmt.execute();

   }
   catch (SQLException e) {
   throw new EnergyproSystemException("Error in transferCounterMountInSC : " + e.getMessage() );
   }
   finally
   {
   try {if (stmt != null) stmt.close();} catch (SQLException e) {}
   if(connection != super.getConnection())
   {
   try{connection.close();} catch(SQLException e){}
   }
   }

}


 public void unprovCounterMountInSCZKU(int P_NUM_UN_ZKU)

{
  CallableStatement stmt = null;

   String query = "begin countersread.pkg_doc.MOUNT_ZKU_PROV_DEL(?)" +
        "; end;";

   Connection connection = getConnection();

   try {

   stmt = connection.prepareCall(query);

   stmt.setInt(1, P_NUM_UN_ZKU);

   stmt.execute();

   }
   catch (SQLException e) {
   throw new EnergyproSystemException("Error in transferCounterMountInSC : " + e.getMessage() );
   }
   finally
   {
   try {if (stmt != null) stmt.close();} catch (SQLException e) {}
   if(connection != super.getConnection())
   {
   try{connection.close();} catch(SQLException e){}
   }
   }

}



 public String getInvNumberZKU(int P_NUM_UN)

{
    PreparedStatement statement = null;
    ResultSet set = null;
     Connection connection = getConnection();

 try
  {
    String out=null;





    String query = " select kod_inv from countersread.ostable where num_un= ? ";

    statement = connection.prepareStatement(query);
    statement.setInt(1,P_NUM_UN);

    set = statement.executeQuery();


    if (set.next())
        out=set.getString(1);

   return out;

   }
   catch (SQLException e) {
   throw new EnergyproSystemException("Error" + e.getMessage() );
   }
   finally
   {
    try {
           if (set != null)
               set.close();
       } catch (SQLException e) {
       }
   try {if (statement != null) statement.close();}
   catch (SQLException e) {}
   if(connection != super.getConnection())
   {
   try{connection.close();} catch(SQLException e){}
   }
   }

}

 public BigDecimal getCostZKU(int P_NUM_UN)

 {
    PreparedStatement statement = null;
    ResultSet set = null;
      Connection connection = getConnection();

  try
   {
    BigDecimal out=new BigDecimal(0);

     String query = " select case when sum_st_perv is null then 0 else sum_st_perv end as sum_st_perv from countersread.ostable where num_un= ? ";

     statement = connection.prepareStatement(query);
     statement.setInt(1,P_NUM_UN);

     set = statement.executeQuery();


     if (set.next())
        out=set.getBigDecimal(1);

    return out;

    }
    catch (SQLException e) {
    throw new EnergyproSystemException("Error" + e.getMessage() );
    }
    finally
    {
        try {
            if (set != null)
                set.close();
        } catch (SQLException e) {
        }
    try {if (statement != null) statement.close();}
    catch (SQLException e) {}
    if(connection != super.getConnection())
    {
    try{connection.close();} catch(SQLException e){}
    }
    }

 }
 
 public String getPodrCodeZKU(int P_NUM_UN)

 {
     PreparedStatement statement = null;
     ResultSet set = null;
      Connection connection = getConnection();

  try
   {
     String out=null;





     String query = " select kod_podr from countersread.ostable where num_un = ? ";

     statement = connection.prepareStatement(query);
     statement.setInt(1,P_NUM_UN);

     set = statement.executeQuery();


     if (set.next())
         out=set.getString(1);

    return out;

    }
    catch (SQLException e) {
    throw new EnergyproSystemException("Error" + e.getMessage() );
    }
    finally
    {
     try {
            if (set != null)
                set.close();
        } catch (SQLException e) {
        }
    try {if (statement != null) statement.close();}
    catch (SQLException e) {}
    if(connection != super.getConnection())
    {
    try{connection.close();} catch(SQLException e){}
    }
    }

 }

public String getPlaceUst(int P_NUM_UN)

 {
    PreparedStatement statement = null;
    ResultSet set = null;
      Connection connection = getConnection();

  try
   {
    String out="";

     String query = " select place_ust from countersread.ostable where num_un= ? ";

     statement = connection.prepareStatement(query);
     statement.setInt(1,P_NUM_UN);

     set = statement.executeQuery();


     if (set.next())
        out=set.getString(1);

    return out;

    }
    catch (SQLException e) {
    throw new EnergyproSystemException("Error" + e.getMessage() );
    }
    finally
    {
        try {
            if (set != null)
                set.close();
        } catch (SQLException e) {
        }
    try {if (statement != null) statement.close();}
    catch (SQLException e) {}
    if(connection != super.getConnection())
    {
    try{connection.close();} catch(SQLException e){}
    }
    }

 }


public String getLschet(int P_NUM_UN)

{
    PreparedStatement statement = null;
    ResultSet set = null;
     Connection connection = getConnection();

 try
  {
    String out="";

    String query = " select lschet from countersread.ostable where num_un= ? ";

    statement = connection.prepareStatement(query);
    statement.setInt(1,P_NUM_UN);

    set = statement.executeQuery();


    if (set.next())
        out=set.getString(1);

   return out;

   }
   catch (SQLException e) {
   throw new EnergyproSystemException("Error" + e.getMessage() );
   }
   finally
   {
    try {
           if (set != null)
               set.close();
       } catch (SQLException e) {
       }
   try {if (statement != null) statement.close();}
   catch (SQLException e) {}
   if(connection != super.getConnection())
   {
   try{connection.close();} catch(SQLException e){}
   }
   }

}


public Date getDateUst(int P_NUM_UN)

{
    PreparedStatement statement = null;
    ResultSet set = null;
     Connection connection = getConnection();

 try
  {
    Date out=new Date();

    String query = " select date_ust from countersread.ostable where num_un= ? ";

    statement = connection.prepareStatement(query);
    statement.setInt(1,P_NUM_UN);

    set = statement.executeQuery();


    if (set.next())
        out=set.getDate(1);

   return out;

   }
   catch (SQLException e) {
   throw new EnergyproSystemException("Error" + e.getMessage() );
   }
   finally
   {
    try {
           if (set != null)
               set.close();
       } catch (SQLException e) {
       }
    try {
        if (statement != null)
            statement.close();
    }
   catch (SQLException e) {}
   if(connection != super.getConnection())
   {
   try{connection.close();} catch(SQLException e){}
   }
   }

}

/**
 * 
 * ���������� ��������� ���. ���� � ��������� ������������ �� ������������ ������ ��������
 * 
 * @param invNumber ����������� �����
 * @return ��������� ���. ����
 */
public String getLastAccount(String invNumber) {
    PreparedStatement statement = null;
    ResultSet set = null;
     Connection connection = getConnection();
     try {
    	 String out = null;
    	 String query = " select a1.kod_subsch_b from countersread.ostable a, countersread.ostable a1 where a.kod_inv = ? "
    	 		+ "and a.child_num_un is null and a1.num_un = a.parent_num_un ";
    	 statement = connection.prepareStatement(query);
    	 statement.setString(1,invNumber);
    	 set = statement.executeQuery();
    	 if (set.next())
    		 out=set.getString(1);
    	 return out;
     } catch (SQLException e) {
    	 throw new EnergyproSystemException("Error" + e.getMessage() );
     }
     finally {
    	 try {
    		 if (set != null)
    			 set.close();
    	 } catch (SQLException e) {
    	 }
    	 try {
    		 if (statement != null)
    			 statement.close();
    }
   catch (SQLException e) {}
   if(connection != super.getConnection())
   {
   try{connection.close();} catch(SQLException e){}
   }
   }

}

public Date getLastDtOper(String invNumber) {
    PreparedStatement statement = null;
    ResultSet set = null;
     Connection connection = getConnection();
     try {
    	 Date out = null;
    	 String query = " select nvl(a1.dt_oper, a1.dt_doc) from countersread.ostable a, countersread.ostable a1 where a.kod_inv = ? "
    	 		+ "and a.child_num_un is null and a1.num_un = a.parent_num_un ";
    	 statement = connection.prepareStatement(query);
    	 statement.setString(1,invNumber);
    	 set = statement.executeQuery();
    	 if (set.next())
    		 out=set.getDate(1);
    	 return out;
     } catch (SQLException e) {
    	 throw new EnergyproSystemException("Error" + e.getMessage() );
     }
     finally {
    	 try {
    		 if (set != null)
    			 set.close();
    	 } catch (SQLException e) {
    	 }
    	 try {
    		 if (statement != null)
    			 statement.close();
    }
   catch (SQLException e) {}
   if(connection != super.getConnection())
   {
   try{connection.close();} catch(SQLException e){}
   }
   }

}


public String getStatusZKU(int P_NUM_UN)

 {
    PreparedStatement statement = null;
    ResultSet set = null;
     Connection connection = getConnection();

  try
   {
    String out="N";

     String query = " select show_ from countersread.ostable where num_un= ? ";

     statement = connection.prepareStatement(query);
     statement.setInt(1,P_NUM_UN);

     set = statement.executeQuery();


     if (set.next())
        out=set.getString(1);

    return out;

        } catch (SQLException e) {
            throw new EnergyproSystemException("Error" + e.getMessage());
        } finally {
            try {
                if (set != null)
                    set.close();
            } catch (SQLException e) {
            }
            try {
                if (statement != null)
                    statement.close();
            } catch (SQLException e) {
            }
            if (connection != super.getConnection()) {
                try {
                    connection.close();
                } catch (SQLException e) {
                }
            }
        }

    }




    public int getNumUnZKU(String invCounter, Connection scConn,String lschet,List<String> podrs)

    {
        PreparedStatement statement = null;
        ResultSet set = null;
        // Connection connection =getSCConnection_();

        try {
            int out = -1;

            String query = " select num_un_zku from countersread.cou2zku where date_out is null and kod_inv_cou = ? ";

            statement = scConn.prepareStatement(query);
            statement.setString(1, invCounter);

            set = statement.executeQuery();

            if (set.next())
            {
            	out = set.getInt(1);
            }

            set.close();
            statement.close();

            if (out<0)
            {
            	query = " select num_un from countersread.ostable where lschet = ? and is_zku=1 and kod_podr in (" 
            			+ Tools.repeatSymbol("?", ",", podrs.size()) + ") order by show_ desc ";
            	statement = scConn.prepareStatement(query);
                int i = 1;
            	statement.setString(i++, lschet);
                for(String podr : podrs) {
                	statement.setString(i++, podr);
                }

                set = statement.executeQuery();

                if (set.next())
                {
                	out = set.getInt(1);
                }
                set.close();
                statement.close();

            }

            return out;

        } catch (SQLException e) {
            throw new EnergyproSystemException("Error" + e.getMessage());
        } finally {
            try {
                if (set != null)
                    set.close();
            } catch (SQLException e) {
            }
            try {
                if (statement != null)
                    statement.close();
            } catch (SQLException e) {
            }
            if (scConn != super.getConnection()) {
                try {
                    scConn.close();
                } catch (SQLException e) {
                }
            }
        }
    }


    public int revision_ins(
    	    int p_num_un
    	    , int p_typerevisionid
    	    , Date p_dateoperac
    	    , String p_numakt
    	    , Date p_dateakt
    	    , BigDecimal p_sumakt
    	    , BigDecimal p_sumaktmaterials
    	    , BigDecimal p_sumaktzarplata
    	    , BigDecimal p_sumaktpensfond
    	    , String p_kod_inv
    	    )


    	{

    	  int out=Integer.MIN_VALUE;

    	  CallableStatement stmt = null;

    	   String query = "begin ? := countersread.pkg_doc.REVISION_INS(" +
    			   "? " +
    			   ", ? " +
    			   ", ? " +
    			   ", ? " +
    			   ", ? " +
    			   ", ? " +
    			   ", ? " +
    			   ", ? " +
    			   ", ? " +
    			   ", ? " +
    			   ")" +
    	        "; end;";

    	   Connection connection = getConnection();

    	   try {

    	   stmt = connection.prepareCall(query);

    	   stmt.registerOutParameter(1, java.sql.Types.INTEGER);

    	   stmt.setInt(2, p_num_un);
    	   stmt.setInt(3, p_typerevisionid);
    	   stmt.setDate(4, new java.sql.Date(p_dateoperac.getTime()));
    	   stmt.setString(5, p_numakt);
    	   stmt.setDate(6, new java.sql.Date(p_dateakt.getTime()));
    	   stmt.setBigDecimal(7, p_sumakt);
    	   stmt.setBigDecimal(8, p_sumaktmaterials);
    	   stmt.setBigDecimal(9, p_sumaktzarplata);
    	   stmt.setBigDecimal(10, p_sumaktpensfond);
    	   stmt.setString(11, p_kod_inv);

    	   stmt.execute();

    	   out = stmt.getInt(1);

    	   return out;

    	   }
    	   catch (SQLException e) {
    	   throw new EnergyproSystemException("Error in revision_ins : " + e.getMessage() );
    	   }
    	   finally
    	   {
    	   try {if (stmt != null) stmt.close();} catch (SQLException e) {}
    	   if(connection != super.getConnection())
    	   {
    	   try{connection.close();} catch(SQLException e){}
    	   }
    	   }

    	}

    public void revision_sotr_ins(
    		int P_ID_REVISIONDATA
            , String P_TABN
            , String P_BALANS
            , BigDecimal P_SUMAKTZARPLATA
            , BigDecimal P_SUMAKTPENSFOND
    	    )


    	{

    	  int out=Integer.MIN_VALUE;

    	  CallableStatement stmt = null;

    	   String query = "begin countersread.pkg_doc.REVISION_SOTR_INS(" +
    			   "? " +
    			   ", ? " +
    			   ", ? " +
    			   ", ? " +
    			   ", ? " +
    			   ")" +
    	        "; end;";

    	   Connection connection = getConnection();

    	   try {

    	   stmt = connection.prepareCall(query);

    	   stmt.setInt(1, P_ID_REVISIONDATA);
    	   stmt.setString(2, P_TABN);
    	   stmt.setString(3, P_BALANS);
    	   stmt.setBigDecimal(4, P_SUMAKTZARPLATA);
    	   stmt.setBigDecimal(5, P_SUMAKTPENSFOND);

    	   stmt.execute();

    	   }
    	   catch (SQLException e) {
    	   throw new EnergyproSystemException("Error in revision_ins : " + e.getMessage() );
    	   }
    	   finally
    	   {
    	   try {if (stmt != null) stmt.close();} catch (SQLException e) {}
    	   if(connection != super.getConnection())
    	   {
    	   try{connection.close();} catch(SQLException e){}
    	   }
    	   }

    	}

    public void revision_del(
    		int P_NUM_UN
    	    )


    	{

    	  int out=Integer.MIN_VALUE;

    	  CallableStatement stmt = null;

    	   String query = "begin countersread.pkg_doc.RECOVER_OS_REVISION(?);" +
    	        "end;";

    	   Connection connection = getConnection();

    	   try {

    	   stmt = connection.prepareCall(query);

    	   stmt.setInt(1, P_NUM_UN);

    	   stmt.execute();

    	   }
    	   catch (SQLException e) {
    	   throw new EnergyproSystemException("Error in revision_del : " + e.getMessage() );
    	   }
    	   finally
    	   {
    	   try {if (stmt != null) stmt.close();} catch (SQLException e) {}
    	   if(connection != super.getConnection())
    	   {
    	   try{connection.close();} catch(SQLException e){}
    	   }
    	   }

    	}


    /**
     *
     * �������� ���������� ��� (num_un) ������ �� �������� �� ����������� ���� ������� � �������������
     *
     * @param id_revision_data ���������� ��� ������� � �������������
     * @return num_un �� ������������� ��� Integer.MIN_VALUE ���� ������ �� �������
     */
    public int getNumUn(int id_revision_data)

    {
        PreparedStatement statement = null;
        ResultSet set = null;
         Connection connection = getConnection();

     try
      {
        int out= Integer.MIN_VALUE;

        String query = " select num_un from countersread.revisiondata where id = ? ";

        statement = connection.prepareStatement(query);
        statement.setInt(1,id_revision_data);

        set = statement.executeQuery();


        if (set.next())
            out=set.getInt(1);

       return out;

       }
       catch (SQLException e) {
       throw new EnergyproSystemException("Error" + e.getMessage() );
       }
       finally
       {
        try {
               if (set != null)
                   set.close();
           } catch (SQLException e) {
           }
       try {if (statement != null) statement.close();}
       catch (SQLException e) {}
       if(connection != super.getConnection())
       {
       try{connection.close();} catch(SQLException e){}
       }
       }

    }

    /**
     *
     * �������� ������������ ���������� ��� (parent_num_un) ������ �� �������� �� ����������� ���� (num_un) � �������������
     *
     * @param p_num_un ���������� ��� � �������������
     * @return parent_num_un �� ������������� ��� Integer.MIN_VALUE ���� ������ �� �������
     */
    public int getParentNumUn(int p_num_un)

    {
        PreparedStatement statement = null;
        ResultSet set = null;
         Connection connection = getConnection();

     try
      {
        int out= Integer.MIN_VALUE;

        String query = " select parent_num_un from countersread.ostable where num_un = ? ";

        statement = connection.prepareStatement(query);
        statement.setInt(1,p_num_un);

        set = statement.executeQuery();


        if (set.next())
            out=set.getInt(1);

       return out;

       }
       catch (SQLException e) {
       throw new EnergyproSystemException("Error" + e.getMessage() );
       }
       finally
       {
        try {
               if (set != null)
                   set.close();
           } catch (SQLException e) {
           }
       try {if (statement != null) statement.close();}
       catch (SQLException e) {}
       if(connection != super.getConnection())
       {
       try{connection.close();} catch(SQLException e){}
       }
       }

    }

    /**
     *
     * ����� �������� ���������� (��������) ��������
     *
     * @param P_NUM_UN id ������ �� �������
     */
    public void likvidation_del(int P_NUM_UN)
    {

    	  int out=Integer.MIN_VALUE;

    	  CallableStatement stmt = null;

    	  String query = "begin countersread.pkg_doc.RECOVER_OS_LIKVIDATION(?); end;";

    	   Connection connection = getConnection();

    	   try {

    		   stmt = connection.prepareCall(query);

    		   stmt.setInt(1, P_NUM_UN);

    		   stmt.execute();

    	   }
    	   catch (SQLException e) {
    		   throw new EnergyproSystemException("Error in likvidation_del : " + e.getMessage() );
    	   }
    	   finally
    	   {
    		   try {if (stmt != null) stmt.close();} catch (SQLException e) {}
    		   if(connection != super.getConnection())
    		   {
    			   try{connection.close();} catch(SQLException e){}
    		   }
    	   }
    }

    /**
     *
     * �������� ���������� (��������) ��������
     *
     * @param p_num_un id ������ �� ������� �� ���������
     * @param p_numakt ����� ���� ��������
     * @param p_dateakt ���� ���� ��������
     * @param p_dateoper ���� ��������
     * @param p_kod_subsch ��� �����
     */
    public void likvidation_ins(
    	    int p_num_un
    	    , String p_numakt
    	    , Date p_dateakt
    	    , Date p_dateoper
    	    , String p_kod_subsch
    	    )


    	{


    	  CallableStatement stmt = null;

    	  String query = "begin countersread.pkg_doc.LIKV_KART(" +
    			   "? " +
    			   ", ? " +
    			   ", ? " +
    			   ", ? " +
    			   ", ? " +
    			   ")" +
    	        "; end;";

    	   Connection connection = getConnection();

    	   try {

    		   stmt = connection.prepareCall(query);


    		   stmt.setInt(1, p_num_un);
    		   stmt.setString(2, p_numakt);
    		   stmt.setDate(3, new java.sql.Date(p_dateakt.getTime()));
    		   stmt.setDate(4, new java.sql.Date(p_dateoper.getTime()));
    		   stmt.setString(5, p_kod_subsch);

    		   stmt.execute();

    	   }
    	   catch (SQLException e) {
    		   throw new EnergyproSystemException("Error in likvidation_ins : " + e.getMessage() );
    	   }
    	   finally
    	   {
    		   try {if (stmt != null) stmt.close();} catch (SQLException e) {}
    		   if(connection != super.getConnection())
    		   {
    			   try{connection.close();} catch(SQLException e){}
    		   }
    	   }

    	}
    
    /**
     * 
     * �������� ��������� ������������ �������� �� ���� �� �������������
     * 
     * @param num_un ��� �� �������������
     * @return ��������� ������������ ����������� �� ���� ������ ����� ������� ��� null ���� 
     */
	public BigDecimal getCounterIncomeCost(int num_un) {
		if(num_un == Integer.MIN_VALUE) throw new java.lang.NullPointerException("");
		String sql = "select nvl(o.sum_st_priobr, 0) from countersread.ostable o where o.num_un = ?";
		Vector<Integer> binded = new Vector<Integer>();
		binded.add(num_un);
		BigDecimal out = BaseDAOUtils.executeStatementAndReadObject(getConnection(), sql, binded,
				new BaseDAOUtils.BigDecimalFromResultSetTransformator(), false);
		return (out == null) ? out : out.setScale(2, BigDecimal.ROUND_HALF_UP);
	}


    /*
    FUNCTION DEFECT_PROV_INS(P_NUM_UN Number, -- ��.��� ��������
                             P_NUM_AKT Varchar2, -- ����� ����
                             P_DATE_AKT Date, -- ���� ����
                             P_DATE_OPER date, -- ���� ����������
                             P_OPER_USER Varchar2, -- ��� ������������
                             P_PRIMECHAN Varchar2 -- ���������� ��������
                            )
    */
    /**
     * ���������� ���� ���������� ���������
     *
     * @param p_num_un - ��. ��� �������� �� ScanCounters
     * @param p_numakt - ����� ����
     * @param p_dateakt - ���� ����
     * @param p_dateoper - ���� ���������� ����
     * @param p_oper_user - ��� ������������
     * @param p_primechan - ���������� ��������
     *
     * @return ����� ��� �������� �� ScanCounters (num_un)
     */
    public int defect_prov_ins(int p_num_un, String p_numakt, Date p_dateakt, Date p_dateoper, String p_oper_user, String p_primechan)
    {
    	int out = Integer.MIN_VALUE;

  	  	CallableStatement stmt = null;

  	  	String query = " begin ? := countersread.pkg_doc.DEFECT_PROV_INS(?, ?, ?, ?, ?, ?); end; ";

  	  	Connection connection = getConnection();

  	  	try
  	  	{
  	  		stmt = connection.prepareCall(query);

  	  		stmt.registerOutParameter(1, java.sql.Types.INTEGER);

  	  		stmt.setInt(2, p_num_un);
  	  		stmt.setString(3, p_numakt);
  	  		stmt.setDate(4, new java.sql.Date(p_dateakt.getTime()));
  	  		stmt.setDate(5, new java.sql.Date(p_dateoper.getTime()));
  	  		stmt.setString(6, p_oper_user);
  	  		stmt.setString(7, p_primechan);

  	  		stmt.execute();

  	  		out = stmt.getInt(1);

  	  		return out;
  	  	}
  	  	catch (SQLException e)
  	  	{
  	  		throw new EnergyproSystemException("Error in defect_prov_ins: " + e.getMessage());
  	  	}
  	  	finally
  	  	{
  	  		try {if (stmt != null) stmt.close();} catch (SQLException e) {}
  	  		if(connection != super.getConnection())
  	  		{
  	  			try{connection.close();} catch(SQLException e){}
  	  		}
  	  	}
    }

    /* PROCEDURE DEFECT_PROV_DEL(P_NUM_UN Number) */
    /**
     * ������ ���������� ���� ���������� ���������
     *
     * @param p_num_un - ��. ��� �������� �� ScanCounters
     */
    public void defect_prov_del(int p_num_un)
    {
  	  	CallableStatement stmt = null;

  	  	String query = " begin countersread.pkg_doc.DEFECT_PROV_DEL(?); end; ";

  	  	Connection connection = getConnection();

  	  	try
  	  	{
  	  		stmt = connection.prepareCall(query);

  	  		stmt.setInt(1, p_num_un);

  	  		stmt.execute();
  	  	}
  	  	catch (SQLException e)
  	  	{
  	  		throw new EnergyproSystemException("Error in defect_prov_del: " + e.getMessage());
  	  	}
  	  	finally
  	  	{
  	  		try {if (stmt != null) stmt.close();} catch (SQLException e) {}
  	  		if(connection != super.getConnection())
  	  		{
  	  			try{connection.close();} catch(SQLException e){}
  	  		}
  	  	}
    }

}
