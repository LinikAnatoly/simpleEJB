
unit EditTKTransportReal;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, DlgUnit,
	EnergyproController, EnergyproController2, TKTransportRealController,
   TKTransportReal2TKFuelKoefController, TKFuelKoefController, TKFuelKoefTypeController,
  AdvObj, ENTransportRealRepairController, EditENTransportRealRepair;

type
  TfrmTKTransportRealEdit = class(TDialogForm)
    pcTransportReal: TPageControl;
    tsTransportReal: TTabSheet;
    lblInvNumber: TLabel;
    spbOSTableFin: TSpeedButton;
    lblSizCode: TLabel;
    edtInvNumber: TEdit;
    edtSizCode: TEdit;
    lblBuhName: TLabel;
    edtName: TEdit;
    lblName: TLabel;
    lblGosNumber: TLabel;
    spbTKTransportTransport: TSpeedButton;
    lblTKTransportTransportName: TLabel;
    spbTKTransportMarkTransportmark: TSpeedButton;
    lblTKTransportMarkTransportmarkName: TLabel;
    lblOSTableFinName: TLabel;
    spbTKTransportStatusTransportstatus: TSpeedButton;
    lblTKTransportStatusTransportstatusName: TLabel;
    Label1: TLabel;
    spbEnDepartment: TSpeedButton;
    lblExpensesCode: TLabel;
    lblRashodWork: TLabel;
    lblRashodProbeg: TLabel;
    lblENTravelSheetType: TLabel;
    lblTKFuelTypeFuelTypeName: TLabel;
    spbTKFuelTypeFuelType: TSpeedButton;
    lblFuelCalcType: TLabel;
    lblFinMolCode: TLabel;
    lblFinMolName: TLabel;
    spbMOL: TSpeedButton;
    edtGosNumber: TEdit;
    edtTKTransportName: TEdit;
    edtTKTransportMarkTransportmarkName: TEdit;
    edtOSTableFinName: TEdit;
    edtTKTransportStatusTransportstatusName: TEdit;
    edtENDepartmentName: TEdit;
    edtExpensesCode: TEdit;
    edtRashodProbeg: TEdit;
    edtRashodWork: TEdit;
    cbTravelSheetType: TComboBox;
    edtTKFuelTypeFuelTypeName: TEdit;
    edtBuhName: TEdit;
    cbFuelCalcType: TComboBox;
    edtFinMolName: TEdit;
    edtFinMolCode: TEdit;
    HTTPRIOTKTransportReal: THTTPRIO;
    HTTPRIOENDepartment: THTTPRIO;
    btnOk: TButton;
    btnCancel: TButton;
    tsAutoTires: TTabSheet;
    tsAccumulators: TTabSheet;
    btnInstallAccumulator: TButton;
    btnUninstallAccumulator: TButton;
    btnUninstallTires: TButton;
    btnInstallTires: TButton;
    ImageList1: TImageList;
    ActionList1: TActionList;
    PopupMenu1: TPopupMenu;
    sgENAccumulators: TAdvStringGrid;
    HTTPRIOENAccumulatorsHistory: THTTPRIO;
    HTTPRIOENAccumulators: THTTPRIO;
    sgENAutoTires: TAdvStringGrid;
    HTTPRIOENAutoTiresHistory: THTTPRIO;
    HTTPRIOENAutoTires: THTTPRIO;
    spbENTransportDepartment: TSpeedButton;
    lblTransportDepartment: TLabel;
    edtENTransportDepartmentName: TEdit;
    HTTPRIOENTransportDepartment: THTTPRIO;
    tsTKTransportRealHistory: TTabSheet;
    sgTKTransportRealHistory: TAdvStringGrid;
    HTTPRIOTKTransportRealHistory: THTTPRIO;
    btnTKTransportRealHistoryChange: TButton;
    chkVerified: TCheckBox;
    lblCapacity: TLabel;
    edtCapacity: TEdit;
    lblLadenMass: TLabel;
    edtLadenMass: TEdit;
    lblReg_id: TLabel;
    edtReg_id: TEdit;
    chkIsNotUsed: TCheckBox;
    tsTKTransportReal2TKFuelKoef: TTabSheet;
    sgTKTransportReal2TKFuelKoef: TAdvStringGrid;
    btnRemoveFuelKoef: TButton;
    HTTPRIOTKTransportReal2TKFuelKoef: THTTPRIO;
    HTTPRIOTKFuelKoef: THTTPRIO;
    btnAddFuelKoef: TSpeedButton;
    lblKoef: TLabel;
    edtYearOfProducing: TEdit;
    lblYearOfProducing: TLabel;
    chkIsOnDuty: TCheckBox;
    chkHasStarter: TCheckBox;
    chkIsOVB: TCheckBox;
    lblCode: TLabel;
    edtCode: TEdit;
    lblPosition: TLabel;
    edtPosition: TEdit;
    spbPosition: TSpeedButton;
    HTTPRIOTKPosition: THTTPRIO;
    tsRepair: TTabSheet;
    HTTPRIOENTransportRealRepair: THTTPRIO;
    sgENTransportRealRepair: TAdvStringGrid;
    PopupMenuRepair: TPopupMenu;
    N1Repair: TMenuItem;
    N2Repair: TMenuItem;
    N3Repair: TMenuItem;
    N4Repair: TMenuItem;
    N6Repair: TMenuItem;
    N7Repair: TMenuItem;
    N8Repair: TMenuItem;
    ActionListRepair: TActionList;
    actViewRepair: TAction;
    actInsertRepair: TAction;
    actDeleteRepair: TAction;
    actEditRepair: TAction;
    actUpdateRepair: TAction;
    actFilterRepair: TAction;
    actNoFilterRepair: TAction;
    ImageList2: TImageList;
    ToolBar1Repair: TToolBar;
    ToolButtonRepair: TToolButton;
    ToolButton6Repair: TToolButton;
    ToolButton7Repair: TToolButton;
    ToolButton8Repair: TToolButton;
    ToolButton11Repair: TToolButton;
    ToolButton2Repair: TToolButton;
    ToolButton3Repair: TToolButton;
    lblGeograph: TLabel;
    edtGeograph: TEdit;
    btnGeograph: TSpeedButton;
    HTTPRIOENGeographicDepartment: THTTPRIO;
    btnGeographClear: TSpeedButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbTKTransportTransportClick(Sender : TObject);
  procedure spbTKTransportMarkTransportmarkClick(Sender : TObject);
  procedure spbOSTableFinClick(Sender : TObject);
  procedure spbTKTransportStatusTransportstatusClick(Sender : TObject);
    procedure spbEnDepartmentClick(Sender: TObject);
    procedure spbENTransportDepartmentClick(Sender: TObject);
    procedure spbTKFuelTypeFuelTypeClick(Sender: TObject);
    procedure spbMOLClick(Sender: TObject);
    procedure pcTransportRealChange(Sender: TObject);
    procedure sgENAccumulatorsDblClick(Sender: TObject);
    procedure btnInstallTiresClick(Sender: TObject);
    procedure sgENAutoTiresDblClick(Sender: TObject);
    procedure btnUninstallTiresClick(Sender: TObject);
    procedure UpdateGrid(Sender: TObject);
    procedure btnInstallAccumulatorClick(Sender: TObject);
    procedure btnUninstallAccumulatorClick(Sender: TObject);
  procedure ClearGrid(AGrid: TStringGrid);
    procedure btnTKTransportRealHistoryChangeClick(Sender: TObject);
    procedure btnTKTransportRealHistoryRemoveClick(Sender: TObject);
    procedure btnAddFuelKoefClick(Sender: TObject);
    procedure btnRemoveFuelKoefClick(Sender: TObject);
    function  calcKoef(const transportCode : Integer) : Double;
    procedure spbPositionClick(Sender: TObject);
    procedure actViewRepairExecute(Sender: TObject);
    procedure actInsertRepairExecute(Sender: TObject);
    procedure actDeleteRepairExecute(Sender: TObject);
    procedure actUpdateRepairExecute(Sender: TObject);
    procedure actEditRepairExecute(Sender: TObject);
    procedure btnGeographClick(Sender: TObject);
    procedure btnGeographClearClick(Sender: TObject);

  private
    { Private declarations }
    selectedRowRepair : Integer;
  public
   SendType: Integer;
   isForCopy : Boolean;
    { Public declarations }

end;

var frmTKTransportRealEdit: TfrmTKTransportRealEdit;
    TKTransportRealObj: TKTransportReal;

implementation

uses
  ShowTKTransport
  ,TKTransportController
  ,ShowTKTransportMark
  ,TKTransportMarkController
  ,ShowOSTable
  ,OSTableController
  ,ShowTKTransportStatus
  ,TKTransportStatusController
, EditENDepartment, ShowENDepartment, EditENDepartmentFilter,
  ENDepartmentController, ENDepartmentTypeController, ENConsts,
  ENTravelSheetTypeController, ShowTKFuelType, TKFuelTypeController,
  TKFuelCalcTypeController, FINMolController, ShowFINMol,
  ENAccumulatorsHistoryController, EditENAccumulatorsHistory, EditENAccumulatorsHistoryFilter,
  ENAccumulatorsController, EditENAccumulators, EditENAccumulatorsFilter,
  ENAutoTiresController, EditENAutoTires, EditENAutoTiresFilter,
  ENAutoTiresHistoryController, EditENAutoTiresHistory, EditENAutoTiresHistoryFilter,
  EditENAutoTiresInstallation, EditENAccumulatorInstallation
  , ENTransportDepartmentController, ShowENTransportDepartment, TKTransportRealHistoryController,
  EditTKTransportRealHistory, ShowTKFuelKoef, ShowTKPosition,
  TKPositionController, ShowENGeographicDepartment,
  ENGeographicDepartmentController;

