package com.ksoe.energynet.logic;

import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.math.BigDecimal;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

import org.apache.commons.csv.CSVParser;
import org.apache.commons.csv.CSVRecord;

import com.ksoe.energynet.util.Tools;
import com.ksoe.energynet.valueobject.ENTravelSheet;
import com.ksoe.energynet.valueobject.ENTravelSheetFuelFill;
import com.ksoe.energynet.valueobject.brief.ENTravelSheetItemShort;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.energypro.logic.LogicModule;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;

import jsint.InputPort;
import jsint.Pair;
import jsint.Symbol;

public class GlobusLogic extends LogicModule {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public GlobusServerConnector getConnector(boolean createThreadOnRead) {
		GlobusServerConnector connector = new GlobusServerConnector("10.77.11.238", 3201, "hoe", "ujkjnehbz", createThreadOnRead);
		connector.open();
		return connector ;
	}
	
	/**
	 * 
	 * Абстрактный класс "Перехватчик сообщений из сервера СКТ Глобус"
	 * 
	 * @author kreschishinma
	 *
	 * @param <T> T - то, что необходимо получить после перехвата
	 */
	public abstract class MessageInterceptor<T> {
		private final Date creationDate = new Date();
		private final String userName = GlobusLogic.this.userProfile.userName;
		private final String receivingStr;
		private T results;
		private GlobusServerConnector globusServerConnector = null;
		private volatile boolean isFinished = false;
		private boolean isError = false;
		private String errorMessage = null;
		
		/**
		 * 
		 * Конструктор для Перехватчика сообщений
		 * 
		 * @param receivingStr строка наименование запроса, который перехватчик ждет от сервера СКТ Глобус 
		 */
		public MessageInterceptor(String receivingStr) {
			this.receivingStr = receivingStr;
		}
		
		public boolean checkQuery(String value) {
			return receivingStr.equalsIgnoreCase(value);
		}
		
		public T getResults() {
			// Ждет пока отработает 
			while(!isFinished) {}
			if(isError) {
				throw new EnergyproSystemException("Обработчик сообщения СКТ \"Глобус\" возвратил ошибку: " + errorMessage);
			}
			globusServerConnector.removeInterceptor(this);
			return results;
		}
		
		public abstract T parse(Pair pair);
		
		/**
		 * Для того, чтобы этот конструктор не использовался вообще он 
		 * 
		 */
		@SuppressWarnings("unused")
		private MessageInterceptor(){ receivingStr = "";};
		
		public boolean equals(Object object) {
			boolean out = false;
			if(object instanceof MessageInterceptor) {
				MessageInterceptor<?> interceptor = (MessageInterceptor<?>)object;
				out = interceptor.checkQuery(this.receivingStr) && creationDate.equals(interceptor.creationDate) 
						&& (this.userName != null ? "" : this.userName ).equals((interceptor.userName != null ? "" : interceptor.userName ));
			}
			return out;
			
		}
		
		public void receive(Pair object) {
			if(object.rest() instanceof Pair) {
				Pair _par = (Pair)(object.rest());
		      if(_par.first() instanceof Pair) {
			         PairIterator i = new PairIterator((Pair)_par.first());

			         while(i.hasNext()) {
			            Object obj = i.next();
			            if(obj instanceof Pair) {
			               T result = this.parse((Pair)obj);
			               if(result != null) {
			                  results = result;
			               }
			            }
			         }
		      } else {
		         isError = true;
		         errorMessage = "ERROR Объект не является типом Pair";
		      }
			}
			isFinished = true;						

		}
	}
	
	public class SimpleStringMessageInterceptor extends MessageInterceptor<String> {
		
		public SimpleStringMessageInterceptor(String query) {
			super(query);
		}

		@Override
		public String parse(Pair pair) {
			return (pair != null && pair.rest() != null) ? pair.rest().toString() : "";
		}
		
	}

