
unit EditSCUsageInputItemOZ;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, SCUsageInputItemOZController, AdvObj ;

type
  TfrmSCUsageInputItemOZEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;


  HTTPRIOSCUsageInputItemOZ: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    ImageList1: TImageList;
    ActionList1: TActionList;
    actView: TAction;
    actInsert: TAction;
    actDelete: TAction;
    actEdit: TAction;
    actUpdate: TAction;
    actFilter: TAction;
    actNoFilter: TAction;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    pcMain: TPageControl;
    tsGeneral: TTabSheet;
    tsSCCounters: TTabSheet;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton11: TToolButton;
    lblNumberDoc: TLabel;
    lblNumberInt: TLabel;
    lblCounterType: TLabel;
    lblAccount: TLabel;
    lblCost: TLabel;
    lblCountGen: TLabel;
    lblScCode: TLabel;
    Label1: TLabel;
    edtNumberDoc: TEdit;
    edtNumberInt: TEdit;
    edtCounterType: TEdit;
    edtAccount: TEdit;
    edtCost: TEdit;
    edtCountGen: TEdit;
    edtScCode: TEdit;
    Edit1: TEdit;
    sgSCCounter: TAdvStringGrid;
    HTTPRIOSCCounter: THTTPRIO;
    actViewPlan: TAction;
    N5: TMenuItem;
    ToolButton2: TToolButton;
    tsPostnigs: TTabSheet;
    sgProvs: TAdvStringGrid;
    HTTPRIOSCUsageInputItemOZ2Prov: THTTPRIO;
    lblBudgetName: TLabel;
    edtBudgetName: TEdit;
    HTTPRIOENDepartment: THTTPRIO;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pcMainChange(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure actViewPlanExecute(Sender: TObject);
    procedure getPostingsList(SCUsageInputItemOZObjCode: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure UpdateGrid(Sender: TObject);
  end;

var
  frmSCUsageInputItemOZEdit: TfrmSCUsageInputItemOZEdit;
  SCUsageInputItemOZObj: SCUsageInputItemOZ;

implementation

uses SCCounterController, EditSCCounter, EditENPlanWork, DMReportsUnit, FKProvObjectController
, ENConsts, ENDepartmentController;


{uses
    EnergyproController, EnergyproController2, SCUsageInputItemOZController  ;
}
{$R *.dfm}

var
  SCCounterHeaders: array [1..16] of String =
        ( 'Код'
          ,'Інв. №'
          ,'Найменування'
          ,'Заводський №'
          ,'Рахунок'
          ,'Підрозділ'
          ,'Код МВО'
          ,'Дата приходу'
          ,'Дата випуску'
          ,'Дата повірки'
          ,'Вартість'
          ,'Код зі ScanCounters'
          ,'Тип лічильника'
          ,'№ наряду на встановлення'
          ,'Показники'
          ,'Дата останньої зміни'
        );

        FKBadProvHeaders: array [1..12] of String =
        ('Код'
         ,'Дата'
         ,'Цех (К)'
         ,'Счет (К)'
         ,'Субсчет (К)'
         ,'КАУ (К)'
         ,'Цех (Д)'
         ,'Счет (Д)'
         ,'Субсчет (Д)'
         ,'КАУ (Д)'
         ,'Сумма'
         ,'Примечание'
        );

procedure TfrmSCUsageInputItemOZEdit.FormShow(Sender: TObject);
var
TempENDepartment : ENDepartmentControllerSoapPort;
BudgetObj : ENDepartment;
begin
  DisableControls([edtCode]);
  SetGridHeaders(SCCounterHeaders, sgSCCounter.ColumnHeaders);
  pcMain.ActivePage := tsGeneral;

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtNumberDoc
      ,edtNumberInt
     ]);
   end;

   TempENDepartment := HTTPRIOENDepartment as ENDepartmentControllerSoapPort;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(SCUsageInputItemOZObj.code);
    edtNumberDoc.Text := SCUsageInputItemOZObj.numberDoc; 
    if ( SCUsageInputItemOZObj.numberInt <> Low(Integer) ) then
       edtNumberInt.Text := IntToStr(SCUsageInputItemOZObj.numberInt)
    else
       edtNumberInt.Text := '';
    edtCounterType.Text := SCUsageInputItemOZObj.counterType; 
    edtAccount.Text := SCUsageInputItemOZObj.account; 
    if ( SCUsageInputItemOZObj.cost <> nil ) then
       edtCost.Text := SCUsageInputItemOZObj.cost.decimalString
    else
       edtCost.Text := ''; 
    if ( SCUsageInputItemOZObj.countGen <> Low(Integer) ) then
       edtCountGen.Text := IntToStr(SCUsageInputItemOZObj.countGen)
    else
       edtCountGen.Text := '';
    if ( SCUsageInputItemOZObj.scCode <> Low(Integer) ) then
       edtScCode.Text := IntToStr(SCUsageInputItemOZObj.scCode)
    else
       edtScCode.Text := '';

    if ( (SCUsageInputItemOZObj.budgetRef <> nil) and (SCUsageInputItemOZObj.budgetRef.code  <> Low(Integer) )) then begin
       BudgetObj := TempENDepartment.getObject(SCUsageInputItemOZObj.budgetRef.code);
       edtBudgetName.Text := BudgetObj.shortName;
    end else
       edtBudgetName.Text := '';
  end;