{uses  
    EnergyproController, EnergyproController2, TKTransportRealController  ;
}
{$R *.dfm}

var
    ENAutoTiresHistoryHeaders: array [1..11] of String =
          ( 'Код'
            ,'серийный №'
            ,'гаражный №'
            ,'наименование'
            ,'дата монтажа'
            ,'дата демонтажа'
            ,'место установки'
            //,'пробег на момент установки'
            ,'пробег на данном автомобиле'
            ,'пробег с начала эксплуатации'
            ,'причина выхода из эксплуатации'
            ,'код покрышки'
          );

    ENAccumulatorsHeaders: array [1..10] of String =
          ( 'Код'
            ,'наименование агрегата'
            ,'марка или тип'
            ,'гаражный №'
            ,'заводской №'
            ,'дата установки'
            ,'дата снятия'
            ,'пройдено на данном автомобиле м/час'
            ,'пройдено с начала эксплуатации м/час'
            ,'причина выхода из эксплуатации'
          );

    TKTransportRealHistoryHeaders: array [1..11] of String =
          ( 'Код'
            ,'Код МОЛ'
            ,'Найменування МОЛ'
            ,'Підрозділ'
            ,'Транспортний підрозділ'
            ,'Держ. номер'
            ,'Реєстраційний номер з СКТ "Глобус"'
            ,'Наявність пускового двигуна'
            ,'Тип палива'
            ,'Дата з'
            ,'Дата по'
          );

              TKTransportReal2TKFuelKoefHeaders: array [1..3] of String =
          ( 'Код'
            ,'Найменування'
            ,'Коефіціент'
          );

           ENTransportRealRepairHeaders: array [1..5] of String =
        ( 'Код'
          ,'Дата початку періоду'
          ,'Дата закінчення періоду'
          ,'Користувач, який вніс зміни'
          ,'Дата зміни'
        );

function TfrmTKTransportRealEdit.calcKoef(const transportCode : Integer) : Double;
var  LastCount,  i  :Integer;
koef , out: Double;
TempTKTransportReal2TKFuelKoef : TKTransportReal2TKFuelKoefControllerSoapPort;
Transport2KoefList : TKTransportReal2TKFuelKoefShortList;
Transport2KoefFilter :  TKTransportReal2TKFuelKoefFilter;
begin
   TempTKTransportReal2TKFuelKoef := HTTPRIOTKTransportReal2TKFuelKoef as  TKTransportReal2TKFuelKoefControllerSoapPort;

    Transport2KoefFilter := TKTransportReal2TKFuelKoefFilter.Create;
    SetNullIntProps(Transport2KoefFilter);
    SetNullXSProps(Transport2KoefFilter);
    Transport2KoefFilter.transportRealRef := TKTransportRealRef.Create;
    Transport2KoefFilter.transportRealRef.code := transportCode;
    Transport2KoefList := TempTKTransportReal2TKFuelKoef.getScrollableFilteredList(Transport2KoefFilter, 0, -1);
    LastCount :=  High(Transport2KoefList.list);

   if LastCount > -1 then
   begin
     koef := 100;
         for i:=0 to LastCount do
      begin
          koef := koef +  StrToFloat(Transport2KoefList.list[i].tkFuelKoefRefKoef.DecimalString);
      end;
        out := koef / 100;
   end
   else out := 1;

   Result := out;
end;


procedure TfrmTKTransportRealEdit.FormShow(Sender: TObject);
var
  TempENDepartment: ENDepartmentControllerSoapPort;
  TempENTransportDepartment : ENTransportDepartmentControllerSoapPort;
  i : Integer;
  TempTKPosition: TKPositionControllerSoapPort;
  TempTKPositionObject : TKPosition;
  TempENGeographicDepartment: ENGeographicDepartmentControllerSoapPort;
  ENGeographicDepartmentObj : ENGeographicDepartment;