	/**
	 * 
	 * Класс для связывания с сервером СКТ Глобус
	 * 
	 * @author kreschishinma
	 *
	 */
	public class GlobusServerConnector {
		   private String addressName;
		   private int port;
		   private String user;
		   private String password;
		   private Socket socket;
		   private BufferedWriter bufferedWriter;
		   private volatile boolean isClosed = true;
		   
		   private Thread thread = null;
		   private InputStreamReader inputStreamReader = null;
		   private InputPort inputPort = null;
		   private boolean createThreadOnRead;
		   final LinkedList<MessageInterceptor<?>> messageInterceptors = new LinkedList<MessageInterceptor<?>>();
		   
		   public String prepareForQuery(String value) {
			      String[] array = value.split("(\n|\r)");
			      StringBuffer stringBuffer = new StringBuffer();

			      for(int i = 0; i < array.length; ++i) {
			         stringBuffer.append(array[i]);
			      }

			      return stringBuffer.toString().replace("\"", "\\\"");
		   }
		   
		   public void addInterceptor(MessageInterceptor<?> interceptor) {
			   if(!this.createThreadOnRead) {
				   throw new SystemException("Заданное подключение к серверу \"СКТ Глобус\" не было открыто для чтения данных");
			   }
			   synchronized (messageInterceptors) {
				   interceptor.globusServerConnector = this;
				   messageInterceptors.add(interceptor);
			   }
		   }
		   
		   public void removeInterceptor(MessageInterceptor<?> interceptor) {
			   synchronized(messageInterceptors) {
				   interceptor.globusServerConnector = null;
				   messageInterceptors.remove(interceptor);		   
			   }
		   }
		   
		   public void sendQuery(String value) {
			   try {
			      synchronized(this.bufferedWriter) {
			         this.bufferedWriter.write(value);
			         this.bufferedWriter.flush();
			      }
			   } catch(IOException e) {
				   throw new SystemException(e);
			   }
		   }
		   
		      Runnable runnable = new Runnable() {
				@Override
				public void run() {
						try {
							
							InputPort inputPort = GlobusServerConnector.this.inputPort;
							while(!Thread.interrupted() && !GlobusServerConnector.this.isClosed) {
								synchronized(inputPort) {
									Object object = inputPort.read();
									if(object != InputPort.EOF) {
											if(object instanceof Pair) {
												Pair pair = (Pair)object;
												if(pair.first() instanceof Symbol) {
													String queryName = pair.first().toString();
													synchronized (messageInterceptors) {
														for(MessageInterceptor<?> interceptor : messageInterceptors) {
															if(interceptor.checkQuery(queryName)) {
																interceptor.receive(pair);
															}
														}	
													}
												}
											}
									} else {
										break;
									}	
								}
							}
						} finally {
							
						}
				}
		    	  
		      };
		   
		   
		   public GlobusServerConnector(String addressName, int port, String user, String password, boolean createThreadOnRead) {
		    	  this.addressName = addressName;
		    	  this.port = port;
		    	  this.user = user;
		    	  this.password = password;
		    	  this.createThreadOnRead = createThreadOnRead;
		   }
		   
		   public void close() {
			   try {
				   if(this.thread != null) {
					   synchronized (this.inputPort) {this.thread.interrupt();}
				   }
				   this.sendQuery("(bye)");
				   if(this.socket != null) {
					   try {
						   this.socket.close();
					   } catch(Exception e) { System.out.println(e); }
				   }
				   this.isClosed = true;
			   } catch(Exception e) {
				   throw new SystemException(e);
			   }

		   }
		   
		   public boolean isClosed() {
			   return this.isClosed;
		   }
		   