end;



procedure TfrmSCUsageInputItemOZEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var
TempSCUsageInputItemOZ: SCUsageInputItemOZControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtNumberDoc
      ,edtNumberInt
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempSCUsageInputItemOZ := HTTPRIOSCUsageInputItemOZ as SCUsageInputItemOZControllerSoapPort;

     SCUsageInputItemOZObj.numberDoc := edtNumberDoc.Text; 

     if ( edtNumberInt.Text <> '' ) then
       SCUsageInputItemOZObj.numberInt := StrToInt(edtNumberInt.Text)
     else
       SCUsageInputItemOZObj.numberInt := Low(Integer) ;

     SCUsageInputItemOZObj.counterType := edtCounterType.Text; 

     SCUsageInputItemOZObj.account := edtAccount.Text; 

     if (SCUsageInputItemOZObj.cost = nil ) then
       SCUsageInputItemOZObj.cost := TXSDecimal.Create;
     if edtCost.Text <> '' then
       SCUsageInputItemOZObj.cost.decimalString := edtCost.Text 
     else
       SCUsageInputItemOZObj.cost := nil;

     if ( edtCountGen.Text <> '' ) then
       SCUsageInputItemOZObj.countGen := StrToInt(edtCountGen.Text)
     else
       SCUsageInputItemOZObj.countGen := Low(Integer) ;

     if ( edtScCode.Text <> '' ) then
       SCUsageInputItemOZObj.scCode := StrToInt(edtScCode.Text)
     else
       SCUsageInputItemOZObj.scCode := Low(Integer) ;

    if DialogState = dsInsert then
    begin
      SCUsageInputItemOZObj.code:=low(Integer);
      TempSCUsageInputItemOZ.add(SCUsageInputItemOZObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempSCUsageInputItemOZ.save(SCUsageInputItemOZObj);
    end;
  end;
end;


procedure TfrmSCUsageInputItemOZEdit.UpdateGrid(Sender: TObject);
var i: Integer;
    TempSCCounter: SCCounterControllerSoapPort;
    SCCounterList: SCCounterShortList;
    counterFilter: SCCounterFilter;
begin
  if pcMain.ActivePage = tsSCCounters then
  begin
    ClearGrid(sgSCCounter);

    counterFilter := SCCounterFilter.Create;
    SetNullIntProps(counterFilter);
    SetNullXSProps(counterFilter);
    counterFilter.conditionSQL := 'sccounter.code in ' +
                                  '(select scusageinputtmz2sccntr.sccounterrefcode from scusageinputtmz2sccntr ' +
                                  ' where scusageinputtmz2sccntr.ozrefcode = ' + IntToStr(SCUsageInputItemOZObj.code) + ')';


    TempSCCounter := HTTPRIOSCCounter as SCCounterControllerSoapPort;

    SCCounterList := TempSCCounter.getScrollableFilteredList(counterFilter, 0, -1);

    if High(SCCounterList.list) > -1 then
       sgSCCounter.RowCount := High(SCCounterList.list) + 2
    else
       sgSCCounter.RowCount := 2;

     with sgSCCounter do
      for i:=0 to High(SCCounterList.list) do
        begin
          Application.ProcessMessages;
          if SCCounterList.list[i].code <> Low(Integer) then
            Cells[0,i+1] := IntToStr(SCCounterList.list[i].code)
          else
            Cells[0,i+1] := '';
          Cells[1,i+1] := SCCounterList.list[i].invNumber;
          Cells[2,i+1] := SCCounterList.list[i].name;
          Cells[3,i+1] := SCCounterList.list[i].buildNumber;
          Cells[4,i+1] := SCCounterList.list[i].account;
          Cells[5,i+1] := SCCounterList.list[i].departmetFKCode;
          Cells[6,i+1] := SCCounterList.list[i].molCode;
          if SCCounterList.list[i].dateIn = nil then
            Cells[7,i+1] := ''
          else
            Cells[7,i+1] := XSDate2String(SCCounterList.list[i].dateIn);
          if SCCounterList.list[i].dateBuild = nil then
            Cells[8,i+1] := ''
          else
            Cells[8,i+1] := XSDate2String(SCCounterList.list[i].dateBuild);
          if SCCounterList.list[i].dateCheck = nil then
            Cells[9,i+1] := ''
          else
            Cells[9,i+1] := XSDate2String(SCCounterList.list[i].dateCheck);
          if SCCounterList.list[i].cost = nil then
            Cells[10,i+1] := ''
          else
            Cells[10,i+1] := SCCounterList.list[i].cost.DecimalString;
          if SCCounterList.list[i].scCode = Low(Integer) then
            Cells[11,i+1] := ''
          else
            Cells[11,i+1] := IntToStr(SCCounterList.list[i].scCode);
          Cells[12,i+1] := SCCounterList.list[i].counterType;
          Cells[13,i+1] := SCCounterList.list[i].installOrderNumber;
          Cells[14,i+1] := SCCounterList.list[i].reading;
          if SCCounterList.list[i].dateEdit = nil then
            Cells[15,i+1] := ''
          else
            Cells[15,i+1] := XSDateTimeWithDate2String(SCCounterList.list[i].dateEdit);
          //LastRow:=i+1;
          sgSCCounter.RowCount := i + 2;
        end;
     //ColCount:=ColCount+1;
     sgSCCounter.Row:=1;
  end;
end;

procedure TfrmSCUsageInputItemOZEdit.pcMainChange(Sender: TObject);
begin
  UpdateGrid(Sender);
    if (pcMain.ActivePage= tsPostnigs) then
  begin
     ClearGrid(sgProvs);
     SetGridHeaders(FKBadProvHeaders, sgProvs.ColumnHeaders);
     getPostingsList(SCUsageInputItemOZObj.code );
  end;
end;

procedure TfrmSCUsageInputItemOZEdit.actViewExecute(Sender: TObject);
var TempSCCounter: SCCounterControllerSoapPort;
begin
  if pcMain.ActivePage = tsSCCounters then
  begin
    TempSCCounter := HTTPRIOSCCounter as SCCounterControllerSoapPort;

    try
      SCCounterObj := TempSCCounter.getObject(StrToInt(sgSCCounter.Cells[0, sgSCCounter.Row]));
    except
      on EConvertError do Exit;
    end;

    frmSCCounterEdit := TfrmSCCounterEdit.Create(Application, dsView);
    try
      frmSCCounterEdit.ShowModal;
    finally
      frmSCCounterEdit.Free;
      frmSCCounterEdit:=nil;
    end;
  end;
end;

procedure TfrmSCUsageInputItemOZEdit.actUpdateExecute(Sender: TObject);
begin
  UpdateGrid(Sender);
end;

procedure TfrmSCUsageInputItemOZEdit.actViewPlanExecute(Sender: TObject);
var TempSCCounter: SCCounterControllerSoapPort;
begin
  if pcMain.ActivePage = tsSCCounters then
  begin
    TempSCCounter := HTTPRIOSCCounter as SCCounterControllerSoapPort;

    try
      SCCounterObj := TempSCCounter.getObject(StrToInt(sgSCCounter.Cells[0, sgSCCounter.Row]));
    except
      on EConvertError do Exit;
    end;

    frmENPlanWorkEdit:=TfrmENPlanWorkEdit.Create(Application, dsView);
    try

      try
        frmENPlanWorkEdit.ENPlanWorkObj := DMReports.getPlanByEstimateCode( SCCounterObj.estimateItemRef.code );
      except
        on EConvertError do Exit;
      end;

      frmENPlanWorkEdit.ShowModal;

    finally
      frmENPlanWorkEdit.Free;
      frmENPlanWorkEdit:=nil;
    end;

  end;
end;


procedure TfrmSCUsageInputItemOZEdit.getPostingsList(SCUsageInputItemOZObjCode: Integer);
var i: Integer;
    TempSCUsageInputItemOZ: SCUsageInputItemOZControllerSoapPort;
    provList: FKProvObjectShortList;

begin
  ClearGrid(sgProvs);
  //ClearGrid(sgProvErrorsDetailed);

  if SCUsageInputItemOZObjCode = LOW_INT then Exit;

  TempSCUsageInputItemOZ := HTTPRIOSCUsageInputItemOZ as SCUsageInputItemOZControllerSoapPort;

  provList := TempSCUsageInputItemOZ.getPostingsList(SCUsageInputItemOZObjCode);

  if High(provList.list) > -1 then
    sgProvs.RowCount := High(provList.list) + 2
  else
    sgProvs.RowCount := 2;

  with sgProvs do
    for i := 0 to High(provList.list) do
    begin
       if provList.list[i].id <> Low(Integer) then
        Cells[0,i+1] := IntToStr(provList.list[i].id)
      else
        Cells[0,i+1] := '';
      if provList.list[i].dt_prov = nil then
        Cells[1,i+1] := ''
      else
        Cells[1,i+1] := XSDate2String(provList.list[i].dt_prov);
      Cells[2,i+1] := provList.list[i].bal_ceh;
      Cells[3,i+1] := provList.list[i].bal_sch;
      Cells[4,i+1] := provList.list[i].bal_sub_sch;
      Cells[5,i+1] := provList.list[i].bal_kau;
      Cells[6,i+1] := provList.list[i].kor_ceh;
      Cells[7,i+1] := provList.list[i].kor_sch;
      Cells[8,i+1] := provList.list[i].kor_sub_sch;
      Cells[9,i+1] := provList.list[i].kor_kau;
      if provList.list[i].summa = nil then
        Cells[10,i+1] := ''
      else
        Cells[10,i+1] := provList.list[i].summa.DecimalString;
      Cells[11,i+1] := provList.list[i].primechan;
    end;
end;

end.