begin

  pcTransportReal.ActivePage := tsTransportReal;

  DisableControls([edtCode , edtGeograph ]);

  if (DialogState = dsView) then
     DisableControls([spbTKTransportTransport , spbTKTransportMarkTransportmark ,
     spbOSTableFin , spbTKTransportStatusTransportstatus , spbEnDepartment
     , spbENTransportDepartment
     , spbMOL
     , btnTKTransportRealHistoryChange
     , spbPosition
     ,btnGeograph
     ,btnGeographClear
     ]);

  DisableControls([
                    edtFinMolCode, edtFinMolName
                    , edtTKFuelTypeFuelTypeName, edtTKTransportName, edtTKTransportMarkTransportmarkName
                    , edtTKTransportStatusTransportstatusName, edtENDepartmentName, edtENTransportDepartmentName
                    , edtPosition
                  ]);

  if (DialogState = dsInsert) then begin
    for i := 0 to pcTransportReal.PageCount - 1 do begin
      if pcTransportReal.Pages[i] <> tsTransportReal then begin
        pcTransportReal.Pages[i].TabVisible := False;
      end;
    end;
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtBuhName
      ,edtInvNumber
      ,edtGosNumber
      , edtTKFuelTypeFuelTypeName

      ,edtFinMolCode, edtFinMolName

     ]);
     DisableControls([edtOSTableFinName,edtInvNumber, edtName]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
   TempENDepartment := HTTPRIOENDepartment as ENDepartmentControllerSoapPort;
   TempENTransportDepartment := HTTPRIOENTransportDepartment as ENTransportDepartmentControllerSoapPort;


   if TKTransportRealObj.enelement.geoDepartmentRef <> nil then
      if TKTransportRealObj.enelement.geoDepartmentRef.code <> LOW_INT then
       begin
            // geodept
            TempENGeographicDepartment := HTTPRIOENGeographicDepartment as ENGeographicDepartmentControllerSoapPort;
          try
            ENGeographicDepartmentObj := TempENGeographicDepartment.getObject( TKTransportRealObj.enelement.geoDepartmentRef.code );
            edtGeograph.Text := ENGeographicDepartmentObj.name;
          except
            on EConvertError do Exit;
          end;
       end;
    edtCode.Text := IntToStr(TKTransportRealObj.code);
    edtENDepartmentName.Text := TempENDepartment.getObject(TKTransportRealObj.departmentRef.code).shortName;

    if TKTransportRealObj.transportdepartmentRef.code <> Low(Integer) then
      edtENTransportDepartmentName.Text := TempENTransportDepartment.getObject(TKTransportRealObj.transportdepartmentRef.code).name
    else
       edtENTransportDepartmentName.Text := '';
    edtName.Text := TKTransportRealObj.name;
    edtBuhName.Text := TKTransportRealObj.buhName;

    if (TKTransportRealObj.isVerified = ENConsts.TKTRANSPORTREAL_ISVERIFIED)
       then  chkVerified.Checked := true
       else  chkVerified.Checked := false;

    if (TKTransportRealObj.isNotUsed = ENConsts.TKTRANSPORTREAL_ISNOTUSED)
       then  chkIsNotUsed.Checked := true
       else  chkIsNotUsed.Checked := false;

    if (TKTransportRealObj.isOnDuty = ENConsts.TKTRANSPORTREAL_ISONDUTY)
       then  chkIsOnDuty.Checked := true
       else  chkIsOnDuty.Checked := false;

    if (TKTransportRealObj.hasStarter = ENConsts.TKTRANSPORTREAL_HASSTARTER)
       then  chkHasStarter.Checked := true
       else  chkHasStarter.Checked := false;

    if (TKTransportRealObj.isOVB = ENConsts.TKTRANSPORTREAL_ISOVB)
       then  chkIsOVB.Checked := true
       else  chkIsOVB.Checked := false;

    edtInvNumber.Text := TKTransportRealObj.invNumber;
    edtGosNumber.Text := TKTransportRealObj.gosNumber;
    edtTKTransportStatusTransportstatusName.Text:= TKTransportRealObj.transportstatus.name;
    edtTKTransportName.Text := TKTransportRealObj.transport.name;
    edtTKTransportMarkTransportmarkName.Text := TKTransportRealObj.transportmark.name;

    edtTKFuelTypeFuelTypeName.Text := TKTransportRealObj.fuelType.name;
    
    edtExpensesCode.Text := TKTransportRealObj.expensesCode;
    if ( TKTransportRealObj.rashodWork <> nil ) then
       edtRashodWork.Text := TKTransportRealObj.rashodWork.decimalString
    else
       edtRashodWork.Text := '';
    if ( TKTransportRealObj.rashodProbeg <> nil ) then
       edtRashodProbeg.Text := TKTransportRealObj.rashodProbeg.decimalString
    else
       edtRashodProbeg.Text := '';

    if TKTransportRealObj.travelSheetTypeRef <> nil then
    begin
       cbTravelSheetType.ItemIndex := TKTransportRealObj.travelSheetTypeRef.code ; //- 1;
    end;

    if  TKTransportRealObj.fuelCalcTypeRef <> nil then
      cbFuelCalcType.ItemIndex := TKTransportRealObj.fuelCalcTypeRef.code - 1;
      

    edtFinMolCode.Text := TKTransportRealObj.finMolCode;
    edtFinMolName.Text := TKTransportRealObj.finMolName;

    if (TKTransportRealObj.sizCode <> low(Integer)) then
       edtSizCode.Text := IntToStr(TKTransportRealObj.sizCode)
    else
       edtSizCode.Text := '';

    if ( TKTransportRealObj.capacity <> nil ) then
       edtCapacity.Text := TKTransportRealObj.capacity.decimalString
    else
       edtCapacity.Text := '';

    if ( TKTransportRealObj.ladenMass <> nil ) then
       edtLadenMass.Text := TKTransportRealObj.ladenMass.decimalString
    else
       edtLadenMass.Text := '';

    if ( TKTransportRealObj.reg_id <> Low(Integer) ) then
       edtReg_id.Text := IntToStr(TKTransportRealObj.reg_id)
    else
       edtReg_id.Text := '';

     if ( TKTransportRealObj.yearOfProducing <> Low(Integer) ) then
       edtYearOfProducing.Text := IntToStr(TKTransportRealObj.yearOfProducing)
    else
       edtYearOfProducing.Text := '';

   lblKoef.Caption := 'Загальний коефіціент розрахунку палива дорівнює ' +  FloatToStr(self.calcKoef(TKTransportRealObj.code));

    if TKTransportRealObj.positionRef.code <> LOW_INT then
     begin
     TempTKPosition := HTTPRIOTKPosition as TKPositionControllerSoapPort;
      TempTKPositionObject :=  TempTKPosition.getObject(TKTransportRealObj.positionRef.code);
      edtPosition.Text := TempTKPositionObject.name;
     end;

    //edtOSTableFinName.Text := TKTransportRealObj.fin.str_name;
  //  edtTKTransportStatusTransportstatusName.Text := TKTransportRealObj.transportstatus.name;

  end;
end;



procedure TfrmTKTransportRealEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempTKTransportReal: TKTransportRealControllerSoapPort;
    TransportRealFilter: TKTransportRealFilter;
    TransportRealList: TKTransportRealShortList;
begin

  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then

  begin
     if TKTransportRealObj.transportstatus = nil then
         begin
         Application.MessageBox(PChar('Введите статус транспорта!'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
         Action:=caNone;
         exit;
         end;
     if TKTransportRealObj.transportstatus.code = Low(Integer) then
         begin
         Application.MessageBox(PChar('Введите статус транспорта!'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
         Action:=caNone;
         exit;
         end;

  if TKTransportRealObj.transportstatus.code <> ENConsts.TKTRANSPORTSTATUS_FROM_SIDE  then
  if not NoBlankValues([
      edtName
      ,edtBuhName
      ,edtInvNumber
      ,edtGosNumber
      , edtTKFuelTypeFuelTypeName

      ,edtFinMolCode, edtFinMolName

     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
      exit;
  end;

      if TKTransportRealObj.transportstatus.code = ENConsts.TKTRANSPORTSTATUS_FROM_SIDE  then
  if not NoBlankValues([
      edtBuhName
      ,edtGosNumber
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
      exit;
  end;

    TempTKTransportReal := HTTPRIOTKTransportReal as TKTransportRealControllerSoapPort;

    ///////
    if (edtInvNumber.Text <> '') then
    begin
      TransportRealFilter := TKTransportRealFilter.Create;
      try
        SetNullIntProps(TransportRealFilter);
        SetNullXSProps(TransportRealFilter);

        TransportRealFilter.invNumber := Trim(edtInvNumber.Text);
        //TransportRealFilter.name := Trim(edtName.Text);
        if DialogState = dsEdit then
          TransportRealFilter.conditionSQL := ' code <> ' + IntToStr(TKTransportRealObj.code) +
                                              ' and transportstatuscode <> ' + IntToStr(ENConsts.TKTRANSPORTSTATUS_FROM_SIDE);

        TransportRealList := TempTKTransportReal.getScrollableFilteredList(TransportRealFilter, 0, -1);
        if TransportRealList.totalCount > 0 then
        begin
          Application.MessageBox(PChar('Объект с таким инвентарным номером уже существует (код: ' + IntToStr(TransportRealList.list[0].code) + ')!'), PChar('Внимание !'), MB_ICONWARNING+MB_OK);
          Action := caNone;
          Exit;
        end;
      finally
        TransportRealFilter.Free;
      end;
    end;

    if (edtGosNumber.Text <> '') and (edtGosNumber.Text <> 'б/н') then
    begin
      TransportRealFilter := TKTransportRealFilter.Create;
      try
        SetNullIntProps(TransportRealFilter);
        SetNullXSProps(TransportRealFilter);

        TransportRealFilter.gosNumber := Trim(edtGosNumber.Text);
        //TransportRealFilter.name := Trim(edtName.Text);
        if DialogState = dsEdit then
          TransportRealFilter.conditionSQL := 'code <> ' + IntToStr(TKTransportRealObj.code);

        TransportRealList := TempTKTransportReal.getScrollableFilteredList(TransportRealFilter, 0, -1);
        if TransportRealList.totalCount > 0 then
        begin
          Application.MessageBox(PChar('Объект с таким гос. номером уже существует (код: ' + IntToStr(TransportRealList.list[0].code) + ')!'), PChar('Внимание !'), MB_ICONWARNING+MB_OK);
          Action := caNone;
          Exit;
        end;
      finally
        TransportRealFilter.Free;
      end;
    end;
    ///////


     TKTransportRealObj.name := edtName.Text;

     TKTransportRealObj.buhName := edtBuhName.Text;

     TKTransportRealObj.invNumber := edtInvNumber.Text; 

     TKTransportRealObj.gosNumber := edtGosNumber.Text;


     TKTransportRealObj.expensesCode := edtExpensesCode.Text; 

     if (TKTransportRealObj.rashodWork = nil ) then
       TKTransportRealObj.rashodWork := TXSDecimal.Create;
     if edtRashodWork.Text <> '' then
       TKTransportRealObj.rashodWork.decimalString := edtRashodWork.Text 
     else
       TKTransportRealObj.rashodWork := nil;

     if (TKTransportRealObj.rashodProbeg = nil ) then
       TKTransportRealObj.rashodProbeg := TXSDecimal.Create;
     if edtRashodProbeg.Text <> '' then
       TKTransportRealObj.rashodProbeg.decimalString := edtRashodProbeg.Text
     else
       TKTransportRealObj.rashodProbeg := nil;

     if (TKTransportRealObj.capacity = nil ) then
       TKTransportRealObj.capacity := TXSDecimal.Create;
     if edtCapacity.Text <> '' then
       TKTransportRealObj.capacity.decimalString := edtCapacity.Text
     else
       TKTransportRealObj.capacity := nil;

     if (TKTransportRealObj.ladenMass = nil ) then
       TKTransportRealObj.ladenMass := TXSDecimal.Create;
     if edtLadenMass.Text <> '' then
       TKTransportRealObj.ladenMass.decimalString := edtLadenMass.Text
     else
       TKTransportRealObj.ladenMass := nil;

     if edtReg_Id.Text <> '' then
       TKTransportRealObj.reg_id := StrToInt(edtReg_id.Text)
     else
       TKTransportRealObj.reg_id := Low(Integer);

           if edtYearOfProducing.Text <> '' then
       TKTransportRealObj.yearOfProducing := StrToInt(edtYearOfProducing.Text)
     else
       TKTransportRealObj.yearOfProducing := Low(Integer);

     {   не всегда оно обязательное .. типа ПРИЦЕПЫ ;)
     if cbTravelSheetType.ItemIndex = -1 then
     begin
      Application.MessageBox(PChar('Виберіть тип подорожнього листа !'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
      Exit;
     end;
     }

    if TKTransportRealObj.travelSheetTypeRef = nil then
       TKTransportRealObj.travelSheetTypeRef := ENTravelSheetTypeRef.Create();

     if cbTravelSheetType.ItemIndex > 0 then
       TKTransportRealObj.travelSheetTypeRef.code := cbTravelSheetType.ItemIndex  //+ 1;
     else
       TKTransportRealObj.travelSheetTypeRef.code := LOW_INT;

    if TKTransportRealObj.fuelCalcTypeRef = nil then
      TKTransportRealObj.fuelCalcTypeRef := TKFuelCalcTypeRef.Create;
    TKTransportRealObj.fuelCalcTypeRef.code := cbFuelCalcType.ItemIndex + 1;

    if edtSizCode.Text <> '' then
       TKTransportRealObj.sizCode := StrToInt(edtSizCode.Text)
    else
       TKTransportRealObj.sizCode := LOW_INT;

    if chkVerified.Checked = true then
    TKTransportRealObj.isVerified := ENConsts.TKTRANSPORTREAL_ISVERIFIED
    else TKTransportRealObj.isVerified := ENConsts.TKTRANSPORTREAL_ISVERIFIED_FALSE;

    if chkIsNotUsed.Checked = true then
    TKTransportRealObj.isNotUsed := ENConsts.TKTRANSPORTREAL_ISNOTUSED
    else TKTransportRealObj.isNotUsed := ENConsts.TKTRANSPORTREAL_ISNOTUSED_FALSE;

    if chkIsOnDuty.Checked = true then
    TKTransportRealObj.isOnDuty := ENConsts.TKTRANSPORTREAL_ISONDUTY
    else TKTransportRealObj.isOnDuty := ENConsts.TKTRANSPORTREAL_ISONDUTY_FALSE;

    if chkHasStarter.Checked = true then
      TKTransportRealObj.hasStarter := ENConsts.TKTRANSPORTREAL_HASSTARTER
    else TKTransportRealObj.hasStarter := ENConsts.TKTRANSPORTREAL_HASSTARTER_FALSE;

    if chkIsOVB.Checked = true then
    TKTransportRealObj.isOVB := ENConsts.TKTRANSPORTREAL_ISOVB
    else TKTransportRealObj.isOVB := ENConsts.TKTRANSPORTREAL_ISOVB_FALSE;

    if DialogState = dsInsert then
    begin
      TKTransportRealObj.code:=low(Integer);
      TempTKTransportReal.add(TKTransportRealObj);
    end
    else
    if DialogState = dsEdit then
    begin
      if Self.isForCopy then begin
        TempTKTransportReal.add(TKTransportRealObj);
      end else begin
        TempTKTransportReal.save(TKTransportRealObj);
      end;
    end;
  end;
end;


procedure TfrmTKTransportRealEdit.spbTKTransportTransportClick(Sender : TObject);
var 
   frmTKTransportShow: TfrmTKTransportShow;
begin
   frmTKTransportShow:=TfrmTKTransportShow.Create(Application,fmNormal);
   try
      with frmTKTransportShow do
        if ShowModal = mrOk then
        begin
            try
               if TKTransportRealObj.transport = nil then TKTransportRealObj.transport := TKTransport.Create();
               TKTransportRealObj.transport.code := TKTransportShort(tvDep.Selected.Data).code;//StrToInt(GetReturnValue(sgTKTransport,0));
               edtTKTransportName.Text:=TKTransportShort(tvDep.Selected.Data).name;//GetReturnValue(sgTKTransport,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmTKTransportShow.Free;
   end;
end;



procedure TfrmTKTransportRealEdit.spbTKTransportMarkTransportmarkClick(Sender : TObject);
var 
   frmTKTransportMarkShow: TfrmTKTransportMarkShow;
begin
   frmTKTransportMarkShow:=TfrmTKTransportMarkShow.Create(Application,fmNormal);
   try
      with frmTKTransportMarkShow do
        if ShowModal = mrOk then
        begin
            try
               if TKTransportRealObj.transportmark = nil then TKTransportRealObj.transportmark := TKTransportMark.Create();
               TKTransportRealObj.transportmark.code := StrToInt(GetReturnValue(sgTKTransportMark,0));
               edtTKTransportMarkTransportmarkName.Text:=GetReturnValue(sgTKTransportMark,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmTKTransportMarkShow.Free;
   end;
end;



procedure TfrmTKTransportRealEdit.spbOSTableFinClick(Sender : TObject);
var 
   frmOSTableShow: TfrmOSTableShow;
   f : OStableFilter;
begin

     f := OStableFilter.Create;
     SetNullIntProps(f);
     SetNullXSProps(f);
     f.conditionSQL := ' OSTABLE.KOD_VID in (10,31) ';

   frmOSTableShow:=TfrmOSTableShow.Create(Application,fmNormal, f);

   try
    //frmOSTableShow.SendType:=3;



      with frmOSTableShow do
        if ShowModal = mrOk then
        begin
            try
               //if TKTransportRealObj.fin = nil then TKTransportRealObj.fin := OSTable.Create();
               TKTransportRealObj.finCode := StrToInt(GetReturnValue(sgOSTable,0));
               //edtOSTableFinName.Text:=GetReturnValue(sgOSTable,1);
               edtName.Text:=GetReturnValue(sgOSTable,1);
               edtInvNumber.Text:= GetReturnValue(sgOSTable,2);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmOSTableShow.Free;
   end;
end;



procedure TfrmTKTransportRealEdit.spbPositionClick(Sender: TObject);
var
   frmTKPositionShow : TfrmTKPositionShow;
begin
   frmTKPositionShow:=TfrmTKPositionShow.Create(Application,fmNormal);
   try
      with frmTKPositionShow do
        if ShowModal = mrOk then
        begin
            try
               if TKTransportRealObj.positionRef = nil then TKTransportRealObj.positionRef := TKPositionRef.Create();
                  TKTransportRealObj.positionRef.code := StrToInt(GetReturnValue(sgTKPosition,0));
                  edtPosition.Text:= GetReturnValue(sgTKPosition,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmTKPositionShow.Free;
   end;
end;

procedure TfrmTKTransportRealEdit.spbTKTransportStatusTransportstatusClick(Sender : TObject);
var 
   frmTKTransportStatusShow: TfrmTKTransportStatusShow;
begin
   frmTKTransportStatusShow:=TfrmTKTransportStatusShow.Create(Application,fmNormal);
   try
      with frmTKTransportStatusShow do
        if ShowModal = mrOk then
        begin
            try
               if TKTransportRealObj.transportstatus = nil then TKTransportRealObj.transportstatus := TKTransportStatus.Create();
               TKTransportRealObj.transportstatus.code := StrToInt(GetReturnValue(sgTKTransportStatus,0));
               edtTKTransportStatusTransportstatusName.Text:=GetReturnValue(sgTKTransportStatus,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmTKTransportStatusShow.Free;
   end;
end;



procedure TfrmTKTransportRealEdit.spbEnDepartmentClick(Sender: TObject);
 var
   frmENDepartmentShow: TfrmENDepartmentShow;
   f : ENDepartmentFilter;
begin
   f := ENDepartmentFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);
   f.code := 1;

   frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application,fmNormal, f);
   try
      with frmENDepartmentShow do begin
      //  DisableActions([ actNoFilter, actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try
               if TKTransportRealObj.departmentRef = nil then TKTransportRealObj.departmentRef := ENDepartmentRef.Create();
               TKTransportRealObj.departmentRef.code := ENDepartmentShort(tvDep.Selected.Data).code;
               edtEnDepartmentName.Text:= ENDepartmentShort(tvDep.Selected.Data).shortName;
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;

end;

procedure TfrmTKTransportRealEdit.spbENTransportDepartmentClick(Sender: TObject);
 var
   frmENTransportDepartmentShow: TfrmENTransportDepartmentShow;
   f : ENTransportDepartmentFilter;
begin
   f := ENTransportDepartmentFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);

   frmENTransportDepartmentShow:=TfrmENTransportDepartmentShow.Create(Application,fmNormal);
   try
      with frmENTransportDepartmentShow do begin
      //  DisableActions([ actNoFilter, actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try
               if TKTransportRealObj.transportDepartmentRef = nil then TKTransportRealObj.transportDepartmentRef := ENTransportDepartmentRef.Create();
               TKTransportRealObj.transportDepartmentRef.code := StrToInt(GetReturnValue(sgENTransportDepartment,0));
               edtENTransportDepartmentName.Text:= GetReturnValue(sgENTransportDepartment,1);
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENTransportDepartmentShow.Free;
   end;

end;


procedure TfrmTKTransportRealEdit.spbTKFuelTypeFuelTypeClick(
  Sender: TObject);
var 
   frmTKFuelTypeShow: TfrmTKFuelTypeShow;
begin
   frmTKFuelTypeShow:=TfrmTKFuelTypeShow.Create(Application,fmNormal);
   try
      with frmTKFuelTypeShow do
        if ShowModal = mrOk then
        begin
            try
               if TKTransportRealObj.fuelType = nil then TKTransportRealObj.fuelType := TKFuelType.Create();
               TKTransportRealObj.fuelType.code := StrToInt(GetReturnValue(sgTKFuelType,0));
               edtTKFuelTypeFuelTypeName.Text:=GetReturnValue(sgTKFuelType,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmTKFuelTypeShow.Free;
   end;
end;

procedure TfrmTKTransportRealEdit.spbMOLClick(Sender: TObject);
var
 f : FINMolFilter;
 frmFINMolShow : TfrmFINMolShow;

  molSel : boolean;

begin
 f := FINMolFilter.Create;
 SetNullXSProps(f);
 SetNullIntProps(f);
 f.state := 1; // ???? ?????? ?????????? ...

 //f.text := edtMolOutCode.Text;
 //f.id := edtMolOutCode.Text;

   frmFINMolShow:=TfrmFINMolShow.Create(Application,fmNormal, f);

   try

      // оно типа ТУТ отфильтровано ...
      //if length(f.conditionSQL) > 0 then
        frmFINMolShow.isFiltered := true;

      with frmFINMolShow do
      begin
        DisableActions([ actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try

               TKTransportRealObj.finMolCode := GetReturnValue(sgFINMol,0);
               TKTransportRealObj.finMolName := GetReturnValue(sgFINMol,1);

               edtFinMolCode.Text := TKTransportRealObj.finMolCode;  //GetReturnValue(sgFINMol,0);
               edtFinMolName.Text := TKTransportRealObj.finMolName;


            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmFINMolShow.Free;
   end;


end;

procedure TfrmTKTransportRealEdit.pcTransportRealChange(Sender: TObject);
var
  TempENAccumulatorsHistory : ENAccumulatorsHistoryControllerSoapPort;
  ENAccumulatorsHistoryList : ENAccumulatorsHistoryShortList;
  TempENAutoTiresHistory : ENAutoTiresHistoryControllerSoapPort;
  ENAutoTiresHistoryList : ENAutoTiresHistoryShortList;
  TempTKTransportRealHistory : TKTransportRealHistoryControllerSoapPort;
  TKTransportRealHistoryList : TKTransportRealHistoryShortList;
  TKTransportReal2TKFuelKoefList : TKTransportReal2TKFuelKoefShortList;
  TempTKTransportReal2TKFuelKoef  : TKTransportReal2TKFuelKoefControllerSoapPort;

  transport2koefFilter : TKTransportReal2TKFuelKoefFilter;
  accumulatorsFilter : ENAccumulatorsHistoryFilter;
  tiresFilter : ENAutoTiresHistoryFilter;
  historyFilter : TKTransportRealHistoryFilter;
  i, j, ColCount, LastCount, LastRow : Integer;

begin
  //--------------------------------------------------------------------------------
  if pcTransportReal.ActivePage = tsRepair then
     actUpdateRepairExecute(Sender);

  if pcTransportReal.ActivePage = tsAccumulators then
  begin
  SetGridHeaders(ENAccumulatorsHeaders, sgENAccumulators.ColumnHeaders);

  ClearGrid(sgENAccumulators);
  
  TempENAccumulatorsHistory := HTTPRIOENAccumulatorsHistory as ENAccumulatorsHistoryControllerSoapPort;

  accumulatorsFilter := ENAccumulatorsHistoryFilter.Create;
  SetNullIntProps(accumulatorsFilter);
  SetNullXSProps(accumulatorsFilter);
  accumulatorsFilter.conditionSQL := 'enaccumulators.installstatusrefcode = 1 and enaccumulatorshistory.uninstalldate is null';
  accumulatorsFilter.transportRealRef := TKTransportRealRef.Create;
  accumulatorsFilter.transportRealRef.code := TKTransportRealObj.code;

  try
     ENAccumulatorsHistoryList := TempENAccumulatorsHistory.getScrollableFilteredList(ENAccumulatorsHistoryFilter(accumulatorsFilter),0,-1);
  finally
     accumulatorsFilter.Free;
  end;

  LastCount := High(ENAccumulatorsHistoryList.list);

  if LastCount > -1 then
     sgENAccumulators.RowCount:=LastCount+2
  else
     sgENAccumulators.RowCount:=2;

          { 'Код'
            ,'наименование агрегата'
            ,'марка или тип'
            ,'гаражный №'
            ,'заводской №'
            ,'дата установки'
            ,'дата снятия'
            ,'пройдено на данном автомобиле м/час'
            ,'продено с начала эксплуатации м/час'
            ,'причина выхода из эксплуатации'
          }

   with sgENAccumulators do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENAccumulatorsHistoryList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENAccumulatorsHistoryList.list[i].code)
        else
        Cells[0,i+1] := '';

        Cells[1,i+1] := ENAccumulatorsHistoryList.list[i].accumulatorsRefName;
        Cells[2,i+1] := ENAccumulatorsHistoryList.list[i].accumulatorsRefTypeName;
        Cells[3,i+1] := ENAccumulatorsHistoryList.list[i].accumulatorsRefGarageNumber;
        Cells[4,i+1] := ENAccumulatorsHistoryList.list[i].accumulatorsRefSerialNumber;

        if ENAccumulatorsHistoryList.list[i].installDate = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := XSDate2String(ENAccumulatorsHistoryList.list[i].installDate);
        if ENAccumulatorsHistoryList.list[i].uninstallDate = nil then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := XSDate2String(ENAccumulatorsHistoryList.list[i].uninstallDate);

        if ENAccumulatorsHistoryList.list[i].distance = nil then
          Cells[7,i+1] := '0'
        else
          Cells[7,i+1] := ENAccumulatorsHistoryList.list[i].distance.DecimalString;

        if ENAccumulatorsHistoryList.list[i].accumulatorsRefMileageAll = nil then
          Cells[8,i+1] := '0'
        else
          Cells[8,i+1] := ENAccumulatorsHistoryList.list[i].accumulatorsRefMileageAll.DecimalString;

        Cells[9,i+1] := ENAccumulatorsHistoryList.list[i].replacementReason;

        LastRow:=i+1;
        sgENAccumulators.RowCount:=LastRow+1;
      end;
   sgENAccumulators.Row:=1;

  end
  else
  //--------------------------------------------------------------------------------

  if pcTransportReal.ActivePage = tsAutoTires then 
  begin
  SetGridHeaders(ENAutoTiresHistoryHeaders, sgENAutoTires.ColumnHeaders);

  ClearGrid(sgENAutoTires);

  TempENAutoTiresHistory := HTTPRIOENAutoTiresHistory as ENAutoTiresHistoryControllerSoapPort;

  tiresFilter := ENAutoTiresHistoryFilter.Create;
  SetNullIntProps(tiresFilter);
  SetNullXSProps(tiresFilter);
  tiresFilter.conditionSQL := 'enautotires.installstatusrefcode = 1 and enautotireshistory.uninstalldate is null';
  tiresFilter.transportRealRef := TKTransportRealRef.Create;
  tiresFilter.transportRealRef.code := TKTransportRealObj.code;

  try
     ENAutoTiresHistoryList := TempENAutoTiresHistory.getScrollableFilteredList(ENAutoTiresHistoryFilter(tiresFilter),0,-1);
  finally
     tiresFilter.Free;
  end;

  LastCount:=High(ENAutoTiresHistoryList.list);

  if LastCount > -1 then
     sgENAutoTires.RowCount:=LastCount+2
  else
     sgENAutoTires.RowCount:=2;

   with sgENAutoTires do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;

        {( 'Код'
          ,'серийный №'
          ,'гаражный №'
          ,'наименование'
          ,'дата монтажа'
          ,'дата демонтажа'
          ,'место установки'
          ,'пробег на данном автомобиле'
          ,'пробег с начала эксплуатации'
          ,'причина выхода из эксплуатации'
        );}


        if ENAutoTiresHistoryList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENAutoTiresHistoryList.list[i].code)
        else
        Cells[0,i+1] := '';

        Cells[1,i+1] := ENAutoTiresHistoryList.list[i].tiresRefSerialNumber;
        Cells[2,i+1] := ENAutoTiresHistoryList.list[i].tiresRefGarageNumber;
        Cells[3,i+1] := ENAutoTiresHistoryList.list[i].tiresRefTypeName;

        if ENAutoTiresHistoryList.list[i].installDate = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := XSDate2String(ENAutoTiresHistoryList.list[i].installDate);

        if ENAutoTiresHistoryList.list[i].uninstallDate = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := XSDate2String(ENAutoTiresHistoryList.list[i].uninstallDate);

        Cells[6,i+1] := ENAutoTiresHistoryList.list[i].installPlacesRefName;

        if ENAutoTiresHistoryList.list[i].distance = nil then
          Cells[7,i+1] := '0'
        else
          Cells[7,i+1] := ENAutoTiresHistoryList.list[i].distance.DecimalString;

        if ENAutoTiresHistoryList.list[i].tiresRefDistanceAll = nil then
          Cells[8,i+1] := '0'
        else
          Cells[8,i+1] := ENAutoTiresHistoryList.list[i].tiresRefDistanceAll.DecimalString;

        Cells[9,i+1] := ENAutoTiresHistoryList.list[i].replacementReason;

        if ENAutoTiresHistoryList.list[i].tiresRefCode <> Low(Integer) then
          Cells[10,i+1] := IntToStr(ENAutoTiresHistoryList.list[i].tiresRefCode)
        else
          Cells[10,i+1] := '';

        LastRow:=i+1;
        sgENAutoTires.RowCount:=LastRow+1;
      end;
   sgENAutoTires.Row:=1;

  end
    //--------------------------------------------------------------------------------
  else
  if pcTransportReal.ActivePage = tsTKTransportRealHistory then
  begin
  SetGridHeaders(TKTransportRealHistoryHeaders, sgTKTransportRealHistory.ColumnHeaders);

  ClearGrid(sgTKTransportRealHistory);

  TempTKTransportRealHistory := HTTPRIOTKTransportRealHistory as TKTransportRealHistoryControllerSoapPort;

  historyFilter := TKTransportRealHistoryFilter.Create;
  SetNullIntProps(historyFilter);
  SetNullXSProps(historyFilter);
  historyFilter.transportRealRef := TKTransportRealRef.Create;
  historyFilter.transportRealRef.code := TKTransportRealObj.code;
  historyFilter.orderBySQL := 'TKTRANSPORTREALHISTORY.DATESTART';

  try
     TKTransportRealHistoryList := TempTKTransportRealHistory.getScrollableFilteredList(historyFilter,0,-1);
  finally
     historyFilter.Free;
  end;

  LastCount:=High(TKTransportRealHistoryList.list);

  if LastCount > -1 then
     sgTKTransportRealHistory.RowCount:=LastCount+2
  else
     sgTKTransportRealHistory.RowCount:=2;

   with sgTKTransportRealHistory do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;

        if TKTransportRealHistoryList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(TKTransportRealHistoryList.list[i].code)
        else
        Cells[0,i+1] := '';

        Cells[1,i+1] := TKTransportRealHistoryList.list[i].finMolCode;
        Cells[2,i+1] := TKTransportRealHistoryList.list[i].finMolName;

        Cells[3,i+1] := TKTransportRealHistoryList.list[i].departmentRefShortName;
        Cells[4,i+1] := TKTransportRealHistoryList.list[i].transportdepartmentRefName;

        Cells[5,i+1] := TKTransportRealHistoryList.list[i].gosNumber;

        if TKTransportRealHistoryList.list[i].reg_id <> Low(Integer) then
        Cells[6,i+1] := IntToStr(TKTransportRealHistoryList.list[i].reg_id)
        else
        Cells[6,i+1] := '';

        if TKTransportRealHistoryList.list[i].hasStarter = TKTRANSPORTREAL_HASSTARTER then
        Cells[7,i+1] := 'наявний'
        else
        Cells[7,i+1] := '';

        Cells[8,i+1] := TKTransportRealHistoryList.list[i].fuelTypeName;

        if TKTransportRealHistoryList.list[i].dateStart = nil then
          Cells[9,i+1] := ''
        else
          Cells[9,i+1] := XSDate2String(TKTransportRealHistoryList.list[i].dateStart);

        if TKTransportRealHistoryList.list[i].dateFinal = nil then
          Cells[10,i+1] := ''
        else
          Cells[10,i+1] := XSDate2String(TKTransportRealHistoryList.list[i].dateFinal);

        LastRow:=i+1;
        sgTKTransportRealHistory.RowCount:=LastRow+1;
      end;
   sgTKTransportRealHistory.Row:=1;

  end

  else

  if pcTransportReal.ActivePage = tsTKTransportReal2TKFuelKoef then
  begin
  SetGridHeaders(TKTransportReal2TKFuelKoefHeaders, sgTKTransportReal2TKFuelKoef.ColumnHeaders);

  ClearGrid(sgTKTransportReal2TKFuelKoef);

  TempTKTransportReal2TKFuelKoef := HTTPRIOTKTransportReal2TKFuelKoef as TKTransportReal2TKFuelKoefControllerSoapPort;

  transport2koefFilter := TKTransportReal2TKFuelKoefFilter.Create;
  SetNullIntProps(transport2koefFilter);
  SetNullXSProps(transport2koefFilter);
  transport2koefFilter.transportRealRef := TKTransportRealRef.Create;
  transport2koefFilter.transportRealRef.code := TKTransportRealObj.code;

  try
     TKTransportReal2TKFuelKoefList := TempTKTransportReal2TKFuelKoef.getScrollableFilteredList(transport2koefFilter,0,-1);
  finally
     transport2koefFilter.Free;
  end;

  LastCount:=High(TKTransportReal2TKFuelKoefList.list);

  if LastCount > -1 then
     sgTKTransportReal2TKFuelKoef.RowCount:=LastCount+2
  else
     sgTKTransportReal2TKFuelKoef.RowCount:=2;

   with sgTKTransportReal2TKFuelKoef do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;

        if TKTransportReal2TKFuelKoefList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(TKTransportReal2TKFuelKoefList.list[i].code)
        else
        Cells[0,i+1] := '';

        Cells[1,i+1] := TKTransportReal2TKFuelKoefList.list[i].tkFuelKoefRefName;

        if TKTransportReal2TKFuelKoefList.list[i].tkFuelKoefRefKoef = nil then
          Cells[2,i+1] := '0'
        else
          Cells[2,i+1] := TKTransportReal2TKFuelKoefList.list[i].tkFuelKoefRefKoef.DecimalString;


        LastRow:=i+1;
        sgTKTransportReal2TKFuelKoef.RowCount:=LastRow+1;
      end;
   sgTKTransportReal2TKFuelKoef.Row:=1;

  end;



end;


procedure TfrmTKTransportRealEdit.sgENAccumulatorsDblClick(
  Sender: TObject);
var TempENAccumulators: ENAccumulatorsControllerSoapPort;
begin
    TempENAccumulators := HTTPRIOENAccumulators as ENAccumulatorsControllerSoapPort;
    try
      ENAccumulatorsObj := TempENAccumulators.getObject(StrToInt(sgENAccumulators.Cells[0, sgENAccumulators.Row]));

    except
      on EConvertError do Exit;
    end;

    frmENAccumulatorsEdit := TfrmENAccumulatorsEdit.Create(Application, dsView);
    try
      if frmENAccumulatorsEdit.ShowModal= mrOk then
      begin
        //TempENAccumulators.save(ENAccumulatorsObj);
        //UpdateGrid(Sender);
      end;
    finally
      frmENAccumulatorsEdit.Free;
      frmENAccumulatorsEdit := nil;
    end;
end;


procedure TfrmTKTransportRealEdit.btnInstallTiresClick(Sender: TObject);
begin
  if TKTransportRealObj = nil then Exit;

  frmENAutoTiresInstallationEdit := TfrmENAutoTiresInstallationEdit.Create(Application, dsEdit);

  DenyBlankValues([frmENAutoTiresInstallationEdit.edtTiresSerialNumber, frmENAutoTiresInstallationEdit.edtTiresTypeName,
                   frmENAutoTiresInstallationEdit.cbENTiresInstallPlaces, frmENAutoTiresInstallationEdit.edtInstallDate,
                   frmENAutoTiresInstallationEdit.edtActNumber]);
  DisableControls([frmENAutoTiresInstallationEdit.edtInvNumber, frmENAutoTiresInstallationEdit.edtInvNumber,
                   frmENAutoTiresInstallationEdit.edtBuhName, frmENAutoTiresInstallationEdit.edtGosNumber,
                   frmENAutoTiresInstallationEdit.spbTKTransportReal, frmENAutoTiresInstallationEdit.edtTiresTypeName]);

  frmENAutoTiresInstallationEdit.transportRealCode := TKTransportRealObj.code;
  frmENAutoTiresInstallationEdit.edtInvNumber.Text := TKTransportRealObj.invNumber;
  frmENAutoTiresInstallationEdit.edtBuhName.Text := TKTransportRealObj.name;
  frmENAutoTiresInstallationEdit.edtGosNumber.Text := TKTransportRealObj.gosNumber;
  frmENAutoTiresInstallationEdit.lblUninstallReason.Visible := False;
  frmENAutoTiresInstallationEdit.edtUninstallReason.Visible := False;
  frmENAutoTiresInstallationEdit.edtInstallDate.DateTime := SysUtils.Date;
  frmENAutoTiresInstallationEdit.edtInstallDate.checked := False;
  frmENAutoTiresInstallationEdit.edtUninstallDate.Visible := False;
  frmENAutoTiresInstallationEdit.lblUninstallDate.Visible := False;
  frmENAutoTiresInstallationEdit.btnGo.Caption := 'Установить';

  with frmENAutoTiresInstallationEdit do
    try
      if frmENAutoTiresInstallationEdit.ShowModal= mrOk then
      begin
        UpdateGrid(Sender);
      end;
    finally
      frmENAutoTiresInstallationEdit.Free;
      frmENAutoTiresInstallationEdit := nil;
    end;
end;

procedure TfrmTKTransportRealEdit.sgENAutoTiresDblClick(Sender: TObject);
var TempENAutoTires: ENAutoTiresControllerSoapPort;
begin
    TempENAutoTires := HTTPRIOENAutoTires as ENAutoTiresControllerSoapPort;
    try
      ENAutoTiresObj := TempENAutoTires.getObject(StrToInt(sgENAutoTires.Cells[10, sgENAutoTires.Row]));

    except
      on EConvertError do Exit;
    end;

    frmENAutoTiresEdit := TfrmENAutoTiresEdit.Create(Application, dsView);

    try

       try
         frmENAutoTiresEdit.ENAutoTiresObj := ENAutoTiresObj;
       except
         on EConvertError do Exit;
       end;

       frmENAutoTiresEdit.ShowModal;

    finally
      frmENAutoTiresEdit.Free;
      frmENAutoTiresEdit := nil;
    end;
end;


procedure TfrmTKTransportRealEdit.btnUninstallTiresClick(Sender: TObject);
begin
  if TKTransportRealObj = nil then Exit;

  //if LastCount = -1 then Exit;

  frmENAutoTiresInstallationEdit := TfrmENAutoTiresInstallationEdit.Create(Application, dsEdit);

  DenyBlankValues([frmENAutoTiresInstallationEdit.edtTiresSerialNumber, frmENAutoTiresInstallationEdit.edtTiresTypeName,
                   frmENAutoTiresInstallationEdit.cbENTiresInstallPlaces, frmENAutoTiresInstallationEdit.edtInstallDate,
                   frmENAutoTiresInstallationEdit.edtActNumber]);
  DisableControls([frmENAutoTiresInstallationEdit.edtInvNumber, frmENAutoTiresInstallationEdit.edtInvNumber,
                   frmENAutoTiresInstallationEdit.edtBuhName, frmENAutoTiresInstallationEdit.edtGosNumber,
                   frmENAutoTiresInstallationEdit.spbTKTransportReal, frmENAutoTiresInstallationEdit.edtTiresTypeName,
                   frmENAutoTiresInstallationEdit.edtInstallDate]);

  frmENAutoTiresInstallationEdit.transportRealCode := TKTransportRealObj.code;
  frmENAutoTiresInstallationEdit.edtInvNumber.Text := TKTransportRealObj.invNumber;
  frmENAutoTiresInstallationEdit.edtBuhName.Text := TKTransportRealObj.name;
  frmENAutoTiresInstallationEdit.edtGosNumber.Text := TKTransportRealObj.gosNumber;
  frmENAutoTiresInstallationEdit.lblUninstallReason.Visible := True;
  frmENAutoTiresInstallationEdit.edtUninstallReason.Visible := True;
  frmENAutoTiresInstallationEdit.edtUninstallDate.DateTime := SysUtils.Date;
  frmENAutoTiresInstallationEdit.edtUninstallDate.checked := True;
  frmENAutoTiresInstallationEdit.btnGo.Caption := 'Снять';
  frmENAutoTiresInstallationEdit.tiresHistoryCode := StrToInt(sgENAutoTires.Cells[0, sgENAutoTires.Row]);

  with frmENAutoTiresInstallationEdit do
    try
      if frmENAutoTiresInstallationEdit.ShowModal= mrOk then
      begin
        UpdateGrid(Sender);
      end;
    finally
      frmENAutoTiresInstallationEdit.Free;
      frmENAutoTiresInstallationEdit := nil;
    end;
end;


procedure TfrmTKTransportRealEdit.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
  if pcTransportReal.ActivePage = tsAutoTires then
  begin
     for i:=1 to sgENAutoTires.RowCount-1 do
       for j:=0 to sgENAutoTires.ColCount-1 do
         sgENAutoTires.Cells[j,i]:='';
  end;

  if pcTransportReal.ActivePage = tsAccumulators then
  begin
     for i:=1 to sgENAccumulators.RowCount-1 do
       for j:=0 to sgENAccumulators.ColCount-1 do
         sgENAccumulators.Cells[j,i]:='';
  end;

  if pcTransportReal.ActivePage = tsTKTransportReal2TKFuelKoef then
  begin
     for i:=1 to sgTKTransportReal2TKFuelKoef.RowCount-1 do
       for j:=0 to sgTKTransportReal2TKFuelKoef.ColCount-1 do
         sgTKTransportReal2TKFuelKoef.Cells[j,i]:='';
  end;

  pcTransportRealChange(Sender);
end;


procedure TfrmTKTransportRealEdit.btnInstallAccumulatorClick(
  Sender: TObject);
begin
  if TKTransportRealObj = nil then Exit;

  frmENAccumulatorInstallationEdit := TfrmENAccumulatorInstallationEdit.Create(Application, dsEdit);

  DenyBlankValues([frmENAccumulatorInstallationEdit.edtAccumulatorSerialNumber, frmENAccumulatorInstallationEdit.edtAccumulatorTypeName,
                   frmENAccumulatorInstallationEdit.edtInstallDate]);
  DisableControls([frmENAccumulatorInstallationEdit.edtInvNumber, frmENAccumulatorInstallationEdit.edtInvNumber,
                   frmENAccumulatorInstallationEdit.edtBuhName, frmENAccumulatorInstallationEdit.edtGosNumber,
                   frmENAccumulatorInstallationEdit.spbTKTransportReal, frmENAccumulatorInstallationEdit.edtAccumulatorTypeName]);

  frmENAccumulatorInstallationEdit.transportRealCode := TKTransportRealObj.code;
  frmENAccumulatorInstallationEdit.edtInvNumber.Text := TKTransportRealObj.invNumber;
  frmENAccumulatorInstallationEdit.edtBuhName.Text := TKTransportRealObj.name;
  frmENAccumulatorInstallationEdit.edtGosNumber.Text := TKTransportRealObj.gosNumber;
  frmENAccumulatorInstallationEdit.lblUninstallReason.Visible := False;
  frmENAccumulatorInstallationEdit.edtUninstallReason.Visible := False;
  frmENAccumulatorInstallationEdit.edtInstallDate.DateTime := SysUtils.Date;
  frmENAccumulatorInstallationEdit.edtInstallDate.checked := False;
  frmENAccumulatorInstallationEdit.edtUninstallDate.Visible := False;
  frmENAccumulatorInstallationEdit.lblUninstallDate.Visible := False;
  frmENAccumulatorInstallationEdit.btnGo.Caption := 'Установить';

  with frmENAccumulatorInstallationEdit do
    try
      if frmENAccumulatorInstallationEdit.ShowModal= mrOk then
      begin
        UpdateGrid(Sender);
      end;
    finally
      frmENAccumulatorInstallationEdit.Free;
      frmENAccumulatorInstallationEdit := nil;
    end;
end;

procedure TfrmTKTransportRealEdit.btnUninstallAccumulatorClick(
  Sender: TObject);
begin
  if TKTransportRealObj = nil then Exit;

  //if LastCount = -1 then Exit;

  frmENAccumulatorInstallationEdit := TfrmENAccumulatorInstallationEdit.Create(Application, dsEdit);

  DenyBlankValues([frmENAccumulatorInstallationEdit.edtAccumulatorSerialNumber, frmENAccumulatorInstallationEdit.edtAccumulatorTypeName,
                   frmENAccumulatorInstallationEdit.edtInstallDate]);
  DisableControls([frmENAccumulatorInstallationEdit.edtInvNumber, frmENAccumulatorInstallationEdit.edtInvNumber,
                   frmENAccumulatorInstallationEdit.edtBuhName, frmENAccumulatorInstallationEdit.edtGosNumber,
                   frmENAccumulatorInstallationEdit.spbTKTransportReal, frmENAccumulatorInstallationEdit.edtAccumulatorTypeName,
                   frmENAccumulatorInstallationEdit.edtInstallDate]);

  frmENAccumulatorInstallationEdit.transportRealCode := TKTransportRealObj.code;
  frmENAccumulatorInstallationEdit.edtInvNumber.Text := TKTransportRealObj.invNumber;
  frmENAccumulatorInstallationEdit.edtBuhName.Text := TKTransportRealObj.name;
  frmENAccumulatorInstallationEdit.edtGosNumber.Text := TKTransportRealObj.gosNumber;
  frmENAccumulatorInstallationEdit.lblUninstallReason.Visible := True;
  frmENAccumulatorInstallationEdit.edtUninstallReason.Visible := True;
  frmENAccumulatorInstallationEdit.edtUninstallDate.DateTime := SysUtils.Date;
  frmENAccumulatorInstallationEdit.edtUninstallDate.checked := True;
  frmENAccumulatorInstallationEdit.btnGo.Caption := 'Снять';
  frmENAccumulatorInstallationEdit.acmHistoryCode := StrToInt(sgENAccumulators.Cells[0, sgENAccumulators.Row]);

  with frmENAccumulatorInstallationEdit do
    try
      if frmENAccumulatorInstallationEdit.ShowModal= mrOk then
      begin
        UpdateGrid(Sender);
      end;
    finally
      frmENAccumulatorInstallationEdit.Free;
      frmENAccumulatorInstallationEdit := nil;
    end;
end;

procedure TfrmTKTransportRealEdit.ClearGrid(AGrid: TStringGrid);
var i, j: Integer;
begin
  for i:=1 to AGrid.RowCount-1 do
    for j:=0 to AGrid.ColCount-1 do
      AGrid.Cells[j,i]:='';
end;

procedure TfrmTKTransportRealEdit.btnTKTransportRealHistoryChangeClick(
  Sender: TObject);
var
  ObjCode : Integer;
  frmTKTransportRealHistoryEdit : TfrmTKTransportRealHistoryEdit;
  TempTKTransportRealHistory : TKTransportRealHistoryControllerSoapPort;
  historyObj : TKTransportRealHistory;
begin
  inherited;
  if TKTransportRealObj = nil then exit;

    try
    ObjCode := StrToInt(sgTKTransportRealHistory.Cells[0,sgTKTransportRealHistory.Row]);
  except
    on EConvertError do Exit;
  end;

  TempTKTransportRealHistory := HTTPRIOTKTransportRealHistory as TKTransportRealHistoryControllerSoapPort;
  historyObj := TempTKTransportRealHistory.getObject(ObjCode);

  frmTKTransportRealHistoryEdit := TfrmTKTransportRealHistoryEdit.Create(Application, dsEdit);

  try
       try
       frmTKTransportRealHistoryEdit.TKTransportRealHistoryObj := historyObj;
     except
     on EConvertError do Exit;
    end;

   if frmTKTransportRealHistoryEdit.ShowModal= mrOk then
      begin
        UpdateGrid(Sender);
      end;
   finally
    frmTKTransportRealHistoryEdit.Free;
    frmTKTransportRealHistoryEdit:=nil;
  end;


end;

procedure TfrmTKTransportRealEdit.btnTKTransportRealHistoryRemoveClick(
  Sender: TObject);
var
  ObjCode : Integer;
  TempTKTransportRealHistory : TKTransportRealHistoryControllerSoapPort;
begin
  inherited;
  TempTKTransportRealHistory := HTTPRIOTKTransportRealHistory as TKTransportRealHistoryControllerSoapPort;

      try
    ObjCode := StrToInt(sgTKTransportRealHistory.Cells[0,sgTKTransportRealHistory.Row]);
  except
    on EConvertError do Exit;
  end;

     if Application.MessageBox(PChar('Ви дійсно бажаєте видалити запис з історії змін автотранспорту ?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
     begin
        TempTKTransportRealHistory.remove(ObjCode);
        UpdateGrid(Sender);
    end;
    
end;

procedure TfrmTKTransportRealEdit.actDeleteRepairExecute(Sender: TObject);
Var TempENTransportRealRepair: ENTransportRealRepairControllerSoapPort;
  ObjCode: Integer;
begin
 TempENTransportRealRepair := HTTPRIOENTransportRealRepair as ENTransportRealRepairControllerSoapPort;
   try
     ObjCode := StrToInt(sgENTransportRealRepair.Cells[0,sgENTransportRealRepair.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Ремонт транспорта) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENTransportRealRepair.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmTKTransportRealEdit.actEditRepairExecute(Sender: TObject);
var
  TempENTransportRealRepair: ENTransportRealRepairControllerSoapPort;
begin
  TempENTransportRealRepair := HTTPRIOENTransportRealRepair as ENTransportRealRepairControllerSoapPort;
  try
    ENTransportRealRepairObj := TempENTransportRealRepair.getObject(StrToInt(sgENTransportRealRepair.Cells[0,sgENTransportRealRepair.Row]));
  except
    on EConvertError do Exit;
  end;

  //selectedRow := sgENTransportRealRepair.Row;
  frmENTransportRealRepairEdit:=TfrmENTransportRealRepairEdit.Create(Application, dsEdit);
  frmENTransportRealRepairEdit.edtTKTransportRealRealTransportName.Text := TKTransportRealObj.name;
  HideControls([frmENTransportRealRepairEdit.spbTKTransportRealRealTransport]);
  DisableControls([frmENTransportRealRepairEdit.edtTKTransportRealRealTransportName , frmENTransportRealRepairEdit.edtCode ]);

  try
    if frmENTransportRealRepairEdit.ShowModal= mrOk then
      begin

       actUpdateRepairExecute(Sender);
      end;
  finally
    frmENTransportRealRepairEdit.Free;
    frmENTransportRealRepairEdit:=nil;
  end;

//  if sgENTransportRealRepair.RowCount > selectedRow then
//    sgENTransportRealRepair.Row := selectedRow
//  else
    sgENTransportRealRepair.Row := sgENTransportRealRepair.RowCount - 1;

end;

procedure TfrmTKTransportRealEdit.actInsertRepairExecute(Sender: TObject);
// Var TempENTransportRealRepair: ENTransportRealRepairControllerSoapPort;
begin
  // TempENTransportRealRepair := HTTPRIOENTransportRealRepair as ENTransportRealRepairControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENTransportRealRepairObj:=ENTransportRealRepair.Create;
  SetNullIntProps(ENTransportRealRepairObj);
  SetNullXSProps(ENTransportRealRepairObj);
//
//   ENTransportRealRepairObj.dateStart:= TXSDate.Create;
//   ENTransportRealRepairObj.dateFinal:= TXSDate.Create;
//   ENTransportRealRepairObj.dateEdit:= TXSDateTime.Create;
   ENTransportRealRepairObj.realTransport := TKTransportReal.Create;
   ENTransportRealRepairObj.realTransport.code := TKTransportRealObj.code;





  try
    frmENTransportRealRepairEdit:=TfrmENTransportRealRepairEdit.Create(Application, dsInsert);
    frmENTransportRealRepairEdit.edtTKTransportRealRealTransportName.Text := TKTransportRealObj.name;
    HideControls([frmENTransportRealRepairEdit.spbTKTransportRealRealTransport]);
    DisableControls([frmENTransportRealRepairEdit.edtTKTransportRealRealTransportName , frmENTransportRealRepairEdit.edtCode ]);
    try
      if frmENTransportRealRepairEdit.ShowModal = mrOk then
      begin
        if ENTransportRealRepairObj<>nil then
            //TempENTransportRealRepair.add(ENTransportRealRepairObj);
            actUpdateRepairExecute(Sender);
      end;
    finally
      frmENTransportRealRepairEdit.Free;
      frmENTransportRealRepairEdit:=nil;
    end;
  finally
    ENTransportRealRepairObj.Free;

  end;
end;

procedure TfrmTKTransportRealEdit.actUpdateRepairExecute(Sender: TObject);
var
  TempENTransportRealRepair: ENTransportRealRepairControllerSoapPort;
  i , h , j  , LastCount  , LastRow : Integer;
  ENTransportRealRepairList: ENTransportRealRepairShortList;
  rlTranspFil : ENTransportRealRepairFilter;
begin
  SetGridHeaders(ENTransportRealRepairHeaders, sgENTransportRealRepair.ColumnHeaders);
  for h:=1 to sgENTransportRealRepair.RowCount-1 do
   for j:=0 to sgENTransportRealRepair.ColCount-1 do
     sgENTransportRealRepair.Cells[j,h]:='';

  TempENTransportRealRepair :=  HTTPRIOENTransportRealRepair as ENTransportRealRepairControllerSoapPort;

     rlTranspFil := ENTransportRealRepairFilter.Create;
     SetNullIntProps(rlTranspFil);
     SetNullXSProps(rlTranspFil);

     rlTranspFil.realTransport:= TKTransportReal.Create;
     rlTranspFil.realTransport.code := TKTransportRealObj.code;

  ENTransportRealRepairList := TempENTransportRealRepair.getScrollableFilteredList(rlTranspFil,0,-1);
  LastCount:=High(ENTransportRealRepairList.list);

  if LastCount > -1 then
     sgENTransportRealRepair.RowCount:=LastCount+2
  else
     sgENTransportRealRepair.RowCount:=2;

   with sgENTransportRealRepair do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENTransportRealRepairList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENTransportRealRepairList.list[i].code)
        else
        Cells[0,i+1] := '';
        if ENTransportRealRepairList.list[i].dateStart = nil then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := XSDate2String(ENTransportRealRepairList.list[i].dateStart);
        if ENTransportRealRepairList.list[i].dateFinal = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDate2String(ENTransportRealRepairList.list[i].dateFinal);
        Cells[3,i+1] := ENTransportRealRepairList.list[i].userGen;
        if ENTransportRealRepairList.list[i].dateEdit = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := XSDateTimeWithDate2String(ENTransportRealRepairList.list[i].dateEdit);
        LastRow:=i+1;
        sgENTransportRealRepair.RowCount:=LastRow+1;
      end;

    sgENTransportRealRepair.Row:=1;

    sgENTransportRealRepair.Row:=1;
end;

procedure TfrmTKTransportRealEdit.actViewRepairExecute(Sender: TObject);
var
  TempENTransportRealRepair: ENTransportRealRepairControllerSoapPort;
begin
  TempENTransportRealRepair := HTTPRIOENTransportRealRepair as ENTransportRealRepairControllerSoapPort;
  try
    ENTransportRealRepairObj := TempENTransportRealRepair.getObject(StrToInt(sgENTransportRealRepair.Cells[0,sgENTransportRealRepair.Row]));
  except
    on EConvertError do Exit;
  end;

  selectedRowRepair := sgENTransportRealRepair.Row;
  frmENTransportRealRepairEdit:=TfrmENTransportRealRepairEdit.Create(Application, dsView);

  try
    frmENTransportRealRepairEdit.ShowModal;
  finally
    frmENTransportRealRepairEdit.Free;
    frmENTransportRealRepairEdit:=nil;
  end;

  if sgENTransportRealRepair.RowCount > selectedRowRepair then
    sgENTransportRealRepair.Row := selectedRowRepair
  else
    sgENTransportRealRepair.Row := sgENTransportRealRepair.RowCount - 1;

end;

procedure TfrmTKTransportRealEdit.btnAddFuelKoefClick(Sender: TObject);
var
  //TempTKFuelKoef1 : TKFuelKoefControllerSoapPort;
  TempTKTransportReal2TKFuelKoef : TKTransportReal2TKFuelKoefControllerSoapPort;
  fuelKoefFilter : TKFuelKoefFilter;
  transport2koefObj : TKTransportReal2TKFuelKoef;
  frmTKFuelKoefShow: TfrmTKFuelKoefShow;
begin
    TempTKTransportReal2TKFuelKoef := HTTPRIOTKTransportReal2TKFuelKoef as TKTransportReal2TKFuelKoefControllerSoapPort;
     fuelKoefFilter := TKFuelKoefFilter.Create;
     SetNullIntProps(fuelKoefFilter);
     SetNullXSProps(fuelKoefFilter);
     fuelKoefFilter.tkFuelKoefTypeRef := TKFuelKoefTypeRef.Create;
     fuelKoefFilter.tkFuelKoefTypeRef.code := ENConsts.TKFUELKOEFTYPE_AUTO;
     fuelKoefFilter.conditionSQL := ' code not in ( ' +
                                 ' select a.tkfuelkoefrefcode ' +
                                 ' from tktransportreal2tkflkf a ' +
                                ' where a.transportrealrefcode = ' + IntToStr(TKTransportRealObj.code) + ')';
      
     frmTKFuelKoefShow := TfrmTKFuelKoefShow.Create(Application, fmNormal, fuelKoefFilter);


  try
      with frmTKFuelKoefShow do begin
       DisableActions([ actNoFilter, actDelete, actFilter, actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try
               transport2koefObj := TKTransportReal2TKFuelKoef.Create;
               transport2koefObj.tkFuelKoefRef := TKFuelKoefRef.Create;
               transport2koefObj.tkFuelKoefRef.code := StrToInt(GetReturnValue(sgTKFuelKoef,0));
               transport2koefObj.transportRealRef := TKTransportRealRef.Create;
               transport2koefObj.transportRealRef.code := TKTransportRealObj.code;
               TempTKTransportReal2TKFuelKoef.add(transport2koefObj);
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmTKFuelKoefShow.Free;
   end;
      UpdateGrid(Sender);

end;

procedure TfrmTKTransportRealEdit.btnGeographClearClick(Sender: TObject);
begin
  TKTransportRealObj.enelement.geoDepartmentRef.code := LOW_INT;
  edtGeograph.Text :='';

end;

procedure TfrmTKTransportRealEdit.btnGeographClick(Sender: TObject);
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
                 TKTransportRealObj.enelement.geoDepartmentRef.code := selected.code;
                 edtGeograph.Text := selected.name;
            end;
          end;
   finally
      frmENGeographicDepartmentShow.Free;
   end;
end;

procedure TfrmTKTransportRealEdit.btnRemoveFuelKoefClick(Sender: TObject);
var
  TempTKTransportReal2TKFuelKoef : TKTransportReal2TKFuelKoefControllerSoapPort;
  ObjCode : Integer;
begin
  inherited;
   TempTKTransportReal2TKFuelKoef := HTTPRIOTKTransportReal2TKFuelKoef as TKTransportReal2TKFuelKoefControllerSoapPort;
   try
    ObjCode := StrToInt(sgTKTransportReal2TKFuelKoef.Cells[0,sgTKTransportReal2TKFuelKoef.Row]);
  except
    on EConvertError do Exit;
  end;

     if Application.MessageBox(PChar('Вы дійсно бажаєте видалити коефіціент для розрахунку палива автотранспорту ?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
     begin
        TempTKTransportReal2TKFuelKoef.remove(ObjCode);
        UpdateGrid(Sender);
    end;

end;

end.
