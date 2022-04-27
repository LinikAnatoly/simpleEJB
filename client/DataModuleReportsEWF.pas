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
    arrHWND: array [0..102] of HWND; //������ ���������� ������������ �������
    //��������� �������� �������� �������� EnergyWorkFlow ������ FastReport
    //�� ����� *.fr3, ����������� ���� ������ *.sql
    procedure LoadSimpleFR3(
      pRT_ID: Integer = 0; //��� ������ �� ������� cn.ewfreports.
        //��������� �� ��������� ��������� RT_ ������ Globals.pas
      pLocalQryText: String = ''; //��������� �������� ��� �������� ����������
        //����� ������� ��������� ���������.  �����������, ���� �� ���������
      //���� rtcontent ������ pRT_ID ������� cn.ewfreports ���� ������ cndata
      //� ������� ������������ �� ������ ������� ��������� � ���������������
      //�������� ����� *.sql, ��� ���� ���� �����������, ��� ������������
      //��������� �� �������� ������� �� ����
      pRtFile: String = ''; //������������ ����� *.fr3 ������ FastReport
      pRtName: String = ''; //�������� FastReport-������ EnergyWorkFlow
      pQryFolder: String = ''; //���������� ������� *.sql ����������
      pQryFile: String = ''); //�������� ������� ������ *.sql

    //��������� �������� ���������� TZQuery �� ���� ������� �� ���� ������
    //��������� EnergyWorkFlow ��� �� ��������� ��������� ������� ������������
    procedure LoadZQueryReportFromDataBaseOrLocalFileSytstemByID(
      QRY_ID: Integer; //��� ������� �� ������� cn.ewfreport_query_text
        //���������� �������� *.sql ��� FastReport-�������, ��������� �
        //���������� ����������� ������, ��� ���������� ��� ��������� ����������
        //�������� ��� ��� ���������� ����� �������������� ������� �������� ����
      pQryRt: TZQuery; //���������� �������� �� ��������� ������ TZQuery
        //���������� ����� EnergyWorkFlow, ����� ������� �� �������� ������
      pFrxDBDS: TfrxDBDataset; //���������� �������� �� ��������� ������
        //TfrxDBDataset ��� �� �������� ������, ����� ������� �������� ������
      pLocalQryFile: String = ''; //�������� ����� ��������� �������� ��������
        //����� ������� *.sql � ������ ���������� ������ � ����� �� ������
        //cn.ewfreports, cn.ewfreport_query_text ���� ������ cndata
      pQryFolder: String = ''; //�������� ����� ��������� �������� ��������
        //���������� ������� *.sql � ������ ���������� ������ � ����� �� ������
        //cn.ewfreports, cn.ewfreport_query_text ���� ������ cndata
      pLocalRtFile: String = ''; //�������� ����� ��������� �������� ��������
        //����� *.fr3 ������ � ������ ���������� ������ � ����� �� ������
        //cn.ewfreports, cn.ewfreport_query_text ���� ������ cndata
      RT_ID: Integer = 0; //��� �� cn.ewfreports ����������� ������� *.fr3
        //����� �������� ����� *.fr3 �� �����������, �������� ��������� ����
        //�������� �� ��������� (��� ������� ����)
      isMainQuery: Boolean = False; //�������� �������: ������ - �������� ������
        //������ �� ������� ����������� � FastReport ������� cn.ewfreports;
        //���� - ������ �� ������� cn.ewfreport_query_text ����������
        //�������� *.sql ��� FastReport-�������, ��������� � ����������
        //����������� ������, ��� ���������� ��� ��������� ���������� ��������
        //��� ��� ���������� ����� �������������� ������� �������� ����
      pQryType: Byte = 1; //��� ������� ��� ����������� ����� � TfrxDBDataSet
        //1 - ������� ������� - ����������� ����; ����� - ����������� ���
        //2 - ����������, 3 - ������� �������, 4 - ������� ��������������
      pQryText: String = ''; //��������� �������� ��� ������� ������ �������
        //������� ���������� ��� ���������� � ������ ���������� ������ QRY_ID
        //������� cn.ewfreport_query_text � ����� pLocalQryFile ������� *.sql
      pZSQLProc: TZSQLProcessor = nil; //��������� ��� �������� ��������������
      pFrxReport: TfrxReport = nil); //�������� �������� FastReport-������ *.fr3
  end;

