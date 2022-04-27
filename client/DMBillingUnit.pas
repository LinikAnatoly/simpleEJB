unit DMBillingUnit;

interface

uses
  SysUtils, Classes, InvokeRegistry, Rio, SOAPHTTPClient, EnergyproController,
  {***}SOAPHTTPTrans, WinInet, AbBase, AbUnzper{***}
  ;

type
  TDMBilling = class(TDataModule)
    HTTPRIOEPBill: THTTPRIO;
    HTTPRIOEPBIllEntry: THTTPRIO;
    HTTPRIOEPCustomerCalculation: THTTPRIO;
    HTTPRIOReport: THTTPRIO;
    HTTPRIOEPCustomer: THTTPRIO;
    HTTPRIOEPTransformer: THTTPRIO;
    procedure HTTPRIOBeforeExecute(const MethodName: String; var SOAPRequest: WideString);
    procedure HTTPRIOAfterExecute(const MethodName: String; SOAPResponse: TStream);
    {*** 16.10.06 DL ***}
    procedure HTTPRIOHTTPWebNodeBeforePost(const HTTPReqResp: THTTPReqResp; Data: Pointer);
    {*** 16.10.06 DL ***}    
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    procedure SetHTTPRIOProps;
  public
    { Public declarations }
    procedure makeGeneralReportPDF(name: String; request: EPReportRequestEx; _type: String);

    procedure Decode(FileName: String;fileEXT:string);
function SubStrMeasurement(Measurement:String; DigitCapacity : Integer):String;
  end;

//  function GetFileName(name: String): String;

var
  DMBilling: TDMBilling;

implementation

uses DialogFormUnit, Forms, Controls, ShellAPI, Windows,
  SetupFormUnit, LoginUnit, IniTools, Main, DlgUnit, Dialogs, Base64Unit,
  DateUtils, TypInfo, XSBuiltIns, Globals;

{$R *.dfm}

{const
  BASE_REALIZATION_CODE_UNDEFINED = 0;
  BASE_REALIZATION_CODE_ACTIVE_ENERGY = 1;
  BASE_REALIZATION_CODE_REACTIVE_ENERGY = 2;
  BASE_REALIZATION_CODE_CONSUMPTION_LIMIT_OVERDRAFT = 3;
  BASE_REALIZATION_CODE_POWER_LIMIT_OVERDRAFT = 4;
  BASE_REALIZATION_CODE_FINE = 5;
  BASE_REALIZATION_CODE_INFLATION = 6;
  BASE_REALIZATION_CODE_THREE_PERCENT = 7;

  // Detail realization

  DETAIL_REALIZATION_ACTIVE_ENERGY = 0;
  DETAIL_REALIZATION_ACTIVE_ENERGY_ADD_ACT = 1;
  DETAIL_REALIZATION_RESERVATION = 2;
  DETAIL_REALIZATION_REACTIVE_ENERGY = 10;
  DETAIL_REALIZATION_REACTIVE_ENERGY_ADD_ACT = 11;
  DETAIL_REALIZATION_CONSUMPTION_LIMIT_OVERDRAFT = 20;
  DETAIL_REALIZATION_POWER_LIMIT_OVERDRAFT = 30;
  DETAIL_REALIZATION_FINE = 40;
  DETAIL_REALIZATION_INFLATION = 50;
  DETAIL_REALIZATION_PERCENT_3 = 60;}

var
    {***} reportObject: EPCustomerCalculationReportObject;
    {***} customer4BillAdditionReport: EPCustomer;
    customerBillNumber: Integer = -1;

    IsLastDecimalNil: Boolean;

{function GetFileName(name: String): String;
var y, m, d, h, mm, s, ms: Word;

  function AddZero(value: Word): String;
  begin
    if value < 10 then
      Result:='0'+IntToStr(value)
    else
      Result:=IntToStr(value);
  end;

begin
  //ShowMessage(name+DateToStr(Date)+TimeToStr(Time));
  DecodeTime(Time,h,mm,s,ms);
  DecodeDate(Date,y,m,d);
  Result:=name+
          AddZero(d)+
          AddZero(m)+
          Copy(IntToStr(y),3,2)+
          AddZero(h)+
          AddZero(mm)+
          AddZero(s)+
          AddZero(ms);
end;}

