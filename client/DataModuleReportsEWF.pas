unit DataModuleReportsEWF;

interface

uses
  SysUtils, Classes, Controls, frxClass, frxDBSet, frxExportODF, frxExportTXT,
  frxExportCSV, frxExportText, frxExportImage, frxExportRTF, frxExportXML,
  frxExportXLS, frxExportHTML, frxExportPDF, DB, ZAbstractRODataset, AbUnzper,
  ZAbstractDataset, ZDataset, Windows, frxChBox, InvokeRegistry, Rio,
  SOAPHTTPClient, SOAPHTTPTrans, WinInet, ZConnection, ZAbstractConnection,
  ZSqlProcessor;

type
  TDMReportsEWF = class(TDataModule)
    frxPDFExport1: TfrxPDFExport;
    frxHTMLExport1: TfrxHTMLExport;
    frxXLSExport1: TfrxXLSExport;
    frxXMLExport1: TfrxXMLExport;
    frxRTFExport1: TfrxRTFExport;
    frxBMPExport1: TfrxBMPExport;
    frxJPEGExport1: TfrxJPEGExport;
    frxTIFFExport1: TfrxTIFFExport;
    frxGIFExport1: TfrxGIFExport;
    frxSimpleTextExport1: TfrxSimpleTextExport;
    frxCSVExport1: TfrxCSVExport;
    frxODSExport1: TfrxODSExport;
    frxODTExport1: TfrxODTExport;
    frxRExternal: TfrxReport;
    frxDBDSExternal: TfrxDBDataset;
    frxDBDSExternal2: TfrxDBDataset;
    zqryExternal2: TZQuery;
    zqryExternal1: TZQuery;
    zqryExternal: TZQuery;
    lrgntfldExternal1cnt_stand_cur_month_announcement_1: TLargeintField;
    lrgntfldExternal1cnt_stand_cur_year_announcement_2: TLargeintField;
    fltfldExternal1power_stand_cur_month_announcement_3: TFloatField;
    fltfldExternal1power_stand_cur_year_announcement_4: TFloatField;
    lrgntfldExternal1cnt_stand_cur_month_agreement_5: TLargeintField;
    lrgntfldExternal1cnt_stand_cur_year_agreement_6: TLargeintField;
    lrgntfldExternal1cnt_stand_cur_month_refusal_7: TLargeintField;
    lrgntfldExternal1cnt_stand_cur_year_refusal_8: TLargeintField;
    lrgntfldExternal1cnt_stand_cur_month_exploitation_9: TLargeintField;
    lrgntfldExternal1cnt_stand_cur_year_exploitation_10: TLargeintField;
    lrgntfldExternal1cnt_stand_cur_month_supply_11: TLargeintField;
    lrgntfldExternal1cnt_stand_cur_year_supply_12: TLargeintField;
    fltfldExternal1power_stand_cur_month_supply_13: TFloatField;
    fltfldExternal1power_stand_cur_year_supply_14: TFloatField;
    intgrfldExternal1cnt_stand_cur_month_complaint_15: TIntegerField;
    intgrfldExternal1cnt_stand_cur_year_complaint_16: TIntegerField;
    intgrfldExternal1cnt_stand_cur_month_complaint_supplier_17: TIntegerField;
    intgrfldExternal1cnt_stand_cur_year_complaint_supplier_18: TIntegerField;
    intgrfldExternal1cnt_stand_cur_month_complaint_customer_19: TIntegerField;
    intgrfldExternal1cnt_stand_cur_year_complaint_customer_20: TIntegerField;
    lrgntfldExternal1cnt_orig_cur_month_announcement_21: TLargeintField;
    lrgntfldExternal1cnt_orig_cur_year_announcement_22: TLargeintField;
    lrgntfldExternal1cnt_cur_month_odp_pack_23: TLargeintField;
    lrgntfldExternal1cnt_cur_year_odp_pack_24: TLargeintField;
    fltfldExternal1power_orig_cur_month_announcement_25: TFloatField;
    fltfldExternal1power_orig_cur_year_announcement_26: TFloatField;
    lrgntfldExternal1cnt_cur_month_odp_finish_pack_27: TLargeintField;
    lrgntfldExternal1cnt_cur_year_odp_finish_pack_28: TLargeintField;
    lrgntfldExternal1cnt_cur_month_odp_archive_pack_29: TLargeintField;
    lrgntfldExternal1cnt_cur_year_odp_archive_pack_30: TLargeintField;
    lrgntfldExternal1cnt_orig_cur_month_connection_owner_31: TLargeintField;
    lrgntfldExternal1cnt_orig_cur_year_connection_owner_32: TLargeintField;
    lrgntfldExternal1cnt_orig_cur_month_connection_other_33: TLargeintField;
    lrgntfldExternal1cnt_orig_cur_year_connection_other_34: TLargeintField;
    lrgntfldExternal1cnt_orig_cur_month_connection_zero_35: TLargeintField;
    lrgntfldExternal1cnt_orig_cur_year_connection_zero_36: TLargeintField;
    lrgntfldExternal1cnt_orig_cur_month_agreement_37: TLargeintField;
    lrgntfldExternal1cnt_orig_cur_year_agreement_38: TLargeintField;
    lrgntfldExternal1cnt_orig_cur_month_agreement_add_39: TLargeintField;
    lrgntfldExternal1cnt_orig_cur_year_agreement_add_40: TLargeintField;
    lrgntfldExternal1cnt_orig_cur_month_refusal_41: TLargeintField;
    lrgntfldExternal1cnt_orig_cur_year_refusal_42: TLargeintField;
    lrgntfldExternal1cnt_orig_cur_month_exploitation_43: TLargeintField;
    lrgntfldExternal1cnt_orig_cur_year_exploitation_44: TLargeintField;
    lrgntfldExternal1cnt_orig_cur_month_supply_45: TLargeintField;
    lrgntfldExternal1cnt_orig_cur_year_supply_46: TLargeintField;
    fltfldExternal1power_orig_cur_month_supply_47: TFloatField;
    fltfldExternal1power_orig_cur_year_supply_48: TFloatField;
    intgrfldExternal1cnt_orig_cur_month_complaint_49: TIntegerField;
    intgrfldExternal1cnt_orig_cur_year_complaint_50: TIntegerField;
    intgrfldExternal1cnt_orig_cur_month_complaint_supplier_51: TIntegerField;
    intgrfldExternal1cnt_orig_cur_year_complaint_supplier_52: TIntegerField;
    intgrfldExternal1cnt_orig_cur_month_complaint_customer_53: TIntegerField;
    intgrfldExternal1cnt_orig_cur_year_complaint_customer_54: TIntegerField;
    zqryEWFReportFromDBbyID: TZQuery;
    wdstrngfldEWFReportFromDBbyIDrtconst: TWideStringField;
    wdstrngfldEWFReportFromDBbyIDrtname: TWideStringField;
    fltfldEWFReportFromDBbyIDid_subsystem: TFloatField;
    fltfldEWFReportFromDBbyIDid_appeal: TFloatField;
    zqryEWFReportFromDBbyIDrtcontent: TWideMemoField;
    wdstrngfldEWFReportFromDBbyIDrtfile: TWideStringField;
    wdstrngfldEWFReportFromDBbyIDqryfolder: TWideStringField;
    wdstrngfldEWFReportFromDBbyIDqryfile: TWideStringField;
    zqryEWFReportQueryFromDBbyID: TZQuery;
    wdstrngfldEWFReportQueryFromDBbyIDqryfile: TWideStringField;
    wdmfldEWFReportQueryFromDBbyIDqrycontent: TWideMemoField;
    wdstrngfldEWFReportQueryFromDBbyIDqryfolder: TWideStringField;
    zspExternal: TZSQLProcessor;
    zspExternal2: TZSQLProcessor;
    wdstrngfldEWFReportQueryFromDBbyIDrtfile: TWideStringField;
    sesReportEWF: TZConnection;
    procedure HTTPRIOBeforeExecute(const MethodName: String; var SOAPRequest: WideString);
    procedure HTTPRIOAfterExecute(const MethodName: String; SOAPResponse: TStream);
    procedure HTTPRIOHTTPWebNodeBeforePost(const HTTPReqResp: THTTPReqResp; Data: Pointer);
    procedure DataModuleCreate(Sender: TObject);
    procedure frxRExternalPreview(Sender: TObject);
  private
    { Private declarations }
    procedure SetHTTPRIOProps;
  public
    { Public declarations }
    packageID, movementID, stateID, subsystemID: Integer;
    jiraTask: string;
    //SPLSumTotal: Integer;
    //SPLSumRenewal: Integer;
    //CurPlanRenewalSPL: array of TPlanRenewalSPL;
    //procedure AddPlanRenewalSPL(RenID, CountTotal, CountRenewal: Integer);
    //hActsStatesPRIC620: HWND;
    arrHWND: array [0..102] of HWND; //Массив уникальных дескрипторов отчётов
    //Процедура загрузки простого внешнего EnergyWorkFlow отчёта FastReport
    //из файла *.fr3, содержащего один запрос *.sql
    procedure LoadSimpleFR3(
      pRT_ID: Integer = 0; //Код отчёта из таблицы cn.ewfreports.
        //Совпадает со значением константы RT_ модуля Globals.pas
      pLocalQryText: String = ''; //Строковый параметр для передачи содержащей
        //текст запроса локальной константы.  Применяется, если не заполнено
      //поле rtcontent строки pRT_ID таблицы cn.ewfreports Базы Данных cndata
      //и текущий пользователь не наделён правами обращения к альтернативному
      //внешнему файлу *.sql, или этот файл отсутствует, или пользователь
      //отказался от загрузки запроса из него
      pRtFile: String = ''; //Наименование файла *.fr3 отчёта FastReport
      pRtName: String = ''; //Название FastReport-отчёта EnergyWorkFlow
      pQryFolder: String = ''; //Содержащая запросы *.sql директория
      pQryFile: String = ''); //Основной внешний запрос *.sql

    //Процедура загрузки компоненту TZQuery по коду запроса из Базы Данных
    //комплекса EnergyWorkFlow или из локальной файлововй системы пользователя
    procedure LoadZQueryReportFromDataBaseOrLocalFileSytstemByID(
      QRY_ID: Integer; //Код запроса из таблицы cn.ewfreport_query_text
        //содержания запросов *.sql для FastReport-отчётов, связанных с
        //зависимыми источниками данных, или вызываемых для получения параметров
        //запросов или для заполнения полей предшествующих отчётам экранных форм
      pQryRt: TZQuery; //Переменная указания на компонент класса TZQuery
        //клиентской части EnergyWorkFlow, через который БД передётся запрос
      pFrxDBDS: TfrxDBDataset; //Переменная указания на компонент класса
        //TfrxDBDataset как на источник данных, через который читается запрос
      pLocalQryFile: String = ''; //Указание через строковый параметр названия
        //файла запроса *.sql в случае отсутствия строки в одной из таблиц
        //cn.ewfreports, cn.ewfreport_query_text Базы Данных cndata
      pQryFolder: String = ''; //Указание через строковый параметр названия
        //директории запроса *.sql в случае отсутствия строки в одной из таблиц
        //cn.ewfreports, cn.ewfreport_query_text Базы Данных cndata
      pLocalRtFile: String = ''; //Указание через строковый параметр Названия
        //файла *.fr3 отчёта в случае отсутствия строки в одной из таблиц
        //cn.ewfreports, cn.ewfreport_query_text Базы Данных cndata
      RT_ID: Integer = 0; //Код из cn.ewfreports формируемых отчётов *.fr3
        //Чтобы загрузки файла *.fr3 не происходило, значение параметра надо
        //оставить по умолчанию (или указать ноль)
      isMainQuery: Boolean = False; //Источник запроса: ИСТИНА - основной запрос
        //отчёта из Перечня формируемых в FastReport отчётов cn.ewfreports;
        //ЛОЖЬ - запрос из таблицы cn.ewfreport_query_text содержания
        //запросов *.sql для FastReport-отчётов, связанных с зависимыми
        //источниками данных, или вызываемых для получения параметров запросов
        //или для заполнения полей предшествующих отчётам экранных форм
      pQryType: Byte = 1; //Вид запроса для определения нужды в TfrxDBDataSet
        //1 - ВЫБОРКА записей - потребность ЕСТЬ; иначе - потребности НЕТ
        //2 - ОБНОВЛЕНИЕ, 3 - ВСТАВКА записей, 4 - ФУНКЦИЯ РЕДАКТИРОВАНИЯ
      pQryText: String = ''; //Резервный параметр для задания текста запроса
        //внешней константой или переменной в случае отсутствия строки QRY_ID
        //таблицы cn.ewfreport_query_text и файла pLocalQryFile запроса *.sql
      pZSQLProc: TZSQLProcessor = nil; //Компонент для запросов редактирования
      pFrxReport: TfrxReport = nil); //Параметр загрузки FastReport-отчёта *.fr3
  end;