var DMReportsEWF: TDMReportsEWF;

  //http://10.77.11.28:8080/browse/PRIC-306. ��������� FastReport-����������
  //�� ���������� ����� ������� EnergyWorkFlow, �� ���� �� �������
  //�����-����������� CN.exe. ������������ �������� �������� ����������
  //�������� TZConnection �� ������ cn.ewfreports, cn.ewfreport_query_text
  //���� ������ cndata. �� � ������������ ���� ����������� �������� ������
  //�������� �� ������ *.sql ��������� ����� ������������ ..\Reports\query
  reportPathDMEWF: String; //������ ���� � ������������ FastReport-������ EWF

  modResDMEWF: Integer; //������������� ���������� - ��������� ��������� -
    //�������� �������� ��������:
    //ID_YES = 6 - �� - �� ������� ������ *.sql;
    //ID_NO = 7 - ��� - �� ���� ������ ��������� EnergyWorkFlow
    //ID_CANCEL = 2 - ������ - �� ��������� �������� pLocal_QryText

  reportNum: Integer = 0;       //����� ������

  //���������� ����������� ������� ������ ������������ �����������
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
{  WaitForm := WaitMessage('��������!',
                          '���������, ����������' + #10#13 +
                          '����������� �������� ������...');
  WaitForm.Show;
  WaitForm.Update;}

  ///// 16.03.06
  frmMain.sbMain.Panels[0].Text := ' ���������, ����������!  ����������� �������� ������...';
  frmMain.Update;

  //for i:=0 to frmMain.MainMenu1.Items.Count-1 do
  //  frmMain.MainMenu1.Items[i].Enabled:=false;  
  /////

  //{***}InvalidateRect(Application.MainForm.Handle,nil,true);
  //{***}Application.MainForm.Update;
  OldCursor:=Screen.Cursor;
  Screen.Cursor:=crHourGlass;
  IsRIOExecuting:=true;
  // �������� �������� ���� ������� ������ � ������
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
    //������������� �������� ����� �������� n-���������������� ���������� �������
    //������������� I - IV �� � ����� 01.08.2010, � 14.03.2011, � 01.03.2013 ��.
    RT_LoadS04fewTransformer:  //������������� 10 - 6 / 0,4 ��
      DMReportsEWF.frxRExternal.PreviewForm.Caption :=
        '������ �������� ���������������� ���������� ������� 10 - 6 / 0,4 ��';
    RT_LoadS35fewTransformer: //�������������� 35 - 27 / 10 - 6 ��
      DMReportsEWF.frxRExternal.PreviewForm.Caption :=
        '������ �������� ���������������� ���������� ������� 35 - 27 / 10 - 6 ��';
    RT_LoadS150fewTransformer: //�������������� 150 / 35 - 27 ��
      DMReportsEWF.frxRExternal.PreviewForm.Caption :=
        '������ �������� ���������������� ���������� ������� 150 / 35 - 27 ��';
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
    ///// ============== ������������� ����� ������� ==============/////

    AppPath := ExtractFilePath(Application.ExeName);
    //ArchiveFilePath := AppPath + TempReportsPath + 'tmpresponse.gz';
    ArchiveFilePath := AppPath + TempReportsPath + getFileName('tmpresponse') + IntToStr(GetTickCount) + '.gz';
        
    //ExtractedFilePath := AppPath + TempReportsPath + 'unknown';

    tmpStream := TMemoryStream.Create;
    try
      // ��������� ������ ����� �� ������ �� ��������� ����
      tmpStream.LoadFromStream(SOAPResponse);
      if not DirectoryExists(AppPath + TempReportsPath) then
        CreateDir(AppPath + TempReportsPath);
      tmpStream.SaveToFile(ArchiveFilePath);
    finally
      FreeAndNil(tmpStream);
    end;

  {  // ������������� ����� �� ���������� �����
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
        // ������������� ����� �� ���������� ����� �� ��������� �����
        tmpUnZipper.ExtractToStream('unknown', tmpStream1);
        // �������� ��� ��������������� ����� ������� � �������� �����
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

  {  // �������� ��� ��������������� ����� ������� � �����
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

    // ������� ��� ��������� �����
    if FileExists(ArchiveFilePath) then
      SysUtils.DeleteFile(ArchiveFilePath);
  //  if FileExists(ExtractedFilePath) then
  //    DeleteFile(ExtractedFilePath);
    ///// =========================================================/////
  end;
  {*** 16.10.06 DL ***}

  // ��������� �������� ���� ������� ������ � ������
  frmMain.Timer1.Enabled:=false;
end;

///// ��������� � ������ ��������� ��� ����, ����� ������ ������ �����
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
  TimeOut := 10800000; // 3 ����
  InternetSetOption(Data,
                    INTERNET_OPTION_RECEIVE_TIMEOUT,
                    Pointer(@TimeOut),
                    SizeOf(TimeOut));
end;

//��������� �������� �������� �������� EnergyWorkFlow ������ FastReport
//�� ����� *.fr3, ����������� ���� ������ *.sql
procedure TDMReportsEWF.LoadSimpleFR3(
  pRT_ID: Integer = 0; //��� ������ �� ������� cn.ewfreports.
    //��������� �� ��������� ��������� RT_ ������ Globals.pas
  pLocalQryText: String = ''; //��������� �������� ��� �������� ����������
    //����� ������� ��������� ���������.  �����������, ���� �� ���������
	//���� rtcontent ������ pRT_ID ������� cn.ewfreports ���� ������ cndata
	//� ������� ������������ �� ������ ������� ��������� � ���������������
	//�������� ����� *.sql, ��� ���� ���� �����������, ��� ������������
	//��������� �� �������� ������� �� ����
  pRtFile: String = ''; //������������ ����� *.fr3 ������ FastReport
  pRtName: String = ''; //�������� FastReport-������ EnergyWorkFlow
  pQryFolder: String = ''; //���������� ������� *.sql ����������
  pQryFile: String = ''); //�������� ������� ������ *.sql

var reportPath, //�������� ���������� FastReport-���������� EnergyWorkFlow
  queryPath, //���������� �������� FastReport-���������� EnergyWorkFlow
  fileName, //������ ��� ����� ������� � ��������� ����������
  varQryText,  //����� ������� -
    //������������ �� ���� rtcontent ������ pRT_ID ������� cn.ewfreports,
    //��� ��������� pLocalQryText, ���� ���� ������ ��� �������� �� �������
  vRtFile, //������������ ����� *.fr3 ������ FastReport -
    //������������ �� ���� rtfile ������ pRT_ID ������� cn.ewfreports,
    //��� ��������� pRtFile, ���� ���� ������ ��� �������� �� �������
  vRtName, //�������� FastReport-������ EnergyWorkFlow -
    //������������ �� ���� rtname ������ pRT_ID ������� cn.ewfreports,
    //��� ��������� pRtName, ���� ���� ������ ��� �������� �� �������
  vQryFolder, //���������� ������� *.sql ���������� -
    //������������ �� ���� qryfolder ������ pRT_ID ������� cn.ewfreports,
    //��� ��������� pQryFolder, ���� ���� ������ ��� �������� �� �������
  vQryFile: String ; //�������� ������� ������ *.sql -
    //������������ �� ���� qryfile ������ pRT_ID ������� cn.ewfreports,
    //��� ��������� pQryFile, ���� ���� ������ ��� �������� �� �������
  sqlFile: TextFile; //���� �������
  modRes: Integer; //������������� ���������� - ��������� ��������� -
    //�������� �������� �������:
    //ID_YES = 6 - �� - �� �������� ����� *.sql;
    //ID_NO = 7 - ��� - �� ���� ������ ��������� EnergyWorkFlow
    //ID_CANCEL = 2 - ������ - �� ��������� ��������� pLocalQryText

begin
  //if not Assigned(DMReportsEWF) then
  //  Application.CreateForm(TDMReportsEWF, DMReportsEWF);

  if pRT_ID = 0 then
    begin
      Application.MessageBox(PChar('�� ������ ��� ������!' + #13#10 +
          '�������� �������� - �������� RT_ ������ Globals.pas.'),
        PChar('������� ��������:'), MB_ICONWARNING);
      Exit;
    end; //if pRT_ID = 0 then

  if DMReportsEWF.arrHWND[pRT_ID] = 0 then
    begin
      DMReportsEWF.zqryExternal.SQL.Clear; //������� ������ �������

      //������������� ��������� ����������
      varQryText := '';  //����� ������� -
      //������������ �� ���� rtcontent ������ pRT_ID ������� cn.ewfreports,
      //��� ��������� pLocalQryText, ���� ���� ������ ��� �������� �� �������
      vRtFile := ''; //������������ ����� *.fr3 ������ FastReport -
      //������������ �� ���� rtfile ������ pRT_ID ������� cn.ewfreports,
      //��� ��������� pRtFile, ���� ���� ������ ��� �������� �� �������
      vRtName := ''; //�������� FastReport-������ EnergyWorkFlow -
      //������������ �� ���� rtname ������ pRT_ID ������� cn.ewfreports,
      //��� ��������� pRtName, ���� ���� ������ ��� �������� �� �������
      vQryFolder := ''; //���������� ������� *.sql ���������� -
      //������������ �� ���� qryfolder ������ pRT_ID ������� cn.ewfreports,
      //��� ��������� pQryFolder, ���� ���� ������ ��� �������� �� �������
      vQryFile := ''; //�������� ������� ������ *.sql -
      //������������ �� ���� qryfile ������ pRT_ID ������� cn.ewfreports,
      //��� ��������� pQryFile, ���� ���� ������ ��� �������� �� �������

      modRes := ID_CANCEL; //�� ��������� ��������� ������ �� ���������

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
            'rtfile').AsString; //������������ ����� *.fr3 ������ FastReport
          vRtName := DMReportsEWF.zqryEWFReportFromDBbyID.FieldByName(
            'rtname').AsString; //�������� FastReport-������ EnergyWorkFlow
          vQryFolder := DMReportsEWF.zqryEWFReportFromDBbyID.FieldByName(
            'qryfolder').AsString; //���������� ������� *.sql ����������
          vQryFile := DMReportsEWF.zqryEWFReportFromDBbyID.FieldByName(
            'qryfile').AsString; //�������� ������� ������ *.sql
        end; //if DMReportsEWF.zqryEWFReportFromDBbyID.RecordCount = 1 then

      //if varQryText = '' then
      //  varQryText := pLocalQryText;
      //�������� ��������� �� ����� ���� �������� ����������, ���������
      //� ���������� � ����������� �� � ������������� ���������� (���
      //�� ����������) ���������� ������ ������� � ��������� ���� *.sql

      if vRtFile = '' then			    //���� ���������� �����,
        vRtFile := pRtFile; 		    //��������� �� ���������
      if vRtFile = '' then
        begin
          Application.MessageBox(
            PChar('�� ������� �������� ����� *.fr3 ������ FastReport.'),
          PChar('������ ��������:'), MB_ICONWARNING);
          Exit;
        end; //if vRtFile = '' then

      if vRtName = '' then			    //���� ���������� �����,
        vRtName := pRtName; 		    //��������� �� ���������

      modRes := ID_NO;
      {if CheckCurrentUserRole('EXTERNAL_QUERYES_READER',
        SS_CHANGEBUSINESSPROCESS)
      or CheckCurrentUserRole('ROOT', SS_CHANGEBUSINESSPROCESS)
      or CheckCurrentUserRole('ROOT_VIEW', SS_CHANGEBUSINESSPROCESS)
      then  //���� ���� ����� ���������� �������� �� ������� ������ *.sql
        modRes := Application.MessageBox(PChar(
            '�� - ��������� ������ �� �������� ����� ' + pQryFile + ';'
            + #13#10 +
            '��� - ��������� ������ �� ���� ������ ��������� EnergyWorkFlow'),
          PChar(
            '����� ��������� ������� ��� ������������ FastReport-������:'),
          MB_YESNO + MB_DEFBUTTON2 + MB_ICONQUESTION)
      else if varQryText <> '' then //�����, ���� �� �� EnergyWorkFlow �������
        modRes := ID_NO;} //� ���������� ����� - ��������� � ��������� ������

      if (varQryText = '') and (modRes = ID_NO) then
        begin
          if pLocalQryText = '' then
            begin
              Application.MessageBox(
                PChar('����� ������� �� ��������.'),
                PChar('������ ��������:'),
                  MB_ICONERROR);
              Exit;
            end
          else
            begin
              Application.MessageBox(
                PChar('����� ������� �� ������ � ���� ������ EnergyWorkFlow.'
                  + #13#10 + '������ ����� �������� �� ��������� ���������.'),
                PChar(
                  '��������� ����� ��������� ������� ��� FastReport-������:'),
                MB_ICONWARNING);
              modRes := ID_CANCEL; //��������� ������ �� ��������� pLocalQryText
            end;
        end;

      //�������� �������� ����� FastReport-���������� EnergyWorkFlow
      reportPath := ExtractFilePath(Application.ExeName) + 'Reports';

      case modRes of
        ID_YES: // = 6 - �� - �� �������� ����� *.sql;
          begin

            if vQryFolder = '' then		    //���� ���������� �����,
              vQryFolder := pQryFolder; 	//��������� �� ���������
            if vQryFolder = '' then
              begin
                Application.MessageBox(
                  PChar('�� ������� ���������� ������� *.sql ����������.'),
                PChar('������ ��������:'), MB_ICONWARNING);
                Exit;
              end; //if vQryFolder = '' then

            if vQryFile = '' then			    //���� ���������� �����,
              vQryFile := pQryFile; 		  //��������� �� ���������
            if vQryFile = '' then
              begin
                Application.MessageBox(
                  PChar('�� ������ �������� ������� ������ *.sql.'),
                PChar('������ ��������:'), MB_ICONWARNING);
                Exit;
              end; //if vQryFile = '' then

            //PRIC-620. ������������ �� �������� ����� ������� ��� ������
            //� ���������� ������������ ����� ��������� ������ �����������
            //������������� �������� ����� ����������� ��� � ���������
            if not DirectoryExists(reportPath) then
              try
                CreateDir(reportPath);
              except
                Application.MessageBox(PChar(
                  '�� ������� �������� ����� FastReport-������� EnergyWorkFlow'
                    + #13#10 + reportPath),
                  PChar('������ �������� ����������:'),
                  MB_ICONERROR);
                Exit;
              end; //if not DirectoryExists(reportPath) then

            queryPath := reportPath + '\query';
            if not DirectoryExists(queryPath) then
              try
                CreateDir(queryPath);
              except
                Application.MessageBox(
                  PChar('�� ������� ����� �������� ��� ������� EnergyWorkFlow'
                    + #13#10 + queryPath),
                  PChar(
                    '������ �������� ����������:'),
                  MB_ICONERROR);
                Exit;
              end; //if not DirectoryExists(queryPath) then

            queryPath := queryPath + '\' + vQryFolder;
            if not DirectoryExists(queryPath) then
              try
                CreateDir(queryPath);
              except
                Application.MessageBox(
                  PChar('�� ����� ���� ������' + #13#10 + vRtName + ', ' +
                    #13#10 + '������ ��� �� ������� ����� ��������' + #13#10 +
                    queryPath),
                  PChar('������ �������� ����������:'),
                  MB_ICONERROR);
                Exit;
              end; //if not DirectoryExists(queryPath) then

            fileName := queryPath + '\' + vQryFile;
            if not FileExists(PChar(fileName)) then
              begin //���� �����-������ *.sql �� ����������

                if varQryText = '' then //���� � ���������� �� ���� ������
                  begin //EnergyWorkFlow �� ������� �����-�������,
                    varQryText := pLocalQryText; //��������� � �� ���������
                    Application.MessageBox(PChar(
                        '�� ������ ������� ���� ������� *.sql' + #13#10 +
                        '� ����� ������� �� ������ � ���� ������ ' +
                        'EnergyWorkFlow.' + #13#10 +
                        '������ ����� �������� �� ��������� ���������.'),
                      PChar(
                        '��������� ����� ��������� ������� ' +
                        '��� FastReport-������:'),
                      MB_ICONWARNING);
                    //modRes := ID_CANCEL; //��������� ������ �� pLocalQryText
                  end
                else //if varQryText <> '' then
                  //begin
                    Application.MessageBox(PChar(
                        '�� ������ ������� ���� ������� *.sql. ' + #13#10 +
                        '������ ����� �������� �� ���� ������ EnergyWorkFlow.'),
                      PChar(
                        '��������� ����� ��������� ������� ' +
                        '��� FastReport-������:'),
                      MB_ICONWARNING);
                  //  modRes := ID_NO; //��������� ������ �� ���� ������
                  //end;

                try
                  AssignFile(sqlFile, fileName);
                  Rewrite(sqlFile);
                  Writeln(sqlFile, varQryText);
                  CloseFile(sqlFile);
                except
                  Application.MessageBox(PChar(varQryText),
                    PChar('������ ������ � ��������� ���� ���������� �������:'),
                    MB_ICONERROR);
                  Exit;
                end;
              end; //if not FileExists(PChar(fileName)) then

            if FileExists(PChar(fileName)) then
              DMReportsEWF.zqryExternal.SQL.LoadFromFile(fileName);
          end; //ID_YES: // = 6 - �� - �� �������� ����� *.sql;

        ID_NO: // = 7 - ��� - �� ���� ������ ��������� EnergyWorkFlow
          begin
            if varQryText = '' then
              //begin
                varQryText := pLocalQryText;
              //  modRes := ID_CANCEL; //��������� ������ �� pLocalQryText
              //end; //if varQryText = '' then
            DMReportsEWF.zqryExternal.Fields.Clear;
            DMReportsEWF.zqryExternal.SQL.Text := varQryText;
            DMReportsEWF.zqryExternal.FieldList.Update;

//            if FileExists(PChar(fileName))
//            and (pos('PriEnergy_PG', fileName) = 0) then
//              DeleteFile(PChar(fileName));
//            DMReportsEWF.zqryExternal.SQL.SaveToFile(fileName);

          end; //ID_NO: // = 7 - ��� - �� ���� ������ ��������� EnergyWorkFlow

        ID_CANCEL: // = 2 - ������ - �� ��������� ��������� pLocalQryText
          begin
            DMReportsEWF.zqryExternal.Fields.Clear;
            DMReportsEWF.zqryExternal.SQL.Text := pLocalQryText;
            DMReportsEWF.zqryExternal.FieldList.Update;
          end; //ID_CANCEL: // = 2 - ������ - �� ��������� ��������� pLocalQryText
      end; //case modRes of

      DMReportsEWF.frxDBDSExternal.DataSet :=
        DMReportsEWF.zqryExternal;

      reportPath := reportPath + '\' + vRtFile;
      DataModuleReportsEWF.reportNum := pRT_ID;

      DMReportsEWF.frxRExternal.LoadFromFile(
        reportPath); //�������� ������ �  ���������� ���������� ��������
          //������� ������ ������������ ����������� ������� ����������
      Inc(LoadReportCount); //�� �������

      DMReportsEWF.frxRExternal.ShowReport();
      if LoadReportCount > 0  then //�������� ��� �������� ������
        begin
          DMReportsEWF.arrHWND[pRT_ID] :=
            DMReportsEWF.frxRExternal.PreviewForm.Handle;
          DMReportsEWF.frxRExternal.PreviewForm.Caption :=
            DMReportsEWF.frxRExternal.PreviewForm.Caption +
            vRtName;
        end; //if LoadReportCount > 0  then //�������� ��� �������� ������
    end //if DMReportsEWF.arrHWND[pRT_ID] = 0 then
  else
    frxRExternal.PreviewForm.Show;
end; //procedure TDMReportsEWF.LoadSimpleFR3(

//��������� �������� ���������� TZQuery �� ���� ������� �� ���� ������
//��������� EnergyWorkFlow ��� �� ��������� �������� ������� ������������
procedure TDMReportsEWF.LoadZQueryReportFromDataBaseOrLocalFileSytstemByID(
  QRY_ID: Integer; //��� ������� �� ������� cn.ewfreport_query_text
    //���������� �������� *.sql ��� FastReport-�������, ��������� �
    //���������� ����������� ������, ��� ���������� ��� ��������� ����������
    //�������� ��� ��� ���������� ����� �������������� ������� �������� ����
  pQryRt: TZQuery; //���������� �������� �� ��������� ������ TZQuery
    //���������� ����� EnergyWorkFlow, ����� ������� �� �������� ������
  pFrxDBDS: TfrxDBDataset; //���������� �������� �� ��������� ������
    //TfrxDBDataset ��� �� �������� ������, ����� ������� �������� ������
  pLocalQryFile: String = ''; //�������� ����� ��������� �������� ��������
    //����� ������� *.sql � ������ ���������� ������ � ����� �� ������
    //cn.ewfreports, cn.ewfreport_query_text ���� ������ cndata
  pQryFolder: String = ''; //�������� ����� ��������� �������� ��������
    //���������� ������� *.sql � ������ ���������� ������ � ����� �� ������
    //cn.ewfreports, cn.ewfreport_query_text ���� ������ cndata
  pLocalRtFile: String = ''; //�������� ����� ��������� �������� ������������
    //����� *.fr3 ������ � ������ ���������� ������ � ����� �� ������
    //cn.ewfreports, cn.ewfreport_query_text ���� ������ cndata
  RT_ID: Integer = 0; //��� �� cn.ewfreports ����������� FastReport-�������
    //����� �������� ����� *.fr3 �� �����������, �������� ��������� ����
    //�������� �� ��������� (��� ������� ����)
  isMainQuery: Boolean = False; //�������� �������: ������ - �������� ������
    //������ �� ������� ����������� � FastReport ������� cn.ewfreports;
    //���� - ������ �� ������� cn.ewfreport_query_text ����������
    //�������� *.sql ��� FastReport-�������, ��������� � ����������
    //����������� ������, ��� ���������� ��� ��������� ���������� ��������
    //��� ��� ���������� ����� �������������� ������� �������� ����
  pQryType: Byte = 1; //��� ������� ��� ����������� ����������� � TfrxDBDataSet
    //1 - ������� ������� - ����������� ����; ����� - ����������� ���
    //2 - ���������� �������, 3 - ������� �������, 4 - ������� ��������������
  pQryText: String = ''; //��������� �������� ��� ������� ������ ������� �����
    //������� ��������� ��� ���������� � ������ ���������� ������ QRY_ID
    //������� cn.ewfreport_query_text � ����� pLocalQryFile ������� *.sql
  pZSQLProc: TZSQLProcessor = nil; //��������� ��� �������� ��������������
  pFrxReport: TfrxReport = nil); //�������� �������� FastReport-������ *.fr3
const
  strMsgLoadWarningSQLPreviousText1 = //1-�� ����� �������������� �� ����������
    '�� ��������� ������� ���� ������� '; //������ ������� � �� � ������� �����
  strMsgLoadWarningSQLPreviousText2 = #13#10 + //2-�� ����� ���������
    '� ����� ������� �� ������ � ���� ������ EnergyWorkFlow.' + #13#10 +
    '������ ������ ����� �������� �� �������� �������� SQL.Text' + #13#10 +
    '���������� ���������� ������ TZQuery';
  strMsgLoadWarningSQLPreviousText2_2 = #13#10 + //2-�� ������� 2-�� �����
    '������ ����� �������� �� ���� ������ EnergyWorkFlow.';
  strMsgLoadWarningSQLPreviousCaption = //��������� ���������������� ���������
    '��������� ����� ��������� ������� ��� FastReport-������:';

  QRYTP_SELECT_SIMPLE  = 0; //������� �������. ��� ����������� � TfrxDBDataSet
  QRYTP_SELECT = 1; //������� �������. ���� ����������� � TfrxDBDataSet
  QRYTP_UPDATE = 2; //���������� �������. ��� ����������� � TfrxDBDataSet
  QRYTP_INSERT = 3; //������� �������. ��� ����������� � TfrxDBDataSet
  QRYTP_EDIT_FUNC = 4; //������� ��������������. ��� ����� � TfrxDBDataSet
  QRYTP_DELETE = 5; //�������� �������. ��� ����������� � TfrxDBDataSet

var vQueryPath, //���������� �������� ������������ FastReport-������ EWF
  vFfileName, //������ ��� ����� ������� � ��������� ����������

  vRtFile, //������������ ����� *.fr3 ������ FastReport -
    //������������ �� ���� rtfile ������ pRT_ID ������� cn.ewfreports,
    //��� ��������� pRtFile, ���� ���� ������ ��� �������� �� �������
  vRtName, //�������� FastReport-������ EnergyWorkFlow -
    //������������ �� ���� rtname ������ pRT_ID ������� cn.ewfreports,
    //��� ��������� pRtName, ���� ���� ������ ��� �������� �� �������
  varQryText, //����� �������. ��� ������� FastReport-�������,
    //���������� ���� �������� ������, ������������ �� ���� rtcontent ������
    //pRT_ID ������� cn.ewfreports, ��� ���������� ��������� pLocalQryText,
    //���� ���� ������ ��� �������� �� �������.
    //��� ������� FastReport-�������, ���������� ��������� ���������� ������,
    //��� ������� �������, �� ��������� ���������������� �������� ����������,
    //���������� varQryText ������������ ������� �� ���� qrycontent ������
    //pQRY_ID ������� cn.ewfreport_query_text, ��� ������ �� ���������
    //���������� pLocalPreviousQryText, pLocalSecondaryQryText,
    //���� ���� ������ ��� �������� �� �������.
    //����� ��������� �������������� �������� � ���������� �������� ������
    //��������� ���������� varQryText ����������� ��� ��� �������� *fr3 ������.
    //� ����� ����������� ��� ��� ������� FastReport-�������
  vQryFile, //������� ������ *.sql: ��������, �������������� ���
    //���������� ��� ���������������� ���������� ����������. �������� ������
    //������������ �� ���� qryfile ������ pRT_ID ������� cn.ewfreports,
    //��� ��������� pQryFileMain, ���� ���� ������ ��� �������� �� �������.
    //������ ������������ �� ���� qryfile ������ pQRY_ID �������
    //cn.ewfreport_query_text, ��� ������ ���������� ��������� pLocalQryFile
    //������������ LoadZqryEWFReportQueryFromDBorLocalFileSytstemByID,
    //���� ���� ������ ��� �������� �� �������.
    //����� ��������� �������������� �������� � ���������� �������� ������
    //��������� ���������� vQryFile ����������� ��� ��� �������� *fr3 ������.
  vQryFolder: String; //���������� ������� *.sql ����������. � ������� �������
    //*.fr3 ������������ �� ���� qryfolder ������ pRT_ID ������� cn.ewfreports,
    //��� ��������� cQryFolder, ���� ���� ������ ��� �������� �� �������.
    //��� ������� FastReport-������� - �� ���� qryfolder ������ pQRY_ID �������
    //cn.ewfreport_query_text, ��� ��������� cQryFolder, ���� ���� ������ ���
    //�������� �� �������.
    //����� ��������� �������������� �������� � ���������� �������� ������
    //��������� ���������� vQryFolder ����������� ��� ��� �������� *fr3 ������.
  sqlFile: TextFile; //���� �������
  //vFrxR: TfrxReport;
  isOnlyParametrReport: Boolean; //������������� ������������� �� ����������
  i, subStrStart, subStrFinish, schSlash: Integer;
  vQrySubFolder: String;
  vFrxReport: TfrxReport; //���������� �������� FastReport-������ *.fr3
begin
  //������������� ������������� � ��������� ����������
  DataModuleReportsEWF.reportNum := RT_ID;

  isOnlyParametrReport := (QRY_ID = 0) and (pQryText = '') and (not isMainQuery)
	and ((pLocalQryFile = '') or (pQryFolder = ''));

  if (not isOnlyParametrReport) and (pQryRt = nil)
  and (pFrxDBDS = nil) and (pZSQLProc = nil) then
    begin
      Application.MessageBox(
	    PChar('�� ������ ���������� �������� ������� ��� ������������ �������.'),
        PChar('��� ����������� ��������� �����-����������� � ���� ������: '),
        MB_ICONERROR);
    end;

  reportPathDMEWF := ''; //�������� ���������� FastReport-���������� EWF
  vQueryPath := ''; //���������� �������� FastReport-���������� EnergyWorkFlow
  vFfileName := ''; //������ ��� ����� ������� � ��������� ����������

  vRtFile := ''; //��������������� ������� ������������ ����� ������ *.fr3
  varQryText := ''; //��������������� ������� ����������-���������� �������
  vQryFile := ''; //��������������� ������� ������������ ����� �������

  modResDMEWF := ID_NO; //��������� ������� �� ���� ������ EnergyWorkFlow
  {if (modResDMEWF = ID_CANCEL) or (modResDMEWF = 0) then
    begin
      modResDMEWF := ID_NO; //��������� ������� �� ���� ������ EnergyWorkFlow
      if CheckCurrentUserRole(
        'EXTERNAL_QUERYES_READER', SS_CHANGEBUSINESSPROCESS)
      or CheckCurrentUserRole('ROOT', SS_CHANGEBUSINESSPROCESS)
      or CheckCurrentUserRole('ROOT_VIEW', SS_CHANGEBUSINESSPROCESS)
      then  //���� ���� ����� ���������� �������� �� ������� ������ *.sql
        modResDMEWF := Application.MessageBox(PChar(
            '�� - ��������� ������� �� ������� ������ *.sql,' + #13#10 +
            '� ���������, �� ' + pLocalQryFile + ';' + #13#10 +
            '��� - ��������� ������� �� ���� ������ ��������� EnergyWorkFlow'),
          PChar(
            '����� ���������� �������� ��� ������������ FastReport-������:'),
          MB_YESNO + MB_DEFBUTTON2 + MB_ICONQUESTION);
    end;} //if modResDMEWF = ID_CANCEL then

  //�������� �������� ����� FastReport-���������� EnergyWorkFlow
  reportPathDMEWF := ExtractFilePath(Application.ExeName) + 'Reports';
  vQueryPath := reportPathDMEWF + '\query';
    
  if not (isOnlyParametrReport and DirectoryExists(vQueryPath)) then
    try
      CreateDir(vQueryPath);
    except
      Application.MessageBox(
        PChar('�� ������� ����� �������� ��� ������� EnergyWorkFlow'
          + #13#10 + vQueryPath),
        PChar('������ �������� ����������:'), MB_ICONERROR);
      //Exit;
    end; //if not DirectoryExists(vQueryPath) then

  if modResDMEWF = ID_NO then
    begin //��������� ������� �� ���� ������ ��������� EnergyWorkFlow
      //if not Assigned(DMReportsEWF) then //��� ������������� �������� �
      //  Application.CreateForm(TDMReportsEWF, DMReportsEWF); //������ ������
      //try //��������� LoadZQueryReportFromDataBaseOrLocalFileSytstemByID
        if isMainQuery then //���� �������� ������ ������
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
                  'rtfile').AsString; //������������ ����� *.fr3 ������
                vRtName := DMReportsEWF.zqryEWFReportFromDBbyID.FieldByName(
                  'rtname').AsString; //�������� FastReport-������ EWF
                vQryFolder :=
                  DMReportsEWF.zqryEWFReportFromDBbyID.FieldByName(
                    'qryfolder').AsString; //���������� ������� *.sql �����
                vQryFile := DMReportsEWF.zqryEWFReportFromDBbyID.FieldByName(
                  'qryfile').AsString; //�������� ������� ������ *.sql
              end; //if DMReportsEWF.zqryEWFReportFromDBbyID.RecordCount ...

          end //if isMainQuery then //���� �������� ������ ������
        else if QRY_ID > 0 then //and not isMainQuery 		
          begin
            DMReportsEWF.zqryEWFReportQueryFromDBbyID.Close;
            DMReportsEWF.zqryEWFReportQueryFromDBbyID.ParamByName(
              'id_query').AsInteger := QRY_ID;
            if RT_ID > 0 then //���� ������ ��� ������ �� cn.ewfreports
              DMReportsEWF.zqryEWFReportQueryFromDBbyID.ParamByName(
                'id_report').AsInteger := RT_ID
            else //if RT_ID <= 0 then //���� �� ������ ��� �� cn.ewfreports
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
                    'qryfolder').AsString; //���������� ������� *.sql �����
                vQryFile :=
                  DMReportsEWF.zqryEWFReportQueryFromDBbyID.FieldByName(
                    'qryfile').AsString; //�������� ������� ������ *.sql
              end; //if DMReportsEWF.zqryEWFReportFromDBbyID.RecordCount ...
          end; //else //if not isMainQuery then
      //finally
      //  DMReportsEWF.Free;
      //  DMReportsEWF := nil;
      //end;
    end; //if modResDMEWF = ID_NO then
       
  if vQryFolder = '' then      //���� �� ������� �������� ���������� ��������,
    vQryFolder := pQryFolder;  //��������� �� ���������

  if vQryFile = '' then        //���� �� ������� ������������ ����� �������,
    vQryFile := pLocalQryFile; //��������� �� ���������

  isOnlyParametrReport := (QRY_ID = 0) and (varQryText = '')
	and ((pLocalQryFile = '') or (vQryFolder = ''));	
  
  if (not isOnlyParametrReport) and (pQryRt = nil)
  and (pFrxDBDS = nil) and (pZSQLProc = nil) then
    begin
      Application.MessageBox(
	    PChar('�� ������ ���������� �������� ������� ��� ������������ �������.'),
        PChar('��� ����������� ��������� �����-����������� � ���� ������: '),
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
                  Application.MessageBox(PChar('�� ������� ����� ' + #13#10 +
                      vQrySubFolder),
                    PChar('������ �������� ����������:'), MB_ICONERROR);
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
            PChar('�� ������� ����� �������� �������� '
              + #13#10 + vQueryPath),
            PChar('������ �������� ����������:'),
            MB_ICONERROR);
          //Exit;
        end; //if not DirectoryExists(vQueryPath) then

      vFfileName := vQueryPath + '\' + vQryFile;

      case modResDMEWF of
        ID_YES: //��������� ������� �� ������� ������ *.sql
          begin
            if not FileExists(PChar(vFfileName)) then
              begin //���� �����-������ *.sql �� ����������
                if (varQryText = '') and (pQryText <> '') then //PRIC-694
                  varQryText := pQryText; //������ �� �������� ��������� ���������

                if varQryText = '' then //���� � ���������� �� ���� ������
                  begin //EnergyWorkFlow �� ������� �����-�������, ��������� � ��
                    if pQryRt <> nil then
                      varQryText := pQryRt.SQL.Text
                    else if pZSQLProc <> nil then
                      varQryText := pZSQLProc.Script.Text;
                      //if not isOnlyParametrReport then //������� �������� ����
                      Application.MessageBox(PChar(strMsgLoadWarningSQLPreviousText1
                          + vQryFile + strMsgLoadWarningSQLPreviousText2),
                        PChar(strMsgLoadWarningSQLPreviousCaption), MB_ICONWARNING);
                    //modResDMEWF := ID_CANCEL; //��������� �� pQryRt.SQL.Text
                    //��� �� pZSQLProc.Script.Text � ������, ����� pQryRt ����
                  end
                else //if not isOnlyParametrReport then //������� �������� ����
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
                    PChar('������ ������ � ��������� ���� ���������� �������:'),
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

          end; //ID_YES: //��������� ������� �� ������� ������ *.sql

        ID_NO: //��������� ������� �� ���� ������ ��������� EnergyWorkFlow
          begin
            if (varQryText = '') and (pQryText <> '') then //PRIC-694. ����������
              varQryText := pQryText; //���������� �� �������� ��������� ���������

            if varQryText <> '' then
              begin //������� ���������� ��������� �������� �������
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
            else //if not isOnlyParametrReport then //������� �������� ����
              Application.MessageBox(PChar(strMsgLoadWarningSQLPreviousText1
                  + vQryFile + strMsgLoadWarningSQLPreviousText2),
                PChar(strMsgLoadWarningSQLPreviousCaption), MB_ICONWARNING);
              //modResDMEWF := ID_CANCEL; //��������� �� qrySPL_PP_Pack.SQL.Text
          end; //ID_NO: //��������� ������� �� ���� ������ ���������
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