function GetObjectField(Obj: TObject; FieldName: String): Variant;
var i, n: Integer;
    TypeData: PTypeData;
    List: PPropList;
begin
  Result:='';
  TypeData:=GetTypeData(Obj.ClassInfo);
  n:=TypeData.PropCount;
  if n <= 0 then Exit;
  GetMem(List,SizeOf(PPropInfo)*n);
  try
    GetPropInfos(Obj.ClassInfo,List);
    for i:=0 to n-1 do
      if SameText(List[i].Name,FieldName) then
        case List[i].PropType^.Kind of
          tkString, tkLString, tkWString:
            begin
              Result:=GetStrProp(Obj,List[i]);
              break;
            end;
          tkInteger:
            begin
              if GetOrdProp(Obj,List[i]) <> Low(Integer) then
                Result:=IntToStr(GetOrdProp(Obj,List[i]))
              else
                Result:='';
              break;
            end;
          tkInt64:
            begin
              if GetInt64Prop(Obj,List[i]) <> Low(Int64) then
                Result:=IntToStr(GetInt64Prop(Obj,List[i]))
              else
                Result:='';
              break;
            end;
          tkFloat:
            begin
              Result:=GetFloatProp(Obj,List[i]);
              break;
            end;
          tkClass:
            begin
              if List[i].PropType^.Name = 'TXSDecimal' then
              begin
                if GetObjectProp(Obj,List[i]) <> nil then
                begin
                  Result:=StrToFloat(TXSDecimal(GetObjectProp(Obj,List[i])).DecimalString);
                  IsLastDecimalNil:=false;
                end
                else begin
                  Result:=0.00;
                  IsLastDecimalNil:=true;
                end;
                break;
              end;
              if List[i].PropType^.Name = 'TXSDate' then
              begin
                if GetObjectProp(Obj,List[i]) <> nil then
                  Result:=XSDate2String(TXSDate(GetObjectProp(Obj,List[i])))
                else
                  Result:='';
                break;
              end;
            end;
        end;
  finally
    FreeMem(List,SizeOf(PPropInfo)*n);
  end;
end;

function renderPeriodDescription(dayOfCalculation: Integer;
                                 periodEndDate: TDateTime): String;
var d1, m1, y1, d2, m2, y2,
    monthOfCalculation, yearOfCalculation,
    startDateDay, endDateDay, daysCountInPrevMonth: Integer;
    startDate, endDate: TDateTime;
begin

  monthOfCalculation := MonthOf(periodEndDate);
  yearOfCalculation := YearOf(periodEndDate);

  if monthOfCalculation > 1 then
  begin
    m1 := monthOfCalculation - 1;
    y1 := yearOfCalculation;
  end
  else begin
    m1 := 12;
    y1 := yearOfCalculation - 1;
  end;

  daysCountInPrevMonth := DaysInMonth(EncodeDate(y1,m1,1));

  if dayOfCalculation + 1 > daysCountInPrevMonth then
    startDateDay := daysCountInPrevMonth
  else
    startDateDay := dayOfCalculation + 1;

  startDate := EncodeDate(y1,m1,startDateDay);

  m2 := monthOfCalculation;
  y2 := yearOfCalculation;

  if dayOfCalculation > DaysInMonth(EncodeDate(y2,m2,1)) then
    endDateDay := DaysInMonth(EncodeDate(y2,m2,1))
  else
    endDateDay := dayOfCalculation;

  endDate := EncodeDate(y2,m2,endDateDay);

  Result := 'з ' + DateToStr(startDate) + ' по ' + DateToStr(endDate);

end;

procedure TDMBilling.makeGeneralReportPDF(name: String; request: EPReportRequestEx; _type: String);
var reportType, filename, result, fname: String;
    TempEPReport: EPReportControllerSoapPort;
    outStream: TFileStream;
    res: TStrings;