var DMReportsEWF: TDMReportsEWF;

  //http://10.77.11.28:8080/browse/PRIC-306. Вынесение FastReport-отчётности
  //из клиентской части проекта EnergyWorkFlow, то есть за пределы
  //файла-исполнителя CN.exe. Приоритетной является загрузка содержания
  //запросов TZConnection из таблиц cn.ewfreports, cn.ewfreport_query_text
  //Базы Данных cndata. Но у разработчика есть возможность загрузки текста
  //запросов из файлов *.sql локальных папки пользователя ..\Reports\query
  reportPathDMEWF: String; //Полный путь к загружаемому FastReport-отчёту EWF

  modResDMEWF: Integer; //Целочисленная переменная - модальный результат -
    //источник загрузки запросов:
    //ID_YES = 6 - ДА - из внешних файлов *.sql;
    //ID_NO = 7 - НЕТ - из Базы Данных комплекса EnergyWorkFlow
    //ID_CANCEL = 2 - ОТМЕНА - из локальных констант pLocal_QryText

  reportNum: Integer = 0;       //Номер отчёта

  //Количество загруженных отчётов модуля нивизуальных компонентов
  LoadReportCount: Integer;

implementation

uses DataModuleReportsENetObject, Dialogs, Forms,
  DialogFormUnit,
  ShellAPI,
  Main,
  ENBelongingController, ENOwnerController, EnergyproController,
  EnergyProController2, ENLine04Controller, ENLineCableController,
  ENLine10Controller, ENLine150Controller, ENSubstation04Controller,
  ENSubstationTypeController, ENSubstation150Controller, IniTools, Globals,
  ChildFormUnit, LoginUnit,
  SetupFormUnit,
  SPLConsts,
  Graphics;

{$R *.dfm}


function ToString(Value: Variant): String;
begin
  case TVarData(Value).VType of
    varSmallInt,
    varInteger   : Result := IntToStr(Value);
    varSingle,
    varDouble,
    varCurrency  : Result := FloatToStr(Value);
    varDate      : Result := FormatDateTime('dd/mm/yyyy', Value);
    varBoolean   : if Value then Result := 'T' else Result := 'F';
    varString    : Result := Value;
    else           Result := '';
  end;
end;

procedure TDMReportsEWF.SetHTTPRIOProps;
var i, p: Integer;
    IP, Port_, IniPath: String;
    //OldWSDLPath, NewWSDLPath, OldPort, OldService: String;