		   public void open() {
			   try {
				  this.socket = new Socket();
		    	  this.socket.connect(new InetSocketAddress(this.addressName, this.port));
			      this.bufferedWriter = new BufferedWriter(new OutputStreamWriter(this.socket.getOutputStream(), "UTF-8"));
			      this.bufferedWriter.write(String.format("(proto-version %d)\n", 24));
			      this.bufferedWriter.write(String.format("(do-auth \"%s\" \"%s\")\n", prepareForQuery(this.user), prepareForQuery(this.password)));
			      this.bufferedWriter.flush();
			      if(this.createThreadOnRead) {
			    	  inputStreamReader = new InputStreamReader(GlobusServerConnector.this.socket.getInputStream(), "UTF-8");
			    	  inputPort = new InputPort(inputStreamReader);
				      thread = new Thread(runnable);
				      thread.start();
			      }
			      this.isClosed = false;
			   } catch (IOException e) {
				   throw new SystemException(e);
			} finally {
				   
			   }
		   }
	}
	
	/***
	 * 
	 * Итератор для объекта Pair, кот.
	 * используется при обработки полученных результатов
	 * от сервера СКТ "Глобус"
	 * 
	 * @author kreschishinma
	 *
	 */
	public class PairIterator implements Iterator<Pair> {
		private Pair pair;

		public PairIterator(Pair pair) {
			this.pair = pair;
		}
		public boolean hasNext() {
			return this.pair != null && this.pair != Pair.EMPTY;
		}
		public Pair next() {
			Object firstInPair = this.pair.first();
			Object secondInPair = this.pair.rest();
			if(secondInPair instanceof Pair) {
				this.pair = (Pair)secondInPair;
			} else {
				this.pair = null;
			}
			return (Pair)firstInPair;
		}
		public void remove() {}
	}
	

	private static final String FUEL_FILLS_EXPORT_CSV = "fuel-fills-export";
	
	private static final String REG_ID_COLUMN = "reg-id";
	private static final String SENSOR_NUM_COLUMN = "sensor-num";
	private static final String VOLUME__DEG_COLUMN = "volume, deg";
	private static final String TIME_BEGIN_UTC_COLUMN = "time-begin, utc";
	private static final String LONGITUDE_DEG_COLUMN = "longitude, deg";
	private static final String LATITUDE_DEG_COLUMN = "latitude, deg";
	private static final String TIME_RECIEVE_UTC_COLUMN = "time-recieve, utc";
	
	private static final SimpleDateFormat dateFormatISO8601 = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
	private static final SimpleDateFormat dateFormatReceived = new SimpleDateFormat("dd.MM.yyyy HH:mm:ss");
	
	private static final String SERVER_ADDRESS = "10.77.11.238";
	private static final String SERVER_PORT = "3201";
	private static final String JAVA_PATH = System.getProperty("java.home") + "/bin/java";
	private static final String JAR_FILE_PATH = "/opt/globus/jglobus2.jar";
	
	
	private static final String[] FUEL_FILLS_EXPORT_CSV_COLUMNS = { REG_ID_COLUMN,
		SENSOR_NUM_COLUMN, VOLUME__DEG_COLUMN, TIME_BEGIN_UTC_COLUMN, LONGITUDE_DEG_COLUMN,
		LATITUDE_DEG_COLUMN, TIME_RECIEVE_UTC_COLUMN };

	  public GlobusLogic(Connection connection, UserProfile userProfile)
	  {
	    super(connection, userProfile);
	  }
	  
	  /**
	   * 
	   * Функция-проверка наличия датчика топлива по регистратору в бд СКТ "Глобус"
	   * 
	   * @param reg_id номер регистратора в СКТ Глобус
	   * @return true - есть, false - нет
	   * @throws PersistenceException
	   */
	  public boolean checkExistFuelLevelSensor(int reg_id) throws PersistenceException
	  {
			String sql = "SELECT count(vs.reg_id) FROM vehicle_sensors vs where vs.sensor_num = 27 "
					+ "and vs.reg_id = " + reg_id;

			PreparedStatement statement = null;
			ResultSet  resultSet = null;

			try {

				statement = connection.prepareStatement(sql);

				resultSet = statement.executeQuery();
				
				boolean result = false;
				
				while(resultSet.next())
				{
					int int_result = resultSet.getInt(1);
					result = ((int_result == 0) ? false : true);
				}
				
				return result;
			}
			catch (SQLException e) {
				System.out.println(	e.getMessage());
				throw new PersistenceException(e.getMessage());
		}
			finally {
		     try {if (resultSet != null) resultSet.close();}             catch (SQLException e) {}
		     try {if (statement != null) statement.close();} catch (SQLException e) {}
		}

	  }
	  