begin
//  var form = new Form('SelectReportType');

  // comment this line to enable selection
  //_type := 'PDF';

  reportType:='PDF';
{  if (_type <> '') then
    reportType := _type
  else
  begin
    if (form.exec())
    begin
      if (form.radioButtonPDF.checked)
      begin
        reportType:='PDF';
      end;
      else
      begin
        reportType:='XLS';
      end;
    end;
    else
      return;
  end;}
  if (reportType = 'PDF') then
  begin
    //filename:=name; //makeCorrectReportFileName(name, 'pdf');

    TempEPReport := HTTPRIOReport as EPReportControllerSoapPort;

    //result:=application.server.EPReportControllerSoapPort.processAsPDF(request);
    if (upperCase(_type) = 'PDF') then
      result:=TempEPReport.processAsPDF(request)
    else if  (upperCase(_type) = 'XLS') then
      result:=TempEPReport.processAsXLS(request);

    res:=TStringList.Create;
    try
      res.Add(Trim(result));
      //fname:=GetFileName('res');
      fname:=GetFileName(name);
      if not DirectoryExists(ExtractFilePath(Application.ExeName)+TempReportsPath) then
        CreateDir(ExtractFilePath(Application.ExeName)+TempReportsPath);
      res.SaveToFile(ExtractFilePath(Application.ExeName)+TempReportsPath+fname+'.b64');
    finally
      res.Free;
    end;
    Decode(ExtractFilePath(Application.ExeName)+TempReportsPath+fname,('.'+_type));
    SysUtils.DeleteFile(ExtractFilePath(Application.ExeName)+TempReportsPath+fname+'.b64');
    ShellExecute(0,PChar('open'),PChar('"' + ExtractFilePath(Application.ExeName)+TempReportsPath+fname+'.'+_type + '"'),
                  nil,nil,SW_SHOWMAXIMIZED);
    //////////////
{    outStream:=TFileStream.Create(ExtractFilePath(Application.ExeName)+filename+'.pdf',fmCreate);
    try
      Decoder.DecodeToStream(result,outStream);
    finally
      outStream.Free;
    end;}

    //////////////


{    var fileReport:=application.file.openForWrite(filename);

    if (fileReport != null)
    begin
     fileReport.writeBase64(result);
     fileReport.close();

     application.shellExecute(filename);
    end;
    else
    begin
     application.errMsgBoxLow('Ошибка при создании файла ' + filename);
    end;}
  end
  else
  begin
{    var filename:=makeCorrectReportFileName(name, 'xls');

    result:=application.server.EPReportControllerSoapPort.processAsXLS(request);

    var fileReport:=application.file.openForWrite(filename);

    if (fileReport != null)
    begin
     fileReport.writeBase64(result);
     fileReport.close();

     application.shellExecute(filename);}
  end;
{  else
  begin
     //application.errMsgBoxLow('Ошибка при создании файла ' + filename);
  end;}
end;

procedure TDMBilling.SetHTTPRIOProps;
var i, p: Integer;
    IP, Port_, IniPath: String;
begin
  ///// Setting UserName, Password and WSDLLocation
  IniPath:=ExtractFilePath(Application.ExeName)+IniName;
  for i:=0 to ComponentCount-1 do
    if (Components[i] is THTTPRIO) then
      with THTTPRIO(Components[i]) do
      begin
              HTTPWebNode.UserName:=UserName;
              HTTPWebNode.Password:=Password;
              HTTPWebNode.Agent := 'KSOE Client';

              if IniValueExists(IniPath,'Billing','IP') then
                IP:=IniReadString(IniPath,'Billing','IP')
              else
                IP:='10.77.11.41';
              if IniValueExists(IniPath,'Billing','Port') then
                Port_:=IniReadString(IniPath,'Billing','Port')
              else
                Port_:='8085';

              URL:='http://'+IP+':'+Port_+'/soap/servlet/rpcrouter';

              OnBeforeExecute:=HTTPRIOBeforeExecute;
              OnAfterExecute:=HTTPRIOAfterExecute;
              HTTPWebNode.OnBeforePost := HTTPRIOHTTPWebNodeBeforePost;
      end;
  /////
end;