begin
  //Setting UserName, Password and WSDLLocation
  IniPath := ExtractFilePath(Application.ExeName) + IniName;
  for i := 0 to ComponentCount - 1 do
    if (Components[i] is THTTPRIO) then
      with THTTPRIO(Components[i]) do
      begin
        HTTPWebNode.UserName := UserName;
		    HTTPWebNode.Password := Password;
        HTTPWebNode.Agent := 'KSOE Client';

        //HTTPWebNode.UserName := 'read';
		    //HTTPWebNode.Password := 'read';

        {OldWSDLPath := WSDLLocation;
        OldService := Service;
        OldPort := Port;
        p := pos('WSDL\',OldWSDLPath);
        NewWSDLPath := ExtractFilePath(Application.ExeName)+
                     Copy(OldWSDLPath, p, Length(OldWSDLPath) - p + 1);
        WSDLLocation := NewWSDLPath;
        Service := OldService;
        Port := OldPort;}
        
        if IniValueExists(IniPath,'EnergyNet','IP') then
          IP := IniReadString(IniPath,'EnergyNet','IP')
        else
          IP := EnergyNetIP;

        if IniValueExists(IniPath,'EnergyNet','Port') then
          Port_ := IniReadString(IniPath,'EnergyNet','Port')
        else
          Port_ := EnergyNetPort;

        URL:='http://'+IP+':'+Port_+'/soap/servlet/rpcrouter';

        OnBeforeExecute := HTTPRIOBeforeExecute;
        OnAfterExecute := HTTPRIOAfterExecute;
        {*** 16.10.06 DL ***}
        HTTPWebNode.OnBeforePost := HTTPRIOHTTPWebNodeBeforePost;
        {*** 16.10.06 DL ***}
      end;
end;

procedure TDMReportsEWF.HTTPRIOBeforeExecute(const MethodName: String; var SOAPRequest: WideString);
begin
{  WaitForm := WaitMessage('Внимание!',
                          'Подождите, пожалуйста' + #10#13 +
                          'Выполняется загрузка данных...');
  WaitForm.Show;
  WaitForm.Update;}

  ///// 16.03.06
  frmMain.sbMain.Panels[0].Text := ' Подождите, пожалуйста!  Выполняется загрузка данных...';
  frmMain.Update;

  //for i:=0 to frmMain.MainMenu1.Items.Count-1 do
  //  frmMain.MainMenu1.Items[i].Enabled:=false;  
  /////

  //{***}InvalidateRect(Application.MainForm.Handle,nil,true);
  //{***}Application.MainForm.Update;
  OldCursor:=Screen.Cursor;
  Screen.Cursor:=crHourGlass;
  IsRIOExecuting:=true;
  // Включить перехват окна запроса логина и пароля
  frmMain.Timer1.Enabled:=true;
end;

procedure TDMReportsEWF.DataModuleCreate(Sender: TObject);
var i: Integer;
begin
  for i := 1 to Length(DMReportsEWF.arrHWND) do
    DMReportsEWF.arrHWND[i] := 0;
end; //procedure TDMReportsEWF.DataModuleCreate(Sender: TObject);

procedure TDMReportsEWF.frxRExternalPreview(Sender: TObject);
begin
  DMReportsEWF.arrHWND[DataModuleReportsEWF.reportNum] :=
    DMReportsEWF.frxRExternal.PreviewForm.Handle;
  case DataModuleReportsEWF.reportNum of
    //Интерактивные печатные формы загрузки n-Трансформаторных Понижающих Станций
    //ПРИСОЕДИНЕНИЕ I - IV до и после 01.08.2010, с 14.03.2011, с 01.03.2013 гг.
    RT_LoadS04fewTransformer:  //НизкоВольтной 10 - 6 / 0,4 кВ
      DMReportsEWF.frxRExternal.PreviewForm.Caption :=
        'Резерв мощности Трансформаторной Понижающей Станции 10 - 6 / 0,4 кВ';
    RT_LoadS35fewTransformer: //СреднеВольтной 35 - 27 / 10 - 6 кВ
      DMReportsEWF.frxRExternal.PreviewForm.Caption :=
        'Резерв мощности Трансформаторной Понижающей Станции 35 - 27 / 10 - 6 кВ';
    RT_LoadS150fewTransformer: //ВысокоВольтной 150 / 35 - 27 кВ
      DMReportsEWF.frxRExternal.PreviewForm.Caption :=
        'Резерв мощности Трансформаторной Понижающей Станции 150 / 35 - 27 кВ';
  end; //case DataModuleReportsEWF.reportNum of
end;

procedure TDMReportsEWF.HTTPRIOAfterExecute(const MethodName: String; SOAPResponse: TStream);
var ArchiveFilePath, AppPath: String;
    tmpStream, tmpStream1: TMemoryStream;
    tmpUnZipper: TAbUnZipper;
begin
  if IsRIOExecuting then
  begin
    Screen.Cursor:=OldCursor;
{    WaitForm.Close;
    WaitForm.Free;
    WaitForm:=nil;}

    ///// 16.03.06
    frmMain.sbMain.Panels[0].Text := '';
    frmMain.Update;

    //for i:=0 to frmMain.MainMenu1.Items.Count-1 do
    //  frmMain.MainMenu1.Items[i].Enabled:=true;
    /////

    IsRIOExecuting:=false;
  end;

  {*** 16.10.06 DL ***}
  if _IS_PACKED_RESPONSE then
  begin
    ///// ============== Распаковываем ответ сервера ==============/////

    AppPath := ExtractFilePath(Application.ExeName);
    //ArchiveFilePath := AppPath + TempReportsPath + 'tmpresponse.gz';
    ArchiveFilePath := AppPath + TempReportsPath + getFileName('tmpresponse') + IntToStr(GetTickCount) + '.gz';
        
    //ExtractedFilePath := AppPath + TempReportsPath + 'unknown';

    tmpStream := TMemoryStream.Create;
    try
      // Сохраняем сжатый ответ из потока во временный файл
      tmpStream.LoadFromStream(SOAPResponse);
      if not DirectoryExists(AppPath + TempReportsPath) then
        CreateDir(AppPath + TempReportsPath);
      tmpStream.SaveToFile(ArchiveFilePath);
    finally
      FreeAndNil(tmpStream);
    end;

  {  // Распаковываем ответ из временного файла
    tmpUnZipper := TAbUnZipper.Create(nil);
    try
      tmpUnZipper.BaseDirectory := AppPath + TempReportsPath;
      tmpUnZipper.FileName := ArchiveFilePath;
      tmpUnZipper.ExtractFiles('*.*');
    finally
      tmpUnZipper.Free;
    end;}

    tmpUnZipper := TAbUnZipper.Create(Self);
    try
      tmpUnZipper.BaseDirectory := AppPath + TempReportsPath;
      tmpUnZipper.FileName := ArchiveFilePath;
      //tmpUnZipper.ExtractFiles('*.*');

      tmpStream1 := TMemoryStream.Create;
      try
        // Распаковываем ответ из временного файла во временный поток
        tmpUnZipper.ExtractToStream('unknown', tmpStream1);
        // Копируем уже распаковаванный ответ обратно в исходный поток
        SOAPResponse.Position := 0;
        tmpStream1.Position := 0;
        SoapResponse.CopyFrom(tmpStream1, tmpStream1.Size);
        SoapResponse.Size := tmpStream1.Size;
        SoapResponse.Position := 0;
      finally
        FreeAndNil(tmpStream1);
      end;

    finally
      tmpUnZipper.Free;
    end;

  {  // Копируем уже распаковаванный ответ обратно в поток
    tmpStream := TMemoryStream.Create;
    try
      tmpStream.LoadFromFile(ExtractedFilePath);
      SOAPResponse.Position := 0;
      tmpStream.Position := 0;
      SoapResponse.CopyFrom(tmpStream, tmpStream.Size);
      SoapResponse.Size := tmpStream.Size;
      SoapResponse.Position := 0;
    finally
      FreeAndNil(tmpStream);
    end;}

    // Удаляем все временные файлы
    if FileExists(ArchiveFilePath) then
      SysUtils.DeleteFile(ArchiveFilePath);
  //  if FileExists(ExtractedFilePath) then
  //    DeleteFile(ExtractedFilePath);
    ///// =========================================================/////
  end;
  {*** 16.10.06 DL ***}

  // Отключить перехват окна запроса логина и пароля
  frmMain.Timer1.Enabled:=false;
end;

///// Добавляем в запрос заголовок для того, чтобы сервер сжимал ответ
{*** 16.10.06 DL ***}
procedure TDMReportsEWF.HTTPRIOHTTPWebNodeBeforePost(const HTTPReqResp: THTTPReqResp; Data: Pointer);
/// 31.01.08
var TimeOut : integer;
///
begin
  if _IS_PACKED_RESPONSE then
  HttpAddRequestHeaders(HTTPReqResp.Request,
                        PChar('Accept-Encoding: gzip, deflate'),
                        Length('Accept-Encoding: gzip, deflate'),
                        HTTP_ADDREQ_FLAG_ADD);

  /// 31.01.08
  TimeOut := 10800000; // 3 часа
  InternetSetOption(Data,
                    INTERNET_OPTION_RECEIVE_TIMEOUT,
                    Pointer(@TimeOut),
                    SizeOf(TimeOut));
end;

//Процедура загрузки простого внешнего EnergyWorkFlow отчёта FastReport
//из файла *.fr3, содержащего один запрос *.sql
procedure TDMReportsEWF.LoadSimpleFR3(
  pRT_ID: Integer = 0; //Код отчёта из таблицы cn.ewfreports.
    //Совпадает со значением константы RT_ модуля Globals.pas
  pLocalQryText: String = ''; //Строковый параметр для передачи содержащей
    //текст запроса локальной константы.  Применяется, если не заполнено
	//поле rtcontent строки pRT_ID таблицы cn.ewfreports Базы Данных cndata
	//и текущий пользователь не наделён правами обращения к альтернативному
	//внешнему файлу *.sql, или этот файл отсутствует, или пользователь
	//отказался от загрузки запроса из него
  pRtFile: String = ''; //Наименование файла *.fr3 отчёта FastReport
  pRtName: String = ''; //Название FastReport-отчёта EnergyWorkFlow
  pQryFolder: String = ''; //Содержащая запросы *.sql директория
  pQryFile: String = ''); //Основной внешний запрос *.sql

var reportPath, //Основная директория FastReport-отчётности EnergyWorkFlow
  queryPath, //Директория запросов FastReport-отчётности EnergyWorkFlow
  fileName, //Полное имя файла запроса с указанием директории
  varQryText,  //Текст запроса -
    //заполняеется из поля rtcontent строки pRT_ID таблицы cn.ewfreports,
    //или параметра pLocalQryText, если поле пустое или значение не найдено
  vRtFile, //Наименование файла *.fr3 отчёта FastReport -
    //заполняеется из поля rtfile строки pRT_ID таблицы cn.ewfreports,
    //или параметра pRtFile, если поле пустое или значение не найдено
  vRtName, //Название FastReport-отчёта EnergyWorkFlow -
    //заполняеется из поля rtname строки pRT_ID таблицы cn.ewfreports,
    //или параметра pRtName, если поле пустое или значение не найдено
  vQryFolder, //Содержащая запросы *.sql директория -
    //заполняеется из поля qryfolder строки pRT_ID таблицы cn.ewfreports,
    //или параметра pQryFolder, если поле пустое или значение не найдено
  vQryFile: String ; //Основной внешний запрос *.sql -
    //заполняеется из поля qryfile строки pRT_ID таблицы cn.ewfreports,
    //или параметра pQryFile, если поле пустое или значение не найдено
  sqlFile: TextFile; //Файл запроса
  modRes: Integer; //Целочисленная переменная - модальный результат -
    //источник загрузки запроса:
    //ID_YES = 6 - ДА - из внешнего файла *.sql;
    //ID_NO = 7 - НЕТ - из Базы Данных комплекса EnergyWorkFlow
    //ID_CANCEL = 2 - ОТМЕНА - из локальной константы pLocalQryText

begin
  //if not Assigned(DMReportsEWF) then
  //  Application.CreateForm(TDMReportsEWF, DMReportsEWF);

  if pRT_ID = 0 then
    begin
      Application.MessageBox(PChar('Не указан код отчёта!' + #13#10 +
          'Диапазон значений - констаты RT_ модуля Globals.pas.'),
        PChar('Нулевое значение:'), MB_ICONWARNING);
      Exit;
    end; //if pRT_ID = 0 then

  if DMReportsEWF.arrHWND[pRT_ID] = 0 then
    begin
      DMReportsEWF.zqryExternal.SQL.Clear; //Очистка текста запроса

      //Инициализация строковых переменных
      varQryText := '';  //Текст запроса -
      //заполняеется из поля rtcontent строки pRT_ID таблицы cn.ewfreports,
      //или параметра pLocalQryText, если поле пустое или значение не найдено
      vRtFile := ''; //Наименование файла *.fr3 отчёта FastReport -
      //заполняеется из поля rtfile строки pRT_ID таблицы cn.ewfreports,
      //или параметра pRtFile, если поле пустое или значение не найдено
      vRtName := ''; //Название FastReport-отчёта EnergyWorkFlow -
      //заполняеется из поля rtname строки pRT_ID таблицы cn.ewfreports,
      //или параметра pRtName, если поле пустое или значение не найдено
      vQryFolder := ''; //Содержащая запросы *.sql директория -
      //заполняеется из поля qryfolder строки pRT_ID таблицы cn.ewfreports,
      //или параметра pQryFolder, если поле пустое или значение не найдено
      vQryFile := ''; //Основной внешний запрос *.sql -
      //заполняеется из поля qryfile строки pRT_ID таблицы cn.ewfreports,
      //или параметра pQryFile, если поле пустое или значение не найдено

      modRes := ID_CANCEL; //По умолчанию загружать запрос из константы

      DMReportsEWF.zqryEWFReportFromDBbyID.Close;
      //DMReportsEWF.zqryEWFReportFromDBbyID.FieldByName('rtcontent').Size :=
      //  Length(pLocalQryText) + 100;
      DMReportsEWF.zqryEWFReportFromDBbyID.ParamByName(
        'id_report').AsInteger := pRT_ID;
      DMReportsEWF.zqryEWFReportFromDBbyID.Open;
      if DMReportsEWF.zqryEWFReportFromDBbyID.RecordCount = 1 then
        begin
          varQryText := DMReportsEWF.zqryEWFReportFromDBbyID.FieldByName(
            'rtcontent').Value;
          vRtFile := DMReportsEWF.zqryEWFReportFromDBbyID.FieldByName(
            'rtfile').AsString; //Наименование файла *.fr3 отчёта FastReport
          vRtName := DMReportsEWF.zqryEWFReportFromDBbyID.FieldByName(
            'rtname').AsString; //Название FastReport-отчёта EnergyWorkFlow
          vQryFolder := DMReportsEWF.zqryEWFReportFromDBbyID.FieldByName(
            'qryfolder').AsString; //Содержащая запросы *.sql директория
          vQryFile := DMReportsEWF.zqryEWFReportFromDBbyID.FieldByName(
            'qryfile').AsString; //Основной внешний запрос *.sql
        end; //if DMReportsEWF.zqryEWFReportFromDBbyID.RecordCount = 1 then

      //if varQryText = '' then
      //  varQryText := pLocalQryText;
      //Значение параметра не может быть передано переменной, поскольку
      //в дальнейшем в зависимости от её заполненности происходит (или
      //не происходит) сохранение текста запроса в локальный файл *.sql

      if vRtFile = '' then			    //Если переменная пуста,
        vRtFile := pRtFile; 		    //заполнить из параметра
      if vRtFile = '' then
        begin
          Application.MessageBox(
            PChar('Не указано название файла *.fr3 отчёта FastReport.'),
          PChar('Пустое значение:'), MB_ICONWARNING);
          Exit;
        end; //if vRtFile = '' then

      if vRtName = '' then			    //Если переменная пуста,
        vRtName := pRtName; 		    //заполнить из параметра

      modRes := ID_NO;
      {if CheckCurrentUserRole('EXTERNAL_QUERYES_READER',
        SS_CHANGEBUSINESSPROCESS)
      or CheckCurrentUserRole('ROOT', SS_CHANGEBUSINESSPROCESS)
      or CheckCurrentUserRole('ROOT_VIEW', SS_CHANGEBUSINESSPROCESS)
      then  //Если есть права применения запросов из внешних файлов *.sql
        modRes := Application.MessageBox(PChar(
            'ДА - загрузить запрос из внешнего файла ' + pQryFile + ';'
            + #13#10 +
            'НЕТ - загрузить запрос из Базы Данных комплекса EnergyWorkFlow'),
          PChar(
            'Выбор источника запроса для формирования FastReport-отчёта:'),
          MB_YESNO + MB_DEFBUTTON2 + MB_ICONQUESTION)
      else if varQryText <> '' then //Иначе, если из БД EnergyWorkFlow получен
        modRes := ID_NO;} //в переменную текст - заполнить её значением запрос

      if (varQryText = '') and (modRes = ID_NO) then
        begin
          if pLocalQryText = '' then
            begin
              Application.MessageBox(
                PChar('Текст запроса не заполнен.'),
                PChar('Пустое значение:'),
                  MB_ICONERROR);
              Exit;
            end
          else
            begin
              Application.MessageBox(
                PChar('Текст запроса не найден в Базе Данных EnergyWorkFlow.'
                  + #13#10 + 'Запрос будет заполнен из локальной константы.'),
                PChar(
                  'Неудачный выбор источника запроса для FastReport-отчёта:'),
                MB_ICONWARNING);
              modRes := ID_CANCEL; //Загружать запрос из константы pLocalQryText
            end;
        end;

      //Указание основной папки FastReport-отчётности EnergyWorkFlow
      reportPath := ExtractFilePath(Application.ExeName) + 'Reports';

      case modRes of
        ID_YES: // = 6 - ДА - из внешнего файла *.sql;
          begin

            if vQryFolder = '' then		    //Если переменная пуста,
              vQryFolder := pQryFolder; 	//заполнить из параметра
            if vQryFolder = '' then
              begin
                Application.MessageBox(
                  PChar('Не указана содержащая запросы *.sql директория.'),
                PChar('Пустое значение:'), MB_ICONWARNING);
                Exit;
              end; //if vQryFolder = '' then

            if vQryFile = '' then			    //Если переменная пуста,
              vQryFile := pQryFile; 		  //заполнить из параметра
            if vQryFile = '' then
              begin
                Application.MessageBox(
                  PChar('Не указан основной внешний запрос *.sql.'),
                PChar('Пустое значение:'), MB_ICONWARNING);
                Exit;
              end; //if vQryFile = '' then

            //PRIC-620. Формирование из внешнего файла запроса для Отчёта
            //о состояниях составленных актов нарушений Правил Пользования
            //Электрической Энергией среди Юридических Лиц и Населения
            if not DirectoryExists(reportPath) then
              try
                CreateDir(reportPath);
              except
                Application.MessageBox(PChar(
                  'Не создана основная папка FastReport-отчётов EnergyWorkFlow'
                    + #13#10 + reportPath),
                  PChar('Ошибка создания директории:'),
                  MB_ICONERROR);
                Exit;
              end; //if not DirectoryExists(reportPath) then

            queryPath := reportPath + '\query';
            if not DirectoryExists(queryPath) then
              try
                CreateDir(queryPath);
              except
                Application.MessageBox(
                  PChar('Не создана папка запросов для отчётов EnergyWorkFlow'
                    + #13#10 + queryPath),
                  PChar(
                    'Ошибка создания директории:'),
                  MB_ICONERROR);
                Exit;
              end; //if not DirectoryExists(queryPath) then

            queryPath := queryPath + '\' + vQryFolder;
            if not DirectoryExists(queryPath) then
              try
                CreateDir(queryPath);
              except
                Application.MessageBox(
                  PChar('Не может быть создан' + #13#10 + vRtName + ', ' +
                    #13#10 + 'потому что не создана папка запросов' + #13#10 +
                    queryPath),
                  PChar('Ошибка создания директории:'),
                  MB_ICONERROR);
                Exit;
              end; //if not DirectoryExists(queryPath) then

            fileName := queryPath + '\' + vQryFile;
            if not FileExists(PChar(fileName)) then
              begin //Если файла-отчёта *.sql не существует

                if varQryText = '' then //Если в переменную из Базы Данных
                  begin //EnergyWorkFlow НЕ получен текст-запроса,
                    varQryText := pLocalQryText; //заполнить её из константы
                    Application.MessageBox(PChar(
                        'Не найден внешний файл запроса *.sql' + #13#10 +
                        'и текст запроса НЕ НАЙДЕН в Базе Данных ' +
                        'EnergyWorkFlow.' + #13#10 +
                        'Запрос будет заполнен из локальной константы.'),
                      PChar(
                        'Неудачный выбор источника запроса ' +
                        'для FastReport-отчёта:'),
                      MB_ICONWARNING);
                    //modRes := ID_CANCEL; //Загружать запрос из pLocalQryText
                  end
                else //if varQryText <> '' then
                  //begin
                    Application.MessageBox(PChar(
                        'Не найден внешний файл запроса *.sql. ' + #13#10 +
                        'Запрос будет заполнен из Базы Данных EnergyWorkFlow.'),
                      PChar(
                        'Неудачный выбор источника запроса ' +
                        'для FastReport-отчёта:'),
                      MB_ICONWARNING);
                  //  modRes := ID_NO; //Загружать запрос из Базы Данных
                  //end;

                try
                  AssignFile(sqlFile, fileName);
                  Rewrite(sqlFile);
                  Writeln(sqlFile, varQryText);
                  CloseFile(sqlFile);
                except
                  Application.MessageBox(PChar(varQryText),
                    PChar('Ошибка записи в текстовый файл содержания запроса:'),
                    MB_ICONERROR);
                  Exit;
                end;
              end; //if not FileExists(PChar(fileName)) then

            if FileExists(PChar(fileName)) then
              DMReportsEWF.zqryExternal.SQL.LoadFromFile(fileName);
          end; //ID_YES: // = 6 - ДА - из внешнего файла *.sql;

        ID_NO: // = 7 - НЕТ - из Базы Данных комплекса EnergyWorkFlow
          begin
            if varQryText = '' then
              //begin
                varQryText := pLocalQryText;
              //  modRes := ID_CANCEL; //Загружать запрос из pLocalQryText
              //end; //if varQryText = '' then
            DMReportsEWF.zqryExternal.Fields.Clear;
            DMReportsEWF.zqryExternal.SQL.Text := varQryText;
            DMReportsEWF.zqryExternal.FieldList.Update;

//            if FileExists(PChar(fileName))
//            and (pos('PriEnergy_PG', fileName) = 0) then
//              DeleteFile(PChar(fileName));
//            DMReportsEWF.zqryExternal.SQL.SaveToFile(fileName);

          end; //ID_NO: // = 7 - НЕТ - из Базы Данных комплекса EnergyWorkFlow

        ID_CANCEL: // = 2 - ОТМЕНА - из локальной константы pLocalQryText
          begin
            DMReportsEWF.zqryExternal.Fields.Clear;
            DMReportsEWF.zqryExternal.SQL.Text := pLocalQryText;
            DMReportsEWF.zqryExternal.FieldList.Update;
          end; //ID_CANCEL: // = 2 - ОТМЕНА - из локальной константы pLocalQryText
      end; //case modRes of

      DMReportsEWF.frxDBDSExternal.DataSet :=
        DMReportsEWF.zqryExternal;

      reportPath := reportPath + '\' + vRtFile;
      DataModuleReportsEWF.reportNum := pRT_ID;

      DMReportsEWF.frxRExternal.LoadFromFile(
        reportPath); //Загрузка отчёта и  увеличение количества открытых
          //отчётов модуля невизуальных компонентов внешней отчётности
      Inc(LoadReportCount); //на единицу

      DMReportsEWF.frxRExternal.ShowReport();
      if LoadReportCount > 0  then //Проверка для закрытия отчёта
        begin
          DMReportsEWF.arrHWND[pRT_ID] :=
            DMReportsEWF.frxRExternal.PreviewForm.Handle;
          DMReportsEWF.frxRExternal.PreviewForm.Caption :=
            DMReportsEWF.frxRExternal.PreviewForm.Caption +
            vRtName;
        end; //if LoadReportCount > 0  then //Проверка для закрытия отчёта
    end //if DMReportsEWF.arrHWND[pRT_ID] = 0 then
  else
    frxRExternal.PreviewForm.Show;
end; //procedure TDMReportsEWF.LoadSimpleFR3(

//Процедура загрузки компоненту TZQuery по коду запроса из Базы Данных
//комплекса EnergyWorkFlow или из локальной файловой системы пользователя
procedure TDMReportsEWF.LoadZQueryReportFromDataBaseOrLocalFileSytstemByID(
  QRY_ID: Integer; //Код запроса из таблицы cn.ewfreport_query_text
    //содержания запросов *.sql для FastReport-отчётов, связанных с
    //зависимыми источниками данных, или вызываемых для получения параметров
    //запросов или для заполнения полей предшествующих отчётам экранных форм
  pQryRt: TZQuery; //Переменная указания на компонент класса TZQuery
    //клиентской части EnergyWorkFlow, через который БД передётся запрос
  pFrxDBDS: TfrxDBDataset; //Переменная указания на компонент класса
    //TfrxDBDataset как на источник данных, через который читается запрос
  pLocalQryFile: String = ''; //Указание через строковый параметр названия
    //файла запроса *.sql в случае отсутствия строки в одной из таблиц
    //cn.ewfreports, cn.ewfreport_query_text Базы Данных cndata
  pQryFolder: String = ''; //Указание через строковый параметр названия
    //директории запроса *.sql в случае отсутствия строки в одной из таблиц
    //cn.ewfreports, cn.ewfreport_query_text Базы Данных cndata
  pLocalRtFile: String = ''; //Указание через строковый параметр Наименования
    //файла *.fr3 отчёта в случае отсутствия строки в одной из таблиц
    //cn.ewfreports, cn.ewfreport_query_text Базы Данных cndata
  RT_ID: Integer = 0; //Код из cn.ewfreports формируемых FastReport-отчётов
    //Чтобы загрузки файла *.fr3 не происходило, значение параметра надо
    //оставить по умолчанию (или указать ноль)
  isMainQuery: Boolean = False; //Источник запроса: ИСТИНА - основной запрос
    //отчёта из Перечня формируемых в FastReport отчётов cn.ewfreports;
    //ЛОЖЬ - запрос из таблицы cn.ewfreport_query_text содержания
    //запросов *.sql для FastReport-отчётов, связанных с зависимыми
    //источниками данных, или вызываемых для получения параметров запросов
    //или для заполнения полей предшествующих отчётам экранных форм
  pQryType: Byte = 1; //Вид запроса для определения потребности в TfrxDBDataSet
    //1 - ВЫБОРКА записей - потребность ЕСТЬ; иначе - потребности НЕТ
    //2 - ОБНОВЛЕНИЕ записей, 3 - ВСТАВКА записей, 4 - ФУНКЦИЯ РЕДАКТИРОВАНИЯ
  pQryText: String = ''; //Резервный параметр для задания текста запроса через
    //внешнюю константу или переменную в случае отсутствия строки QRY_ID
    //таблицы cn.ewfreport_query_text и файла pLocalQryFile запроса *.sql
  pZSQLProc: TZSQLProcessor = nil; //Компонент для запросов редактирования
  pFrxReport: TfrxReport = nil); //Параметр загрузки FastReport-отчёта *.fr3
const
  strMsgLoadWarningSQLPreviousText1 = //1-ая часть предупреждения об отсутствии
    'Не обнаружен внешний файл запроса '; //текста запроса в БД и внешнем файле
  strMsgLoadWarningSQLPreviousText2 = #13#10 + //2-ая часть сообщения
    'и текст запроса НЕ НАЙДЕН в Базе Данных EnergyWorkFlow.' + #13#10 +
    'Данный запрос будет заполнен из значения свойства SQL.Text' + #13#10 +
    'внутренней компоненты класса TZQuery';
  strMsgLoadWarningSQLPreviousText2_2 = #13#10 + //2-ой вариант 2-ой части
    'Запрос будет заполнен из Базы Данных EnergyWorkFlow.';
  strMsgLoadWarningSQLPreviousCaption = //Заголовок предупреждающего сообщения
    'Неудачный выбор источника запроса для FastReport-отчёта:';

  QRYTP_SELECT_SIMPLE  = 0; //Простая ВЫБОРКА. НЕТ потребности в TfrxDBDataSet
  QRYTP_SELECT = 1; //ВЫБОРКА записей. ЕСТЬ потребность в TfrxDBDataSet
  QRYTP_UPDATE = 2; //ОБНОВЛЕНИЕ записей. НЕТ потребности в TfrxDBDataSet
  QRYTP_INSERT = 3; //ВСТАВКА записей. НЕТ потребности в TfrxDBDataSet
  QRYTP_EDIT_FUNC = 4; //ФУНКЦИЯ РЕДАКТИРОВАНИЯ. НЕТ нужды в TfrxDBDataSet
  QRYTP_DELETE = 5; //УДАЛЕНИЕ записей. НЕТ потребности в TfrxDBDataSet

var vQueryPath, //Директория запросов загружаемого FastReport-отчёта EWF
  vFfileName, //Полное имя файла запроса с указанием директории

  vRtFile, //Наименование файла *.fr3 отчёта FastReport -
    //заполняеется из поля rtfile строки pRT_ID таблицы cn.ewfreports,
    //или параметра pRtFile, если поле пустое или значение не найдено
  vRtName, //Название FastReport-отчёта EnergyWorkFlow -
    //заполняеется из поля rtname строки pRT_ID таблицы cn.ewfreports,
    //или параметра pRtName, если поле пустое или значение не найдено
  varQryText, //Текст запроса. Для простых FastReport-отчётов,
    //содержащих один источник данных, заполняеется из поля rtcontent строки
    //pRT_ID таблицы cn.ewfreports, или строкового параметра pLocalQryText,
    //если поле пустое или значение не найдено.
    //Для сложных FastReport-отчётов, содержащих несколько источников данных,
    //или простых отчётов, но требующих предварительного указания параметров,
    //переменная varQryText заполняеется сначала из поля qrycontent строки
    //pQRY_ID таблицы cn.ewfreport_query_text, или одного из строковых
    //параметров pLocalPreviousQryText, pLocalSecondaryQryText,
    //если поле пустое или значение не найдено.
    //После обработки второстепенных запросов и параметров сложного отчёта
    //текстовая переменная varQryText заполняется как для простого *fr3 отчёта.
    //а затем заполняются как для простых FastReport-отчётов
  vQryFile, //Внешний запрос *.sql: основной, второстепенный или
    //вызываемый для предварительного заполнения параметров. Основной запрос
    //заполняеется из поля qryfile строки pRT_ID таблицы cn.ewfreports,
    //или параметра pQryFileMain, если поле пустое или значение не найдено.
    //Другие заполняеются из поля qryfile строки pQRY_ID таблицы
    //cn.ewfreport_query_text, или одного строкового параметра pLocalQryFile
    //подпроцедуры LoadZqryEWFReportQueryFromDBorLocalFileSytstemByID,
    //если поле пустое или значение не найдено.
    //После обработки второстепенных запросов и параметров сложного отчёта
    //строковая переменная vQryFile заполняется как для простого *fr3 отчёта.
  vQryFolder: String; //Содержащая запросы *.sql директория. В простых отчётах
    //*.fr3 заполняеется из поля qryfolder строки pRT_ID таблицы cn.ewfreports,
    //или константы cQryFolder, если поле пустое или значение не найдено.
    //Для сложных FastReport-отчётов - из поля qryfolder строки pQRY_ID таблицы
    //cn.ewfreport_query_text, или параметра cQryFolder, если поле пустое или
    //значение не найдено.
    //После обработки второстепенных запросов и параметров сложного отчёта
    //строковая переменная vQryFolder заполняется как для простого *fr3 отчёта.
  sqlFile: TextFile; //Файл запроса
  //vFrxR: TfrxReport;
  isOnlyParametrReport: Boolean; //Загружаемость исключительно из параметров
  i, subStrStart, subStrFinish, schSlash: Integer;
  vQrySubFolder: String;
  vFrxReport: TfrxReport; //Переменная загрузки FastReport-отчёта *.fr3
begin
  //Инициализация целочисленных и строковых переменных
  DataModuleReportsEWF.reportNum := RT_ID;

  isOnlyParametrReport := (QRY_ID = 0) and (pQryText = '') and (not isMainQuery)
	and ((pLocalQryFile = '') or (pQryFolder = ''));

  if (not isOnlyParametrReport) and (pQryRt = nil)
  and (pFrxDBDS = nil) and (pZSQLProc = nil) then
    begin
      Application.MessageBox(
	    PChar('Не заданы компоненты загрузки запроса или выполняемого скрипта.'),
        PChar('Нет инструмента обращения файла-исполнителя к Базе Данных: '),
        MB_ICONERROR);
    end;

  reportPathDMEWF := ''; //Основная директория FastReport-отчётности EWF
  vQueryPath := ''; //Директория запросов FastReport-отчётности EnergyWorkFlow
  vFfileName := ''; //Полное имя файла запроса с указанием директории

  vRtFile := ''; //Предварительная очистка наименования файла отчёта *.fr3
  varQryText := ''; //Предварительная очистка переменной-содержания запроса
  vQryFile := ''; //Предварительная очистка наименования файла запроса

  modResDMEWF := ID_NO; //Загружать запросы из Базы Данных EnergyWorkFlow
  {if (modResDMEWF = ID_CANCEL) or (modResDMEWF = 0) then
    begin
      modResDMEWF := ID_NO; //Загружать запросы из Базы Данных EnergyWorkFlow
      if CheckCurrentUserRole(
        'EXTERNAL_QUERYES_READER', SS_CHANGEBUSINESSPROCESS)
      or CheckCurrentUserRole('ROOT', SS_CHANGEBUSINESSPROCESS)
      or CheckCurrentUserRole('ROOT_VIEW', SS_CHANGEBUSINESSPROCESS)
      then  //Если есть права применения запросов из внешних файлов *.sql
        modResDMEWF := Application.MessageBox(PChar(
            'ДА - загружать запросы из внешних файлов *.sql,' + #13#10 +
            'в частности, из ' + pLocalQryFile + ';' + #13#10 +
            'НЕТ - загружать запросы из Базы Данных комплекса EnergyWorkFlow'),
          PChar(
            'Выбор источников запросов для формирования FastReport-отчёта:'),
          MB_YESNO + MB_DEFBUTTON2 + MB_ICONQUESTION);
    end;} //if modResDMEWF = ID_CANCEL then

  //Указание основной папки FastReport-отчётности EnergyWorkFlow
  reportPathDMEWF := ExtractFilePath(Application.ExeName) + 'Reports';
  vQueryPath := reportPathDMEWF + '\query';
    
  if not (isOnlyParametrReport and DirectoryExists(vQueryPath)) then
    try
      CreateDir(vQueryPath);
    except
      Application.MessageBox(
        PChar('Не создана папка запросов для отчётов EnergyWorkFlow'
          + #13#10 + vQueryPath),
        PChar('Ошибка создания директории:'), MB_ICONERROR);
      //Exit;
    end; //if not DirectoryExists(vQueryPath) then

  if modResDMEWF = ID_NO then
    begin //Загружать запросы из Базы Данных комплекса EnergyWorkFlow
      //if not Assigned(DMReportsEWF) then //При необходимости переноса в
      //  Application.CreateForm(TDMReportsEWF, DMReportsEWF); //другой модуль
      //try //процедуры LoadZQueryReportFromDataBaseOrLocalFileSytstemByID
        if isMainQuery then //Если основной запрос отчёта
          begin
            DMReportsEWF.zqryEWFReportFromDBbyID.Close;
            DMReportsEWF.zqryEWFReportFromDBbyID.ParamByName(
              'id_report').AsInteger := RT_ID;
            DMReportsEWF.zqryEWFReportFromDBbyID.Open;
            if DMReportsEWF.zqryEWFReportFromDBbyID.RecordCount = 1 then
              begin
                if not DMReportsEWF.zqryEWFReportFromDBbyID.FieldByName(
                  'rtcontent').IsNull
                then varQryText :=
                  DMReportsEWF.zqryEWFReportFromDBbyID.FieldByName(
                    'rtcontent').Value;				    
                vRtFile := DMReportsEWF.zqryEWFReportFromDBbyID.FieldByName(
                  'rtfile').AsString; //Наименование файла *.fr3 отчёта
                vRtName := DMReportsEWF.zqryEWFReportFromDBbyID.FieldByName(
                  'rtname').AsString; //Название FastReport-отчёта EWF
                vQryFolder :=
                  DMReportsEWF.zqryEWFReportFromDBbyID.FieldByName(
                    'qryfolder').AsString; //Содержащая запросы *.sql папка
                vQryFile := DMReportsEWF.zqryEWFReportFromDBbyID.FieldByName(
                  'qryfile').AsString; //Основной внешний запрос *.sql
              end; //if DMReportsEWF.zqryEWFReportFromDBbyID.RecordCount ...

          end //if isMainQuery then //Если основной запрос отчёта
        else if QRY_ID > 0 then //and not isMainQuery 		
          begin
            DMReportsEWF.zqryEWFReportQueryFromDBbyID.Close;
            DMReportsEWF.zqryEWFReportQueryFromDBbyID.ParamByName(
              'id_query').AsInteger := QRY_ID;
            if RT_ID > 0 then //Если указан код отчёта из cn.ewfreports
              DMReportsEWF.zqryEWFReportQueryFromDBbyID.ParamByName(
                'id_report').AsInteger := RT_ID
            else //if RT_ID <= 0 then //Если НЕ указан код из cn.ewfreports
              DMReportsEWF.zqryEWFReportQueryFromDBbyID.ParamByName(
                'id_report').Clear;
            DMReportsEWF.zqryEWFReportQueryFromDBbyID.Open;
            if DMReportsEWF.zqryEWFReportQueryFromDBbyID.RecordCount = 1 then
              begin
                varQryText :=
                  DMReportsEWF.zqryEWFReportQueryFromDBbyID.FieldByName(
                    'qrycontent').Value;
                vQryFolder :=
                  DMReportsEWF.zqryEWFReportQueryFromDBbyID.FieldByName(
                    'qryfolder').AsString; //Содержащая запросы *.sql папка
                vQryFile :=
                  DMReportsEWF.zqryEWFReportQueryFromDBbyID.FieldByName(
                    'qryfile').AsString; //Основной внешний запрос *.sql
              end; //if DMReportsEWF.zqryEWFReportFromDBbyID.RecordCount ...
          end; //else //if not isMainQuery then
      //finally
      //  DMReportsEWF.Free;
      //  DMReportsEWF := nil;
      //end;
    end; //if modResDMEWF = ID_NO then
       
  if vQryFolder = '' then      //Если не указано название директории запросов,
    vQryFolder := pQryFolder;  //заполнить из параметра

  if vQryFile = '' then        //Если не указано наименование файла запроса,
    vQryFile := pLocalQryFile; //заполнить из параметра

  isOnlyParametrReport := (QRY_ID = 0) and (varQryText = '')
	and ((pLocalQryFile = '') or (vQryFolder = ''));	
  
  if (not isOnlyParametrReport) and (pQryRt = nil)
  and (pFrxDBDS = nil) and (pZSQLProc = nil) then
    begin
      Application.MessageBox(
	    PChar('Не заданы компоненты загрузки запроса или выполняемого скрипта.'),
        PChar('Нет инструмента обращения файла-исполнителя к Базе Данных: '),
        MB_ICONERROR);
    end;

  if (not isOnlyParametrReport) then
    begin
      vQueryPath := vQueryPath + '\' + vQryFolder;
  
      subStrStart := 1; subStrFinish := 0; schSlash := 0;
      vQrySubFolder := '';

      {if (CheckCurrentUserRole('EXTERNAL_QUERYES_EDITOR', SS_CHANGEBUSINESSPROCESS)
        or CheckCurrentUserRole('ROOT', SS_CHANGEBUSINESSPROCESS))
      and (pos('\', vQueryPath) > 0) then}

      if (pos('\', vQueryPath) > 0) then
        for i := 1 to Length(vQueryPath) do
        if Copy(vQueryPath, i, 1) = '\' then
          begin
            schSlash := schSlash + 1;
            if schSlash > 1 then
              begin
                subStrFinish := i - 1;
                if subStrFinish > subStrStart then
                begin
                  vQrySubFolder := Copy(vQueryPath, 1, subStrFinish);
                  subStrStart := i + 1;
                  if not DirectoryExists(vQrySubFolder) then
                  try
                    CreateDir(vQrySubFolder);
                  except
                  Application.MessageBox(PChar('Не создана папка ' + #13#10 +
                      vQrySubFolder),
                    PChar('Ошибка создания директории:'), MB_ICONERROR);
                  //Exit;
                  end; //if not DirectoryExists(vQueryPath) then
                end;
              end;
          end;
  
      if not DirectoryExists(vQueryPath) then
        try
          CreateDir(vQueryPath);
        except
          Application.MessageBox(
            PChar('Не создана папка хранения запросов '
              + #13#10 + vQueryPath),
            PChar('Ошибка создания директории:'),
            MB_ICONERROR);
          //Exit;
        end; //if not DirectoryExists(vQueryPath) then

      vFfileName := vQueryPath + '\' + vQryFile;

      case modResDMEWF of
        ID_YES: //Загружать запросы из внешних файлов *.sql
          begin
            if not FileExists(PChar(vFfileName)) then
              begin //Если файла-отчёта *.sql не существует
                if (varQryText = '') and (pQryText <> '') then //PRIC-694
                  varQryText := pQryText; //Запрос из НЕПУСТОЙ строковой константы

                if varQryText = '' then //Если в переменную из Базы Данных
                  begin //EnergyWorkFlow НЕ получен текст-запроса, заполнить её из
                    if pQryRt <> nil then
                      varQryText := pQryRt.SQL.Text
                    else if pZSQLProc <> nil then
                      varQryText := pZSQLProc.Script.Text;
                      //if not isOnlyParametrReport then //Условие уровнями выше
                      Application.MessageBox(PChar(strMsgLoadWarningSQLPreviousText1
                          + vQryFile + strMsgLoadWarningSQLPreviousText2),
                        PChar(strMsgLoadWarningSQLPreviousCaption), MB_ICONWARNING);
                    //modResDMEWF := ID_CANCEL; //Загружать из pQryRt.SQL.Text
                    //или из pZSQLProc.Script.Text в случае, когда pQryRt пуст
                  end
                else //if not isOnlyParametrReport then //Условие уровнями выше
                  Application.MessageBox(PChar(strMsgLoadWarningSQLPreviousText1
                      + vQryFile + strMsgLoadWarningSQLPreviousText2_2),
                    PChar(strMsgLoadWarningSQLPreviousCaption), MB_ICONWARNING);
                try
                  AssignFile(sqlFile, vFfileName);
                  Rewrite(sqlFile);
                  Writeln(sqlFile, varQryText);
                  CloseFile(sqlFile);
                except
                  Application.MessageBox(PChar(varQryText),
                    PChar('Ошибка записи в текстовый файл содержания запроса:'),
                    MB_ICONERROR);
                  Exit;
                end;
              end; //if not FileExists(PChar(vFfileName)) then

            if pQryRt <> nil then
              begin
                pQryRt.Close;
                pQryRt.SQL.Clear;
                pQryRt.Fields.Clear;

                if FileExists(PChar(vFfileName)) then
                  pQryRt.SQL.LoadFromFile(vFfileName)
                else if varQryText <> '' then
                  pQryRt.SQL.Text := varQryText;

                pQryRt.FieldList.Update;
              end; //if pQryRt <> nil then

          end; //ID_YES: //Загружать запросы из внешних файлов *.sql

        ID_NO: //Загружать запросы из Базы Данных комплекса EnergyWorkFlow
          begin
            if (varQryText = '') and (pQryText <> '') then //PRIC-694. Заполнение
              varQryText := pQryText; //переменной из НЕПУСТОЙ строковой константы

            if varQryText <> '' then
              begin //Очистка содержания задающего параметр запроса
                if pQryRt <> nil then
                  begin
                    pQryRt.Close;
                    pQryRt.SQL.Clear;
                    pQryRt.Fields.Clear;
                    //pQryRt.ClearFields;
                    pQryRt.SQL.Text := varQryText;
                    //if QRY_ID = QRY_EAPLandsAllotmentPRIC692 then
                    //  pQryRt.SQL.SaveToFile('C:\Temp\zqryEAPLandsAllotmentPRIC692.sql');
                    pQryRt.FieldList.Update;
                    pQryRt.FieldDefList.Update;
                  end
                else if pZSQLProc <> nil then
                  pZSQLProc.Script.Text := varQryText;

                {if CheckCurrentUserRole('EXTERNAL_QUERYES_EDITOR',
                  SS_CHANGEBUSINESSPROCESS)
                or CheckCurrentUserRole('ROOT', SS_CHANGEBUSINESSPROCESS) then
                  begin}
                    if (pos('PriEnergy_PG', vFfileName) = 0)
                    and DirectoryExists(vQueryPath)
                    and FileExists(PChar(vFfileName)) then
                      DeleteFile(PChar(vFfileName));

                    if DirectoryExists(vQueryPath)
                    and not FileExists(PChar(vFfileName)) then
                      begin
                        if pQryRt <> nil then
                          pQryRt.SQL.SaveToFile(vFfileName)
                        else if pZSQLProc <> nil then
                          pZSQLProc.Script.SaveToFile(vFfileName);
                      end;
                  //end;
              end //if vQryFile <> '' then
            else //if not isOnlyParametrReport then //Условие уровнями выше
              Application.MessageBox(PChar(strMsgLoadWarningSQLPreviousText1
                  + vQryFile + strMsgLoadWarningSQLPreviousText2),
                PChar(strMsgLoadWarningSQLPreviousCaption), MB_ICONWARNING);
              //modResDMEWF := ID_CANCEL; //Загружать из qrySPL_PP_Pack.SQL.Text
          end; //ID_NO: //Загружать запросы из Базы Данных комплекса
      end; //case modResDMEWF of

      if (pQryType = QRYTP_SELECT) and (pFrxDBDS <> nil) and (pQryRt <> nil)
      then
        begin
          pFrxDBDS.DataSet.FieldList.Clear;
          pFrxDBDS.DataSet := pQryRt;
          pFrxDBDS.DataSet.FieldList.Update;
          pFrxDBDS.DataSet.FieldDefList.Update;
        end;
    end; //if (not isOnlyParametrReport) then
  
  if RT_ID > 0 then
    begin
      if (vRtFile = '') or (pLocalRtFile <> '') then
        vRtFile := pLocalRtFile;
      reportPathDMEWF := reportPathDMEWF + '\' + vRtFile;
      if FileExists(PChar(DataModuleReportsEWF.reportPathDMEWF)) then
        begin
          vFrxReport := pFrxReport;
          if vFrxReport = nil then
            vFrxReport := DMReportsEWF.frxRExternal;
          vFrxReport.LoadFromFile(reportPathDMEWF);
        end;
      Inc(LoadReportCount);
    end;
end; //TDMReportsEWF.LoadZQueryReportFromDataBaseOrLocalFileSytstemByID( ...

end.