	  /**
	   * 
	   * Функция-проверка номера регистратора в бд СКТ "Глобус"
	   * 
	   * @param reg_id номер регистратора в СКТ Глобус
	   * @return true - есть, false - нет
	   * @throws PersistenceException
	   */
	  public boolean checkExist(int reg_id) throws PersistenceException
	  {
			String sql = "SELECT count(ve.reg_id) FROM vehicle as ve where ve.reg_id = " + reg_id;

			PreparedStatement statement = null;
			ResultSet  resultSet = null;

			try {

				statement = connection.prepareStatement(sql);

				resultSet = statement.executeQuery();
				
				boolean result = false;
				
				while(resultSet.next())
				{
					int int_result = resultSet.getInt(1);
					result = ((int_result == 0) ? false : true);
				}
				
				return result;
			}
			catch (SQLException e) {
				System.out.println(	e.getMessage());
				throw new PersistenceException(e.getMessage());
		}
			finally {
		     try {if (resultSet != null) resultSet.close();}             catch (SQLException e) {}
		     try {if (statement != null) statement.close();} catch (SQLException e) {}
		}

	  }

	  
	  /**
	   * 
	   * Количество топлива в машине периода путевого листа
	   * 
	   * @param reg_id - номер регистратора
	   * @param dateStart - начальная дата
	   * @param dateFinal - конечная дата
	   * @param isOnStart - true на минимальную дату, если false, то на максимальную
	   * @return BigDecimal
	   */
	  public BigDecimal getFuelLevel(int reg_id, java.util.Date dateStart, java.util.Date dateFinal, boolean isOnStart) throws PersistenceException
	  {
		  BigDecimal result = new BigDecimal(0);
		  String sqlMinMax = "";
		  
		  if (isOnStart == true) {sqlMinMax = "min";} else {sqlMinMax = "max";}
		  
		  String sql = 
	      " select " + 
	      " round(((ss.value * ss.value_scale) + ss.value_offs)::numeric(15,2),1) as val " + 
	      "   from  hoe.analog_sensor as ss,  ( " + 
	      " select " +  sqlMinMax + "(gd.time_send) as time, gd.reg_id " + 
	    		   " from hoe.gps_data gd " + 
	    		   " where "  +
	    		   " gd.reg_id = ? " + 
	    		   " and gd.time_send >= ? " + 
	    		   " and gd.time_send <= ? " + 
	    		   " and gd.longitude <> 0 " +
	    		   " and gd.latitude <> 0 " + 
	    		   " and gd.ignition_on = true" + 
	               " group by gd.reg_id ) as time_q " + 
	      " where ss.time_send = time_q.time " + 
	      " and ss.sensor_id = 27 " + 
	      " and ss.reg_id = time_q.reg_id"; 
		  
			PreparedStatement statement = null;
			ResultSet  resultSet = null;

			try {
				statement = connection.prepareStatement(sql);
				statement.setInt(1,reg_id);
				statement.setTimestamp(2, new Timestamp(dateStart.getTime()));
				statement.setTimestamp(3, new Timestamp(dateFinal.getTime()));

				resultSet = statement.executeQuery();

				while(resultSet.next())
				{
					result = resultSet.getBigDecimal(1);
				}
				
				if(result == null)
					result = new BigDecimal(0);

				return result;
			}
			catch (SQLException e) {
				System.out.println(	e.getMessage());
				throw new PersistenceException(e.getMessage());
		}
			finally {
		     try {if (resultSet != null) resultSet.close();} catch (SQLException e) {}
		     try {if (statement != null) statement.close();} catch (SQLException e) {}
		}

	  }
	  
	  
	  /**
	   * 
	   * Расстояние по маршруту из СКТ Глобус
	   * 
	   * @param reg_id - номер регистратора
	   * @param dateStart - начальная дата
	   * @param dateFinal - конечная дата
	   * @return BigDecimal
	   */
	  public BigDecimal getDistance(int reg_id, java.util.Date dateStart, java.util.Date dateFinal) throws PersistenceException
	  {
		  BigDecimal result = new BigDecimal(0);
		  ENTravelSheetItemShort travelData = getGlobusData(reg_id, dateStart, dateFinal);
		  result = travelData.distanceByGPS;
		  return result;

	  }
	  