procedure TDMBilling.HTTPRIOBeforeExecute(const MethodName: String; var SOAPRequest: WideString);
begin
  WaitForm := WaitMessage('Внимание!',
                          'Подождите, пожалуйста' + #10#13 +
                          'Выполняется загрузка данных...');
  WaitForm.Show;
  WaitForm.Update;
  {***}Application.MainForm.Update;
  OldCursor:=Screen.Cursor;
  Screen.Cursor:=crHourGlass;
  IsRIOExecuting:=true;
  // Включить перехват окна запроса логина и пароля
  frmMain.Timer1.Enabled:=true;
end;

procedure TDMBilling.HTTPRIOAfterExecute(const MethodName: String; SOAPResponse: TStream);
var ArchiveFilePath, AppPath: String;
    tmpStream, tmpStream1: TMemoryStream;
    tmpUnZipper: TAbUnZipper;
begin
  if IsRIOExecuting then
  begin
    Screen.Cursor:=OldCursor;
    WaitForm.Close;
    WaitForm.Free;
    WaitForm:=nil;
    IsRIOExecuting:=false;
  end;
  {***}Application.MainForm.Update;

  {*** 16.10.06 DL ***}
  if _IS_PACKED_RESPONSE then
  begin
    ///// ============== Распаковываем ответ сервера ==============/////

    AppPath := ExtractFilePath(Application.ExeName);
    ArchiveFilePath := AppPath + TempReportsPath + 'tmpresponse.gz';
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
procedure TDMBilling.HTTPRIOHTTPWebNodeBeforePost(const HTTPReqResp: THTTPReqResp; Data: Pointer);
/// 31.01.08
var TimeOut : integer;
///
begin
  if not _IS_PACKED_RESPONSE then Exit;

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
  ///
end;
{*** 16.10.06 DL ***}
/////

procedure TDMBilling.DataModuleCreate(Sender: TObject);
begin
  SetHTTPRIOProps;
end;

procedure TDMBilling.Decode(FileName: String; fileEXT:String);
Var
  base64File: TextFile;
  BufStr, base64String: String;
  Base64: TBase64;
  hFile: Integer;
begin
  AssignFile(base64File,FileName+'.b64');
  Reset(base64File);
  hFile := FileCreate(FileName+fileEXT);
  while not EOF(base64File) do
  begin
    Application.ProcessMessages;
    Readln(base64File,BufStr);
    while Length(BufStr) > 0 do
    begin
      base64String := Copy(BufStr,1,4);
      Delete(BufStr,1,4);
      Base64 := DecodeBase64(base64String);
      FileWrite(hFile,Base64.ByteArr,Base64.ByteCount);
    end;
  end;
  FileClose(hFile);
  CloseFile(base64File);
end;

{
procedure TDMBilling.DecodeXLS(FileName: String);
Var
  base64File: TextFile;
  BufStr, base64String: String;
  Base64: TBase64;
  hFile: Integer;
begin
  AssignFile(base64File,FileName+'.b64');
  Reset(base64File);
  hFile := FileCreate(FileName+'.xls');
  while not EOF(base64File) do
  begin
    Application.ProcessMessages;
    Readln(base64File,BufStr);
    while Length(BufStr) > 0 do
    begin
      base64String := Copy(BufStr,1,4);
      Delete(BufStr,1,4);
      Base64 := DecodeBase64(base64String);
      FileWrite(hFile,Base64.ByteArr,Base64.ByteCount);
    end;
  end;
  FileClose(hFile);
  CloseFile(base64File);
end;
}


function TDMBilling.SubStrMeasurement(Measurement:String; DigitCapacity : Integer):String;
var
SubstringetMeasurement:String;
s0 , s , s1 , s2: string;
i,n : integer;
begin
s := Copy(Measurement, 0, length(Measurement)-4 );
s0 := Copy('000000000000000',0,DigitCapacity-length(Measurement)+4);

s1 := Copy(Measurement, length(Measurement)-3, 4);  // поменяеться ФОРМАТ - будет БАГГГ
n:=-1;
s2:='';
for i:=1 to length(s1) do
  //if (s1[i] <> '0') and (s1[i]<>'.') or (s1[i]<>',') then n:=i;
  if s1[i] in ['1','2','3','4','5','6','7','8','9'] then n:=i;

if n <> -1 then
  s2:= copy(s1,0,n);

SubstringetMeasurement := s0 + s + s2;
result := SubstringetMeasurement;
end;

end.
