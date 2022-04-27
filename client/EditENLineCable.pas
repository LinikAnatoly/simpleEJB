
unit EditENLineCable;

interface

uses
  Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
  Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
  DialogFormUnit, AdvGrid, Buttons, ENHighVoltageSellController,
  EnergyproController, EnergyproController2, ENLineCableController, ENSubst150CellController,
  TB2Item, TB2Dock, TB2Toolbar, AdvObj,
  CCElementDataController, CCFeederController,
  IdFTP, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, ShellAPI,
  CCDamageLogController, CCGlobal, CCDMReportUnit, CCReportController;

type
    TfrmENLineCableEdit = class(TDialogForm)
    lblDateGen : TLabel;
    edtDateGen: TDateTimePicker;

    lblENElementElementName : TLabel;
    edtENElementElementName : TEdit;
    spbENElementElement : TSpeedButton;

    HTTPRIOENLineCable: THTTPRIO;

    btnOk: TButton;
    btnCancel: TButton;
    HTTPRIOENHighVoltageSell: THTTPRIO;
    HTTPRIOENSubst150Cell: THTTPRIO;
    pcENLineCable: TPageControl;
    tsGeneral: TTabSheet;
    tsActs: TTabSheet;
    tsPlanWorks: TTabSheet;
    lblEPRenName: TLabel;
    edtFINExecutorName: TEdit;
    edtSubst150Cell: TEdit;
    edtENHighVoltageSellName: TEdit;
    edtEPRenName: TEdit;
    cbOwner: TComboBox;
    cbBelonging: TComboBox;
    edtEPVoltageNominalVoltagenominalName: TEdit;
    edtLastRepairDate: TDateTimePicker;
    edtMoreData: TMemo;
    edtMainCustomersData: TMemo;
    edtYearWorkingStart: TEdit;
    edtYearBuild: TEdit;
    edtLineLength: TEdit;
    edtBuhName: TEdit;
    edtName: TEdit;
    edtInvNumber: TEdit;
    lblExecuter: TLabel;
    spbFINExecutor: TSpeedButton;
    Label1: TLabel;
    sb150cell: TSpeedButton;
    spbENHighVoltageSell: TSpeedButton;
    lblENHighVoltageSellName: TLabel;
    spbEPRen: TSpeedButton;
    lblBelonging: TLabel;
    lblOwner: TLabel;
    spbOSSelect: TSpeedButton;
    lblEPVoltageNominalVoltagenominalName: TLabel;
    spbEPVoltageNominalVoltagenominal: TSpeedButton;
    lblLastRepairDate: TLabel;
    lblMoreData: TLabel;
    lblMainCustomersData: TLabel;
    lblYearWorkingStart: TLabel;
    lblYearBuild: TLabel;
    lblLineLength: TLabel;
    lblBuhName: TLabel;
    lblName: TLabel;
    lblInvNumber: TLabel;
    Label2: TLabel;
    edtCableDescription: TMemo;
    ActionList1: TActionList;
    actViewPlan: TAction;
    ImageList1: TImageList;
    tbActions: TTBToolbar;
    TBItem3: TTBItem;
    TBItem46: TTBItem;
    actUpdate: TAction;
    sgENPlanWork: TAdvStringGrid;
    HTTPRIOENPlanWork: THTTPRIO;
    TBToolbar1: TTBToolbar;
    TBItem1: TTBItem;
    TBItem2: TTBItem;
    actViewAct: TAction;
    sgENAct: TAdvStringGrid;
    HTTPRIOENAct: THTTPRIO;
    tsCCElement: TTabSheet;
    sgCCElementData: TAdvStringGrid;
    HTTPRIOCCElementData: THTTPRIO;
    HTTPRIOENElement: THTTPRIO;
    HTTPRIOCCFeeder: THTTPRIO;
    lblGeograph: TLabel;
    edtGeograph: TEdit;
    btnGeograph: TSpeedButton;
    btnGeographClear: TSpeedButton;
    HTTPRIOENGeographicDepartment: THTTPRIO;
    tsAttachments: TTabSheet;
    sgENDocAttachment: TAdvStringGrid;
    ToolBar19: TToolBar;
    btnLoadAttachment: TToolButton;
    btnAddAttachments: TToolButton;
    btnDeleteAttachment: TToolButton;
    btnUpdateAttachments: TToolButton;
    pmAttachment: TPopupMenu;
    MenuItem21: TMenuItem;
    MenuItem22: TMenuItem;
    MenuItem23: TMenuItem;
    MenuItem24: TMenuItem;
    ActionAttachment: TActionList;
    actLoadAttachment: TAction;
    actAddAttachment: TAction;
    actDeleteAttachment: TAction;
    actUpdateAttachments: TAction;
    HTTPRIOENDocAttachment: THTTPRIO;
    tsCCDamageLog: TTabSheet;
    sgCCDamageLog: TAdvStringGrid;
    HTTPRIOCCDamageLog: THTTPRIO;
    tbDamages: TTBToolbar;
    tbiDamagesXLS: TTBItem;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

    procedure spbEPVoltageNominalVoltagenominalClick(Sender : TObject);
    procedure spbENElementElementClick(Sender : TObject);
    procedure spbOSSelectClick(Sender: TObject);
    procedure spbEPRenClick(Sender: TObject);
    procedure sb150cellClick(Sender: TObject);
    procedure spbFINExecutorClick(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure pcENLineCableChange(Sender: TObject);
    procedure updatePlanWorkGrid();
    procedure actViewPlanExecute(Sender: TObject);
    procedure sgENPlanWorkDblClick(Sender: TObject);
    procedure actViewActExecute(Sender: TObject);
    procedure updateActGrid();
    procedure sgENActDblClick(Sender: TObject);
    procedure LoadCCElement();
    procedure LoadCCDamageLog();
    procedure OpenSLAMO(Sender: TObject);
    procedure sgCCElementDataDblClick(Sender: TObject);
    procedure btnGeographClick(Sender: TObject);
    procedure btnGeographClearClick(Sender: TObject);
    procedure actLoadAttachmentExecute(Sender: TObject);
    procedure actAddAttachmentExecute(Sender: TObject);
    procedure actDeleteAttachmentExecute(Sender: TObject);
    procedure actUpdateAttachmentsExecute(Sender: TObject);
    procedure sgCCDamageLogDblClick(Sender: TObject);
    procedure tbiDamagesXLSClick(Sender: TObject);

  private
    { Private declarations }
    procedure updateAttachments();            //Обновление списка вложений
  public
    { Public declarations }

end;

var
  frmENLineCableEdit: TfrmENLineCableEdit;
  ENLineCableObj: ENLineCable;
  cellCode, pwLastCount, pwColCount, pwLastRow, selectedRow: Integer;
  actLastCount, actColCount, actLastRow: Integer;

  ENPlanWorkHeaders: array [1..19] of String =
        ( 'Код'
          ,'Об''єкт планування'
          ,'Інв. №'
          ,'РЕЗ та ЕМ'
          ,'Рік плану'
          ,'Місяць плану'
          ,'Дата початку робіт'
          //,'Початк. місяць та рік плану (до перенесення)'
          //,'Початк. місяць плану'
          ,'ПідВид робіт'
          ,'Тип акту'
          ,'Вид плану'
          ,'Статус'
          ,'Підрозділ'
          ,'БюджетоТримач'
          ,'Центр відповідальності'
          ,'Початк. місяць та рік плану (до перенесення)'
          //,'Дата складання плану'
          ,'Номер наряда'
          ,'Користувач, що вніс зміни'
          ,'Дата останньої зміни'
          ,'Дата створення'
        );

  ENActHeaders: array [1..9] of String =
        ( 'Код'
          ,'Номер акту'
          ,'Дата проведення акту'
          ,'Дата акту'
          ,'Код МОЛ / ПІБ з Фін. Кол.'
          ,'Тип'
          ,'Статус'
          ,'Зробивший зміни користувач'
          ,'Дата останніх змін'
        );
  ENDocAttachmentHeaders: array [1..7] of String =
       ( 'Код'
         ,'Коментар до вкладення'
         ,'Посилання на файл'
         ,'Користувач, що додав вкладення'
         ,'Дата додавання'
         ,'Користувач, що змінив вкладення'
         ,'Дата зміни'
       );



implementation

uses
  ShowEPVoltageNominal
//  ,EPVoltageNominalController
  ,ShowENElement
  ,ENElementController

  
, OSTableController, ShowOStable, ShowENEPRen, ENOwnerController,
  ENBelongingController,ShowENSubst150Cell, ENConsts, FINExecutorController,
  ShowFINExecutorTree, DMReportsUnit, ENPlanWorkController, EditENPlanWork,
  ENActController, EditENAct, EditCCElementData, EditTopologyF10, EditTopologyF04, EditCCFeeder,
  ShowENGeographicDepartment, ENGeographicDepartmentController,
  ENDocAttachmentController, EditDFDocAttachment,
  ENDocAttachmentServerController, Globals, ENDocAttachmentStatusController,
  EditCCDamageLog;

{uses
    EnergyproController, EnergyproController2, ENLineCableController  ;
}
{$R *.dfm}



procedure TfrmENLineCableEdit.FormShow(Sender: TObject);
var
  TempENHighVoltageSell: ENHighVoltageSellControllerSoapPort;
  hvsObj: ENHighVoltageSell;
  TempENSubst150Cell :ENSubst150CellControllerSoapPort;
  cell150:ENSubst150Cell;
  TempENGeographicDepartment: ENGeographicDepartmentControllerSoapPort;
  ENGeographicDepartmentObj : ENGeographicDepartment;
  eList : ENElementShortList;
  TempENElement: ENElementControllerSoapPort;
  eFilter : ENElementFilter;
begin

  pcENLineCable.ActivePage := tsGeneral;

  TempENSubst150Cell := HTTPRIOENSubst150Cell as ENSubst150CellControllerSoapPort;
  FormatSettings.DecimalSeparator := '.';
  SetIntStyle([edtYearBuild, edtYearWorkingStart]);
  SetFloatStyle([edtLineLength]);

  DisableControls([edtBuhName, edtEPRenName,
    edtEPVoltageNominalVoltagenominalName,
    edtENHighVoltageSellName, spbENHighVoltageSell , edtGeograph ]);

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([edtName
      ,edtLineLength
      ,edtEPVoltageNominalVoltagenominalName
      ,edtEPRenName
     ]);
  end;

  if (DialogState = dsView) then
  begin
    DisableControls([spbEPVoltageNominalVoltagenominal, spbEPRen, spbOSSelect, spbFINExecutor, sb150cell , btnGeograph , btnGeographClear ]);
  end;

  if (DialogState = dsEdit) or (DialogState = dsView) then
  begin


    if ENLineCableObj.element.geoDepartmentRef <> nil then
      if ENLineCableObj.element.geoDepartmentRef.code <> LOW_INT then
       begin
           // geodept
            TempENGeographicDepartment := HTTPRIOENGeographicDepartment as ENGeographicDepartmentControllerSoapPort;
          try
            ENGeographicDepartmentObj := TempENGeographicDepartment.getObject( ENLineCableObj.element.geoDepartmentRef.code );
            edtGeograph.Text := ENGeographicDepartmentObj.name;
          except
            on EConvertError do Exit;
          end;
       end;

    edtInvNumber.Text := ENLineCableObj.invNumber;
    edtName.Text := ENLineCableObj.name; 
    edtBuhName.Text := ENLineCableObj.buhName; 
    if ( ENLineCableObj.lineLength <> nil ) then
       edtLineLength.Text := ENLineCableObj.lineLength.decimalString
    else
       edtLineLength.Text := ''; 
    if ( ENLineCableObj.yearBuild <> Low(Integer) ) then
       edtYearBuild.Text := IntToStr(ENLineCableObj.yearBuild)
    else
       edtYearBuild.Text := '';
    if ( ENLineCableObj.yearWorkingStart <> Low(Integer) ) then
       edtYearWorkingStart.Text := IntToStr(ENLineCableObj.yearWorkingStart)
    else
       edtYearWorkingStart.Text := '';

    if ENLineCableObj.substationcellrefcode>0 then
    begin
      cell150:=TempENSubst150Cell.getObject(ENLineCableObj.substationcellrefcode);
      cellCode:=ENLineCableObj.substationcellrefcode;
      edtSubst150Cell.text:=cell150.name;
    end
    else
    begin
     cellCode:=Low(Integer);
     edtSubst150Cell.text:='';
    end;

    MakeMultiline(edtMainCustomersData.Lines, ENLineCableObj.mainCustomersData);
    MakeMultiline(edtMoreData.Lines, ENLineCableObj.moreData);
    if ENLineCableObj.lastRepairDate <> nil then
    begin
      edtLastRepairDate.DateTime:=EncodeDate(ENLineCableObj.lastRepairDate.Year,ENLineCableObj.lastRepairDate.Month,ENLineCableObj.lastRepairDate.Day);
      edtLastRepairDate.checked := true;
    end
    else
    begin
      edtLastRepairDate.DateTime:=SysUtils.Date;
      edtLastRepairDate.checked := false;
    end;

    MakeMultiline(edtCableDescription.Lines, ENLineCableObj.cableDescription);

    if ENLineCableObj.dateGen <> nil then
    begin
      edtDateGen.DateTime:=EncodeDate(ENLineCableObj.dateGen.Year,ENLineCableObj.dateGen.Month,ENLineCableObj.dateGen.Day);
      edtDateGen.checked := true;
    end
    else
    begin
      edtDateGen.DateTime:=SysUtils.Date;
      edtDateGen.checked := false;
    end;

    cbOwner.ItemIndex := -1;
    if ENLineCableObj.ownerRef <> nil then
      if ENLineCableObj.ownerRef.code <> Low(Integer) then
        cbOwner.ItemIndex := ENLineCableObj.ownerRef.code;

    cbBelonging.ItemIndex := -1;
    if ENLineCableObj.belongingRef <> nil then
      if ENLineCableObj.belongingRef.code <> Low(Integer) then
        cbBelonging.ItemIndex := ENLineCableObj.belongingRef.code;

    if ENLineCableObj.voltagenominal <> nil then
       if  ENLineCableObj.voltagenominal.value <> nil then
           edtEPVoltageNominalVoltagenominalName.Text := ENLineCableObj.voltagenominal.value.DecimalString
       else
           edtEPVoltageNominalVoltagenominalName.Text := ''
    else
       edtEPVoltageNominalVoltagenominalName.Text := '';

    if ENLineCableObj.element <> nil then
           if (ENLineCableObj.element.renRef <> nil ) then
         begin
          TempENElement :=  HTTPRIOENElement as ENElementControllerSoapPort;
           eFilter := ENElementFilter.Create;
           SetNullIntProps(eFilter);
           SetNullXSProps(eFilter);
           eFilter.code := ENLineCableObj.element.code;
          eList := TempENElement.getScrollableFilteredList(eFilter,0,-1);
          edtEPRenName.Text :=  eList.list[0].renRefName;
         end
        else
          edtEPRenName.Text := ''
    else
       edtEPRenName.Text := '';

        if ENLineCableObj.element.finExecutor <> nil then
      if ENLineCableObj.element.finExecutor.code > LOW_INT then
       begin
         edtFINExecutorName.Text := ENLineCableObj.element.finExecutor.name;
       end;


    TempENHighVoltageSell :=
      HTTPRIOENHighVoltageSell as ENHighVoltageSellControllerSoapPort;
    hvsObj := TempENHighVoltageSell.getObject(ENLineCableObj.highVoltageSell.code);
    if hvsObj <> nil then
      edtENHighVoltageSellName.Text := 'Ячейка № ' + hvsObj.numberGen;

    //edtEPVoltageNominalVoltagenominalName.Text := ENLineCableObj.voltagenominal.value;
    //edtENElementElementName.Text := ENLineCableObj.element.name;

  end;
end;


procedure TfrmENLineCableEdit.pcENLineCableChange(Sender: TObject);
begin
  inherited;
  if (pcENLineCable.ActivePage = tsPlanWorks) then updatePlanWorkGrid();
  if (pcENLineCable.ActivePage = tsActs) then updateActGrid();
  if (pcENLineCable.ActivePage = tsCCElement) then LoadCCElement();
  if (pcENLineCable.ActivePage = tsCCDamageLog) then LoadCCDamageLog();
  if pcENLineCable.ActivePage = tsAttachments then
  begin;
    btnLoadAttachment.Enabled := True;
    SetGridHeaders(ENDocAttachmentHeaders, sgENDocAttachment.ColumnHeaders);
    ClearGrid(sgENDocAttachment);
    updateAttachments;
  end;
end;


procedure TfrmENLineCableEdit.actAddAttachmentExecute(Sender: TObject);
begin
  ENDocAttachmentObj := ENDocAttachment.Create;
  try
    frmDFDocAttachmentEdit := TfrmDFDocAttachmentEdit.Create(Application, dsInsert);
    frmDFDocAttachmentEdit.elementCode := ENLineCableObj.element.code;
    frmDFDocAttachmentEdit.HideControls([frmDFDocAttachmentEdit.lblENDocAttachmentTypeTypeRefName,
                                         frmDFDocAttachmentEdit.edtENDocAttachmentTypeTypeRefName,
                                         frmDFDocAttachmentEdit.spbENDocAttachmentTypeTypeRef]);
    try
      if frmDFDocAttachmentEdit.ShowModal = mrOk then
      begin
        if ENDocAttachmentObj <> nil then
          updateAttachments;
      end;
    finally
      frmDFDocAttachmentEdit.Free;
      frmDFDocAttachmentEdit := nil;
    end;
  finally
    ENDocAttachmentObj.Free;
    ENDocAttachmentObj := nil;
  end;

end;

procedure TfrmENLineCableEdit.actDeleteAttachmentExecute(Sender: TObject);
var
  TempENDocAttachment : ENDocAttachmentControllerSoapPort;
  ObjCode : Integer;
begin
  try
    ObjCode := StrToInt(sgENDocAttachment.Cells[0, sgENDocAttachment.Row]);
  except
    on EConvertError do Exit;
  end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити вкладення ?'),
                            PChar('Увага !'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
  begin
    TempENDocAttachment := HTTPRIOENDocAttachment as ENDocAttachmentControllerSoapPort;
    TempENDocAttachment.remove(ObjCode);
    updateAttachments;
  end;
end;
procedure TfrmENLineCableEdit.actLoadAttachmentExecute(Sender: TObject);
var
  i : Integer;
  result, fname, fileName, dir, ftpDir : string;
  ftpClient: TIdFTP;
  FileNames: TStrings;
  fileSize: Integer;
  att : ENDocAttachment;
  serv : ENDocAttachmentServer;
begin
  inherited;
  FileNames := TStringList.Create;

  try
    att := DMReports.getENDocAttachmentByCode(StrToInt(sgENDocAttachment.Cells[0,sgENDocAttachment.Row]));
    if att = nil then Exit;
    serv := DMReports.getENDocAttachmentServerByCode(att.serverRef.code);
    if serv = nil then Exit;
  except
    on EConvertError do Exit;
  end;

  fileName := ExtractFileName(att.fileLink);
  dir :=  ExtractFilePath(StringReplace(att.fileLink, '/', '\', [rfReplaceAll]));
  ftpDir := StringReplace(dir, '\', '/', [rfReplaceAll]);

  i := LastDelimiter('/' + PathDelim + DriveDelim, fileName);
  if (i > 0) and (fileName[i] = '/') then
    fname := Copy(fileName, i+1, MaxInt) else
    fname := '';

  ftpClient := TIdFTP.create(nil);
  try

    with ftpClient do begin
      Host:= serv.serverIp;
      Username:= serv.userName;
      Password:= serv.userPass;
    end;

    ftpClient.Connect();

    ftpClient.Passive := True;
    ftpClient.BeginWork(wmRead);
    ftpClient.ChangeDir('/'+ftpDir);
    ftpClient.List(FileNames, '', False);

    if not DirectoryExists(ExtractFilePath(Application.ExeName)+TempReportsPath) then
      CreateDir(ExtractFilePath(Application.ExeName)+TempReportsPath);

    with ftpClient.DirectoryListing do for i := 0 to Count - 1 do
    begin
      fileSize := ftpClient.Size(ftpClient.DirectoryListing[0].FileName);
      ftpClient.Get(ftpClient.DirectoryListing[0].FileName, ExtractFilePath(Application.ExeName)+TempReportsPath+fname, True, False);
    end;

    ftpClient.Disconnect();
  finally
    ftpClient.Free;
  end;

  ShellExecute(0,PChar('open'),PChar('"' + ExtractFilePath(Application.ExeName)+TempReportsPath+fname + '"'),
                nil,nil,SW_SHOWMAXIMIZED);

end;

procedure TfrmENLineCableEdit.actUpdateAttachmentsExecute(Sender: TObject);
begin
  updateAttachments;
end;


procedure TfrmENLineCableEdit.updateAttachments;
var
  TempENDocAttachment: ENDocAttachmentControllerSoapPort;
  ENDocAttachmentList: ENDocAttachmentShortList;
  docAttachmentFilter: ENDocAttachmentFilter;
  i, attachmentsCount: Integer;
begin
  ClearGrid(sgENDocAttachment);

  if DialogState = dsInsert then Exit;
  if ENLineCableObj = nil then Exit;
  if ENLineCableObj.element = nil then Exit;
  if ENLineCableObj.element.code = LOW_INT then Exit;

  TempENDocAttachment := HTTPRIOENDocAttachment as ENDocAttachmentControllerSoapPort;

  docAttachmentFilter := ENDocAttachmentFilter.Create;
  SetNullIntProps(docAttachmentFilter);
  SetNullXSProps(docAttachmentFilter);

  docAttachmentFilter.status := ENDocAttachmentStatusRef.Create;
  docAttachmentFilter.status.code := ENDOCATTACHMENTSTATUS_ACTIVE;

  docAttachmentFilter.conditionSQL := ' code in (select endocattachment2enlmnt.docattachmentrefcode '+
    ' from endocattachment2enlmnt where endocattachment2enlmnt.elementrefcode = ' + IntToStr(ENLineCableObj.element.code) + ')';

  ENDocAttachmentList := TempENDocAttachment.getScrollableFilteredList(docAttachmentFilter, 0, -1);

  attachmentsCount := High(ENDocAttachmentList.list);

  if attachmentsCount > -1 then
    sgENDocAttachment.RowCount := attachmentsCount + 2
  else
    sgENDocAttachment.RowCount := 2;

  with sgENDocAttachment do
    for i := 0 to attachmentsCount do
      begin
        Application.ProcessMessages;
        if ENDocAttachmentList.list[i].code <> Low(Integer) then
          Cells[0,i+1] := IntToStr(ENDocAttachmentList.list[i].code)
        else
          Cells[0,i+1] := '';
        Cells[1,i+1] := ENDocAttachmentList.list[i].commentGen;
        Cells[2,i+1] := ENDocAttachmentList.list[i].fileLink;
        Cells[3,i+1] := ENDocAttachmentList.list[i].userAdd;
        if ENDocAttachmentList.list[i].dateAdd = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := XSDateTimeWithDate2String(ENDocAttachmentList.list[i].dateAdd);
        Cells[5,i+1] := ENDocAttachmentList.list[i].userGen;
        if ENDocAttachmentList.list[i].dateEdit = nil then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := XSDateTimeWithDate2String(ENDocAttachmentList.list[i].dateEdit);

        sgENDocAttachment.RowCount := i + 2;
      end;

  sgENDocAttachment.Row := 1;

end;

procedure TfrmENLineCableEdit.actUpdateExecute(Sender: TObject);
begin
  inherited;
  if (pcENLineCable.ActivePage = tsPlanWorks) then updatePlanWorkGrid();
  if (pcENLineCable.ActivePage = tsActs) then updateActGrid();
end;


procedure TfrmENLineCableEdit.actViewActExecute(Sender: TObject);
var
  TempENAct: ENActControllerSoapPort;
begin
  inherited;
  TempENAct := HTTPRIOENAct as ENActControllerSoapPort;

  frmENActEdit := TfrmENActEdit.Create(Application, dsView);
  try
    try
      frmENActEdit.ENActObj := TempENAct.getObject(StrToInt(sgENAct.Cells[0, sgENAct.Row]));
    except
      on EConvertError do Exit;
    end;

    if frmENActEdit.ShowModal in [mrOk, mrYes ] then
    begin
      updateActGrid();
    end;
  finally
    frmENActEdit.Free;
    frmENActEdit := nil;
  end;
end;


procedure TfrmENLineCableEdit.actViewPlanExecute(Sender: TObject);
var
  TempENPlanWork: ENPlanWorkControllerSoapPort;
  tPlan: ENPlanWork;
  objCode: Integer;
begin
  inherited;
  try
    objCode := StrToInt(sgENPlanWork.Cells[0, sgENPlanWork.row]);
  except
    on EConvertError do Exit;
  end;

  tPlan := DMReports.getPlanByCode(objCode);

  if tPlan = nil then
  begin
    Exit;
  end;

  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;
  selectedRow := sgENPlanWork.Row;
  frmENPlanWorkEdit := TfrmENPlanWorkEdit.Create(Application, dsView);

  try
    try
      frmENPlanWorkEdit.ENPlanWorkObj := TempENPlanWork.getObject(objCode);
    except
      on EConvertError do Exit;
    end;

    frmENPlanWorkEdit.ShowModal;

  finally
    frmENPlanWorkEdit.Free;
    frmENPlanWorkEdit := nil;
  end;
end;


procedure TfrmENLineCableEdit.btnGeographClearClick(Sender: TObject);
begin
   ENLineCableObj.element.geoDepartmentRef.code := LOW_INT;
   edtGeograph.Text := '';
end;

procedure TfrmENLineCableEdit.btnGeographClick(Sender: TObject);
var
   frmENGeographicDepartmentShow: TfrmENGeographicDepartmentShow;
   Filter : ENGeographicDepartmentFilter;
   selected : ENGeographicDepartmentShort;
begin
  Filter := ENGeographicDepartmentFilter.Create;
  SetNullIntProps(Filter);
  SetNullXSProps(Filter);


  frmENGeographicDepartmentShow := TfrmENGeographicDepartmentShow.Create(Application, fmNormal, Filter);
  try
      with frmENGeographicDepartmentShow do
          begin
            DisableActions([ actEdit, actInsert, actDelete ]);
            if ShowModal = mrOk then
            begin
                try
                  selected := ENGeographicDepartmentShort(sgENGeographicDepartment.Objects[0, sgENGeographicDepartment.Row]);
                except
                   on EConvertError do begin  Exit; end;
                end;
                 ENLineCableObj.element.geoDepartmentRef.code := selected.code;
                 edtGeograph.Text := selected.name;
            end;
          end;
   finally
      frmENGeographicDepartmentShow.Free;
   end;
end;

procedure TfrmENLineCableEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var
  TempENLineCable: ENLineCableControllerSoapPort;
  LineCableFilter: ENLineCableFilter;

  LineCableList: ENLineCableShortList;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtName
      ,edtLineLength
      ,edtEPVoltageNominalVoltagenominalName
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENLineCable := HTTPRIOENLineCable as ENLineCableControllerSoapPort;

    if ENLineCableObj.element.renRef <> nil then
    begin
       if ENLineCableObj.element.renRef.code = low(Integer) then
       begin
          Application.MessageBox(PChar('Оберіть підрозділ !'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
          if edtEPRenName.CanFocus then edtEPRenName.SetFocus;
          Action:=caNone;
          Abort;
       end;
    end
    else
    begin
          Application.MessageBox(PChar('Оберіть підрозділ !!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
          if edtEPRenName.CanFocus then edtEPRenName.SetFocus;
          Action:=caNone;
          abort;
    end;

    ///////
    if (edtName.Text <> '') and (edtInvNumber.Text <> '') then
    begin
      LineCableFilter := ENLineCableFilter.Create;
      try
        SetNullIntProps(LineCableFilter);
        SetNullXSProps(LineCableFilter);

        LineCableFilter.invNumber := Trim(edtInvNumber.Text);
        LineCableFilter.name := Trim(edtName.Text);
        if DialogState = dsEdit then
          LineCableFilter.conditionSQL := 'code <> ' + IntToStr(ENLineCableObj.code);

        LineCableList := TempENLineCable.getScrollableFilteredList(LineCableFilter, 0, -1);
        if LineCableList.totalCount > 0 then
        begin
          Application.MessageBox(PChar('Объект с таким именем и инвентарным номером уже существует (код: ' + IntToStr(LineCableList.list[0].code) + ')!'), PChar('Внимание !'), MB_ICONWARNING+MB_OK);
          Action := caNone;
          Exit;
        end;
      finally
        LineCableFilter.Free;
      end;
    end;
    ///////


    if cellCode>0 then

       ENLineCableObj.substationcellrefcode:=cellCode

     else
       ENLineCableObj.substationcellrefcode:=Low(Integer);

     ENLineCableObj.invNumber := edtInvNumber.Text;

     ENLineCableObj.name := edtName.Text; 

     ENLineCableObj.buhName := edtBuhName.Text; 

     if (ENLineCableObj.lineLength = nil ) then
       ENLineCableObj.lineLength := TXSDecimal.Create;
     if edtLineLength.Text <> '' then
       ENLineCableObj.lineLength.decimalString := edtLineLength.Text 
     else
       ENLineCableObj.lineLength := nil;

     if ( edtYearBuild.Text <> '' ) then
       ENLineCableObj.yearBuild := StrToInt(edtYearBuild.Text)
     else
       ENLineCableObj.yearBuild := Low(Integer) ;

     if ( edtYearWorkingStart.Text <> '' ) then
       ENLineCableObj.yearWorkingStart := StrToInt(edtYearWorkingStart.Text)
     else
       ENLineCableObj.yearWorkingStart := Low(Integer) ;

     ENLineCableObj.mainCustomersData := edtMainCustomersData.Text;
     ENLineCableObj.moreData := edtMoreData.Text; 

     if edtlastRepairDate.checked then
     begin 
       if ENLineCableObj.lastRepairDate = nil then
          ENLineCableObj.lastRepairDate := TXSDate.Create;
       ENLineCableObj.lastRepairDate.XSToNative(GetXSDate(edtlastRepairDate.DateTime));
     end
     else
       ENLineCableObj.lastRepairDate := nil;

     ENLineCableObj.cableDescription := edtCableDescription.Text;

     if edtdateGen.checked then
     begin 
       if ENLineCableObj.dateGen = nil then
          ENLineCableObj.dateGen := TXSDate.Create;
       ENLineCableObj.dateGen.XSToNative(GetXSDate(edtdateGen.DateTime));
     end
     else
       ENLineCableObj.dateGen := nil;

    if ENLineCableObj.ownerRef = nil then ENLineCableObj.ownerRef := ENOwnerRef.Create;
    ENLineCableObj.ownerRef.code := cbOwner.ItemIndex;

    if ENLineCableObj.belongingRef = nil then ENLineCableObj.belongingRef := ENBelongingRef.Create;
    ENLineCableObj.belongingRef.code := cbBelonging.ItemIndex;

    if DialogState = dsInsert then
    begin
      ENLineCableObj.code:=low(Integer);
      TempENLineCable.add(ENLineCableObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENLineCable.save(ENLineCableObj);
    end;
  end;
end;


procedure TfrmENLineCableEdit.spbEPVoltageNominalVoltagenominalClick(Sender : TObject);
var 
   frmEPVoltageNominalShow: TfrmEPVoltageNominalShow;
   EPVoltageNominalFilterObj: EPVoltageNominalFilter; 
begin
   EPVoltageNominalFilterObj := EPVoltageNominalFilter.Create;
   SetNullIntProps(EPVoltageNominalFilterObj);
   SetNullXSProps(EPVoltageNominalFilterObj);
   EPVoltageNominalFilterObj.conditionSQL := ' code in (5,6,9,3)';

   frmEPVoltageNominalShow:=TfrmEPVoltageNominalShow.Create(Application, fmNormal, EPVoltageNominalFilterObj);
   try
      with frmEPVoltageNominalShow do
        if ShowModal = mrOk then
        begin
            try
               if ENLineCableObj.voltagenominal = nil then ENLineCableObj.voltagenominal := EPVoltageNominal.Create();
               ENLineCableObj.voltagenominal.code := StrToInt(GetReturnValue(sgMain,0));
               edtEPVoltageNominalVoltagenominalName.Text:=GetReturnValue(sgMain,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmEPVoltageNominalShow.Free;
   end;
end;



procedure TfrmENLineCableEdit.spbFINExecutorClick(Sender: TObject);
var
   frmFINExecutorTreeShow: TfrmFINExecutorTreeShow;
begin
   frmFINExecutorTreeShow:=TfrmFINExecutorTreeShow.Create(Application,fmNormal);
   try
      with frmFINExecutorTreeShow do begin
        DisableActions([ actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try

               ENLineCableObj.element.finExecutor :=
                 DMReports.finExecutorShort2finExecutor(FINExecutorShort(tvDep.Selected.Data),
                                                        DMReports.getFullExecutorName(tvDep.Selected));

               edtFINExecutorName.Text := ENLineCableObj.element.finExecutor.name;
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmFINExecutorTreeShow.Free;
   end;
end;

procedure TfrmENLineCableEdit.sb150cellClick(Sender: TObject);
var
   frmENSubst150CellShow: TfrmENSubst150CellShow;
begin
   frmENSubst150CellShow:=TfrmENSubst150CellShow.Create(Application,fmNormal);
   try
      with frmENSubst150CellShow do
        if ShowModal = mrOk then
        begin
            try
               cellCode:=StrToInt(frmENSubst150CellShow.GetReturnValue(sgENSubst150Cell,0));
               edtSubst150Cell.Text := frmENSubst150CellShow.GetReturnValue(sgENSubst150Cell,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENSubst150CellShow.Free;
   end;

end;


procedure TfrmENLineCableEdit.sgCCDamageLogDblClick(Sender: TObject);
Var
   TempCCDamageLog: CCDamageLogControllerSoapPort;
begin
   TempCCDamageLog := HTTPRIOCCDamageLog as CCDamageLogControllerSoapPort;

   frmCCDamageLogEdit:=TfrmCCDamageLogEdit.Create(Application, dsView);
   try
     frmCCDamageLogEdit.CCDamageLogObj := TempCCDamageLog.getObject(StrToInt(sgCCDamageLog.Cells[0,sgCCDamageLog.Row]));
   except
   on EConvertError do Exit;
   end;
   try
     frmCCDamageLogEdit.ShowModal;
   finally
     frmCCDamageLogEdit.Free;
     frmCCDamageLogEdit:=nil;
   end;
end;

procedure TfrmENLineCableEdit.sgCCElementDataDblClick(Sender: TObject);
var
  TempCCElementData: CCElementDataControllerSoapPort;
begin
  TempCCElementData := HTTPRIOCCElementData as CCElementDataControllerSoapPort;
  try
    CCElementDataObj := TempCCElementData.getObject(StrToInt(sgCCElementData.Cells[0,sgCCElementData.Row]));
  except
    on EConvertError do Exit;
  end;

  frmCCElementDataEdit:=TfrmCCElementDataEdit.Create(Application, dsView);

  try
    frmCCElementDataEdit.ShowModal;
  finally
    frmCCElementDataEdit.Free;
    frmCCElementDataEdit:=nil;
  end;
end;

procedure TfrmENLineCableEdit.sgENActDblClick(Sender: TObject);
begin
  inherited;
  actViewActExecute(Sender);
end;


procedure TfrmENLineCableEdit.sgENPlanWorkDblClick(Sender: TObject);
begin
  inherited;
  actViewPlanExecute(Sender);
end;


procedure TfrmENLineCableEdit.spbENElementElementClick(Sender : TObject);
var 
   frmENElementShow: TfrmENElementShow;
begin
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENLineCableObj.element = nil then ENLineCableObj.element := ENElement.Create();
               ENLineCableObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
               edtENElementElementName.Text:=GetReturnValue(sgENElement,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENElementShow.Free;
   end;
end;



procedure TfrmENLineCableEdit.spbOSSelectClick(Sender: TObject);
var
frmOSTableShow: TfrmOSTableShow;
f : OStableFilter;
begin

     f := OStableFilter.Create;
     SetNullIntProps(f);
     SetNullXSProps(f);
          // инвентарные ЛИНИЙ могут быть взяты с Подстанций (код обор 11).. СКадовск - 006089 !!!
     f.conditionSQL := ' OSTABLE.KOD_VID in (3,11) '; // Линии как передающие утр-ва

     if length(edtInvNumber.Text) > 0 then
       f.kod_inv := '*' + edtInvNumber.Text + '*';

     f.orderBySQL :=  'OSTABLE.STR_NAME';

   frmOSTableShow:=TfrmOSTableShow.Create(Application,fmNormal,f);
   //frmOSTableShow.SendType := 444; /// для энерго ....
   try
      with frmOSTableShow do
        if ShowModal = mrOk then
        begin
            try
               //TKElementToFinCollectionObj.fincode := StrToInt(GetReturnValue(sgOSTable,0));
               edtInvNumber.Text :=  GetReturnValue(sgOSTable,2);
               edtBuhName.Text := GetReturnValue(sgOSTable,1);

               DisableControls([edtInvNumber, edtBuhName]);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmOSTableShow.Free;
   end;
end;

procedure TfrmENLineCableEdit.tbiDamagesXLSClick(Sender: TObject);
Var
  request: CCReportRequestEx;
  argNames, args: CCReportController.ArrayOfString;
  reportType : String;
begin

    if (ENLineCableObj.element=nil) or (ENLineCableObj.element.code=Low(Integer)) then
    begin
       Exit;
    end;

    request := CCReportRequestEx.Create;

    SetLength(argNames,2);
    SetLength(args,2);
    request.reportCode := 0;
    argNames[0] := 'nodeCode';
    args[0] := '-1';
    argNames[1] := 'elementCode';
    args[1] := IntToStr(ENLineCableObj.element.code);

    request.argNames:=argNames;
    request.args:=args;
    request.resultType:=Low(Integer);

    request.funcName := '/com/ksoe/callcenter/reports/Dispetcher/ByNode_Damages_T32.jasper';
    reportType := 'xls';

    CCDMReport.makeGeneralReportPDF('RequestLog', request, reportType);
end;

procedure TfrmENLineCableEdit.spbEPRenClick(Sender: TObject);
var 
   frmEPRenShow: TfrmENEPRenShow;
begin
   frmEPRenShow:=TfrmENEPRenShow.Create(Application,fmNormal);
   try
      with frmEPRenShow do
        if ShowModal = mrOk then
        begin
            try
               if ENLineCableObj.element.renRef = nil then ENLineCableObj.element.renRef := EPRenRef.Create();
               ENLineCableObj.element.renRef.code := StrToInt(GetReturnValue(sgEPRen,0));
               edtEPRenName.Text:=GetReturnValue(sgEPRen,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmEPRenShow.Free;
   end;
end;


procedure TfrmENLineCableEdit.updatePlanWorkGrid();
var
  TempENPlanWork: ENPlanWorkControllerSoapPort;
  i, n: Integer;
  ENPlanWorkList: ENPlanWorkShortList;
  pwFilterObject: ENPlanWorkFilter;
begin
  SetGridHeaders(ENPlanWorkHeaders, sgENPlanWork.ColumnHeaders);
  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

  if pwFilterObject = nil then
  begin
    pwFilterObject := ENPlanWorkFilter.Create;
    SetNullIntProps(pwFilterObject);
    SetNullXSProps(pwFilterObject);
    ENPlanWorkFilter(pwFilterObject).conditionSQL := ' ENPLANWORK.STATUSCODE = ' + IntToStr(ENPLANWORKSTATUS_GOOD)
        + 'AND ENPLANWORK.ELEMENTREFCODE = ' + IntToStr(ENLineCableObj.element.code);
    pwFilterObject.orderBySQL := 'enplanwork.code desc';
  end;

  ENPlanWorkList := TempENPlanWork.getScrollableFilteredList(ENPlanWorkFilter(pwFilterObject), 0, -1);
  try
    pwLastCount := High(ENPlanWorkList.list);
    if pwLastCount > -1 then
      sgENPlanWork.RowCount := pwLastCount + 2
    else
      sgENPlanWork.RowCount := 2;
    with sgENPlanWork do
      for i := 0 to pwLastCount do
        begin
          Application.ProcessMessages;
          n := 0;
          if ENPlanWorkList.list[i].code <> Low(Integer) then
            Cells[n, i + 1] := IntToStr(ENPlanWorkList.list[i].code)
          else
            Cells[n, i + 1] := '';
          inc(n);
          Cells[n, i + 1] := ENPlanWorkList.list[i].objectName;
          inc(n);
          Cells[n, i + 1] := ENPlanWorkList.list[i].invNumber;
          inc(n);
          Cells[n, i + 1] := ENPlanWorkList.list[i].renRefName;
          inc(n);
          if ENPlanWorkList.list[i].yearGen <> Low(Integer) then
            Cells[n, i + 1] := IntToStr(ENPlanWorkList.list[i].yearGen)
          else
            Cells[n, i + 1] := '';
          inc(n);
          if ENPlanWorkList.list[i].monthGen <> Low(Integer) then
            Cells[n, i + 1] :=
              MonthesNames[ENPlanWorkList.list[i].monthGen]
          else
            Cells[n, i + 1] := '';
          inc(n);
          if ENPlanWorkList.list[i].dateStart = nil then
            Cells[n, i + 1] := ''
          else
            Cells[n, i + 1] :=
              XSDate2String(ENPlanWorkList.list[i].dateStart);
          inc(n);
          Cells[n, i + 1] := ENPlanWorkList.list[i].typeRefName;
          inc(n);
          Cells[n, i + 1] := ENPlanWorkList.list[i].stateRefShortName;
          inc(n);
          Cells[n, i + 1] := ENPlanWorkList.list[i].kindName ;
          inc(n);
          Cells[n, i + 1] := ENPlanWorkList.list[i].statusName;
          inc(n);
          Cells[n, i + 1] := ENPlanWorkList.list[i].departmentRefShortName;
          inc(n);
          Cells[n, i + 1] := ENPlanWorkList.list[i].budgetRefShortName;
          inc(n);
          Cells[n, i + 1] :=
            ENPlanWorkList.list[i].responsibilityRefShortName;
          inc(n);
          Cells[n, i + 1] := '';
          if ENPlanWorkList.list[i].yearOriginal > 0 then
            begin
              if ENPlanWorkList.list[i].monthOriginal > 0 then
                Cells[n, i + 1] :=
                  MonthesNames[ENPlanWorkList.list[i].monthOriginal] + ' '
                  + IntToStr(ENPlanWorkList.list[i].yearOriginal);
            end
          else
            Cells[n, i + 1] := '';
          inc(n);
          Cells[n, i + 1] := ENPlanWorkList.list[i].workOrderNumber;
          inc(n);
          Cells[n, i + 1] := ENPlanWorkList.list[i].userGen;
          inc(n);
          if ENPlanWorkList.list[i].dateEdit = nil then
            Cells[n, i + 1] := ''
          else
            Cells[n, i + 1] :=
              XSDate2String(ENPlanWorkList.list[i].dateEdit);
          inc(n);
          pwLastRow := i + 1;
          sgENPlanWork.RowCount := pwLastRow + 1;
        end;
     pwColCount := pwColCount + 1;
     sgENPlanWork.Row := 1;
  finally
    ENPlanWorkList.Free;
    pwFilterObject.Free;
    pwFilterObject := nil;
  end;
end;


procedure TfrmENLineCableEdit.updateActGrid();
var
  i: Integer;
  TempENAct: ENActControllerSoapPort;
  ENActList: ENActShortList;
  actFilterObject: ENActFilter;
begin
  SetGridHeaders(ENActHeaders, sgENAct.ColumnHeaders);
  TempENAct := HTTPRIOENAct as ENActControllerSoapPort;

  if actFilterObject = nil then
  begin
    actFilterObject := ENActFilter.Create;
    SetNullIntProps(actFilterObject);
    SetNullXSProps(actFilterObject);
    ENActFilter(actFilterObject).conditionSQL := ' ENACT.STATUSREFCODE <> ' + IntToStr(ENACT_CANCELED)
        + 'AND ENACT.ELEMENTCODE = ' + IntToStr(ENLineCableObj.element.code);
    actFilterObject.orderBySQL := 'enact.code desc';
  end;

  ENActList := TempENAct.getScrollableFilteredList(ENActFilter(actFilterObject), 0, -1);

  try
    actLastCount := High(ENActList.list);
    if actLastCount > -1 then
       sgENAct.RowCount := actLastCount + 2
    else
       sgENAct.RowCount := 2;
    with sgENAct do
      for i := 0 to actLastCount do
        begin
          Application.ProcessMessages;
          if ENActList.list[i].code <> Low(Integer) then
            Cells[0,i + 1] := IntToStr(ENActList.list[i].code)
          else
            Cells[0, i + 1] := '';
          Cells[1, i + 1] := ENActList.list[i].numberGen;
          if ENActList.list[i].dateGen = nil then
            Cells[2, i + 1] := ''
          else
            Cells[2, i + 1] := XSDate2String(ENActList.list[i].dateGen);

          if ENActList.list[i].dateAct = nil then
            Cells[3, i + 1] := ''
          else
            Cells[3, i + 1] := XSDate2String(ENActList.list[i].dateAct);

          Cells[4, i + 1] :=  ENActList.list[i].finMolCode + ' / ' +
            ENActList.list[i].finMolName;

          Cells[5, i + 1] := ENActList.list[i].actTypeRefName;
          Cells[6, i + 1] := ENActList.list[i].statusRefName;
          Cells[7, i + 1] := ENActList.list[i].userGen;
          Cells[8, i + 1] := XSDate2String(ENActList.list[i].dateGen);

          actLastRow := i + 1;
          sgENAct.RowCount := actLastRow + 1;
        end;
     actColCount := actColCount + 1;
     sgENAct.Row:=1;
  finally
    ENActList.Free;
    actFilterObject.Free;
    actFilterObject := nil;
  end;
end;

procedure TfrmENLineCableEdit.LoadCCElement();
var
  i, j: Integer;
  TempCCElementData: CCElementDataControllerSoapPort;
  ccElementList: CCElementDataShortList;
  ccElementFilter: CCElementDataFilter;
  LastCount: Integer;
  selectedRow: Integer;
begin
  selectedRow:=sgCCElementData.Row;

  for i:=1 to sgCCElementData.RowCount-1 do
  for j:=0 to sgCCElementData.ColCount-1 do
  begin
     sgCCElementData.Cells[j,i]:='';
     if sgCCElementData.CellControls[j,i]<>nil then sgCCElementData.CellControls[j,i].Destroy;
  end;

  if (ENLineCableObj.element=nil) or (ENLineCableObj.element.code=Low(Integer)) then Exit;

  TempCCElementData :=  HTTPRIOCCElementData as CCElementDataControllerSoapPort;

  {ENVOLTAGECLASS_150 = 1;
  ENVOLTAGECLASS_35  = 2;
  ENVOLTAGECLASS_10  = 3;
  ENVOLTAGECLASS_6   = 4;}

  ccElementFilter := CCElementDataFilter.Create;
  SetNullIntProps(ccElementFilter);
  SetNullXSProps(ccElementFilter);
  ccElementFilter.elementCode:=ENLineCableObj.element.code;
  ccElementFilter.orderBySQL:='name';

  ccElementList := TempCCElementData.getScrollableFilteredList(ccElementFilter,0,100);
  LastCount:=High(ccElementList.list);

  if LastCount > -1 then
     sgCCElementData.RowCount:=LastCount+2
  else
     sgCCElementData.RowCount:=2;

   with sgCCElementData do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ccElementList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ccElementList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ccElementList.list[i].name;
        Cells[2,i+1] := ccElementList.list[i].res;
        Cells[3,i+1] := ccElementList.list[i].nodetypeName;
        Cells[4,i+1] := ccElementList.list[i].uid;

        CellControls[5,i+1] := TButton.Create(sgCCElementData);
        TButton(CellControls[5,i+1]).Parent := sgCCElementData;
        TButton(CellControls[5,i+1]).Tag := i+1;
        TButton(CellControls[5,i+1]).OnClick := OpenSLAMO;
        TButton(CellControls[5,i+1]).Caption := 'Открыть';
      end;

    sgCCElementData.Row:=1;

    if selectedRow <> 0 then
    begin
    if sgCCElementData.RowCount > selectedRow then
      sgCCElementData.Row := selectedRow
    else
      sgCCElementData.Row := sgCCElementData.RowCount - 1;
    end
    else
      sgCCElementData.Row:=1;
end;

procedure TfrmENLineCableEdit.LoadCCDamageLog();
var
  TempCCDamageLog: CCDamageLogControllerSoapPort;
  damFilter: CCDamageLogFilter;
  damList: CCDamageLogShortList;
  i,j: Integer;
  selectedRow: Integer;
begin
  selectedRow:=sgCCDamageLog.Row;

  for i:=1 to sgCCDamageLog.RowCount-1 do
  for j:=0 to sgCCDamageLog.ColCount-1 do
  begin
     sgCCDamageLog.Cells[j,i]:='';
     sgCCDamageLog.Colors[j,i]:=clNone;
     sgCCDamageLog.FontColors[j,i]:=clWindowText;
  end;

  if (ENLineCableObj.element=nil) or (ENLineCableObj.element.code=Low(Integer)) then Exit;

  TempCCDamageLog :=  HTTPRIOCCDamageLog as CCDamageLogControllerSoapPort;

  damFilter := CCDamageLogFilter.Create;
  SetNullIntProps(damFilter);
  SetNullXSProps(damFilter);
  damFilter.conditionSQL:=
      ' CCDamageLog.statuscode in (0,1,2,3,6,10,11) '+
      ' and CCDamageLog.subtyperefcode=32 '+
      ' and CCDamageLog.departmentrefcode=0 '+
      ' and ('+
      '   CCDamageLog.nodecode in (select n2e.nodecode from ccnode2enelement n2e where n2e.elementcode='+IntToStr(ENLineCableObj.element.code)+')'+
      '   or '+
      '   CCDamageLog.nodecode in (select g.code from ccnodegroup g where g.parentnormalcode in '+
      '     (select n2e.nodecode from ccnode2enelement n2e where n2e.elementcode='+IntToStr(ENLineCableObj.element.code)+'))'+
      ')';
  damFilter.orderBySQL:=
      'CCDamageLog.code desc';

  damList := TempCCDamageLog.getScrollableFilteredList(damFilter,0,100);

  if High(damList.list) > -1 then
     sgCCDamageLog.RowCount:=High(damList.list)+2
  else
     sgCCDamageLog.RowCount:=2;

   with sgCCDamageLog do
    for i:=0 to High(damList.list) do
      begin
        Application.ProcessMessages;
        if damList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(damList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := damList.list[i].kindName;

        if (damList.list[i].kindCode=0) and (damList.list[i].datedamage<>nil) then
          Cells[2,i+1] := XSDateTimeWithDate2String(damList.list[i].datedamage)
        else
        if (damList.list[i].kindCode<>0) and (damList.list[i].datestart<>nil) then
          Cells[2,i+1] := XSDateTimeWithDate2String(damList.list[i].datestart)
        else
        if (damList.list[i].kindCode<>0) and (damList.list[i].datedamage<>nil) then
        begin
          Cells[2,i+1] := XSDateTimeWithDate2String(damList.list[i].datedamage);
        end
        else
          Cells[2,i+1] := '';

        if damList.list[i].dateend <> nil then
          Cells[3,i+1] := XSDateTimeWithDate2String(damList.list[i].dateend)
        else
          Cells[3,i+1] := '';

        Cells[4,i+1] := damList.list[i].nodetxt;
        Cells[5,i+1] := damList.list[i].subtyperefMark;
        Cells[6,i+1] := damList.list[i].statusName;
        Cells[7,i+1] := damList.list[i].reasontxt;

        // Подсветка места отключения
        //Colors[4,i+1] := damageColorByStatus(damList.list[i].statusCode, damList.list[i].urgent);
      end;

    if selectedRow <> 0 then
    begin
    if sgCCDamageLog.RowCount > selectedRow then
      sgCCDamageLog.Row := selectedRow
    else
      sgCCDamageLog.Row := sgCCDamageLog.RowCount - 1;
    end
    else
      sgCCDamageLog.Row:=1;
end;

procedure TfrmENLineCableEdit.OpenSLAMO(Sender: TObject);
var
  TempCCElementData: CCElementDataControllerSoapPort;
  TempCCFeeder: CCFeederControllerSoapPort;
  CCFeederObj: CCFeeder;
begin
  TempCCElementData := HTTPRIOCCElementData as CCElementDataControllerSoapPort;
  TempCCFeeder:=HTTPRIOCCFeeder as CCFeederControllerSoapPort;

  sgCCElementData.Row:=TButton(Sender).Tag;

  try
    CCElementDataObj := TempCCElementData.getObject(StrToInt(sgCCElementData.Cells[0,sgCCElementData.Row]));
  except
    on EConvertError do Exit;
  end;

  CCFeederObj:=TempCCFeeder.getObject(CCElementDataObj.code);

  if CCFeederObj=nil then Exit;

  if StrToFloat(CCFeederObj.voltage.DecimalString)>1 then
  begin
    frmTopologyF10Edit:=TfrmTopologyF10Edit.Create(Application,fmNormal);
    frmTopologyF10Edit.CCFeederObj:=CCFeederObj;
    try
      frmTopologyF10Edit.ShowModal;
    finally
      frmTopologyF10Edit.Free;
      frmTopologyF10Edit:=nil;
    end;
  end
  else
  if StrToFloat(CCFeederObj.voltage.DecimalString)<1 then
  begin
    frmTopologyF04Edit:=TfrmTopologyF04Edit.Create(Application,fmNormal);
    frmTopologyF04Edit.CCFeederObj:=CCFeederobj;
    try
      frmTopologyF04Edit.ShowModal;
    finally
      frmTopologyF04Edit.Free;
      frmTopologyF04Edit:=nil;
    end;
  end;

end;

end.