	  /**
	   * 
	   * Время стоянок с включенным зажиганием
	   * 
	   * @param reg_id - номер регистратора
	   * @param dateStart - начальная дата
	   * @param dateFinal - конечная дата
	   * @return <b>BigDecimal</b> кол-во часов остановок с включенным зажиганием
	   * @throws PersistenceException
	   */
	  public BigDecimal getMachineHoursStop(int reg_id, java.util.Date dateStart, java.util.Date dateFinal) throws PersistenceException 
	  {
		  BigDecimal result = new BigDecimal(0);
		  ENTravelSheetItemShort travelData = getGlobusData(reg_id, dateStart, dateFinal);
		  result = travelData.hoursStopWorkByGPS;
		  return result;
	  }
	  
	  /**
	   * 
	   * Время с включенным зажиганием
	   * 
	   * @param reg_id - номер регистратора
	   * @param dateStart - начальная дата
	   * @param dateFinal - конечная дата
	   * @return <b>BigDecimal</b> кол-во часов с включенным зажиганием
	   * @throws PersistenceException
	   */
	  public BigDecimal getMachineHoursAll(int reg_id, java.util.Date dateStart, java.util.Date dateFinal) throws PersistenceException
	  {
		  BigDecimal result = new BigDecimal(0);
		  ENTravelSheetItemShort travelData = getGlobusData(reg_id, dateStart, dateFinal);
		  result = travelData.hoursStopWorkByGPS.add(travelData.hoursInMotionByGPS);
		  return result;

	  }
	  
	  /**
	   * 
	   * Время движения с включенным зажиганием
	   * 
	   * @param reg_id - номер регистратора
	   * @param dateStart - начальная дата
	   * @param dateFinal - конечная дата
	   * @return <b>BigDecimal</b> кол-во часов движения с включенным зажиганием
	   * @throws PersistenceException
	   */
	  public BigDecimal getMachineHoursMove(int reg_id, java.util.Date dateStart, java.util.Date dateFinal) throws PersistenceException
	  {
		  BigDecimal result = new BigDecimal(0);
		  ENTravelSheetItemShort travelData = getGlobusData(reg_id, dateStart, dateFinal);
		  result = travelData.hoursInMotionByGPS;
		  return result;

	  }
	  
