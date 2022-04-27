
unit ShowENCustomerServices;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit,
    InvokeRegistry, Rio, SOAPHTTPClient,
    ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns,
    DialogFormUnit, DlgUnit, GridHeadersUnit,
    ENCustomerServicesController, AdvObj ;


type
    TfrmENCustomerServicesShow = class(TChildForm)  
    HTTPRIOENCustomerServices: THTTPRIO;
    ImageList1: TImageList;
    sgENCustomerServices: TAdvStringGrid;
    ActionList1: TActionList;
    actUpdate: TAction;
    actFilter: TAction;
    actNoFilter: TAction;
    PopupMenu1: TPopupMenu;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    ToolBar1: TToolBar;
    ToolButton11: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    HTTPRIODFDocSupplyEE: THTTPRIO;
    HTTPRIOENPlanWork: THTTPRIO;
    HTTPRIOCCCall: THTTPRIO;
    HTTPRIODFDocInBox: THTTPRIO;
    HTTPRIODFDocAppeal: THTTPRIO;
    HTTPRIODFDocServicesConsumer: THTTPRIO;
    HTTPRIOENServicesObject: THTTPRIO;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sgENCustomerServicesTopLeftChanged(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
    procedure actNoFilterExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
    procedure sgENCustomerServicesDblClick(Sender: TObject);

  private
   { Private declarations }
   selectedRow : Integer;
 public
   { Public declarations }
   procedure UpdateGrid(Sender: TObject);
 end;

var
 frmENCustomerServicesShow : TfrmENCustomerServicesShow;

  
  
implementation

uses Main, EditENCustomerServicesFilter
  , DFDocSupplyEEController
  , EditDFDocSupplyEE
  , EditDFDocDistributionEE
  , DFConsts
  , ENPlanWorkController
  , DMReportsUnit
  , EditENPlanWork
  , ENConsts
  , CCCallController
  , EditCCCall
  , DFDocInBoxController
  , EditDFDocInBox
  , DFDocAppealController
  , EditDFDocAppeal
  , DFDocServicesConsumerController
  , EditDFDocServicesConsumer
  , ENServicesObjectController
  , EditENServicesCalculation
  , EditENServicesSales
  , EditENServicesConnection
  , EditENServicesRent
  , EditENServicesProject
  , EditENServicesShift
  , EditENServicesGuard
;


{$R *.dfm}

var
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENCustomerServicesHeaders: array [1..14] of String =
        ( 'Код'
          ,'Дата реєстрації'
          ,'№ документа'
          ,'Споживач'
          ,'Адреса споживача'
          ,'Адреса об''єкта'
          ,'Вид послуги'
          ,'Зміст послуги'
          ,'Стан послуги'
          ,'Джерело інформації'
          ,'sourceTable'
          ,'sourceTableCode'
          ,'sourceType'
          ,''
        );
   

procedure TfrmENCustomerServicesShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENCustomerServicesShow:=nil;
  inherited;
end;


procedure TfrmENCustomerServicesShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmENCustomerServicesShow.FormShow(Sender: TObject);
var
  TempENCustomerServices: ENCustomerServicesControllerSoapPort;
  i: Integer;
  ENCustomerServicesList: ENCustomerServicesShortList;
begin
  SetGridHeaders(ENCustomerServicesHeaders, sgENCustomerServices.ColumnHeaders);
  ColCount:=100;
  TempENCustomerServices :=  HTTPRIOENCustomerServices as ENCustomerServicesControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENCustomerServicesFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENCustomerServicesList := TempENCustomerServices.getScrollableFilteredList(ENCustomerServicesFilter(FilterObject),0,ColCount);
  LastCount:=High(ENCustomerServicesList.list);

  if LastCount > -1 then
     sgENCustomerServices.RowCount:=LastCount+2
  else
     sgENCustomerServices.RowCount:=2;

   with sgENCustomerServices do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;

        Cells[0,i+1] := '';

        if ENCustomerServicesList.list[i].dateRegistration = nil then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := XSDate2String(ENCustomerServicesList.list[i].dateRegistration);

        Cells[2,i+1] := ENCustomerServicesList.list[i].docNum;

        Cells[3,i+1] := ENCustomerServicesList.list[i].customerName;
        Cells[4,i+1] := ENCustomerServicesList.list[i].customerAddress;
        Cells[5,i+1] := ENCustomerServicesList.list[i].objectsAddress;


        Cells[6,i+1] := ENCustomerServicesList.list[i].typeName;
        Cells[7,i+1] := ENCustomerServicesList.list[i].serviceName;
        Cells[8,i+1] := ENCustomerServicesList.list[i].docStatus;
        Cells[9,i+1] := ENCustomerServicesList.list[i].sourceInfo;

        Cells[10,i+1] := ENCustomerServicesList.list[i].sourceTable;

        if ENCustomerServicesList.list[i].sourceTableCode <> Low(Integer) then
          Cells[11,i+1] := IntToStr(ENCustomerServicesList.list[i].sourceTableCode)
        else
          Cells[11,i+1] := '';

        if ENCustomerServicesList.list[i].sourceType <> Low(Integer) then
          Cells[12,i+1] := IntToStr(ENCustomerServicesList.list[i].sourceType)
        else
          Cells[12,i+1] := '';


        LastRow:=i+1;
        sgENCustomerServices.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgENCustomerServices.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgENCustomerServices.RowCount > selectedRow then
      sgENCustomerServices.Row := selectedRow
    else
      sgENCustomerServices.Row := sgENCustomerServices.RowCount - 1;
    end
    else
      sgENCustomerServices.Row:=1;   
end;


procedure TfrmENCustomerServicesShow.sgENCustomerServicesDblClick(Sender: TObject);
begin
  inherited;
  actViewExecute(Sender);
end;


procedure TfrmENCustomerServicesShow.sgENCustomerServicesTopLeftChanged(Sender: TObject);
var
  TempENCustomerServices: ENCustomerServicesControllerSoapPort;
  i,CurrentRow: Integer;
  ENCustomerServicesList: ENCustomerServicesShortList;
begin
  if LastCount < 99 then Exit;
  if (sgENCustomerServices.TopRow + sgENCustomerServices.VisibleRowCount) = ColCount
  then
  begin
    TempENCustomerServices :=  HTTPRIOENCustomerServices as ENCustomerServicesControllerSoapPort;
    CurrentRow:=sgENCustomerServices.RowCount;

    if FilterObject = nil then
    begin
       FilterObject := ENCustomerServicesFilter.Create;
       SetNullIntProps(FilterObject);
       SetNullXSProps(FilterObject);
    end;

    ENCustomerServicesList := TempENCustomerServices.getScrollableFilteredList(ENCustomerServicesFilter(FilterObject),ColCount-1, 100);

    sgENCustomerServices.RowCount:=sgENCustomerServices.RowCount+100;
    LastCount:=High(ENCustomerServicesList.list);
    with sgENCustomerServices do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;

        Cells[0,i+CurrentRow] := '';

        if ENCustomerServicesList.list[i].dateRegistration = nil then
          Cells[1,i+CurrentRow] := ''
        else
          Cells[1,i+CurrentRow] := XSDate2String(ENCustomerServicesList.list[i].dateRegistration);

        Cells[2,i+CurrentRow] := ENCustomerServicesList.list[i].docNum;

        Cells[3,i+CurrentRow] := ENCustomerServicesList.list[i].customerName;
        Cells[4,i+CurrentRow] := ENCustomerServicesList.list[i].customerAddress;
        Cells[5,i+CurrentRow] := ENCustomerServicesList.list[i].objectsAddress;

        Cells[6,i+CurrentRow] := ENCustomerServicesList.list[i].typeName;
        Cells[7,i+CurrentRow] := ENCustomerServicesList.list[i].serviceName;
        Cells[8,i+CurrentRow] := ENCustomerServicesList.list[i].docStatus;
        Cells[9,i+CurrentRow] := ENCustomerServicesList.list[i].sourceInfo;

        Cells[10,i+CurrentRow] := ENCustomerServicesList.list[i].sourceTable;

        if ENCustomerServicesList.list[i].sourceTableCode = Low(Integer) then
          Cells[11,i+CurrentRow] := ''
        else
          Cells[11,i+CurrentRow] := IntToStr(ENCustomerServicesList.list[i].sourceTableCode);

        if ENCustomerServicesList.list[i].sourceType = Low(Integer) then
          Cells[12,i+CurrentRow] := ''
        else
          Cells[12,i+CurrentRow] := IntToStr(ENCustomerServicesList.list[i].sourceType);

        LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENCustomerServices.Row:=CurrentRow-5;
   sgENCustomerServices.RowCount:=LastRow+1;
  end;
end;


procedure TfrmENCustomerServicesShow.UpdateGrid(Sender: TObject);
var 
  i, j: Integer;
begin
 for i:=1 to sgENCustomerServices.RowCount-1 do
   for j:=0 to sgENCustomerServices.ColCount-1 do
     sgENCustomerServices.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmENCustomerServicesShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmENCustomerServicesShow.actViewExecute(Sender: TObject);
var
  sourceTableCode, sourceType: Integer;
  sourceTable, sourceInfo: string;
  TempDFDocSupplyEE: DFDocSupplyEEControllerSoapPort;
  TempENPlanWork: ENPlanWorkControllerSoapPort;
  tPlan: ENPlanWork;
  TempCCCall: CCCallControllerSoapPort;
  TempDFDocInBox: DFDocInBoxControllerSoapPort;
  TempDFDocAppeal: DFDocAppealControllerSoapPort;
  TempDFDocServicesConsumer: DFDocServicesConsumerControllerSoapPort;
  TempENServicesCalculation: ENServicesObjectControllerSoapPort;
  CCCallObj: CCCall;
begin
  inherited;
  try
    sourceInfo := sgENCustomerServices.Cells[9,sgENCustomerServices.Row];
    sourceTable := sgENCustomerServices.Cells[10,sgENCustomerServices.Row];
    sourceTableCode := StrToInt(sgENCustomerServices.Cells[11,sgENCustomerServices.Row]);
    sourceType := StrToInt(sgENCustomerServices.Cells[12,sgENCustomerServices.Row]);
  except
    on EConvertError do Exit;
  end;

  if sourceTable = '' then Exit;
  if sourceTableCode = Low(Integer) then Exit;
  if sourceType = Low(Integer) then Exit;

  if sourceTableCode <> Low(Integer) then
  begin

    //**  DocFlow  */
    if sourceInfo = 'DocFlow' then
    begin
      //**  договора постави  */
      if (sourceTable = 'dfdocsupplyee') then
      begin
        //**  Договір про постачання е/е  */
        TempDFDocSupplyEE := HTTPRIODFDocSupplyEE as DFDocSupplyEEControllerSoapPort;
        if (sourceType = DFDOCSUPPLYEETYPE_SUPPLY) then
        begin

          DFDocSupplyEEObj := TempDFDocSupplyEE.getObject(sourceTableCode);
          try
            frmDFDocSupplyEEEdit := TfrmDFDocSupplyEEEdit.Create(Application, dsView);
            frmDFDocSupplyEEEdit.ShowModal;
          finally
            frmDFDocSupplyEEEdit.Free;
            frmDFDocSupplyEEEdit := nil;
          end;

        end else
        //**  Договір про розподіл е/е  */
        if (sourceType = DFDOCSUPPLYEETYPE_DISTRIBUTION) then
        begin

          DFDocDistributionEEObj := TempDFDocSupplyEE.getObject(sourceTableCode);
          try
            frmDFDocDistributionEEEdit := TfrmDFDocDistributionEEEdit.Create(Application, dsView);
            frmDFDocDistributionEEEdit.ShowModal;
          finally
            frmDFDocDistributionEEEdit.Free;
            frmDFDocDistributionEEEdit := nil;
          end;

        end;

      end else
      //**  Вхідна кореспонденція  */
      if (sourceTable = 'dfdocinbox') then
      begin
        TempDFDocInBox := HTTPRIODFDocInBox as DFDocInBoxControllerSoapPort;
        DFDocInBoxObj := TempDFDocInBox.getObject(sourceTableCode);
        try
          frmDFDocInBoxEdit := TfrmDFDocInBoxEdit.Create(Application, dsView);
          frmDFDocInBoxEdit.globalSearch := True;
          frmDFDocInBoxEdit.ShowModal;
        finally
          frmDFDocInBoxEdit.Free;
          frmDFDocInBoxEdit:=nil;
        end;

      end else
      //*  Звернення споживача  */
      if (sourceTable = 'dfdocappeal') then
      begin
        TempDFDocAppeal := HTTPRIODFDocAppeal as DFDocAppealControllerSoapPort;
        DFDocAppealObj := TempDFDocAppeal.getObject(sourceTableCode);
        try
          frmDFDocAppealEdit := TfrmDFDocAppealEdit.Create(Application, dsView);
          frmDFDocAppealEdit.ShowModal;
        finally
          frmDFDocAppealEdit.Free;
          frmDFDocAppealEdit:=nil;
        end;

      end else
      //*  Заява побутового споживача  */
      if (sourceTable = 'dfdocservicesconsumer') then
      begin
        TempDFDocServicesConsumer := HTTPRIODFDocServicesConsumer as DFDocServicesConsumerControllerSoapPort;
        DFDocServicesConsumerObj := TempDFDocServicesConsumer.getObject(sourceTableCode);
        try
          frmDFDocServicesConsumerEdit := TfrmDFDocServicesConsumerEdit.Create(Application, dsView);
          frmDFDocServicesConsumerEdit.ShowModal;
        finally
          frmDFDocServicesConsumerEdit.Free;
          frmDFDocServicesConsumerEdit:=nil;
        end;

      end;

    end else

    //**  EnergyNet  */
    if sourceInfo = 'EnergyNet' then
    begin
      //**  Підключення за заявкою постачальника  */
      if (sourceTable = 'enplanwork') then
      begin
        tPlan := DMReports.getPlanByCode(sourceTableCode);
        if tPlan = nil then
        begin
          Exit;
        end;

        TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

        frmENPlanWorkEdit := TfrmENPlanWorkEdit.Create(Application, dsView);
        frmENPlanWorkEdit.viewPlanWork := PLANWORKSHOW_STANDART;

        if (tPlan.typeRef.code = ENPLANWORKTYPE_TRANSPORT) and (tPlan.stateRef.code = ENPLANWORKSTATE_GSM) then
        frmENPlanWorkEdit.isTransport := True;

        if (tPlan.typeRef.code = ENPLANWORKTYPE_SIZ) then
        frmENPlanWorkEdit.isSiz := True;

        try
          frmENPlanWorkEdit.ENPlanWorkObj := TempENPlanWork.getObject(sourceTableCode);
          frmENPlanWorkEdit.ShowModal;
        finally
          frmENPlanWorkEdit.Free;
          frmENPlanWorkEdit:=nil;
        end;

      end else
      //**  Послуги  */
      if (sourceTable = 'enservicesobject') then
      begin
        TempENServicesCalculation := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;

        //**  1 - ТУ, 2 - Інші  */
        if (sourceType = ENSERVICESOBJECTTYPE_TU) or (sourceType = ENSERVICESOBJECTTYPE_OTHER) then
        begin
          ENServicesObjectObj := TempENServicesCalculation.getObject(sourceTableCode);
          try
            frmENServicesCalculationEdit := TfrmENServicesCalculationEdit.Create(Application, dsView);
            frmENServicesCalculationEdit.ShowModal;
          finally
            frmENServicesCalculationEdit.Free;
            frmENServicesCalculationEdit:=nil;
          end;
        end else

        //**  3 - Продаж  */
        if (sourceType = ENSERVICESOBJECTTYPE_SALE) then
        begin
          ENServicesSaleObj := TempENServicesCalculation.getObject(sourceTableCode);
          try
            frmENServicesSalesEdit := TfrmENServicesSalesEdit.Create(Application, dsView);
            frmENServicesSalesEdit.ShowModal;
          finally
            frmENServicesSalesEdit.Free;
            frmENServicesSalesEdit:=nil;
          end;
        end else

        //**  5 - Приєднання  */
        if (sourceType = ENSERVICESOBJECTTYPE_CONNECTION) then
        begin
          ENServicesConnectionObj := TempENServicesCalculation.getObject(sourceTableCode);
          try
            frmENServicesConnectionEdit := TfrmENServicesConnectionEdit.Create(Application, dsView);
            frmENServicesConnectionEdit.priconnections := True;

            frmENServicesConnectionEdit.ShowModal;
          finally
            frmENServicesConnectionEdit.Free;
            frmENServicesConnectionEdit:=nil;
          end;
        end else

        //**  7 - ОКСН  */
        if (sourceType = ENSERVICESOBJECTTYPE_OKSN) then
        begin
          ENServicesRentObj := TempENServicesCalculation.getObject(sourceTableCode);
          try
            frmENServicesRentEdit := TfrmENServicesRentEdit.Create(Application, dsView);
            frmENServicesRentEdit.rent := True;

            frmENServicesRentEdit.ShowModal;
          finally
            frmENServicesRentEdit.Free;
            frmENServicesRentEdit:=nil;
          end;
        end else

        //**  8 - Проектування  */
        if (sourceType = ENSERVICESOBJECTTYPE_PROJECT) then
        begin
          ENServicesProjectObj := TempENServicesCalculation.getObject(sourceTableCode);
          try
            frmENServicesProjectEdit := TfrmENServicesProjectEdit.Create(Application, dsView);
            frmENServicesProjectEdit.project := True;

            frmENServicesProjectEdit.ShowModal;
          finally
            frmENServicesProjectEdit.Free;
            frmENServicesProjectEdit:=nil;
          end;
        end else

        //**  9 - Договори на виконання робіт  */
        if (sourceType = ENSERVICESOBJECTTYPE_SHIFT_LINES) then
        begin
          ENServicesShiftObj := TempENServicesCalculation.getObject(sourceTableCode);
          try
            frmENServicesShiftEdit := TfrmENServicesShiftEdit.Create(Application, dsView);
            frmENServicesShiftEdit.ShowModal;
          finally
            frmENServicesShiftEdit.Free;
            frmENServicesShiftEdit:=nil;
          end;
        end else

        //**  10 - Охорона  */
        if (sourceType = ENSERVICESOBJECTTYPE_OHRINA) then
        begin
          ENServicesGuardObj := TempENServicesCalculation.getObject(sourceTableCode);
          try
            frmENServicesGuardEdit := TfrmENServicesGuardEdit.Create(Application, dsView);
            frmENServicesGuardEdit.guard := True;

            frmENServicesGuardEdit.ShowModal;
          finally
            frmENServicesGuardEdit.Free;
            frmENServicesGuardEdit:=nil;
          end;
        end;

      end;

    end else

    //**  CallCenter  */
    if sourceInfo = 'CallCenter' then
    begin
      TempCCCall := HTTPRIOCCCall as CCCallControllerSoapPort;
      CCCallObj := TempCCCall.getObject(sourceTableCode);

      frmCCCallEdit := TfrmCCCallEdit.Create(Application, dsView);
      frmCCCallEdit.CCCallObj:=CCCallObj;
      try
        frmCCCallEdit.ShowModal;
      finally
        frmCCCallEdit.Free;
        frmCCCallEdit:=nil;
      end;
    end;

  end;
end;


procedure TfrmENCustomerServicesShow.actFilterExecute(Sender: TObject);
begin
  frmENCustomerServicesFilterEdit := TfrmENCustomerServicesFilterEdit.Create(Application, dsInsert);
  try
    ENCustomerServicesFilterObj := ENCustomerServicesFilter.Create;
    SetNullIntProps(ENCustomerServicesFilterObj);
    SetNullXSProps(ENCustomerServicesFilterObj);

    if frmENCustomerServicesFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      FilterObject := ENCustomerServicesFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENCustomerServicesFilterEdit.Free;
    frmENCustomerServicesFilterEdit:=nil;
  end;
end;


procedure TfrmENCustomerServicesShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
  UpdateGrid(Sender);
end;


end.
