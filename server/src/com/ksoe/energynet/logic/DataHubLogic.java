package com.ksoe.energynet.logic;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energypro.logic.LogicModule;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;

public class DataHubLogic extends LogicModule {

	public DataHubLogic(Connection connection, UserProfile userProfile) {
		super(connection, userProfile);
	}

	public void updateMaterialPrice(int materialCode, BigDecimal price) {

		if (materialCode == Integer.MIN_VALUE) {
			throw new SystemException("\n\nSUPP-83003 �� ������� ��� �������� � EnergyNet!");
		}
		
		if (price == null) {
			throw new SystemException("\n\nSUPP-83003 �� ������ ���� �������� � EnergyNet!");
		}
		
		Connection dataHubConnection = null;
		PreparedStatement preparedStmt = null;

		try {
			dataHubConnection = getConnection(AuthorizationJNDINames.DATAHUB_DATASOURCE);

			String updQuery = "update dhmaterials set price = ? where encode = ?";

			preparedStmt = dataHubConnection.prepareStatement(updQuery);
			preparedStmt.setBigDecimal(1, price);
			preparedStmt.setInt(2, materialCode);

			preparedStmt.execute();

		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (SQLException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {
				if (preparedStmt != null)
					preparedStmt.close();
			} catch (SQLException e) {
			}
			try {
				if (dataHubConnection != null && !dataHubConnection.isClosed()) {
					dataHubConnection.close();
					dataHubConnection = null;
				}
			} catch (SQLException e) {
			}
		}
	}
	
	/**
	 * �������� ������� �������-����� � ������� ����������/�����������
	 * 
	 * @param npzCode - ��� �������-�����
	 */
	public void checkNpzCodeInDHDisconnection(int npzCode) {
		if (npzCode == Integer.MIN_VALUE) {
			throw new SystemException("\n\n�� ������� ��� ��������-����� � EnergyNet!");
		}

		Connection dataHubConnection = null;
		PreparedStatement preparedStmt = null;
		ResultSet set = null;

		try {
			dataHubConnection = getConnection(AuthorizationJNDINames.DATAHUB_DATASOURCE);

			String query = "select code from dhdisconnection where npzcode = ?";

			preparedStmt = dataHubConnection.prepareStatement(query);
			preparedStmt.setInt(1, npzCode);
			
			set = preparedStmt.executeQuery();
			
			int count = 0;			
			while (set.next()) {
				count++;
			}
			
			if (count == 0) {
				throw new SystemException("\n\n� ����� ���������/��������� DataHub �� �������� ������ ��� ��������-����� � ����� " + 
						npzCode + " !");
			}

			if (count > 1) {
				throw new SystemException("\n\n� ����� ���������/��������� DataHub �������� ������� (" + count + ") " + 
						"������ ��� ��������-����� � ����� " + npzCode + " !");
			} 
			
		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (SQLException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {
				if (set != null)
					set.close();
			} catch (SQLException e) {
			}
			try {
				if (preparedStmt != null)
					preparedStmt.close();
			} catch (SQLException e) {
			}
			try {
				if (dataHubConnection != null && !dataHubConnection.isClosed()) {
					dataHubConnection.close();
					dataHubConnection = null;
				}
			} catch (SQLException e) {
			}
		}		
	}
	
	/**
	 * ���������� ���� �������-����� � ������� ����������/�����������
	 * 
	 * @param npzCode - ��� �������-�����
	 * @param factCode - ��� �������-�����
	 */
    public void updateDisconnectionFactCode(int npzCode, int factCode) {
		if (npzCode == Integer.MIN_VALUE) {
			throw new SystemException("\n\n�� ������� ��� ��������-����� � EnergyNet!");
		}

		Connection dataHubConnection = null;
		PreparedStatement preparedStmt = null;

		try {
			dataHubConnection = getConnection(AuthorizationJNDINames.DATAHUB_DATASOURCE);

			String updQuery = "update dhdisconnection set factcode = ? where npzcode = ?";

			preparedStmt = dataHubConnection.prepareStatement(updQuery);
			if (factCode != Integer.MIN_VALUE ) {
				preparedStmt.setInt(1, factCode);
			} else {
				preparedStmt.setNull(1, java.sql.Types.INTEGER);
			}			
			preparedStmt.setInt(2, npzCode);
			
			preparedStmt.execute();
			
		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (SQLException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {
				if (preparedStmt != null)
					preparedStmt.close();
			} catch (SQLException e) {
			}
			try {
				if (dataHubConnection != null && !dataHubConnection.isClosed()) {
					dataHubConnection.close();
					dataHubConnection = null;
				}
			} catch (SQLException e) {
			}
		}
    }

    /**
     * ���������� ������ ������� �� ����������/����������� � DataHub �� ���� �������-�����
     * 
     * @param factCode - ��� �������-����� 
     * @return ������ ������� � DataHub
     */
	public int getDHDisconnectionStatusByFactCode(int factCode) {
		if (factCode == Integer.MIN_VALUE) {
			throw new SystemException("\n\n�� ������� ��� ��������-����� � EnergyNet!");
		}

		Connection dataHubConnection = null;
		PreparedStatement preparedStmt = null;
		ResultSet set = null;

		try {
			dataHubConnection = getConnection(AuthorizationJNDINames.DATAHUB_DATASOURCE);

			String query = "select statuscode from dhdisconnection where factcode = ?";

			preparedStmt = dataHubConnection.prepareStatement(query);
			preparedStmt.setInt(1, factCode);

			set = preparedStmt.executeQuery();

			if (set.next()) {
				return set.getInt(1);
			}

			return Integer.MIN_VALUE;

		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (SQLException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {
				if (set != null)
					set.close();
			} catch (SQLException e) {
			}
			try {
				if (preparedStmt != null)
					preparedStmt.close();
			} catch (SQLException e) {
			}
			try {
				if (dataHubConnection != null && !dataHubConnection.isClosed()) {
					dataHubConnection.close();
					dataHubConnection = null;
				}
			} catch (SQLException e) {
			}
		}		
	}

}