	  /**
	   * 
	   * Данные из Глобуса по регистратору
	   * 
	   * @param reg_id - номер регистратора
	   * @param dateStart - начальная дата
	   * @param dateFinal - конечная дата
	   * @return ENTravelSheetItemShort 
	   * @throws PersistenceException
	   */
	  public ENTravelSheetItemShort getGlobusData(int reg_id, java.util.Date dateStart, java.util.Date dateFinal) throws PersistenceException
	  {

		  String sql =	
	// --- период работы 	
	// --- километраж
	// --- время в движении		
	// --- стоянка с включенным зажиганием
	// --- стоянка с выключенным зажиганием
				  
" select " +
  " coalesce((extract('epoch' from max(case when q.ignition = q.ignition_data " +
  " and q.speed <> 0 then q.time_send else null end) - " +
  " min(case when q.ignition = q.ignition_data and q.speed <> 0 " +
  " then q.time_send else null end))/3600)::numeric(15,2),0) as workperiod," + 
  
  " coalesce(round((sum(case when q.ignition > 0 and q.speed <> 0 " +
  " and q.ignition = q.ignition_data and q.power_restored is null then " +
  " q.time_interval*q.speed else 0 end  )/100000.0),2),0) as km, " +
  
  " coalesce(round((sum( case when q.ignition > 0 " +
  " and q.ignition = q.ignition_data and q.speed <> 0 and q.power_restored is null then " +
  " q.time_interval else 0 end)/3600.0),2),0) as hours_in_motion, " +
  
  " coalesce(round((sum( case when q.ignition > 0 " +
  " and q.speed = 0 and q.ignition = q.ignition_data and q.power_restored is null " + 
  " then " +
  " q.time_interval else 0 end)/3600.0),2),0) as hours_work_stop, " +
  
  " coalesce(round((sum( case when q.ignition = 0 " +
  " and q.speed = 0 and q.ignition = q.ignition_data and q.power_restored is null then " +
  " q.time_interval else 0 end)/3600.0),2),0) as hours_ignition_off " +
 " from " + 
" (select d.latitude, d.longitude, d.time_send, d.speed, d.time_interval, " +
" case coalesce(case when e.ignition is null then d.ignition_on " +
" when e.ignition = 0 then false " + 
" when e.ignition = 1 then true end , d.ignition_on) when true then 1 else 0 end  as ignition, " + 
" case when d.ignition_on = true then 1 else 0 end as ignition_data, e.power_restored   " +
" from hoe.gps_data d left join hoe.event e on (d.reg_id = e.reg_id and d.time_send = e.time_send)  " +
" where d.reg_id = ? " +
" and d.time_send >= ? " +  
" and d.time_send <= ? " +
" order by d.time_send desc) as q";
		  
			PreparedStatement statement = null;
			ResultSet  resultSet = null;

			try {
				statement = connection.prepareStatement(sql);
				statement.setInt(1,reg_id);
				statement.setTimestamp(2, new Timestamp(dateStart.getTime()));
				statement.setTimestamp(3, new Timestamp(dateFinal.getTime()));

				resultSet = statement.executeQuery();

				ENTravelSheetItemShort anObject = new ENTravelSheetItemShort();
				while(resultSet.next())
				{

			        anObject.hoursByGPS = resultSet.getBigDecimal(1);
			        anObject.distanceByGPS = resultSet.getBigDecimal(2);
			        anObject.hoursInMotionByGPS = resultSet.getBigDecimal(3);
			        anObject.hoursStopWorkByGPS = resultSet.getBigDecimal(4);		
			        anObject.hoursStopOffByGPS = resultSet.getBigDecimal(5);							
					
				}
				
				return anObject;
			}
			catch (SQLException e) {
				System.out.println(	e.getMessage());
				throw new PersistenceException(e.getMessage());
		}
			finally {
		     try {if (resultSet != null) resultSet.close();} catch (SQLException e) {}
		     try {if (statement != null) statement.close();} catch (SQLException e) {}
		}

	  }
	  
		/**
		 * 
		 * Пропорция машиночасов к общему времени работы из СКТ Глобус
		 * 
		 * Находится как результат деления машиночасов из глобуса на общее время работы транспорта с включенным зажиганием.
		 *
		 * = машиночасы / общее время работы с включенным зажиганием 
		 * 
		 * @param travelSheet путевой лист на время которого расчитывается пропорция
		 * @return BigDecimal пропорция с округлением до 2.
		 * @throws DatasourceConnectException
		 * @throws PersistenceException
		 */
		public BigDecimal getMachineHoursProportion(ENTravelSheet travelSheet) throws DatasourceConnectException, PersistenceException {
			BigDecimal sumMachineHours = getMachineHoursStop(travelSheet.transportReal.reg_id, travelSheet.timeStart, travelSheet.timeFinal);
			BigDecimal overallMachineHours = getMachineHoursAll(travelSheet.transportReal.reg_id, travelSheet.timeStart, travelSheet.timeFinal);
			return sumMachineHours.divide(overallMachineHours, 2, BigDecimal.ROUND_HALF_UP);
		}
		
