unit EditENLine04;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, EnergyproController, EnergyproController2,
    ENLine04Controller, AdvObj, TB2Item, TB2Dock, TB2Toolbar,
    CCElementDataController, CCFeederController, ENObjectsTechnicalStatusController,
    IdFTP, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
    IdExplicitTLSClientServerBase, ShellAPI,
    CCDamageLogController, CCGlobal, CCDMReportUnit, CCReportController;

type
    TfrmENLine04Edit = class(TDialogForm)

    HTTPRIOENLine04: THTTPRIO;
    btnOk: TButton;
    btnCancel: TButton;
    pcLine04: TPageControl;
    tsLine04: TTabSheet;
    lblInvNumber: TLabel;
    lblName: TLabel;
    lblYearBuild: TLabel;
    lblYearWorkingStart: TLabel;
    lblNameProject: TLabel;
    lblMainCustomersData: TLabel;
    lblMoreData: TLabel;
    lblENSubstation04Name: TLabel;
    edtInvNumber: TEdit;
    edtName: TEdit;
    edtYearBuild: TEdit;
    edtYearWorkingStart: TEdit;
    edtENSubstation04Name: TEdit;
    edtMainCustomersData: TMemo;
    edtMoreData: TMemo;
    HTTPRIOENSubstation04: THTTPRIO;
    spbENSubstation04: TSpeedButton;
    edtLastRepairDate: TDateTimePicker;
    lblLastRepairDate: TLabel;
    lblLineLength: TLabel;
    edtLineLength: TEdit;
    edtBuhName: TEdit;
    lblBuhName: TLabel;
    lblOwner: TLabel;
    lblBelonging: TLabel;
    cbOwnerType: TComboBox;
    cbBelongingType: TComboBox;
    lblEPRenName: TLabel;
    edtEPRenName: TEdit;
    spbEPRen: TSpeedButton;
    spbOSSelect: TSpeedButton;
    tsENActL04: TTabSheet;
    tsENPlanWorkL04: TTabSheet;
    HTTPRIOENAct: THTTPRIO;
    HTTPRIOAuth: THTTPRIO;
    HTTPRIOENPlanWorkItem: THTTPRIO;
    HTTPRIOENPlanWork: THTTPRIO;
    HTTPRIOENElement: THTTPRIO;
    HTTPRIOENPlanWorkMoveHistory: THTTPRIO;
    ImageList1: TImageList;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    ActionList1: TActionList;
    actView: TAction;
    actInsert: TAction;
    actDelete: TAction;
    actEdit: TAction;
    actUpdate: TAction;
    actFilter: TAction;
    actNoFilter: TAction;
    ToolBar13: TToolBar;
    ToolButton15: TToolButton;
    ToolButton16: TToolButton;
    ToolButton17: TToolButton;
    ToolButton18: TToolButton;
    sgENAct: TAdvStringGrid;
    ToolBar17: TToolBar;
    ToolButton19: TToolButton;
    ToolButton20: TToolButton;
    ToolButton21: TToolButton;
    ToolButton22: TToolButton;
    sgENPlanWork: TAdvStringGrid;
    edtExtentForest: TEdit;
    lblExtentForest: TLabel;
    tsPost4OKSN: TTabSheet;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    btnEditP4O: TToolButton;
    btnUpdateP4O: TToolButton;
    sgENPost04OKSN: TAdvStringGrid;
    HTTPRIOENPost04OKSN: THTTPRIO;
    actViewP4O: TAction;
    actInsertP4O: TAction;
    actDeleteP4O: TAction;
    actEditP4O: TAction;
    actUpdateP4O: TAction;
    tsENInspectionSheet: TTabSheet;
    tbActions: TTBToolbar;
    TBItem5: TTBItem;
    TBItem6: TTBItem;
    TBItem47: TTBItem;
    TBItem7: TTBItem;
    TBItem46: TTBItem;
    sgENInspectionSheet: TAdvStringGrid;
    HTTPRIOENInspectionSheet: THTTPRIO;
    pmInspectionSheet: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    actSendToSigning: TAction;
    actUnSigning: TAction;
    N5: TMenuItem;
    miSendToSigning: TMenuItem;
    miUnSigning: TMenuItem;
    actSigned: TAction;
    miSigned: TMenuItem;
    actUnSigned: TAction;
    miUnSigned: TMenuItem;
    spbFINExecutor: TSpeedButton;
    edtFINExecutorName: TEdit;
    lblExecuter: TLabel;
    actCopySheet: TAction;
    miCopySheet: TMenuItem;
    tsCCElement: TTabSheet;
    sgCCElementData: TAdvStringGrid;
    HTTPRIOCCElementData: THTTPRIO;
    HTTPRIOCCFeeder: THTTPRIO;
    tsTechnicalStatus: TTabSheet;
    gbMainElements: TGroupBox;
    lblTotalCountWood: TLabel;
    lblDefectCountWood: TLabel;
    lblTotalCountArmored: TLabel;
    lblDefectCountArmored: TLabel;
    lblTotalLengthCable: TLabel;
    lblDefectLengthtCable: TLabel;
    edtTotalCountWood: TEdit;
    edtDefectCountWood: TEdit;
    edtTotalCountArmored: TEdit;
    edtDefectCountArmored: TEdit;
    edtTotalLengthCable: TEdit;
    edtDefectLengthtCable: TEdit;
    lblBaseDistance: TLabel;
    lblMaxFallPower: TLabel;
    edtBaseDistance: TEdit;
    edtMaxFallPower: TEdit;
    lblVKD: TLabel;
    edtVKD: TEdit;
    lblVKDO: TLabel;
    lblVKDP: TLabel;
    edtVKDO: TEdit;
    edtVKDP: TEdit;
    btnEvaluateTechnicalStatus: TButton;
    btnPrint: TButton;
    HTTPRIOENObjectsTechnicalStatus: THTTPRIO;
    pmENSettings: TPopupMenu;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    alENSettings: TActionList;
    actViewENSettings: TAction;
    actEditENSettings: TAction;
    actUpdateENSettings: TAction;
    imlENSettings: TImageList;
    HTTPRIOENSettings: THTTPRIO;
    gbENSettings: TGroupBox;
    sgENSettings: TAdvStringGrid;
    lblTotalCountBranch: TLabel;
    lblDefectCountBranch: TLabel;
    edtTotalCountBranch: TEdit;
    edtDefectCountBranch: TEdit;
    lblVKDV: TLabel;
    edtVKDV: TEdit;
    lblGeograph: TLabel;
    edtGeograph: TEdit;
    btnGeograph: TSpeedButton;
    btnGeographClear: TSpeedButton;
    HTTPRIOENGeographicDepartment: THTTPRIO;
    tsAttachments: TTabSheet;
    ToolBar19: TToolBar;
    btnLoadAttachment: TToolButton;
    btnAddAttachments: TToolButton;
    btnDeleteAttachment: TToolButton;
    btnUpdateAttachments: TToolButton;
    sgENDocAttachment: TAdvStringGrid;
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
    lblLengthToReconstruct: TLabel;
    edtLengthToReconstruct: TEdit;
    tsCCDamageLog: TTabSheet;
    HTTPRIOCCDamageLog: THTTPRIO;
    sgCCDamageLog: TAdvStringGrid;
    spbGetBaseDistance: TSpeedButton;
    tbDamages: TTBToolbar;
    tbiDamagesXLS: TTBItem;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbENSubstation04Click(Sender: TObject);
    procedure spbEPRenClick(Sender: TObject);
    procedure spbOSSelectClick(Sender: TObject);
    procedure pcLine04Change(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
    procedure actUpdateAttachmentsExecute(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
    procedure actNoFilterExecute(Sender: TObject);
    procedure UpdateGrid(Sender: TObject);
    procedure actViewP4OExecute(Sender: TObject);
    procedure actInsertP4OExecute(Sender: TObject);
    procedure actDeleteP4OExecute(Sender: TObject);
    procedure actEditP4OExecute(Sender: TObject);
    procedure actUpdateP4OExecute(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure sgENInspectionSheetDblClick(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actSendToSigningExecute(Sender: TObject);
    procedure actUnSigningExecute(Sender: TObject);
    procedure actSignedExecute(Sender: TObject);
    procedure actUnSignedExecute(Sender: TObject);
    procedure pmInspectionSheetPopup(Sender: TObject);
    procedure sgENInspectionSheetClick(Sender: TObject);
    procedure spbFINExecutorClick(Sender: TObject);
    procedure actCopySheetExecute(Sender: TObject);
    procedure LoadCCElement();
    procedure LoadCCDamageLog();
    procedure OpenSLAMO(Sender: TObject);
    procedure sgCCElementDataDblClick(Sender: TObject);
    procedure sgENActDblClick(Sender: TObject);
    procedure actViewENSettingsExecute(Sender: TObject);
    procedure actEditENSettingsExecute(Sender: TObject);
    procedure actUpdateENSettingsExecute(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnEvaluateTechnicalStatusClick(Sender: TObject);
    procedure btnGeographClick(Sender: TObject);
    procedure btnGeographClearClick(Sender: TObject);
    procedure actDeleteAttachmentExecute(Sender: TObject);
    procedure actAddAttachmentExecute(Sender: TObject);
    procedure actLoadAttachmentExecute(Sender: TObject);
    procedure sgCCDamageLogDblClick(Sender: TObject);
    procedure spbGetBaseDistanceClick(Sender: TObject);
    procedure tbiDamagesXLSClick(Sender: TObject);
  private
    { Private declarations }
    procedure UpdateGridAct(Sender: TObject);
    procedure UpdateGridPW(Sender: TObject);
    procedure updateP4O;
    procedure LoadTechnicalStatus(Sender: TObject);
    procedure updateAttachments();            //Обновление списка вложений
    procedure getBaseDistance();
  public
    { Public declarations }

end;

var
  frmENLine04Edit: TfrmENLine04Edit;
  ENLine04Obj: ENLine04;
  ENObjectsTechnicalStatusObj: ENObjectsTechnicalStatus;

implementation

uses
  ShowEPWorker, ShowENElement, ENElementController, ShowENSubstation04,
  ENSubstation04Controller, ENBelongingController, ENOwnerController,
  ShowENEPRen, ShowOStable, OSTableController,
  ENPostController, EditENPost,
  ENActController, ENPlanWorkController, ENConsts, EditENAct, EditENActFilter,
  EditENPlanWork, EditENPlanWorkFilter, ShowENPlanWork, DMReportsUnit,
  ENPost04OKSNController, EditENPost04OKSN, ENInspectionSheetController,
  EditENInspectionSheet, ENElementTypeController, AddENInspectionSheet,
  FINExecutorController, ShowFINExecutorTree, EditCCElementData,
  EditCCFeeder, EditTopologyF04, ENSettingsController, EditENSettings,
  ShowENGeographicDepartment, ENGeographicDepartmentController,
  ENDocAttachmentController, EditDFDocAttachment,
  ENDocAttachmentServerController, Globals, ENDocAttachmentStatusController,
  EditCCDamageLog;

{$R *.dfm}

var
  ColCount: Integer;
  LastRow: Integer = 1;

  selectedPWRow, selectedPost4OKSNRow: Integer;
  outerPWCondition: String;
  disableControlsTypePW: TDisableType;
  actFilterObject: ENActFilter;                     //Акты
  actColCount, actLastCount: Integer;
  actLastRow: Integer = 1;
  ENActHeaders: array [1..11] of String =
        ( 'Код'
          ,'Номер акту'
          ,'Дата проведення акту'
          ,'Дата акту'
          ,'Код МОЛ / ПІБ з Фін. Кол.'
          ,'Тип акту'
          ,'Підвид робіт плану'
          ,'Людино-години'
          ,'Статус'
          ,'Зробивший зміни користувач'
          ,'Дата останніх змін'
        );

  pwFilterObject: ENPlanWorkFilter;                 //Планы
  pwColCount, pwLastCount: Integer;
  pwLastRow: Integer = 1;
  ENPlanWorkHeaders: array [1..18] of String =
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
        );

  ColCountP4O, LastCountP4O, LastCount: Integer;
  LastRowP4O: Integer = 1;
  ENPost04OKSNHeaders: array [1..5] of String =
        ( 'Код'
          ,'Номер опори'
          ,'Максимальна кількість проводів підвісу'
          ,'Тип опори'
          ,'Наименование отпайки'
        );

  ENInspectionSheetHeaders: array [1..7] of String =
        ( 'Код'
          ,'Назва'
          ,'Вид огляду'
          ,'Статус'
          ,'Дата складання'
          ,'користувач який змінив запис'
          ,'Дата ост. зміни'
        );

  ENSettingsHeaders: array [1..3] of String =
        ( 'Код'
          ,'Коментар до налаштування'
          , 'Поточне значення'
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



procedure TfrmENLine04Edit.updateP4O;
  var
  TempENPost04OKSN: ENPost04OKSNControllerSoapPort;
  i: Integer;
  ENPost04OKSNList: ENPost04OKSNShortList;
  ENPost04OKSNFil: ENPost04OKSNFilter;
begin

  ClearGrid(sgENPost04OKSN);

  SetGridHeaders(ENPost04OKSNHeaders, sgENPost04OKSN.ColumnHeaders);
  TempENPost04OKSN :=  HTTPRIOENPost04OKSN as ENPost04OKSNControllerSoapPort;

  ENPost04OKSNFil := ENPost04OKSNFilter.Create;
  SetNullIntProps(ENPost04OKSNFil);
  SetNullXSProps(ENPost04OKSNFil);
  ENPost04OKSNFil.line04Ref := ENLine04Ref.Create;
  ENPost04OKSNFil.line04Ref.code := ENLine04Obj.code;

  ENPost04OKSNList := TempENPost04OKSN.getScrollableFilteredList(ENPost04OKSNFil,0,-1);
  LastCountP4O:=High(ENPost04OKSNList.list);

  if LastCountP4O > -1 then
     sgENPost04OKSN.RowCount:=LastCountP4O+2
  else
     sgENPost04OKSN.RowCount:=2;

   with sgENPost04OKSN do
    for i:=0 to LastCountP4O do
      begin
        Application.ProcessMessages;
        if ENPost04OKSNList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENPost04OKSNList.list[i].code)
        else
        Cells[0,i+1] := '';

        AddCheckBox(1,i+1,false, false);

        Cells[1,i+1] := ENPost04OKSNList.list[i].postNumber;
        if ENPost04OKSNList.list[i].numberOfCables = Low(Integer) then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := IntToStr(ENPost04OKSNList.list[i].numberOfCables);

        Cells[3,i+1] := ENPost04OKSNList.list[i].postTtypeName;
        Cells[4,i+1] := ENPost04OKSNList.list[i].branchLineName;

        LastRowP4O:=i+1;
        sgENPost04OKSN.RowCount:=LastRowP4O+1;
      end;

    ColCountP4O:=ColCountP4O+1;
    sgENPost04OKSN.Row:=1;

end;


procedure TfrmENLine04Edit.FormShow(Sender: TObject);
var s04Filter: ENSubstation04Filter;
    s04List: ENSubstation04ShortList;
    TempENSubstation04: ENSubstation04ControllerSoapPort;

    TempENGeographicDepartment: ENGeographicDepartmentControllerSoapPort;
    ENGeographicDepartmentObj : ENGeographicDepartment;
begin

  tsTechnicalStatus.TabVisible := (DialogState <> dsInsert);
  tsENActL04.TabVisible := (DialogState <> dsInsert);
  tsENPlanWorkL04.TabVisible := (DialogState <> dsInsert);
  tsPost4OKSN.TabVisible := (DialogState <> dsInsert);
  tsENInspectionSheet.TabVisible := (DialogState <> dsInsert);
  tsCCElement.TabVisible := (DialogState <> dsInsert);

  btnEvaluateTechnicalStatus.Visible := (DialogState = dsEdit);
  gbENSettings.Enabled := (DialogState = dsEdit);

  DisableActions([actSendToSigning, actUnSigning, actSigned, actUnSigned]);

  FormatSettings.DecimalSeparator := '.';
  SetIntStyle([edtYearBuild, edtYearWorkingStart]);
  SetFloatStyle([edtLineLength]);
  DisableControls([edtBuhName]);

  DisableControls([edtDefectCountArmored, edtDefectCountWood, edtDefectLengthtCable
    , edtVKD, edtVKDO, edtVKDP, edtVKDV, edtMaxFallPower, edtDefectCountBranch]);

  SetFloatStyle([edtTotalLengthCable, edtBaseDistance, edtMaxFallPower, edtLengthToReconstruct]);
  SetIntStyle([edtTotalCountArmored, edtTotalCountWood, edtTotalCountBranch]);

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([edtName, edtLineLength, edtEPRenName
        , edtTotalCountArmored, edtTotalCountWood, edtTotalLengthCable, edtLengthToReconstruct
        , edtBaseDistance, edtTotalCountBranch ]);
  end;

  pcLine04.ActivePage := tsLine04;

  if (DialogState = dsView) then
  begin
    DisableControls([spbFINExecutor, spbENSubstation04, spbEPRen, spbOSSelect]);
    HideControls([spbGetBaseDistance]);
  end;

  if (DialogState = dsInsert) then
  begin
    edtLastRepairDate.Checked := false;
  end;

  if (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    if ENLine04Obj.element.geoDepartmentRef <> nil then
      if ENLine04Obj.element.geoDepartmentRef.code <> LOW_INT then
       begin
          // geodept
            TempENGeographicDepartment := HTTPRIOENGeographicDepartment as ENGeographicDepartmentControllerSoapPort;
          try
            ENGeographicDepartmentObj := TempENGeographicDepartment.getObject( ENLine04Obj.element.geoDepartmentRef.code );
            edtGeograph.Text := ENGeographicDepartmentObj.name;
          except
            on EConvertError do Exit;
          end;
        end;
    LoadTechnicalStatus(Sender);

    DisableControls([spbEPRen, edtEPRenName]);

    edtInvNumber.Text := ENLine04Obj.invNumber;
    edtName.Text := ENLine04Obj.name;
    edtBuhName.Text := ENLine04Obj.buhName;

    if ( ENLine04Obj.lineLength <> nil ) then
       edtLineLength.Text := ENLine04Obj.lineLength.decimalString
    else
       edtLineLength.Text := '';

    if ( ENLine04Obj.extentForest <> nil ) then
       edtExtentForest.Text := ENLine04Obj.extentForest.decimalString
    else
       edtExtentForest.Text := '';


    if ( ENLine04Obj.yearBuild <> Low(Integer) ) then
       edtYearBuild.Text := IntToStr(ENLine04Obj.yearBuild)
    else
       edtYearBuild.Text := '';


    if ( ENLine04Obj.yearWorkingStart <> Low(Integer) ) then
       edtYearWorkingStart.Text := IntToStr(ENLine04Obj.yearWorkingStart)
    else
       edtYearWorkingStart.Text := '';


    edtMainCustomersData.Text := ENLine04Obj.mainCustomersData;
    edtMoreData.Text := ENLine04Obj.moreData;

      if ENLine04Obj.lastRepairDate <> nil then
      begin
        edtLastRepairDate.DateTime:=EncodeDate(ENLine04Obj.lastRepairDate.Year,ENLine04Obj.lastRepairDate.Month,ENLine04Obj.lastRepairDate.Day);
        edtLastRepairDate.checked := true;
      end
      else
      begin
        edtLastRepairDate.DateTime:=SysUtils.Date;
        edtLastRepairDate.checked := false;
      end;


      if ENLine04Obj.ownerRef <> nil then
      begin
          cbOwnerType.ItemIndex := ENLine04Obj.ownerRef.code;
      end;

      if ENLine04Obj.belongingRef <> nil then
      begin
          cbBelongingType.ItemIndex := ENLine04Obj.belongingRef.code;
      end;


    if ENLine04Obj.element <> nil then
       if  ENLine04Obj.element.renRef <> nil then
           edtEPRenName.Text := ENLine04Obj.element.renRef.name
       else
           edtEPRenName.Text := ''
    else
       edtEPRenName.Text := '';


    if ENLine04Obj.element.finExecutor <> nil then
      if ENLine04Obj.element.finExecutor.code > LOW_INT then
      begin
        edtFINExecutorName.Text := ENLine04Obj.element.finExecutor.name;
      end;

    if ENLine04Obj.element.elementInRef.code > Low(Integer) then
    begin
       s04Filter := ENSubstation04Filter.Create;
       try
         SetNullIntProps(s04Filter);
         SetNullXSProps(s04Filter);

         //s04Filter.conditionSQL := '';
         s04Filter.element := ENElement.Create;
         s04Filter.element.code := ENLine04Obj.element.elementInRef.code;

         TempENSubstation04 :=  HTTPRIOENSubstation04 as ENSubstation04ControllerSoapPort;
         s04List := TempENSubstation04.getScrollableFilteredList(s04Filter,0,-1);
         if s04List.totalCount > 0 then
         begin
             edtENSubstation04Name.Text := s04List.list[0].name;
             // Убрать !!! и вернуть DisableControls([edtENSubstation04Name, spbENSubstation04]);
             DisableControls([edtENSubstation04Name]);
         end;
       finally
         s04Filter.Free;
       end;
    end
    else
       edtENSubstation04Name.Text := '';

  end;

  updateP4O;

end;



procedure TfrmENLine04Edit.getBaseDistance;
var
  TempENObjectsTechnicalStatus: ENObjectsTechnicalStatusControllerSoapPort;
begin
  if ENLine04Obj = nil then Exit;
  if ENLine04Obj.element = nil then Exit;
  if ENLine04Obj.element.code = Low(Integer) then Exit;

  TempENObjectsTechnicalStatus := HTTPRIOENObjectsTechnicalStatus as ENObjectsTechnicalStatusControllerSoapPort;
  SetTXSDecimalForTEdit(edtBaseDistance, TempENObjectsTechnicalStatus.getBaseDistanceByElementCode(ENLine04Obj.element.code));
end;

procedure TfrmENLine04Edit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENLine04: ENLine04ControllerSoapPort;
    Line04Filter: ENLine04Filter;
    Line04List: ENLine04ShortList;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtLineLength
      ,edtName
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin

    if ENLine04Obj.element.renRef <> nil then
    begin
       if ENLine04Obj.element.renRef.code = low(Integer) then
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

    TempENLine04 := HTTPRIOENLine04 as ENLine04ControllerSoapPort;

    ///////
    if (edtName.Text <> '') and (edtInvNumber.Text <> '') then
    begin
      Line04Filter := ENLine04Filter.Create;
      try
        SetNullIntProps(Line04Filter);
        SetNullXSProps(Line04Filter);

        Line04Filter.invNumber := Trim(edtInvNumber.Text);
        Line04Filter.name := Trim(edtName.Text);
        if DialogState = dsEdit then
          Line04Filter.conditionSQL := 'code <> ' + IntToStr(ENLine04Obj.code);

        Line04List := TempENLine04.getScrollableFilteredList(Line04Filter, 0, -1);
        if Line04List.totalCount > 0 then
        begin
          Application.MessageBox(PChar('Объект с таким именем и инвентарным номером уже существует (код: ' + IntToStr(Line04List.list[0].code) + ')!'), PChar('Внимание !'), MB_ICONWARNING+MB_OK);
          Action := caNone;
          Exit;
        end;
      finally
        Line04Filter.Free;
      end;
    end;
    ///////

     ENLine04Obj.invNumber := edtInvNumber.Text;
     ENLine04Obj.name := edtName.Text;
     ENLine04Obj.buhName := edtBuhName.Text;

     if (ENLine04Obj.lineLength = nil ) then
       ENLine04Obj.lineLength := TXSDecimal.Create;

     if edtLineLength.Text <> '' then
       ENLine04Obj.lineLength.decimalString := edtLineLength.Text
     else
       ENLine04Obj.lineLength := nil;


     if ( edtYearBuild.Text <> '' ) then
       ENLine04Obj.yearBuild := StrToInt(edtYearBuild.Text)
     else
       ENLine04Obj.yearBuild := Low(Integer) ;


     if ( edtYearWorkingStart.Text <> '' ) then
       ENLine04Obj.yearWorkingStart := StrToInt(edtYearWorkingStart.Text)
     else
       ENLine04Obj.yearWorkingStart := Low(Integer) ;

     ENLine04Obj.mainCustomersData := edtMainCustomersData.Text;
     ENLine04Obj.moreData := edtMoreData.Text;


     if edtLastRepairDate.Checked then
     begin
       if ENLine04Obj.lastRepairDate = nil then
          ENLine04Obj.lastRepairDate := TXSDate.Create;
        ENLine04Obj.lastRepairDate.XSToNative(GetXSDate(edtlastRepairDate.DateTime));
     end
     else
         ENLine04Obj.lastRepairDate := nil;


    if ENLine04Obj.ownerRef = nil then ENLine04Obj.ownerRef := ENOwnerRef.Create;
    ENLine04Obj.ownerRef.code := cbOwnerType.ItemIndex;


    if ENLine04Obj.belongingRef = nil then ENLine04Obj.belongingRef := ENBelongingRef.Create;
    ENLine04Obj.belongingRef.code := cbBelongingType.ItemIndex;

    if (ENLine04Obj.extentForest = nil ) then
      ENLine04Obj.extentForest := TXSDecimal.Create;
    if edtExtentForest.Text <> '' then
      ENLine04Obj.extentForest.decimalString := edtExtentForest.Text
    else
      ENLine04Obj.extentForest := nil;

    if DialogState = dsInsert then
    begin
      ENLine04Obj.code:=low(Integer);
      TempENLine04.add(ENLine04Obj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENLine04.save(ENLine04Obj);
    end;

  end;
end;


procedure TfrmENLine04Edit.spbFINExecutorClick(Sender: TObject);
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

               ENLine04Obj.element.finExecutor :=
                 DMReports.finExecutorShort2finExecutor(FINExecutorShort(tvDep.Selected.Data),
                                                        DMReports.getFullExecutorName(tvDep.Selected));

               edtFINExecutorName.Text := ENLine04Obj.element.finExecutor.name;
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmFINExecutorTreeShow.Free;
   end;
end;


procedure TfrmENLine04Edit.sgCCDamageLogDblClick(Sender: TObject);
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

procedure TfrmENLine04Edit.spbGetBaseDistanceClick(Sender: TObject);
begin
  getBaseDistance;
end;

procedure TfrmENLine04Edit.sgCCElementDataDblClick(Sender: TObject);
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


procedure TfrmENLine04Edit.sgENActDblClick(Sender: TObject);
begin
  inherited;
  actViewExecute(Sender);
end;


procedure TfrmENLine04Edit.sgENInspectionSheetClick(Sender: TObject);
var
  inspectionSheet: ENInspectionSheet;
  TempENInspectionSheet: ENInspectionSheetControllerSoapPort;
begin
  inherited;
  TempENInspectionSheet := HTTPRIOENInspectionSheet as ENInspectionSheetControllerSoapPort;

  try
    inspectionSheet := TempENInspectionSheet.getObject(StrToInt(sgENInspectionSheet.Cells[0,sgENInspectionSheet.Row]));
  except
    on EConvertError do Exit;
  end;

  if inspectionSheet = nil then Exit;
  if inspectionSheet.code = Low(Integer) then Exit;

  actEdit.Enabled := (inspectionSheet.statusRef.code = ENINSPECTIONSHEETSTATUS_DRAFT);
  actDelete.Enabled := (inspectionSheet.statusRef.code = ENINSPECTIONSHEETSTATUS_DRAFT);
end;


procedure TfrmENLine04Edit.sgENInspectionSheetDblClick(Sender: TObject);
begin
  inherited;
  actViewExecute(Sender);
end;


procedure TfrmENLine04Edit.spbENSubstation04Click(Sender : TObject);
var
   frmENSubstation04Show: TfrmENSubstation04Show;
    TempENSubstation04: ENSubstation04ControllerSoapPort;
    ENSb : ENSubstation04;
begin
   frmENSubstation04Show:=TfrmENSubstation04Show.Create(Application,fmNormal);
   try
      with frmENSubstation04Show do
        if ShowModal = mrOk then
        begin
            try
               if ENLine04Obj.element = nil then ENLine04Obj.element := ENElement.Create();
               ENLine04Obj.element.elementInRef := ENElementRef.Create;

               //ENSb := ENSubstation04.Create;
               TempENSubstation04 :=  frmENLine04Edit.HTTPRIOENSubstation04 as ENSubstation04ControllerSoapPort;
               ENSb := TempENSubstation04.getObject(StrToInt(GetReturnValue(sgENSubstation04,0)));

               ENLine04Obj.element.elementInRef.code := ENSb.element.code ;//StrToInt(GetReturnValue(sgENSubstation04,0));
               edtENSubstation04Name.Text:=GetReturnValue(sgENSubstation04,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENSubstation04Show.Free;
   end;
end;



procedure TfrmENLine04Edit.spbEPRenClick(Sender: TObject);
var
   frmEPRenShow: TfrmENEPRenShow;
begin
   frmEPRenShow:=TfrmENEPRenShow.Create(Application,fmNormal);
   try
      with frmEPRenShow do
        if ShowModal = mrOk then
        begin
            try
               if ENLine04Obj.element.renRef = nil then ENLine04Obj.element.renRef := EPRenRef.Create();
               ENLine04Obj.element.renRef.code := StrToInt(GetReturnValue(sgEPRen,0));
               edtEPRenName.Text:=GetReturnValue(sgEPRen,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmEPRenShow.Free;
   end;
end;


procedure TfrmENLine04Edit.spbOSSelectClick(Sender: TObject);
var
frmOSTableShow: TfrmOSTableShow;
f : OStableFilter;
begin

     f := OStableFilter.Create;
     SetNullIntProps(f);
     SetNullXSProps(f);
     // инвентарные ЛИНИЙ могут быть взяты с Подстанций  (код обор 11)... СКадовск 10-ка - 006089 !!!
     f.conditionSQL := ' OSTABLE.KOD_VID in (3, 11) '; // Линии как передающие утр-ва

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

procedure TfrmENLine04Edit.tbiDamagesXLSClick(Sender: TObject);
Var
  request: CCReportRequestEx;
  argNames, args: CCReportController.ArrayOfString;
  reportType : String;
begin

    if (ENLine04Obj.element=nil) or (ENLine04Obj.element.code=Low(Integer)) then
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
    args[1] := IntToStr(ENLine04Obj.element.code);

    request.argNames:=argNames;
    request.args:=args;
    request.resultType:=Low(Integer);

    request.funcName := '/com/ksoe/callcenter/reports/Dispetcher/ByNode_Damages_T32.jasper';
    reportType := 'xls';

    CCDMReport.makeGeneralReportPDF('RequestLog', request, reportType);
end;

procedure TfrmENLine04Edit.pcLine04Change(Sender: TObject);
var i, n: Integer;
  TempENAct: ENActControllerSoapPort;                 //Акты
  ENActList: ENActShortList;
  TempENPlanWork: ENPlanWorkControllerSoapPort;         //Планы
  ENPlanWorkList: ENPlanWorkShortList;
  TempENInspectionSheet: ENInspectionSheetControllerSoapPort;
  ENInspectionSheetList: ENInspectionSheetShortList;
  inspectionSheetFilter: ENInspectionSheetFilter;
begin
  if pcLine04.ActivePage = tsENActL04 then
    begin //Виконані роботи
      SetGridHeaders(ENActHeaders, sgENAct.ColumnHeaders);
      actColCount := 100;
      TempENAct :=  HTTPRIOENAct as ENActControllerSoapPort;

      if actFilterObject = nil then
        begin
           actFilterObject := ENActFilter.Create;
           SetNullIntProps(actFilterObject);
           SetNullXSProps(actFilterObject);
           ENActFilter(actFilterObject).conditionSQL :=
             'ENACT.STATUSREFCODE <> ' + IntToStr(ENACT_CANCELED)
             + 'AND ENACT.ELEMENTCODE = '
             + IntToStr(ENLine04Obj.element.code);

           ENActFilter(actFilterObject).orderBySQL := '1 desc';
        end;
      ENActList := TempENAct.getScrollableFilteredList(
        ENActFilter(actFilterObject), 0, actColCount);
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
              Cells[6, i + 1] := ENActList.list[i].planWorkTypeName;

              if ENActList.list[i].humanHours = nil then
                Cells[7, i + 1] := ''
              else
                Cells[7, i + 1] := ENActList.list[i].humanHours.DecimalString;

              Cells[8, i + 1] := ENActList.list[i].statusRefName;
              Cells[9, i + 1] := ENActList.list[i].userGen;
              Cells[10, i + 1] := XSDate2String(ENActList.list[i].dateGen);

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
    end //else if pcLine04.ActivePage = tsENActL04 then
  else if pcLine04.ActivePage = tsENPlanWorkL04 then
    begin //Роботи, що виконуються
      SetGridHeaders(ENPlanWorkHeaders, sgENPlanWork.ColumnHeaders);
      pwColCount := 100;
      TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;
      if pwFilterObject = nil then
        begin
           pwFilterObject := ENPlanWorkFilter.Create;
           SetNullIntProps(pwFilterObject);
           SetNullXSProps(pwFilterObject);
           ENPlanWorkFilter(pwFilterObject).conditionSQL :=
             ' ENPLANWORK.STATUSCODE = ' + IntToStr(ENPLANWORKSTATUS_GOOD)
             + ' AND ENPLANWORK.KINDCODE <> '
             + IntToStr(ENPLANWORKKIND_CALCULATION_SINGLE)
             + 'AND ENPLANWORK.ELEMENTREFCODE = '
             + IntToStr(ENLine04Obj.element.code);
           //isPWFiltered := False;
        end;
      (*if not isPWFiltered then
        begin
         //isPWFiltered := true;
         actFilterPlanWorkExecute(Sender);
         Exit;
        end;*)
      ENPlanWorkList := TempENPlanWork.getScrollableFilteredList(
        ENPlanWorkFilter(pwFilterObject), 0, pwColCount);
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
    end
     else if pcLine04.ActivePage = tsPost4OKSN then
     updateP4O;

  // ENInspectionSheet
  if pcLine04.ActivePage = tsENInspectionSheet then
  begin
    SetGridHeaders(ENInspectionSheetHeaders, sgENInspectionSheet.ColumnHeaders);
    ClearGrid(sgENInspectionSheet);
    TempENInspectionSheet := HTTPRIOENInspectionSheet as ENInspectionSheetControllerSoapPort;

    inspectionSheetFilter := ENInspectionSheetFilter.Create;
    SetNullIntProps(inspectionSheetFilter);
    SetNullXSProps(inspectionSheetFilter);

    inspectionSheetFilter.elementRef := ENElementRef.Create;
    inspectionSheetFilter.elementRef.code := ENLine04Obj.element.code;

    ENInspectionSheetList := TempENInspectionSheet.getScrollableFilteredList(inspectionSheetFilter, 0, -1);
    LastCount:=High(ENInspectionSheetList.list);

    if LastCount > -1 then
       sgENInspectionSheet.RowCount:=LastCount+2
    else
       sgENInspectionSheet.RowCount:=2;

    with sgENInspectionSheet do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENInspectionSheetList.list[i].code <> Low(Integer) then
          Cells[0,i+1] := IntToStr(ENInspectionSheetList.list[i].code)
        else
          Cells[0,i+1] := '';

        Cells[1,i+1] := ENInspectionSheetList.list[i].name;
        Cells[2,i+1] := ENInspectionSheetList.list[i].inspectionKindName;
        Cells[3,i+1] := ENInspectionSheetList.list[i].statusRefName;

        if ENInspectionSheetList.list[i].dateGen = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := XSDate2String(ENInspectionSheetList.list[i].dateGen);

        Cells[5,i+1] := ENInspectionSheetList.list[i].userGen;

        if ENInspectionSheetList.list[i].dateEdit = nil then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := XSDate2String(ENInspectionSheetList.list[i].dateEdit);
      end;

    sgENInspectionSheet.Row:=1;

    sgENInspectionSheetClick(sgENInspectionSheet);
  end;

  if pcLine04.ActivePage = tsCCElement then
    LoadCCElement();

  if pcLine04.ActivePage = tsCCDamageLog then
    LoadCCDamageLog();

  if pcLine04.ActivePage = tsAttachments then
  begin;
    SetGridHeaders(ENDocAttachmentHeaders, sgENDocAttachment.ColumnHeaders);
    ClearGrid(sgENDocAttachment);
    updateAttachments;
  end;

end;


procedure TfrmENLine04Edit.pmInspectionSheetPopup(Sender: TObject);
var
  inspectionSheet: ENInspectionSheet;
  TempENInspectionSheet: ENInspectionSheetControllerSoapPort;
begin
  inherited;
  TempENInspectionSheet := HTTPRIOENInspectionSheet as ENInspectionSheetControllerSoapPort;

  try
    inspectionSheet := TempENInspectionSheet.getObject(StrToInt(sgENInspectionSheet.Cells[0,sgENInspectionSheet.Row]));
  except
    on EConvertError do Exit;
  end;

  if inspectionSheet = nil then Exit;
  if inspectionSheet.code = Low(Integer) then Exit;

  actSendToSigning.Enabled := (inspectionSheet.statusRef.code = ENINSPECTIONSHEETSTATUS_DRAFT);
  actUnSigning.Enabled := (inspectionSheet.statusRef.code = ENINSPECTIONSHEETSTATUS_ON_SIGNATURE);
  actSigned.Enabled := (inspectionSheet.statusRef.code = ENINSPECTIONSHEETSTATUS_ON_SIGNATURE);
  actUnSigned.Enabled := (inspectionSheet.statusRef.code = ENINSPECTIONSHEETSTATUS_SIGNED);

end;


procedure TfrmENLine04Edit.UpdateGridAct(Sender: TObject);
Var i, j: Integer;
begin
 for i := 1 to sgENAct.RowCount - 1 do
   for j := 0 to sgENAct.ColCount - 1 do
     sgENAct.Cells[j, i] := '';
 pcLine04Change(Sender);
end;


procedure TfrmENLine04Edit.UpdateGridPW(Sender: TObject);
var i, j: Integer;
begin
  for i := 1 to sgENPlanWork.RowCount - 1 do
    for j := 0 to sgENPlanWork.ColCount - 1 do
      begin
        sgENPlanWork.Cells[j, i] := '';
        sgENPlanWork.Objects[0, i] := nil;
      end;
  pcLine04Change(Sender);
end;


procedure TfrmENLine04Edit.actViewENSettingsExecute(Sender: TObject);
var
  TempENSettings: ENSettingsControllerSoapPort;
begin
  inherited;
  TempENSettings := HTTPRIOENSettings as ENSettingsControllerSoapPort;
  try
    ENSettingsObj := TempENSettings.getObject(StrToInt(sgENSettings.Cells[0,sgENSettings.Row]));
  except
    on EConvertError do Exit;
  end;

  frmENSettingsEdit := TfrmENSettingsEdit.Create(Application, dsView);

  try
    frmENSettingsEdit.ShowModal;
  finally
    frmENSettingsEdit.Free;
    frmENSettingsEdit:=nil;
  end;
end;


procedure TfrmENLine04Edit.actViewExecute(Sender: TObject);
var TempENAct: ENActControllerSoapPort;                   //Акти
  TempENPlanWork: ENPlanWorkControllerSoapPort;           //Плани
  tPlan: ENPlanWork; objCode : Integer;
  TempENInspectionSheet: ENInspectionSheetControllerSoapPort;
begin
  if pcLine04.ActivePage = tsENActL04 then
    begin //Виконані роботи
      TempENAct := HTTPRIOENAct as ENActControllerSoapPort;

      frmENActEdit := TfrmENActEdit.Create(Application, dsView);
      try
        try
          frmENActEdit.ENActObj :=
            TempENAct.getObject(StrToInt(sgENAct.Cells[0, sgENAct.Row]));
        except
          on EConvertError do Exit;
        end;

        if frmENActEdit.ShowModal in [mrOk, mrYes ] then
          begin
            UpdateGridAct(Sender);
          end;
      finally
        frmENActEdit.Free;
        frmENActEdit := nil;
      end;
    end //else if pcLine04.ActivePage = tsENActL04 then
  else if pcLine04.ActivePage = tsENPlanWorkL04 then
    begin //Роботи, що виконуються
      try
        objCode := StrToInt(sgENPlanWork.Cells[0, sgENPlanWork.Row]);
      except
        on EConvertError do Exit;
      end;
      tPlan := DMReports.getPlanByCode(objCode);
      if tPlan = nil then
        Exit;
      TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;
      selectedPWRow := sgENPlanWork.Row;
      frmENPlanWorkEdit := TfrmENPlanWorkEdit.Create(Application, dsView);
      if (tPlan.typeRef.code = ENPLANWORKTYPE_TRANSPORT)
      and (tPlan.stateRef.code = ENPLANWORKSTATE_GSM) then
        frmENPlanWorkEdit.isTransport := True;
      if (tPlan.typeRef.code = ENPLANWORKTYPE_SIZ) then
        frmENPlanWorkEdit.isSiz := True;
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
    end; //else if pcLine04.ActivePage = tsENPlanWorkL04 then

  if pcLine04.ActivePage = tsENInspectionSheet then
  begin
    TempENInspectionSheet := HTTPRIOENInspectionSheet as ENInspectionSheetControllerSoapPort;
    frmENInspectionSheetEdit := TfrmENInspectionSheetEdit.Create(Application, dsView);

    try
      frmENInspectionSheetEdit.ENInspectionSheetObj := TempENInspectionSheet.getObject(StrToInt(sgENInspectionSheet.Cells[0,sgENInspectionSheet.Row]));
    except
      on EConvertError do Exit;
    end;

    try
      if frmENInspectionSheetEdit.ShowModal= mrOk then
      begin
        pcLine04Change(Sender);
      end;
    finally
      frmENInspectionSheetEdit.Free;
      frmENInspectionSheetEdit:=nil;
    end;
  end;
end;


procedure TfrmENLine04Edit.actViewP4OExecute(Sender: TObject);
var
  TempENPost04OKSN: ENPost04OKSNControllerSoapPort;
begin
  TempENPost04OKSN := HTTPRIOENPost04OKSN as ENPost04OKSNControllerSoapPort;
  try
    ENPost04OKSNObj := TempENPost04OKSN.getObject(StrToInt(sgENPost04OKSN.Cells[0,sgENPost04OKSN.Row]));
  except
    on EConvertError do Exit;
  end;

  selectedPost4OKSNRow := sgENPost04OKSN.Row;
  frmENPost04OKSNEdit:=TfrmENPost04OKSNEdit.Create(Application, dsView);

  try
    frmENPost04OKSNEdit.ShowModal;
  finally
    frmENPost04OKSNEdit.Free;
    frmENPost04OKSNEdit:=nil;
  end;

  if sgENPost04OKSN.RowCount > selectedPost4OKSNRow then
    sgENPost04OKSN.Row := selectedPost4OKSNRow
  else
    sgENPost04OKSN.Row := sgENPost04OKSN.RowCount - 1;

end;


procedure TfrmENLine04Edit.btnEvaluateTechnicalStatusClick(Sender: TObject);
var
  TempENObjectsTechnicalStatus: ENObjectsTechnicalStatusControllerSoapPort;
begin
  inherited;
  if ENLine04Obj = nil then Exit;
  if ENLine04Obj.code = Low(Integer) then Exit;

  if (DialogState = dsEdit) or (DialogState = dsInsert) then
  if not NoBlankValues([ edtTotalCountArmored, edtTotalCountWood, edtTotalLengthCable,
          edtTotalCountBranch, edtLengthToReconstruct, edtBaseDistance ]) then
  begin
    Application.MessageBox(PChar('Порожні поля неприпустимі!'), PChar('Увага!'), MB_ICONWARNING + MB_OK);
    Exit;
  end
  else
  begin

    if ( edtTotalCountArmored.Text <> '' ) then
      ENObjectsTechnicalStatusObj.totalCountArmored := StrToInt(edtTotalCountArmored.Text)
    else
      ENObjectsTechnicalStatusObj.totalCountArmored := Low(Integer);

    if ( edtTotalCountWood.Text <> '' ) then
      ENObjectsTechnicalStatusObj.totalCountWood := StrToInt(edtTotalCountWood.Text)
    else
      ENObjectsTechnicalStatusObj.totalCountWood := Low(Integer);

    ENObjectsTechnicalStatusObj.totalLengthCable := GetTXSDecimalFromTEdit(edtTotalLengthCable);

    if ( edtTotalCountBranch.Text <> '' ) then
      ENObjectsTechnicalStatusObj.totalCountBranch := StrToInt(edtTotalCountBranch.Text)
    else
      ENObjectsTechnicalStatusObj.totalCountBranch := Low(Integer);


    ENObjectsTechnicalStatusObj.baseDistance := GetTXSDecimalFromTEdit(edtBaseDistance);

    ENObjectsTechnicalStatusObj.lengthToReconstruct := GetTXSDecimalFromTEdit(edtLengthToReconstruct);

    TempENObjectsTechnicalStatus := HTTPRIOENObjectsTechnicalStatus as ENObjectsTechnicalStatusControllerSoapPort;
    TempENObjectsTechnicalStatus.add(ENObjectsTechnicalStatusObj);
    LoadTechnicalStatus(Sender);
  end;

end;


procedure TfrmENLine04Edit.btnGeographClearClick(Sender: TObject);
begin
  inherited;
   ENLine04Obj.element.geoDepartmentRef.code := LOW_INT;
   edtGeograph.Text := '';
end;

procedure TfrmENLine04Edit.btnGeographClick(Sender: TObject);
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
                 ENLine04Obj.element.geoDepartmentRef.code := selected.code;
                 edtGeograph.Text := selected.name;
            end;
          end;
   finally
      frmENGeographicDepartmentShow.Free;
   end;
end;

procedure TfrmENLine04Edit.btnPrintClick(Sender: TObject);
var
  argNames, args: EnergyProController.ArrayOfString;
  reportName: String;
begin
  inherited;
  if ENLine04Obj.element = nil then Exit;
  if ENLine04Obj.element.code = Low(Integer) then Exit;

  SetLength(argNames, 1);
  SetLength(args, 1);

  argNames[0] := 'elementCode';
  args[0] := IntToStr(ENLine04Obj.element.code);

  reportName := 'TechnicalStatus/technicalStatusLine';
  makeReport(reportName, argNames, args, 'xls');
end;


procedure TfrmENLine04Edit.UpdateGrid(Sender : TObject);
//Var i, j: Integer;
begin
  if pcLine04.ActivePage = tsENActL04 then
    begin //Виконані роботи
      UpdateGridAct(Sender);
    end //else if pcLine10.ActivePage = tsENActL04 then
  else if pcLine04.ActivePage = tsENPlanWorkL04 then
    begin //Роботи, що виконуються
      selectedPWRow := sgENPlanWork.Row;
      UpdateGridPW(Sender);
      if  sgENPlanWork.RowCount > selectedPWRow then
        sgENPlanWork.Row := selectedPWRow
      else
        sgENPlanWork.Row :=  sgENPlanWork.RowCount - 1;
    end; //else if pcLine10.ActivePage = tsENPlanWorkL04 then

  if pcLine04.ActivePage = tsENInspectionSheet then
  begin
    pcLine04Change(Sender);
  end;
end;


procedure TfrmENLine04Edit.actUnSignedExecute(Sender: TObject);
var
  sheetCode: Integer;
  TempENInspectionSheet : ENInspectionSheetControllerSoapPort;
begin
  inherited;
  if pcLine04.ActivePage = tsENInspectionSheet then
  begin
    TempENInspectionSheet := HTTPRIOENInspectionSheet as ENInspectionSheetControllerSoapPort;
    try
      sheetCode := StrToInt(sgENInspectionSheet.Cells[0,sgENInspectionSheet.Row]);
    except
      on EConvertError do Exit;
    end;
    if Application.MessageBox(PChar('Ви дійсно бажаєте відмінити підписання листа огляду?'),
                    PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
    begin
      TempENInspectionSheet.unSigned(sheetCode);
      pcLine04Change(Sender);
    end;
  end;
end;


procedure TfrmENLine04Edit.actUnSigningExecute(Sender: TObject);
var
  sheetCode: Integer;
  TempENInspectionSheet: ENInspectionSheetControllerSoapPort;
begin
  inherited;
  TempENInspectionSheet := HTTPRIOENInspectionSheet as ENInspectionSheetControllerSoapPort;
  try
    sheetCode := StrToInt(sgENInspectionSheet.Cells[0,sgENInspectionSheet.Row]);
  except
    on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Ви дійсно бажаєте перевести лист огляду в статус "чорновий"?'),
                  PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempENInspectionSheet.unSigning(sheetCode);
    pcLine04Change(Sender);
  end;
end;


procedure TfrmENLine04Edit.actUpdateENSettingsExecute(Sender: TObject);
begin
  inherited;
  LoadTechnicalStatus(Sender);
end;


procedure TfrmENLine04Edit.actUpdateAttachmentsExecute(Sender: TObject);
begin
  updateAttachments;
end;


procedure TfrmENLine04Edit.updateAttachments;
var
  TempENDocAttachment: ENDocAttachmentControllerSoapPort;
  ENDocAttachmentList: ENDocAttachmentShortList;
  docAttachmentFilter: ENDocAttachmentFilter;
  i, attachmentsCount: Integer;
begin
  ClearGrid(sgENDocAttachment);

  if DialogState = dsInsert then Exit;
  if ENLine04Obj = nil then Exit;
  if ENLine04Obj.element = nil then Exit;
  if ENLine04Obj.element.code = LOW_INT then Exit;

  TempENDocAttachment := HTTPRIOENDocAttachment as ENDocAttachmentControllerSoapPort;

  docAttachmentFilter := ENDocAttachmentFilter.Create;
  SetNullIntProps(docAttachmentFilter);
  SetNullXSProps(docAttachmentFilter);

  docAttachmentFilter.status := ENDocAttachmentStatusRef.Create;
  docAttachmentFilter.status.code := ENDOCATTACHMENTSTATUS_ACTIVE;

  docAttachmentFilter.conditionSQL := ' code in (select endocattachment2enlmnt.docattachmentrefcode '+
    ' from endocattachment2enlmnt where endocattachment2enlmnt.elementrefcode = ' + IntToStr(ENLine04Obj.element.code) + ')';

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


procedure TfrmENLine04Edit.actUpdateP4OExecute(Sender: TObject);
begin
  updateP4O;
end;


procedure TfrmENLine04Edit.actAddAttachmentExecute(Sender: TObject);
begin
  ENDocAttachmentObj := ENDocAttachment.Create;
  try
    frmDFDocAttachmentEdit := TfrmDFDocAttachmentEdit.Create(Application, dsInsert);
    frmDFDocAttachmentEdit.elementCode := ENLine04Obj.element.code;
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

procedure TfrmENLine04Edit.actCopySheetExecute(Sender: TObject);
var
  TempENInspectionSheet: ENInspectionSheetControllerSoapPort;
  newSheetCode, objCode: Integer;
begin
  inherited;
  TempENInspectionSheet := HTTPRIOENInspectionSheet as ENInspectionSheetControllerSoapPort;
  try
    objCode := StrToInt(sgENInspectionSheet.Cells[0,sgENInspectionSheet.Row]);
  except
    on EConvertError do Exit;
  end;

  if objCode = Low(Integer) then Exit;

  if Application.MessageBox(PChar('Ви дійсно бажаєте копіювати (Лист огляду об`єкта енергетики) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    newSheetCode := TempENInspectionSheet.copySheet(objCode);
    Application.MessageBox(PChar('Лист огляду скопійовано! Код = ' + IntToStr(newSheetCode)), PChar('Повідомлення'), MB_ICONINFORMATION);

    pcLine04Change(Sender);
  end;
end;


procedure TfrmENLine04Edit.actDeleteAttachmentExecute(Sender: TObject);
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

procedure TfrmENLine04Edit.actDeleteExecute(Sender: TObject);
var
  sheetCode: Integer;
  TempENInspectionSheet : ENInspectionSheetControllerSoapPort;
begin
  inherited;
  if pcLine04.ActivePage = tsENInspectionSheet then
  begin
    TempENInspectionSheet := HTTPRIOENInspectionSheet as ENInspectionSheetControllerSoapPort;
    try
      sheetCode := StrToInt(sgENInspectionSheet.Cells[0,sgENInspectionSheet.Row]);
    except
      on EConvertError do Exit;
    end;
    if Application.MessageBox(PChar('Ви дійсно бажаєте видалити (Лист огляду об`єкта енергетики)?'),
                    PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
    begin
      TempENInspectionSheet.remove(sheetCode);
      pcLine04Change(Sender);
    end;
  end;
end;


procedure TfrmENLine04Edit.actDeleteP4OExecute(Sender: TObject);
Var TempENPost04OKSN: ENPost04OKSNControllerSoapPort;
  ObjCode, i: Integer;
  state_: boolean; //isSel : boolean;
begin
 TempENPost04OKSN := HTTPRIOENPost04OKSN as ENPost04OKSNControllerSoapPort;

   if Application.MessageBox(PChar('Вы действительно хотите удалить (Опори для сумісного підвісу ліній 0,4) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
   begin

       for i:=1 to sgENPost04OKSN.RowCount - 1 do
              begin
                 sgENPost04OKSN.GetCheckBoxState(1,i,state_);
                 if state_ then
                 begin

                    try
                      ObjCode := StrToInt(sgENPost04OKSN.Cells[0, i ]);
                    except
                      on EConvertError do Exit;
                    end;
                    TempENPost04OKSN.remove(ObjCode);
                 end;

              end;
              updateP4O;
  end;
end;


procedure TfrmENLine04Edit.actEditENSettingsExecute(Sender: TObject);
var
  TempENSettings: ENSettingsControllerSoapPort;
begin
  inherited;
  TempENSettings := HTTPRIOENSettings as ENSettingsControllerSoapPort;
  try
    ENSettingsObj := TempENSettings.getObject(StrToInt(sgENSettings.Cells[0,sgENSettings.Row]));
  except
    on EConvertError do Exit;
  end;

  frmENSettingsEdit := TfrmENSettingsEdit.Create(Application, dsEdit);
  DisableControls([frmENSettingsEdit.edtKey]);

  try
    if frmENSettingsEdit.ShowModal = mrOk then
      begin
        LoadTechnicalStatus(Sender);
      end;
  finally
    frmENSettingsEdit.Free;
    frmENSettingsEdit:=nil;
  end;
end;


procedure TfrmENLine04Edit.actEditExecute(Sender: TObject);
var
  TempENInspectionSheet: ENInspectionSheetControllerSoapPort;
begin
  inherited;
  if pcLine04.ActivePage = tsENInspectionSheet then
  begin
    TempENInspectionSheet := HTTPRIOENInspectionSheet as ENInspectionSheetControllerSoapPort;
    frmENInspectionSheetEdit := TfrmENInspectionSheetEdit.Create(Application, dsEdit);

    try
      frmENInspectionSheetEdit.ENInspectionSheetObj := TempENInspectionSheet.getObject(StrToInt(sgENInspectionSheet.Cells[0,sgENInspectionSheet.Row]));
    except
      on EConvertError do Exit;
    end;

    try
      if frmENInspectionSheetEdit.ShowModal= mrOk then
      begin
        pcLine04Change(Sender);
      end;
    finally
      frmENInspectionSheetEdit.Free;
      frmENInspectionSheetEdit:=nil;
    end;
  end;
end;


procedure TfrmENLine04Edit.actEditP4OExecute(Sender: TObject);
var
  TempENPost04OKSN: ENPost04OKSNControllerSoapPort;
begin
  TempENPost04OKSN := HTTPRIOENPost04OKSN as ENPost04OKSNControllerSoapPort;
  try
    ENPost04OKSNObj := TempENPost04OKSN.getObject(StrToInt(sgENPost04OKSN.Cells[0,sgENPost04OKSN.Row]));
  except
    on EConvertError do Exit;
  end;

  selectedPost4OKSNRow := sgENPost04OKSN.Row;
  frmENPost04OKSNEdit:=TfrmENPost04OKSNEdit.Create(Application, dsEdit);

  try
    if frmENPost04OKSNEdit.ShowModal= mrOk then
      begin
        //TempENPost04OKSN.save(ENPost04OKSNObj);
        updateP4O;
      end;
  finally
    frmENPost04OKSNEdit.Free;
    frmENPost04OKSNEdit:=nil;
  end;

  if sgENPost04OKSN.RowCount > selectedPost4OKSNRow then
    sgENPost04OKSN.Row := selectedPost4OKSNRow
  else
    sgENPost04OKSN.Row := sgENPost04OKSN.RowCount - 1;

end;

procedure TfrmENLine04Edit.actFilterExecute(Sender: TObject);
var condition: String;
begin
  if pcLine04.ActivePage = tsENActL04 then
    begin //Виконані роботи
      frmENActFilterEdit := TfrmENActFilterEdit.Create(Application, dsInsert);
      try
        ENActFilterObj := ENActFilter.Create;
        SetNullIntProps(ENActFilterObj);
        SetNullXSProps(ENActFilterObj);

        if frmENActFilterEdit.ShowModal = mrOk then
          begin
            if length(ENActFilterObj.conditionSQL) > 0 then
              ENActFilterObj.conditionSQL := ENActFilterObj.conditionSQL
                + ' AND ENACT.STATUSREFCODE <> ' + IntToStr(ENACT_CANCELED)
                + ' AND ENACT.ELEMENTCODE = '
                + IntToStr(ENLine04Obj.element.code)
            else
              ENActFilterObj.conditionSQL :=
                ' ENACT.STATUSREFCODE <> ' + IntToStr(ENACT_CANCELED)
                + ' AND ENACT.ELEMENTCODE = '
                + IntToStr(ENLine04Obj.element.code);
            actFilterObject := ENActFilterObj;
            UpdateGridAct(Sender);
          end;
      finally
        frmENActFilterEdit.Free;
        frmENActFilterEdit := nil;
      end;
    end //else if pcLine04.ActivePage = tsENActL04 then
  else if pcLine04.ActivePage = tsENPlanWorkL04 then
    begin //Роботи, що виконуються
      frmENPlanWorkFilterEdit :=
        TfrmENPlanWorkFilterEdit.Create(Application, dsInsert);
      try
        ENPlanWorkFilterObj := ENPlanWorkFilter.Create;
        SetNullIntProps(ENPlanWorkFilterObj);
        SetNullXSProps(ENPlanWorkFilterObj);
        frmENPlanWorkFilterEdit.disableControlsType := disableControlsTypePW;
        if frmENPlanWorkFilterEdit.ShowModal = mrOk then
          begin
            pwFilterObject := ENPlanWorkFilter.Create;

            outerPWCondition := ' ENPLANWORK.STATUSCODE = '
              + IntToStr(ENPLANWORKSTATUS_GOOD)
              + ' AND ENPLANWORK.KINDCODE <> '
              + IntToStr(ENPLANWORKKIND_CALCULATION_SINGLE)
              + 'AND ENPLANWORK.ELEMENTREFCODE = '
              + IntToStr(ENLine04Obj.element.code);

            if outerPWCondition <> '' then
              begin
                condition := ENPlanWorkFilterObj.conditionSQL;
                AddCondition(condition, outerPWCondition);
                ENPlanWorkFilterObj.conditionSQL := condition;
              end;
            pwFilterObject := ENPlanWorkFilterObj;
            //isPWFiltered := True;
            UpdateGridPW(Sender);
          end;
        ENPlanWorkFilterObj := nil;
      finally
        frmENPlanWorkFilterEdit.Free;
        frmENPlanWorkFilterEdit := nil;
      end;
    end; //else if pcLine04.ActivePage = tsENPlanWorkL04 then
end;


procedure TfrmENLine04Edit.actInsertExecute(Sender: TObject);
begin
  inherited;
  if pcLine04.ActivePage = tsENInspectionSheet then
  begin
    try
      frmENInspectionSheetAdd := TfrmENInspectionSheetAdd.Create(Application, dsInsert);
      frmENInspectionSheetAdd.elementType := ENLine04Obj.element.typeRef.code;

      frmENInspectionSheetAdd.ENInspectionSheetObj := ENInspectionSheet.Create;
      SetNullIntProps(frmENInspectionSheetAdd.ENInspectionSheetObj);
      SetNullXSProps(frmENInspectionSheetAdd.ENInspectionSheetObj);

      frmENInspectionSheetAdd.ENInspectionSheetObj.elementRef := ENElementRef.Create;
      frmENInspectionSheetAdd.ENInspectionSheetObj.elementRef.code := ENLine04Obj.element.code;
      frmENInspectionSheetAdd.ENInspectionSheetObj.equipmentKind := EQUIPMENTKIND_LOW_VOLTAGE;

      try
        if frmENInspectionSheetAdd.ShowModal = mrOk then
        begin
          if frmENInspectionSheetAdd.ENInspectionSheetObj <> nil then
            pcLine04Change(Sender);
        end;
      finally
        frmENInspectionSheetAdd.Free;
        frmENInspectionSheetAdd:=nil;
      end;
    finally
      // ENInspectionSheetObj.Free;
    end;
  end;
end;


procedure TfrmENLine04Edit.actInsertP4OExecute(Sender: TObject);
begin
  ENPost04OKSNObj:=ENPost04OKSN.Create;
  SetNullIntProps(ENPost04OKSNObj);
  SetNullXSProps(ENPost04OKSNObj);
  ENPost04OKSNObj.line04Ref := ENLine04Ref.Create;
  ENPost04OKSNObj.line04Ref.code := ENLine04Obj.code;

  try
    frmENPost04OKSNEdit:=TfrmENPost04OKSNEdit.Create(Application, dsInsert);
    frmENPost04OKSNEdit.chbCopy.Visible := True;
    try
      if frmENPost04OKSNEdit.ShowModal = mrOk then
      begin
        if ENPost04OKSNObj<>nil then
            updateP4O;
      end;
    finally
      frmENPost04OKSNEdit.Free;
      frmENPost04OKSNEdit:=nil;
    end;
  finally
    ENPost04OKSNObj.Free;
  end;

end;

procedure TfrmENLine04Edit.actLoadAttachmentExecute(Sender: TObject);
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

procedure TfrmENLine04Edit.actNoFilterExecute(Sender: TObject);
begin
  if pcLine04.ActivePage = tsENActL04 then
    begin //Виконані роботи
      actFilterObject.Free;
      actFilterObject := nil;
      UpdateGridAct(Sender);
    end //else if pcLine04.ActivePage = tsENActL04 then
  else if pcLine04.ActivePage = tsENPlanWorkL04 then
    begin //Роботи, що виконуються
      pwFilterObject.Free;
      pwFilterObject := nil;
      UpdateGridPW(Sender);
    end; //else if pcLine04.ActivePage = tsENPlanWorkL04 then
end;


procedure TfrmENLine04Edit.actSendToSigningExecute(Sender: TObject);
var
  sheetCode: Integer;
  TempENInspectionSheet: ENInspectionSheetControllerSoapPort;
begin
  inherited;
  TempENInspectionSheet := HTTPRIOENInspectionSheet as ENInspectionSheetControllerSoapPort;
  try
    sheetCode := StrToInt(sgENInspectionSheet.Cells[0,sgENInspectionSheet.Row]);
  except
    on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Ви дійсно бажаєте перевести лист огляду на підпис?'),
                  PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempENInspectionSheet.sendToSigning(sheetCode);
    pcLine04Change(Sender);
  end;
end;


procedure TfrmENLine04Edit.actSignedExecute(Sender: TObject);
var
  sheetCode: Integer;
  TempENInspectionSheet: ENInspectionSheetControllerSoapPort;
begin
  inherited;
  TempENInspectionSheet := HTTPRIOENInspectionSheet as ENInspectionSheetControllerSoapPort;
  try
    sheetCode := StrToInt(sgENInspectionSheet.Cells[0,sgENInspectionSheet.Row]);
  except
    on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Ви дійсно бажаєте підписати лист огляду?'),
                  PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempENInspectionSheet.signed(sheetCode);
    pcLine04Change(Sender);
  end;
end;

procedure TfrmENLine04Edit.LoadCCElement();
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

  if (ENLine04Obj.element=nil) or (ENLine04Obj.element.code=Low(Integer)) then Exit;

  TempCCElementData :=  HTTPRIOCCElementData as CCElementDataControllerSoapPort;

  ccElementFilter := CCElementDataFilter.Create;
  SetNullIntProps(ccElementFilter);
  SetNullXSProps(ccElementFilter);
  ccElementFilter.elementCode:=ENLine04Obj.element.code;
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

procedure TfrmENLine04Edit.LoadCCDamageLog();
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

  if (ENLine04Obj.element=nil) or (ENLine04Obj.element.code=Low(Integer)) then Exit;

  TempCCDamageLog :=  HTTPRIOCCDamageLog as CCDamageLogControllerSoapPort;

  damFilter := CCDamageLogFilter.Create;
  SetNullIntProps(damFilter);
  SetNullXSProps(damFilter);
  damFilter.conditionSQL:=
      ' CCDamageLog.statuscode in (0,1,2,3,6,10,11) '+
      ' and CCDamageLog.subtyperefcode=32 '+
      ' and CCDamageLog.departmentrefcode=0 '+
      ' and ('+
      '   CCDamageLog.nodecode in (select n2e.nodecode from ccnode2enelement n2e where n2e.elementcode='+IntToStr(ENLine04Obj.element.code)+')'+
      '   or '+
      '   CCDamageLog.nodecode in (select g.code from ccnodegroup g where g.parentnormalcode in '+
      '     (select n2e.nodecode from ccnode2enelement n2e where n2e.elementcode='+IntToStr(ENLine04Obj.element.code)+'))'+
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

procedure TfrmENLine04Edit.OpenSLAMO(Sender: TObject);
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

  frmTopologyF04Edit:=TfrmTopologyF04Edit.Create(Application, fmNormal);
  frmTopologyF04Edit.CCFeederObj:=CCFeederObj;
  try
    frmTopologyF04Edit.ShowModal;
  finally
    frmTopologyF04Edit.Free;
    frmTopologyF04Edit:=nil;
  end;
end;


procedure TfrmENLine04Edit.LoadTechnicalStatus(Sender: TObject);
var
  i: Integer;
  TempENObjectsTechnicalStatus: ENObjectsTechnicalStatusControllerSoapPort;
  technicalStatusFilter: ENObjectsTechnicalStatusFilter;
  technicalStatusArr: ENObjectsTechnicalStatusController.ArrayOfInteger;
  settingsFilter: ENSettingsFilter;
  TempENSettings: ENSettingsControllerSoapPort;
  ENSettingsList: ENSettingsShortList;
begin
  if ENLine04Obj = nil then Exit;
  if ENLine04Obj.code = Low(Integer) then Exit;

  SetGridHeaders(ENSettingsHeaders, sgENSettings.ColumnHeaders);
  TempENObjectsTechnicalStatus := HTTPRIOENObjectsTechnicalStatus as ENObjectsTechnicalStatusControllerSoapPort;

  technicalStatusFilter := ENObjectsTechnicalStatusFilter.Create;
  SetNullIntProps(technicalStatusFilter);
  SetNullXSProps(technicalStatusFilter);
  technicalStatusFilter.elementRef := ENElementRef.Create;
  technicalStatusFilter.elementRef.code := ENLine04Obj.element.code;

  technicalStatusArr := TempENObjectsTechnicalStatus.getScrollableFilteredCodeArray(technicalStatusFilter, 0, -1);
  if High(technicalStatusArr) > -1 then
  begin
    try
      ENObjectsTechnicalStatusObj := TempENObjectsTechnicalStatus.getObject(technicalStatusArr[0]);
    except
      on EConvertError do Exit;
    end;

    if ENObjectsTechnicalStatusObj <> nil then
    begin

      if ( ENObjectsTechnicalStatusObj.totalCountArmored <> Low(Integer) ) then
        edtTotalCountArmored.Text := IntToStr(ENObjectsTechnicalStatusObj.totalCountArmored)
      else
        edtTotalCountArmored.Text := '';

      if ( ENObjectsTechnicalStatusObj.defectCountArmored <> Low(Integer) ) then
        edtDefectCountArmored.Text := IntToStr(ENObjectsTechnicalStatusObj.defectCountArmored)
      else
        edtDefectCountArmored.Text := '';

      if ( ENObjectsTechnicalStatusObj.totalCountWood <> Low(Integer) ) then
        edtTotalCountWood.Text := IntToStr(ENObjectsTechnicalStatusObj.totalCountWood)
      else
        edtTotalCountWood.Text := '';

      if ( ENObjectsTechnicalStatusObj.defectCountWood <> Low(Integer) ) then
        edtDefectCountWood.Text := IntToStr(ENObjectsTechnicalStatusObj.defectCountWood)
      else
        edtDefectCountWood.Text := '';

      if ( ENObjectsTechnicalStatusObj.totalCountBranch <> Low(Integer) ) then
        edtTotalCountBranch.Text := IntToStr(ENObjectsTechnicalStatusObj.totalCountBranch)
      else
        edtTotalCountBranch.Text := '';

      if ( ENObjectsTechnicalStatusObj.defectCountBranch <> Low(Integer) ) then
        edtDefectCountBranch.Text := IntToStr(ENObjectsTechnicalStatusObj.defectCountBranch)
      else
        edtDefectCountBranch.Text := '';

      SetTXSDecimalForTEdit(edtTotalLengthCable, ENObjectsTechnicalStatusObj.totalLengthCable);
      SetTXSDecimalForTEdit(edtDefectLengthtCable, ENObjectsTechnicalStatusObj.defectLengthtCable);

      SetTXSDecimalForTEdit(edtBaseDistance, ENObjectsTechnicalStatusObj.baseDistance);
      SetTXSDecimalForTEdit(edtVKDP, ENObjectsTechnicalStatusObj.vKDP);
      SetTXSDecimalForTEdit(edtVKDO, ENObjectsTechnicalStatusObj.vKDO);
      SetTXSDecimalForTEdit(edtVKDV, ENObjectsTechnicalStatusObj.vKDV);
      SetTXSDecimalForTEdit(edtVKD, ENObjectsTechnicalStatusObj.vKD);
      SetTXSDecimalForTEdit(edtMaxFallPower, ENObjectsTechnicalStatusObj.maxFallPower);
      SetTXSDecimalForTEdit(edtLengthToReconstruct, ENObjectsTechnicalStatusObj.lengthToReconstruct);

    end;
  end else
  begin
    ENObjectsTechnicalStatusObj := ENObjectsTechnicalStatus.Create;
    SetNullIntProps(ENObjectsTechnicalStatusObj);
    SetNullXSProps(ENObjectsTechnicalStatusObj);

    ENObjectsTechnicalStatusObj.elementRef := ENElementRef.Create;
    ENObjectsTechnicalStatusObj.elementRef.code := ENLine04Obj.element.code;

    // определение расстояния от базы обслуживания
    if DialogState <> dsView then
      getBaseDistance;
  end;


  TempENSettings := HTTPRIOENSettings as ENSettingsControllerSoapPort;
  settingsFilter := ENSettingsFilter.Create;
  SetNullIntProps(settingsFilter);
  SetNullXSProps(settingsFilter);
  settingsFilter.conditionSQL := 'ensettings.code in ( ' + IntToStr(TECHNICALSTATUS_TRANSFERTARIFF)
      + ', ' + IntToStr(TECHNICALSTATUS_FINE) + ', ' + IntToStr(TECHNICALSTATUS_DISTRIBUTIONTARIFF)
      + ', ' + IntToStr(TECHNICALSTATUS_BLINECAPEX) + ' )';

  ENSettingsList := TempENSettings.getScrollableFilteredList(settingsFilter, 0, -1);
  LastCount := High(ENSettingsList.list);

  if LastCount > -1 then
     sgENSettings.RowCount:=LastCount+2
  else
     sgENSettings.RowCount:=2;

   with sgENSettings do
    for i:=0 to LastCount do
      begin
        if ENSettingsList.list[i].code <> Low(Integer) then
          Cells[0,i+1] := IntToStr(ENSettingsList.list[i].code)
        else
          Cells[0,i+1] := '';
        Cells[1,i+1] := ENSettingsList.list[i].comment;
        Cells[2,i+1] := ENSettingsList.list[i].currentValue;

        LastRow:=i+1;
        sgENSettings.RowCount:=LastRow+1;
      end;

    ColCount:=ColCount+1;
    sgENSettings.Row:=1;
end;



end.


