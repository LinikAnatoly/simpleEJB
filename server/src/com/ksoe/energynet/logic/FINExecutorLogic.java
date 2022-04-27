package com.ksoe.energynet.logic;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.FINExecutorDAO;
import com.ksoe.energynet.valueobject.ENElement;
import com.ksoe.energynet.valueobject.ENElementType;
import com.ksoe.energynet.valueobject.ENPlanWork;
import com.ksoe.energynet.valueobject.FINExecutor;
import com.ksoe.energynet.valueobject.filter.FINExecutorFilter;
import com.ksoe.energypro.logic.LogicModule;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;

public class FINExecutorLogic extends LogicModule {

    /**
	 *
	 */
	private static final long serialVersionUID = 1L;



	public FINExecutorLogic(Connection connection, UserProfile userProfile) {
        super(connection, userProfile);
    }

    public Integer setFinExecutorInPlan(ENPlanWork object, ENElement e) {
    	try {
    		FINExecutorDAO dao = new FINExecutorDAO(connection, userProfile);
	    if (object.finExecutor != null) {
	        if (object.finExecutor.finCode > Integer.MIN_VALUE || object.finExecutor.axOrgId != null) {
	            FINExecutor f = new FINExecutor();
	            f.finCode = object.finExecutor.finCode;
	            f.name = object.finExecutor.name;
	            f.finCehCode = object.finExecutor.finCehCode;
	            f.finCehName = object.finExecutor.finCehName;
	            f.finKindCode = object.finExecutor.finKindCode;
	            f.finKindName = object.finExecutor.finKindName;
	            f.finTypeCode = object.finExecutor.finTypeCode;
	            f.finTypeName = object.finExecutor.finTypeName;
	            ///// MDAX-441
	            f.axOrgId = object.finExecutor.axOrgId;
	            f.axParentOrgId = object.finExecutor.axParentOrgId;
	            f.axParentOrgName = object.finExecutor.axParentOrgName;
	            f.axOrgTypeId = object.finExecutor.axOrgTypeId;
	            f.axOrgTypeName = object.finExecutor.axOrgTypeName;
	            /////


	            if (e.typeRef.code != ENElementType.PURCHASES_OBJECT
	            		&& e.typeRef.code != ENElementType.PURCHASES_NO_OBJECT
	            		&& e.typeRef.code != ENElementType.NO_OBJECT_RESTOCKING
	            		&& e.typeRef.code != ENElementType.NO_OBJECT_GIFT
	            		&& e.typeRef.code != ENElementType.NO_OBJECT_AVR16
	            		&& e.typeRef.code != ENElementType.NO_OBJECT_AVZ

	            		/** SUPP-96277... +++ 04.12.2020... пропускаем услуги */
	            		&& e.typeRef.code != ENElementType.SERVICES_OBJECT ) {

	            	this.checkFinExecutorHasPersonal(object.dateStart, f);
	            }

	            f.code = dao.add(f);
	            object.finExecutor.code = f.code;
	            return f.code;
	        }
	    } else if (e.finExecutor != null) {
	    	Integer retVal = Integer.MIN_VALUE;
	    	retVal = dao.add(e.finExecutor);
	    	return retVal;
	    }
   } catch (PersistenceException e1) {
	   throw new SystemException(e1);
   } finally {

   }
    	return null;
    }

    /**
     *
     * SUPP-52106 Проверка, что виконавець на плане будет иметь людей
     *
     * Проверяет только при заполненном {@code axOrgId} и если нет людей в этом
     * подразделении то будет сгенерировано исключение
     *
     * @param date дата для выборки
     * @param finExecutor {@link FINExecutor} объект Виконавець
     * @throws PersistenceException
     */
    public void checkFinExecutorHasPersonal(Date date, FINExecutor finExecutor) throws PersistenceException {
    	try {
    		mDaxLogic logic = new mDaxLogic(getConnection(AuthorizationJNDINames.MDAX_DATASOURCE), userProfile);

            if(finExecutor.axOrgId != null && finExecutor.axOrgId.length() > 0) {
                BigDecimal countPersonalInPodr = logic.getCountPersonalInPodrAx(date, finExecutor.axOrgId, false);
                if(countPersonalInPodr.equals(new BigDecimal(0))) {
                	throw new SystemException(String.format("SUPP-52106 У підрозділі \"%s\" "
                			+ "з кодом %s , на дату %s немає персоналу. Неможливо обирати такі підрозділи як виконавця"
                			, finExecutor.name
                			, finExecutor.axOrgId
                			, new SimpleDateFormat("dd.MM.yyyy").format(date)  ));
                }
            }

    	} catch (DatasourceConnectException e) {
    		throw new SystemException("Немає зв'язку із MS Axapta");
		}
    }