		/**
		 * 
		 * Заправки/Возможные сливы на время путевого из СКТ "Глобус"
		 * 
		 * @param travelSheet путевой лист
		 * @return BigDecimal сумма заправок
		 */
		public ENTravelSheetFuelFill[] getFuelFills(ENTravelSheet travelSheet) {
			try {
				ENTravelSheetFuelFill[] result = null;
				String strTimeStart = dateFormatISO8601.format(Tools.addHours(travelSheet.timeStart, -2));
				String strTimeFinal = dateFormatISO8601.format(Tools.addHours(travelSheet.timeFinal, -2));
				String[] params = { JAVA_PATH, "-classpath",
					JAR_FILE_PATH,
					"jglobus2.ReportDumper", "-U", "hoe", "-P", "ujkjnehbz",
					"-H", SERVER_ADDRESS, "-p", SERVER_PORT, "-f", strTimeStart,
					"-t", strTimeFinal, "-e", FUEL_FILLS_EXPORT_CSV, "-i",
					String.valueOf(travelSheet.transportReal.reg_id) };
				InputStream stream = Tools.callJar(params);
				CSVParser parser = Tools.createSimpleCSVParser(stream, FUEL_FILLS_EXPORT_CSV_COLUMNS, ';');
				
				List<CSVRecord> records = parser.getRecords();
				result = new ENTravelSheetFuelFill[records.size()];
				int count = 0;
				for(CSVRecord record : records) {
					ENTravelSheetFuelFill fuelFill = new ENTravelSheetFuelFill();
					fuelFill.reg_id = travelSheet.transportReal.reg_id;
					fuelFill.timeGen = dateFormatReceived.parse(record.get(TIME_BEGIN_UTC_COLUMN));					
					fuelFill.countGen = new BigDecimal(record.get(VOLUME__DEG_COLUMN));
					fuelFill.timeReceived = dateFormatReceived.parse(record.get(TIME_RECIEVE_UTC_COLUMN));
					fuelFill.travelSheetRef.code = travelSheet.code;
					// Так как Экспорт в СКТ глобус возвращает дату в UTC, то необходимо добавить два часа для правильного отображения
					fuelFill.timeGen = Tools.addHours(fuelFill.timeGen, 2);
					fuelFill.timeReceived = Tools.addHours(fuelFill.timeReceived, 2);
					
					result[count++] = fuelFill;
				}
				return result;				
			} catch(IOException e) {
				throw new EnergyproSystemException(e);
			} catch (ParseException e) {
				throw new EnergyproSystemException(e);
			}

		}
		
		/**
		 * 
		 * Тестовая функция для вытягивания данных из глобуса
		 * 
		 * @param startDate
		 * @param finalDate
		 * @param reg_id
		 * @return
		 */
		public String testo(Date startDate, Date finalDate, int reg_id) {
			GlobusServerConnector serverConnector = null;
			try {
				// Реализация абстрактного класса для экспорта
				MessageInterceptor<String> fuelFillsExportInterceptor = new SimpleStringMessageInterceptor("exports");
				
				String strStartDate = Tools.getStrOfDateInUTC(Tools.addHours(startDate, -2));
				String strFinalDate = Tools.getStrOfDateInUTC(Tools.addHours(finalDate, -2));

				serverConnector = this.getConnector(true);
				serverConnector.addInterceptor(fuelFillsExportInterceptor);
				serverConnector.sendQuery("(give-export (");
				serverConnector.sendQuery(new Integer(reg_id).toString());
				serverConnector.sendQuery(" ");
				serverConnector.sendQuery(") (" + serverConnector.prepareForQuery(FUEL_FILLS_EXPORT_CSV) + ") " + strStartDate + " " + strFinalDate + " nil)\n");
				String results = fuelFillsExportInterceptor.getResults();
					
				return results;
			} finally {
				if(serverConnector != null && !serverConnector.isClosed) {
					serverConnector.close();
				}
			}
			
		}
		