    public FINExecutor checkUnicFinExecutor(FINExecutor newFinExecutor)
            throws PersistenceException {

        /**
         *  проверка уникальности по полям....
         *  name, fincode, fintypename, fintypecode,
         *  finkindname, finkindcode, fincehname, fincehcode
         *
         */

        FINExecutorFilter filter = new FINExecutorFilter();
        filter.name = newFinExecutor.name;
        filter.finCode = newFinExecutor.finCode;
        filter.finTypeName = newFinExecutor.finTypeName;
        filter.finTypeCode = newFinExecutor.finTypeCode;
        filter.finKindName = newFinExecutor.finKindName;
        filter.finKindCode = newFinExecutor.finKindCode;
        filter.finCehName = newFinExecutor.finCehName;
        filter.finCehCode = newFinExecutor.finCehCode;
        ///// MDAX-441
        filter.axOrgId = newFinExecutor.axOrgId;
        filter.axParentOrgId = newFinExecutor.axParentOrgId;
        filter.axParentOrgName = newFinExecutor.axParentOrgName;
        filter.axOrgTypeId = newFinExecutor.axOrgTypeId;
        filter.axOrgTypeName = newFinExecutor.axOrgTypeName;
        /////

        FINExecutorDAO finExecutorDAO = new FINExecutorDAO(connection, userProfile);
        int[] executorArr = finExecutorDAO.getUnicFilteredCodeArray(filter, 0, 1);

        if (executorArr.length > 0) {
            FINExecutor distFinExecutor = finExecutorDAO.getObject(executorArr[0]);
            return distFinExecutor;
        } else {
            return newFinExecutor;
        }
    }



    /**
     *	возвращает полное наименование подразделения
     *
     *	@param - FINExecutor
     *	@return - fullAxExecutorName
     */
	public String getFullAxExecutorName(FINExecutor finExecutor) {

		Connection mDaxConnection = null;
		PreparedStatement statement = null;
		ResultSet set = null;
		String fullAxExecutorName = "";

		try {
			mDaxConnection = getConnection(AuthorizationJNDINames.MDAX_DATASOURCE);

			if (finExecutor.axOrgId != null && finExecutor.axOrgId.length() > 0) {

				String selectStr =
					" with tree as ( " +
					" select hrmorganizationid, " +
					" 	   description, " +
					"	   parentorganizationid, " +
					"	   1 as level  " +
					"   from dbo.ENERGYNET_FN_ORGANIZATION_STRUCTURE ('KSOE' , '" + new SimpleDateFormat("dd.MM.yyyy").format(new Date()) + "', '" + finExecutor.axOrgId + "', 0 ) " +
					"   union all " +
					"   select p.hrmorganizationid, " +
					"          p.description, " +
					"          p.parentorganizationid, " +
					"          t.level + 1 " +
					"   from dbo.ENERGYNET_FN_ORGANIZATION_STRUCTURE ('KSOE' , '" + new SimpleDateFormat("dd.MM.yyyy").format(new Date()) + "', '',  1 ) p " +
					"   join tree t on t.parentorganizationid = p.hrmorganizationid " +
					" ) " +
					" select * " +
					" from tree " +
					" order by 4,2 ";


				statement = mDaxConnection.prepareStatement(selectStr);

				for (set = statement.executeQuery(); set.next();) {
					if (set.getString("PARENTORGANIZATIONID") != null && set.getString("PARENTORGANIZATIONID").length() > 0) {

						if (fullAxExecutorName.length() > 0) {
							fullAxExecutorName = fullAxExecutorName + " " + set.getString("DESCRIPTION");
						} else {
							fullAxExecutorName = set.getString("DESCRIPTION");
						}
					}
				}
			}

		} catch (DatasourceConnectException e) {
			throw new SystemException("\n\n"
					+ "Немає зв'язку із MS Axapta");
		} catch (SQLException e) {
			throw new SystemException(e.getMessage(), e);
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
			if (mDaxConnection != null) {
				try {
					mDaxConnection.close();
				} catch (SQLException e) {
				}
			}
		}

		return fullAxExecutorName;
	}

}