		public void renameVehicle(int reg_id, String name) {
			GlobusServerConnector connector = this.getConnector(false);
			connector.sendQuery(String.format("(rename-device %d \"%s\")\n", reg_id, connector.prepareForQuery(name)));
			connector.close();
		}
		
		public void moveToFolder(int reg_id, String name) {
			GlobusServerConnector connector = this.getConnector(false);
			connector.sendQuery(String.format("(put-device-to-folder %d %s)\n", reg_id
					, name == null ? "nil" : "\"" + connector.prepareForQuery(name) + "\""));
			connector.close();
		}
		
		public void allowDeviceForUser(Collection<String> userNames, Collection<Integer> reg_ids) {
			if(userNames == null || userNames.size() == 0 || reg_ids == null || reg_ids.size() == 0) return;
			String reg_idsString = "(" + Tools.collection2String(reg_ids, " ") + ")";
			GlobusServerConnector connector = this.getConnector(false);
			for(String userName : userNames) {
				connector.sendQuery(String.format("(allow-device-for-user \"%s\" %s)\n", connector.prepareForQuery(userName), reg_idsString));	
			}
			connector.close();
		}
		public void revokeDeviceForUser(Collection<String> userNames, Collection<Integer> reg_ids) {
			if(userNames == null || userNames.size() == 0 || reg_ids == null || reg_ids.size() == 0) return;
			String reg_idsString = "(" + Tools.collection2String(reg_ids, " ") + ")";
			GlobusServerConnector connector = this.getConnector(false);
			for(String userName : userNames) {
				connector.sendQuery(String.format("(revoke-device-for-user \"%s\" %s)\n", connector.prepareForQuery(userName), reg_idsString));	
			}
			connector.close();
		}
		
		public BigDecimal getDistanceByHydra(int reg_id, Date startDate, Date finalDate) {
			GlobusServerConnector serverConnector = null;
			try {
				// Реализация абстрактного класса для экспорта
				MessageInterceptor<String> fuelFillsExportInterceptor = new SimpleStringMessageInterceptor("exports");
				
				String strStartDate = Tools.getStrOfDateInUTC(startDate);
				String strFinalDate = Tools.getStrOfDateInUTC(finalDate);
				
				try {
					Class.forName("jsint.InputPort");
				} catch (ClassNotFoundException e) {
					return new BigDecimal(5).setScale(2, BigDecimal.ROUND_HALF_UP);
				} finally {
					
				}

				serverConnector = this.getConnector(true);
				serverConnector.addInterceptor(fuelFillsExportInterceptor);
				serverConnector.sendQuery("(give-export (");
				serverConnector.sendQuery(new Integer(reg_id).toString());
				serverConnector.sendQuery(" ");
				serverConnector.sendQuery(") (" + serverConnector.prepareForQuery("day-export") + ") " + strStartDate + " " + strFinalDate + " nil)\n");
				String results = fuelFillsExportInterceptor.getResults();
				if(results == null || results.trim().length() == 0 || results.indexOf("(" + reg_id) < 0) {
					return BigDecimal.ZERO;
				} else {
					String infoString = results.substring(results.indexOf("(" + reg_id));
					infoString = infoString.substring(infoString.lastIndexOf(") "));
					infoString = infoString.substring(1).trim();
					String distanceString = infoString.substring(0, infoString.indexOf(" "));
					BigDecimal result = new BigDecimal(distanceString).setScale(2, BigDecimal.ROUND_HALF_UP)
							.divide(new BigDecimal(1000).setScale(2, BigDecimal.ROUND_HALF_UP), 2, BigDecimal.ROUND_HALF_UP);
					return result;
				}
			} finally {
				if(serverConnector != null && !serverConnector.isClosed) {
					serverConnector.close();
				}
			}
		}

}
