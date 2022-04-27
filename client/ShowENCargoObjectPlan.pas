unit ShowENCargoObjectPlan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENPlanWorkController, AdvObj
  //,XSBuiltIns
  ;


type
  TfrmENCargoObjectPlanShow = class(TChildForm)
  HTTPRIOENPlanWork: THTTPRIO;
    ImageList1: TImageList;
    sgENPlanWork: TAdvStringGrid;
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
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton11: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    N5: TMenuItem;
    N9: TMenuItem;
    actEstimate: TAction;
    actCancelEstimate: TAction;
    ToolButton4: TToolButton;
    miClosePlan: TMenuItem;
    N11: TMenuItem;
    HTTPRIOENPlanWorkMoveHistory: THTTPRIO;
    N12: TMenuItem;
    N13: TMenuItem;
    actClosePlan: TAction;
    actMovePlan: TAction;
    actCorrectPlan: TAction;
    actAddPlanItems: TAction;
    actMakeNPZ: TAction;
    actFact: TAction;
    actPreConfirm: TAction;
    actConfirm: TAction;
    miPreConfirm: TMenuItem;
    miConfirm: TMenuItem;
    N15: TMenuItem;
    actUndoConfirm: TAction;
    miUndoConfirm: TMenuItem;
    actCreatePack: TAction;
    actUnClose: TAction;
    N14: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N10: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    actSaveAddInfo: TAction;
    N20: TMenuItem;
    HTTPRIOAuth: THTTPRIO;
    HTTPRIOENPlanWorkItem: THTTPRIO;
    HTTPRIOENMOL2PlanWork: THTTPRIO;

procedure FormShow(Sender: TObject);
procedure FormClose(Sender: TObject; var Action: TCloseAction);
procedure sgENPlanWorkTopLeftChanged(Sender: TObject);
procedure sgENPlanWorkDblClick(Sender: TObject);
procedure actViewExecute(Sender: TObject);
procedure actEditExecute(Sender: TObject);
procedure actDeleteExecute(Sender: TObject);
procedure actInsertExecute(Sender: TObject);
procedure actUpdateExecute(Sender: TObject);
procedure actFilterExecute(Sender: TObject);
procedure actNoFilterExecute(Sender: TObject);
    procedure actEstimateExecute(Sender: TObject);
    procedure actCancelEstimateExecute(Sender: TObject);
    procedure actClosePlanExecute(Sender: TObject);
    procedure actMovePlanExecute(Sender: TObject);
    procedure actCorrectPlanExecute(Sender: TObject);
    procedure actAddPlanItemsExecute(Sender: TObject);
    procedure actMakeNPZExecute(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure actPreConfirmExecute(Sender: TObject);
    procedure actConfirmExecute(Sender: TObject);
    procedure actUndoConfirmExecute(Sender: TObject);
    procedure actCreatePackExecute(Sender: TObject);
    procedure actUnCloseExecute(Sender: TObject);
    procedure actSaveAddInfoExecute(Sender: TObject);



  private
   { Private declarations }
 public
   { Public declarations }
   isFiltered, isTransport : boolean;
   outerCondition: String; 
   procedure UpdateGrid(Sender: TObject);

 end;

//var
 // ENPlanWorkObj: ENPlanWork;
 // ENPlanWorkFilterObj: ENPlanWorkFilter;
  
  
implementation

uses Main, EditENPlanWork, EditENPlanWorkFilter, ENConsts,
  ENPlanWorkMoveHistoryController, EditENPlanWorkMoveHistory,
  ENPlanWorkMoveReasonController, EditENPlanCorrectHistory,
  ENPlanCorrectHistoryController, DMReportsUnit, ENDepartmentController,
  ENElementController, ENPlanWorkTypeController,
  ENPlanWorkStatusController, ENPlanWorkKindController
  //, EditENFact
  , EditCNPack2PlanWork, CNPack2PlanWorkController, EditENPlanWorkAddInfo,
  AuthorizationController, ENPlanWorkStateController, EditENPlanWorkItem,
  ENPlanWorkItemController, ENMOL2PlanWorkController, EditENTransportItem,
  EditENCargoObjectPlan;


{$R *.dfm}

var
  //frmENCargoObjectPlanShow : TfrmENCargoObjectPlanShow;

  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENPlanWorkHeaders: array [1..17] of String =
        ( 'Код'
          ,'Об''єкт планування'
          ,'Інв. №'
          ,'РЕЗ та ЕМ'
          ,'Рік плану'
          ,'Місяць плану'
          ,'Дата початку робіт'
          ,'ПідВид робіт'
          ,'Тип акту'
          ,'Вид плану'
          ,'Статус'
          ,'Підрозділ'
          ,'БюджетоТримач'
          ,'Центр відповідальності'
          //,'Дата складання плану'
          ,'Номер наряда'
          ,'Користувач, що вніс зміни'
          ,'Дата останньої зміни'
        );

  selectedRow : Integer;


procedure TfrmENCargoObjectPlanShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENCargoObjectPlanShow:=nil;
    inherited;
  end;


procedure TfrmENCargoObjectPlanShow.FormShow(Sender: TObject);
var
  TempENPlanWork: ENPlanWorkControllerSoapPort;
  i, n : Integer;
  ENPlanWorkList: ENPlanWorkShortList;
  begin
  isTransport := true;
  SetGridHeaders(ENPlanWorkHeaders, sgENPlanWork.ColumnHeaders);
  ColCount:=100;
  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENPlanWorkFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
     ENPlanWorkFilter(FilterObject).conditionSQL := ' enplanwork.statuscode <> ' + IntToStr(ENPLANWORKSTATUS_OLDER);

     // элемент - 1017002423 - Вантаж для перевезення
     ENPlanWorkFilter(FilterObject).elementRef := ENElementRef.Create;
     ENPlanWorkFilter(FilterObject).elementRef.code := CARGO_OBJECT;
     
     isFiltered := false;
  end;

  if not isFiltered then
  begin
     isFiltered := true;
     actFilterExecute(Sender);
     exit;
  end;


  ENPlanWorkList := TempENPlanWork.getScrollableFilteredList(ENPlanWorkFilter(FilterObject),0,ColCount);

try

  LastCount:=High(ENPlanWorkList.list);

  if LastCount > -1 then
     sgENPlanWork.RowCount:=LastCount+2
  else
     sgENPlanWork.RowCount:=2;

   with sgENPlanWork do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;

        n := 0;

        if ENPlanWorkList.list[i].code <> Low(Integer) then
        Cells[n,i+1] := IntToStr(ENPlanWorkList.list[i].code)
        else
        Cells[n,i+1] := '';
        inc(n);

        Cells[n,i+1] := ENPlanWorkList.list[i].objectName;
        inc(n);

        Cells[n,i+1] := ENPlanWorkList.list[i].invNumber;
        inc(n);

        Cells[n,i+1] := ENPlanWorkList.list[i].renRefName;
        inc(n);

        if ENPlanWorkList.list[i].yearGen <> Low(Integer) then
          Cells[n,i+1] := IntToStr(ENPlanWorkList.list[i].yearGen)
        else
          Cells[n,i+1] := '';
        inc(n);

        if ENPlanWorkList.list[i].monthGen <> Low(Integer) then
          //Cells[4,i+1] := IntToStr(ENPlanWorkList.list[i].monthGen)
          Cells[n,i+1] := MonthesNames[ENPlanWorkList.list[i].monthGen]
        else
          Cells[n,i+1] := '';
        inc(n);

        if ENPlanWorkList.list[i].dateStart = nil then
          Cells[n,i+1] := ''
        else
          Cells[n,i+1] := XSDate2String(ENPlanWorkList.list[i].dateStart);
        inc(n);

        Cells[n,i+1] := ENPlanWorkList.list[i].typeRefName;
        inc(n);

        Cells[n,i+1] := ENPlanWorkList.list[i].stateRefShortName;
        inc(n);


        Cells[n,i+1] := ENPlanWorkList.list[i].kindName ;
        inc(n);

        Cells[n,i+1] := ENPlanWorkList.list[i].statusName;
        inc(n);

        Cells[n,i+1] := ENPlanWorkList.list[i].departmentRefShortName;
        inc(n);

        Cells[n,i+1] := ENPlanWorkList.list[i].budgetRefShortName;
        inc(n);

        Cells[n,i+1] := ENPlanWorkList.list[i].responsibilityRefShortName;
        inc(n);

        Cells[n,i+1] := ENPlanWorkList.list[i].workOrderNumber;
        inc(n);

{
        if ENPlanWorkList.list[i].dateGen = nil then
          Cells[n,i+1] := ''
        else
          Cells[n,i+1] := XSDate2String(ENPlanWorkList.list[i].dateGen);
        inc(n);
}
        Cells[n,i+1] := ENPlanWorkList.list[i].userGen;
        inc(n);

        if ENPlanWorkList.list[i].dateEdit = nil then
          Cells[n,i+1] := ''
        else
          Cells[n,i+1] := XSDate2String(ENPlanWorkList.list[i].dateEdit);
        inc(n);

        //Objects[0,i+1] := ENPlanWorkShort.Create;
        //Objects[0,i+1] := TObject(ENPlanWorkList.list[i]); //TObject(ENPlanWorkList.list[i].statusCode);

        LastRow:=i+1;
        sgENPlanWork.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENPlanWork.Row:=1;

finally
ENPlanWorkList.Free;
end;

end;

procedure TfrmENCargoObjectPlanShow.sgENPlanWorkTopLeftChanged(Sender: TObject);
var
  TempENPlanWork: ENPlanWorkControllerSoapPort;
  i, n, CurrentRow: Integer;
  ENPlanWorkList: ENPlanWorkShortList;
begin
  if LastCount < 99 then Exit;
  if (sgENPlanWork.TopRow + sgENPlanWork.VisibleRowCount) = ColCount
  then
    begin
      TempENPlanWork :=  HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;
      CurrentRow:=sgENPlanWork.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENPlanWorkFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);

     // элемент - 1017002423 - Вантаж для перевезення
     ENPlanWorkFilter(FilterObject).elementRef := ENElementRef.Create;
     ENPlanWorkFilter(FilterObject).elementRef.code := CARGO_OBJECT;

     ENPlanWorkFilter(FilterObject).conditionSQL := ' enplanwork.statuscode <> ' + IntToStr(ENPLANWORKSTATUS_OLDER);
  end;

  ENPlanWorkList := TempENPlanWork.getScrollableFilteredList(ENPlanWorkFilter(FilterObject),ColCount-1, 100);

try
  sgENPlanWork.RowCount:=sgENPlanWork.RowCount+100;
  LastCount:=High(ENPlanWorkList.list);

  with sgENPlanWork do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;

        n := 0;

        if ENPlanWorkList.list[i].code <> Low(Integer) then
          Cells[n,i+CurrentRow] := IntToStr(ENPlanWorkList.list[i].code)
        else
          Cells[n,i+CurrentRow] := '';
        inc(n);

        Cells[n,i+CurrentRow] := ENPlanWorkList.list[i].objectName;
        inc(n);

        Cells[n,i+CurrentRow] := ENPlanWorkList.list[i].invNumber;
        inc(n);

        Cells[n,i+CurrentRow] := ENPlanWorkList.list[i].renRefName;
        inc(n);

        if ENPlanWorkList.list[i].yearGen <> Low(Integer) then
          Cells[n,i+CurrentRow] := IntToStr(ENPlanWorkList.list[i].yearGen)
        else
          Cells[n,i+CurrentRow] := '';
        inc(n);

        if ENPlanWorkList.list[i].monthGen <> Low(Integer) then
          //Cells[4,i+CurrentRow] := IntToStr(ENPlanWorkList.list[i].monthGen)
          Cells[n,i+CurrentRow] := MonthesNames[ENPlanWorkList.list[i].monthGen]
        else
          Cells[n,i+CurrentRow] := '';
        inc(n);

        if ENPlanWorkList.list[i].dateStart = nil then
          Cells[n,i+CurrentRow] := ''
        else
          Cells[n,i+CurrentRow] := XSDate2String(ENPlanWorkList.list[i].dateStart);
        inc(n);

        Cells[n,i+CurrentRow] := ENPlanWorkList.list[i].typeRefName;
        inc(n);
        Cells[n,i+CurrentRow] := ENPlanWorkList.list[i].stateRefShortName;
        inc(n);
        
        Cells[n,i+CurrentRow] := ENPlanWorkList.list[i].kindName;
        inc(n);
        Cells[n,i+CurrentRow] := ENPlanWorkList.list[i].statusName;
        inc(n);

        Cells[n,i+CurrentRow] := ENPlanWorkList.list[i].departmentRefShortName;
        inc(n);
        Cells[n,i+CurrentRow] := ENPlanWorkList.list[i].budgetRefShortName;
        inc(n);
        Cells[n,i+CurrentRow] := ENPlanWorkList.list[i].responsibilityRefShortName;
        inc(n);

{
         if ENPlanWorkList.list[i].dateGen = nil then
          Cells[n,i+CurrentRow] := ''
        else
          Cells[n,i+CurrentRow] := XSDate2String(ENPlanWorkList.list[i].dateGen);
}
        Cells[n,i+CurrentRow] := ENPlanWorkList.list[i].workOrderNumber;
        inc(n);

        
        Cells[n,i+CurrentRow] := ENPlanWorkList.list[i].userGen;
        inc(n);


        if ENPlanWorkList.list[i].dateEdit = nil then
          Cells[n,i+CurrentRow] := ''
        else
          Cells[n,i+CurrentRow] := XSDate2String(ENPlanWorkList.list[i].dateEdit);
        inc(n);
        
        Objects[0,i+CurrentRow] := ENPlanWorkList.list[i]; //TObject(ENPlanWorkList.list[i].statusCode);

        LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENPlanWork.Row:=CurrentRow-5;
   sgENPlanWork.RowCount:=LastRow+1;

finally
ENPlanWorkList.Free;
end;
   
  end;


end;

procedure TfrmENCargoObjectPlanShow.sgENPlanWorkDblClick(Sender: TObject);
Var
temp : Integer;
begin

  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENPlanWork,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENCargoObjectPlanShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENPlanWork.RowCount-1 do
   for j:=0 to sgENPlanWork.ColCount-1 do
   begin
     sgENPlanWork.Cells[j,i]:='';
     sgENPlanWork.Objects[0,i] := nil;
   end;
   FormShow(Sender);
end;

procedure TfrmENCargoObjectPlanShow.actViewExecute(Sender: TObject);
Var TempENPlanWork: ENPlanWorkControllerSoapPort;
tPlan : ENPlanWork;
objCode : Integer;
begin

      try
        objCode:=StrToInt( sgENPlanWork.Cells[0, sgENPlanWork.row] );
      except
        on EConvertError do Exit;
      end;


  tPlan := DMReports.getPlanByCode( objCode );

  if tPlan = nil then
  begin
      exit;
  end;


  //ShowMessage( ENPlanWorkShort(sgENPlanWork.Objects[0,sgENPlanWork.Row]).statusName );
  //if  Integer(sgENPlanWork.Objects[0,sgENPlanWork.Row]) <> ENPLANWORKSTATUS_GOOD then
  {if not (tPlan.status.code in [ENPLANWORKSTATUS_GOOD, ENPLANWORKSTATUS_INCORRECTION])

      and
      not ( tPlan.kind.code in [ENPLANWORKKIND_CURRENT ])
  then
  begin
      Application.MessageBox(PChar('План затверджений або видалений !'), PChar('Увага'), MB_ICONWARNING);
      exit;
  end;}


  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

  selectedRow := sgENPlanWork.Row;

  frmENPlanWorkEdit:=TfrmENPlanWorkEdit.Create(Application, dsView);
  frmENPlanWorkEdit.isTransport := true;
  try

    try
      frmENPlanWorkEdit.ENPlanWorkObj := TempENPlanWork.getObject( objCode );
    except
      on EConvertError do Exit;
    end;

    frmENPlanWorkEdit.ShowModal;

  finally
    frmENPlanWorkEdit.Free;
    frmENPlanWorkEdit:=nil;
  end;

end;

procedure TfrmENCargoObjectPlanShow.actEditExecute(Sender: TObject);
Var TempENPlanWork: ENPlanWorkControllerSoapPort;
    tPlan : ENPlanWork;
    ObjCode: Integer;
begin
  try
    ObjCode := StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]);
  except
    on EConvertError do Exit;
  end;

  tPlan := DMReports.getPlanByCode(ObjCode);

  if tPlan = nil then
  begin
    Exit;
  end;

  //ShowMessage( ENPlanWorkShort(sgENPlanWork.Objects[0,sgENPlanWork.Row]).statusName );
  //if  Integer(sgENPlanWork.Objects[0,sgENPlanWork.Row]) <> ENPLANWORKSTATUS_GOOD then


  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

if (tPlan.status.code = ENPLANWORKSTATUS_PRECONFIRMED)  then
begin
  try
      TempENPlanWork.editPreConfirm(tPlan.code);
  except
      Application.MessageBox(PChar('Цей план можуть коригувати тільки у ХОЕ !'), PChar('Увага'), MB_ICONWARNING);
      exit;
  end;
end;

  if not (tPlan.status.code in [ENPLANWORKSTATUS_GOOD, ENPLANWORKSTATUS_INCORRECTION, ENPLANWORKSTATUS_PRECONFIRMED])

      //and
      //not ( tPlan.kind.code in [ENPLANWORKKIND_CURRENT ])
  then
  begin
      Application.MessageBox(PChar('План затверджений !'), PChar('Увага'), MB_ICONWARNING);
      exit;
  end;

  selectedRow := sgENPlanWork.Row;

  frmENPlanWorkEdit:=TfrmENPlanWorkEdit.Create(Application, dsEdit);
  frmENPlanWorkEdit.isTransport := true;
  try

     try
       frmENPlanWorkEdit.ENPlanWorkObj := TempENPlanWork.getObject(StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]));
     except
     on EConvertError do Exit;
    end;

    if frmENPlanWorkEdit.ShowModal= mrOk then
      begin
        //TempENPlanWork.save(ENPlanWorkObj);
        //UpdateGrid(Sender);

          if sgENPlanWork.RowCount > 100 then
            sgENPlanWork.RowCount:=sgENPlanWork.RowCount-99
          else
            sgENPlanWork.RowCount:= 2;

            ColCount := ColCount - 99;

            if selectedRow > 100 then
              //CounterGridTopLeftChanged(Sender)
              sgENPlanWorkTopLeftChanged(Sender)
            else
            begin
              //SetGridHeaders(TMPCounterHeaders, CounterGrid.ColumnHeaders);
              //btnSearchNomenclatureClick(Sender);
              //FormShow(Sender);
              UpdateGrid(Sender);
            end;
      end;

        if  sgENPlanWork.RowCount > selectedRow then
           sgENPlanWork.Row := selectedRow
        else
           sgENPlanWork.Row :=  sgENPlanWork.RowCount-1;

  finally
    frmENPlanWorkEdit.Free;
    frmENPlanWorkEdit:=nil;
  end;

end;

procedure TfrmENCargoObjectPlanShow.actDeleteExecute(Sender: TObject);
Var TempENPlanWork: ENPlanWorkControllerSoapPort;
  ObjCode, eType : Integer;
  tPlan : ENPlanWork;
begin
  try
    ObjCode := StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]);
  except
    on EConvertError do Exit;
  end;

  tPlan := DMReports.getPlanByCode(ObjCode);

  if tPlan = nil then
  begin
      exit;
  end;


  //ShowMessage( ENPlanWorkShort(sgENPlanWork.Objects[0,sgENPlanWork.Row]).statusName );
  //if  Integer(sgENPlanWork.Objects[0,sgENPlanWork.Row]) <> ENPLANWORKSTATUS_GOOD then

  //if  Integer(sgENPlanWork.Objects[0,sgENPlanWork.Row]) <> ENPLANWORKSTATUS_GOOD then

  //if not (ENPlanWorkShort(sgENPlanWork.Objects[0,sgENPlanWork.Row]).statusCode in [ENPLANWORKSTATUS_GOOD, ENPLANWORKSTATUS_INCORRECTION]) then
  if not (tPlan.status.code in [ENPLANWORKSTATUS_GOOD, ENPLANWORKSTATUS_INCORRECTION]) then
  begin
      Application.MessageBox(PChar('План затверджений !'), PChar('Увага'), MB_ICONWARNING);
      exit;
  end;

  selectedRow := sgENPlanWork.Row;

  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

  if Application.MessageBox(PChar('Вы действительно хотите удалить (План робіт) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
           {
            eType := DMReports.getElementTypeByPlan(ObjCode);
            case eType of
              1,2,3 : TempENPlanWork.removeBySRS(ObjCode);
              5 : TempENPlanWork.removeBySVES(ObjCode);
              6 : TempENPlanWork.removeBySPS(ObjCode);
              else
              begin
                Application.MessageBox(PChar('Невідомий тип Об"єкту !!!'), PChar('Помилка'), MB_ICONERROR);
                exit;
              end;
            end;
            }
      TempENPlanWork.remove(ObjCode);
      //UpdateGrid(Sender);

          if sgENPlanWork.RowCount > 100 then
            sgENPlanWork.RowCount:=sgENPlanWork.RowCount-99
          else
            sgENPlanWork.RowCount:= 2;

            ColCount := ColCount - 99;

            if selectedRow > 100 then
              //CounterGridTopLeftChanged(Sender)
              sgENPlanWorkTopLeftChanged(Sender)
            else
            begin
              //SetGridHeaders(TMPCounterHeaders, CounterGrid.ColumnHeaders);
              //btnSearchNomenclatureClick(Sender);
              UpdateGrid(Sender);
              //FormShow(Sender);
            end;

        if  sgENPlanWork.RowCount > selectedRow then
           sgENPlanWork.Row := selectedRow - 1
        else
           sgENPlanWork.Row :=  sgENPlanWork.RowCount-1;

  end;

end;

procedure TfrmENCargoObjectPlanShow.actInsertExecute(Sender: TObject);
var TempENPlanWork: ENPlanWorkControllerSoapPort;
    TempENPlanWorkItem: ENPlanWorkItemControllerSoapPort;
    ENMOL2PlanWorkObj: ENMOL2PlanWork;
    TempENMOL2PlanWork: ENMOL2PlanWorkControllerSoapPort;
begin
  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

  selectedRow := sgENPlanWork.Row;

  try
    frmENCargoObjectPlanEdit := TfrmENCargoObjectPlanEdit.Create(Application, dsInsert);
    try

      frmENCargoObjectPlanEdit.ENPlanWorkObj:=ENPlanWork.Create;
      SetNullIntProps(frmENCargoObjectPlanEdit.ENPlanWorkObj);
      SetNullXSProps(frmENCargoObjectPlanEdit.ENPlanWorkObj);
    // NET-4213 frmENCargoObjectPlanEdit.ENPlanWorkObj.dateGen:= TXSDate.Create;
      frmENCargoObjectPlanEdit.ENPlanWorkObj.dateEdit:= TXSDate.Create;
      frmENCargoObjectPlanEdit.isTransport := true;

      frmENCargoObjectPlanEdit.cbPlanWorkKind.ItemIndex := ENPLANWORKKIND_YEAR - 1;

      if frmENCargoObjectPlanEdit.ShowModal = mrOk then

      begin
        if frmENCargoObjectPlanEdit.ENPlanWorkObj<>nil then

        begin

         /////////////////////////////////////
         {
         TempENPlanWorkItem := HTTPRIOENPlanWorkItem as ENPlanWorkItemControllerSoapPort;
         ENPlanWorkItemObj := ENPlanWorkItem.Create;
         ENPlanWorkItemObj := TempENPlanWorkItem.getObject(frmENCargoObjectPlanEdit.itemCode);

         frmENPlanWorkItemEdit := TfrmENPlanWorkItemEdit.Create(Application, dsEdit);
         //frmENPlanWorkItemEdit.pcEstimate.Visible := false;
         frmENPlanWorkItemEdit.isTransport := true;

         with frmENPlanWorkItemEdit do
         if ShowModal = mrOk then
           begin
               try
                 //frmENPlanWorkItemEdit.pcEstimate.Visible := false;
               except
               on EConvertError do Exit;
            end;
         end;    }

          /////
          //if FilterObject = nil then
          //if not isFiltered then
          if (sgENPlanWork.RowCount = 2) and (sgENPlanWork.Cells[0, 1] = '') then
          begin
            FilterObject := ENPlanWorkFilter.Create;
            SetNullIntProps(FilterObject);
            SetNullXSProps(FilterObject);

            // элемент - 1017002423 - Вантаж для перевезення
            ENPlanWorkFilter(FilterObject).elementRef := ENElementRef.Create;
            ENPlanWorkFilter(FilterObject).elementRef.code := CARGO_OBJECT;

            ENPlanWorkFilter(FilterObject).code := frmENCargoObjectPlanEdit.ENPlanWorkObj.code;
            ENPlanWorkFilter(FilterObject).conditionSQL := ' enplanwork.statuscode <> ' + IntToStr(ENPLANWORKSTATUS_OLDER);
          end;
          /////

          if sgENPlanWork.RowCount > 100 then
            sgENPlanWork.RowCount:=sgENPlanWork.RowCount-99
          else
            sgENPlanWork.RowCount:= 2;

          ColCount := ColCount - 99;

          if selectedRow > 100 then
            //CounterGridTopLeftChanged(Sender)
            sgENPlanWorkTopLeftChanged(Sender)
          else
          begin
            //SetGridHeaders(TMPCounterHeaders, CounterGrid.ColumnHeaders);
            //btnSearchNomenclatureClick(Sender);
            //FormShow(Sender);
            UpdateGrid(Sender);
          end;

          sgENPlanWork.Row :=  sgENPlanWork.RowCount - 1;
        end;
      end;


    finally
      frmENCargoObjectPlanEdit.Free;
      frmENCargoObjectPlanEdit:=nil;
    end;
  finally
    //ENPlanWorkObj.Free;
  end;
end;

procedure TfrmENCargoObjectPlanShow.actUpdateExecute(Sender: TObject);
  begin
  selectedRow := sgENPlanWork.Row;
  UpdateGrid(Sender);
  
          if  sgENPlanWork.RowCount > selectedRow then
           sgENPlanWork.Row := selectedRow
        else
           sgENPlanWork.Row :=  sgENPlanWork.RowCount-1;
end;


procedure TfrmENCargoObjectPlanShow.actFilterExecute(Sender: TObject);
var condition: String;
begin

  frmENPlanWorkFilterEdit := TfrmENPlanWorkFilterEdit.Create(Application, dsInsert);
  try
    ENPlanWorkFilterObj := ENPlanWorkFilter.Create;
    SetNullIntProps(ENPlanWorkFilterObj);
    SetNullXSProps(ENPlanWorkFilterObj);

    frmENPlanWorkFilterEdit.DisableControls(
    [frmENPlanWorkFilterEdit.edtTypeName, frmENPlanWorkFilterEdit.spbType,
    frmENPlanWorkFilterEdit.edtWorkState, frmENPlanWorkFilterEdit.spbENPlanWorkState]);

    ENPlanWorkFilterObj.typeRef := ENPlanWorkTypeRef.Create();
    ENPlanWorkFilterObj.typeRef.code := ENPLANWORKTYPE_TRANSPORT; //11;
    frmENPlanWorkFilterEdit.edtTypeName.Text := 'Перевезення';
    ENPlanWorkFilterObj.stateRef := ENPlanWorkStateRef.Create();
    ENPlanWorkFilterObj.stateRef.code := ENPLANWORKSTATE_GSM; //12;
    frmENPlanWorkFilterEdit.edtWorkState.Text := 'Списання паливно-мастильних матеріалів';
    frmENPlanWorkFilterEdit.isTransport := true;

    // элемент - 1017002423 - Вантаж для перевезення
    ENPlanWorkFilterObj.elementRef := ENElementRef.Create;
    ENPlanWorkFilterObj.elementRef.code := CARGO_OBJECT;

    if frmENPlanWorkFilterEdit.ShowModal = mrOk then
    begin
      FilterObject := ENPlanWorkFilter.Create;
      if outerCondition <> '' then
      begin
        condition := ENPlanWorkFilterObj.conditionSQL;
        AddCondition(condition, outerCondition);
        ENPlanWorkFilterObj.conditionSQL := condition;
      end;
      FilterObject := ENPlanWorkFilterObj;
      actUpdateExecute(Sender);
    end;

    ENPlanWorkFilterObj := nil;
  finally
    frmENPlanWorkFilterEdit.Free;
    frmENPlanWorkFilterEdit:=nil;
  end;
end;

procedure TfrmENCargoObjectPlanShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

procedure TfrmENCargoObjectPlanShow.actEstimateExecute(Sender: TObject);
Var TempENPlanWork: ENPlanWorkControllerSoapPort;
begin

  //if  Integer(sgENPlanWork.Objects[0,sgENPlanWork.Row]) <> ENPLANWORKSTATUS_GOOD then
  if not (Integer(sgENPlanWork.Objects[0,sgENPlanWork.Row]) in [ENPLANWORKSTATUS_GOOD, ENPLANWORKSTATUS_INCORRECTION]) then
  begin
      Application.MessageBox(PChar('План затверджений або видалений !'), PChar('Увага'), MB_ICONWARNING);
      exit;
  end;

  if Application.MessageBox(PChar('Сформувати кошторис ?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON1)=IDOK then
  begin
    TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;
    TempENPlanWork.generateEsentialByPlan(StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]));

    Application.MessageBox(PChar('Кошторис сформовано!'), PChar('Повідомлення'), MB_ICONINFORMATION);
  end;
end;

procedure TfrmENCargoObjectPlanShow.actCancelEstimateExecute(Sender: TObject);
Var TempENPlanWork: ENPlanWorkControllerSoapPort;
begin

  //if  Integer(sgENPlanWork.Objects[0,sgENPlanWork.Row]) <> ENPLANWORKSTATUS_GOOD then
  if not (Integer(sgENPlanWork.Objects[0,sgENPlanWork.Row]) in [ENPLANWORKSTATUS_GOOD, ENPLANWORKSTATUS_INCORRECTION]) then
  begin
      Application.MessageBox(PChar('План затверджений або видалений !'), PChar('Увага'), MB_ICONWARNING);
      exit;
  end;

  
  if Application.MessageBox(PChar('Ви дійсно бажаєте скасувати кошторис ?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;
    TempENPlanWork.cancelEsentialByPlan(StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]));

    Application.MessageBox(PChar('Кошторис скасовано!'), PChar('Повідомлення'), MB_ICONINFORMATION);
  end;
end;

procedure TfrmENCargoObjectPlanShow.actClosePlanExecute(Sender: TObject);
Var TempENPlanWork: ENPlanWorkControllerSoapPort;
    ENPlanWorkList: ENPlanWorkShortList;
    ENPlanWorkFilterObj: ENPlanWorkFilter;
    ObjCode: Integer;
    ENPlanWorkObj: ENPlanWork;
    tPlan : ENPlanWork;
begin

  //if not (Integer(sgENPlanWork.Objects[0,sgENPlanWork.Row]) in [ ENPLANWORKSTATUS_GOOD, ENPLANWORKSTATUS_INCORRECTION]) then
  tPlan := DMReports.getPlanByCode(StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]));
  if tPlan = nil then
  begin
     Application.MessageBox(PChar('План not found !'), PChar('Увага'), MB_ICONWARNING);
      exit;
  end;


  if
    (
      not (tPlan.status.code in [ENPLANWORKSTATUS_GOOD, ENPLANWORKSTATUS_INCORRECTION])
    )
    and ( tPlan.kind.code <> ENPLANWORKKIND_CURRENT )
    then
  begin
      Application.MessageBox(PChar('План ВЖЕ затверджений або видалений !'), PChar('Увага'), MB_ICONWARNING);
      exit;
  end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте '+ miClosePlan.Caption +' ?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

    TempENPlanWork.closePlanWork(StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]));

    Application.MessageBox(PChar('План затверджено !'), PChar('Повідомлення'), MB_ICONINFORMATION);
    UpdateGrid(Sender);
  end;

{
  if tPlan.kind.code in [ENPLANWORKKIND_NPZ] then
  begin


    ENPlanWorkFilterObj := ENPlanWorkFilter.Create;
    SetNullIntProps(ENPlanWorkFilterObj);
    SetNullXSProps(ENPlanWorkFilterObj);
    ENPlanWorkFilterObj.conditionSQL := 'code in (select ph.plannewrefcode from enplancorrecthistory ph where ph.planoldrefcode = '+ IntToStr(tPlan.code) +')';

    ENPlanWorkList := TempENPlanWork.getScrollableFilteredList(ENPlanWorkFilterObj, 0, -1);

    if ENPlanWorkList.totalCount > 0 then
      if ENPlanWorkList.list <> nil then
        if ENPlanWorkList.list[0] <> nil then
        begin
          ENPlanWorkObj := TempENPlanWork.getObject(ENPlanWorkList.list[0].code);
          if ENPlanWorkObj = nil then
          begin
            Application.MessageBox(PChar('План не знайдено!'), PChar('Помилка'), MB_ICONERROR);
            Exit;
          end;

          frmENFactEdit := TfrmENFactEdit.Create(Application, dsEdit);
          try
            frmENFactEdit.ENPlanWorkObj := TempENPlanWork.getObject(ENPlanWorkList.list[0].code);
            if frmENFactEdit.ShowModal = mrOk then
              UpdateGrid(Sender);
          finally
            frmENFactEdit.Free;
          end;

        end;

  end;
}
end;

procedure TfrmENCargoObjectPlanShow.actMovePlanExecute(Sender: TObject);
Var
  TempPlanWorkMoveHistory: ENPlanWorkMoveHistoryControllerSoapPort;
//MoveHistoryObj : ENPlanWorkMoveHistory;
  objCode : Integer;
  plan : ENPlanWork;
begin
 {
 TempPlanWorkMoveHistory := HTTPRIOENPlanWorkMoveHistory as ENPlanWorkMoveHistoryControllerSoapPort;
   try
     MoveHistoryObj := TempPlanWorkMoveHistory.getObject(StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]));
   except
   on EConvertError do Exit;
  end;
  }

   try
     ObjCode := StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]);
   except
     on EConvertError do Exit;
  end;

  plan := DMReports.getPlanByCode(objCode);
  if plan = nil then Exit;

  // переносить можно ТОЛЬКО текущие НЕУТВЕРЖДЕННЫЕ (без НПЗ)
  if not ((plan.kind.code = ENPLANWORKKIND_CURRENT) and (plan.status.code = ENPLANWORKSTATUS_GOOD)) then
//  if  not ( plan.status.code in [ENPLANWORKSTATUS_LOCKED, ENPLANWORKSTATUS_CORRECTED]) then
  begin
      Application.MessageBox(PChar('переносить можно ТОЛЬКО текущие НЕУТВЕРЖДЕННЫЕ (без НПЗ) !'), PChar('Увага'), MB_ICONWARNING);
      exit;
  end;

  ENPlanWorkMoveHistoryObj := ENPlanWorkMoveHistory.Create;
  SetNullIntProps(ENPlanWorkMoveHistoryObj);
  SetNullXSProps(ENPlanWorkMoveHistoryObj);
  ENPlanWorkMoveHistoryObj.planRef := ENPlanWorkRef.Create;
  ENPlanWorkMoveHistoryObj.planRef.code := StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]);
  ENPlanWorkMoveHistoryObj.reason := ENPlanWorkMoveReason.Create;

  frmENPlanWorkMoveHistoryEdit:=TfrmENPlanWorkMoveHistoryEdit.Create(Application, dsInsert);
  try
    frmENPlanWorkMoveHistoryEdit.ShowModal;
    UpdateGrid(Sender);
  finally
    frmENPlanWorkMoveHistoryEdit.Free;
    frmENPlanWorkMoveHistoryEdit:=nil;
  end;
end;

procedure TfrmENCargoObjectPlanShow.actCorrectPlanExecute(Sender: TObject);
begin
{
  if not ( Integer(sgENPlanWork.Objects[0,sgENPlanWork.Row]) in [ ENPLANWORKSTATUS_LOCKED, ENPLANWORKSTATUS_CORRECTED ] ) then
  begin
      Application.MessageBox(PChar('План ще не затверджений !'), PChar('Увага'), MB_ICONWARNING);
      exit;
  end;

  ENPlanCorrectHistoryObj := ENPlanCorrectHistory.Create;
  SetNullIntProps(ENPlanCorrectHistoryObj);
  SetNullXSProps(ENPlanCorrectHistoryObj);
  ENPlanCorrectHistoryObj.planOldRef := ENPlanWorkRef.Create;
  ENPlanCorrectHistoryObj.planOldRef.code := StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]);

  frmENPlanCorrectHistoryEdit:= TfrmENPlanCorrectHistoryEdit.Create(Application, dsInsert);
  try
    frmENPlanCorrectHistoryEdit.ShowModal;
    UpdateGrid(Sender);
  finally
    frmENPlanCorrectHistoryEdit.Free;
    frmENPlanCorrectHistoryEdit:=nil;
  end;
}
end;

procedure TfrmENCargoObjectPlanShow.actAddPlanItemsExecute(Sender: TObject);
Var TempENPlanWork: ENPlanWorkControllerSoapPort;
tPlan : ENPlanWork;
begin
  try
    tPlan := DMReports.getPlanByCode(StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]));
  except
    on EConvertError do Exit;
  end;

  if tPlan = nil then
  begin
    Exit;
  end;
  
  //if  Integer(sgENPlanWork.Objects[0,sgENPlanWork.Row]) <> ENPLANWORKSTATUS_GOOD then
  if  not (tPlan.status.code in [ENPLANWORKSTATUS_GOOD, ENPLANWORKSTATUS_INCORRECTION]) then
  begin
      Application.MessageBox(PChar('План затверджений !'), PChar('Увага'), MB_ICONWARNING);
      exit;
  end;

 TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

  frmENPlanWorkEdit:=TfrmENPlanWorkEdit.Create(Application, dsEdit);
  try

     try
       frmENPlanWorkEdit.ENPlanWorkObj := TempENPlanWork.getObject(StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]));
     except
     on EConvertError do Exit;
    end;

    frmENPlanWorkEdit.tsPlanWork.TabVisible := false;
    frmENPlanWorkEdit.tsEstimateItems.TabVisible := false;
    frmENPlanWorkEdit.tsMoves.TabVisible := false;
    frmENPlanWorkEdit.tsCorrections.TabVisible := false;

    frmENPlanWorkEdit.tsHumens.TabVisible := false;
    frmENPlanWorkEdit.tsTransports.TabVisible := false;
    frmENPlanWorkEdit.tsWorkOrder.TabVisible := false;

    frmENPlanWorkEdit.pcPlanWork.ActivePage := frmENPlanWorkEdit.tsPlanWorkItems;
    frmENPlanWorkEdit.UpdateGrid(Sender);

    frmENPlanWorkEdit.addPlanItemsMode := true;

    if frmENPlanWorkEdit.ShowModal= mrOk then
      begin
        //TempENPlanWork.save(ENPlanWorkObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENPlanWorkEdit.Free;
    frmENPlanWorkEdit:=nil;
  end;
end;

procedure TfrmENCargoObjectPlanShow.actMakeNPZExecute(Sender: TObject);
Var TempENPlanWork: ENPlanWorkControllerSoapPort;
parentPlan :ENPlanWork;
newPlan , tPlan : ENPlanWork;
pCode : integer;
begin

EXIT;

  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

  tPlan := DMReports.getPlanByCode(StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]));
  if tPlan = nil then
  begin
    Exit;
  end;

  //if  Integer(sgENPlanWork.Objects[0,sgENPlanWork.Row]) <> ENPLANWORKSTATUS_GOOD then
  if  not (tPlan.status.code in [ENPLANWORKSTATUS_GOOD, ENPLANWORKSTATUS_INCORRECTION]) then
  begin
      Application.MessageBox(PChar('План затверджений або видалений !'), PChar('Увага'), MB_ICONWARNING);
      exit;
  end;

     try
       parentPlan := TempENPlanWork.getObject(StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]));
     except
     on EConvertError do Exit;
    end;


 
  selectedRow := sgENPlanWork.Row;

  try
    frmENPlanWorkEdit:=TfrmENPlanWorkEdit.Create(Application, dsEdit);
    try

      newPlan := ENPlanWork.Create;
      SetNullIntProps(newPlan);
      SetNullXSProps(newPlan);
      //frmENPlanWorkEdit.ENPlanWorkObj:=ENPlanWork.Create;
      //newPlan.dateGen:= TXSDate.Create;  NET-4213
      newPlan.dateGen.XSToNative(GetXSDate(SysUtils.Date));


      newPlan.dateEdit:= TXSDate.Create;

      // заполним с базовогу нужными данными ...
      newPlan.departmentRef := ENDepartmentRef.Create;
      newPlan.departmentRef.code := parentPlan.departmentRef.code;
      newPlan.budgetRef := ENDepartmentRef.Create;
      newPlan.budgetRef.code := parentPlan.budgetRef.code;
      newPlan.responsibilityRef := ENDepartmentRef.Create;
      newPlan.responsibilityRef.code := parentPlan.responsibilityRef.code;
      newPlan.renRef := EPRenRef.Create;
      newPlan.renRef.code := parentPlan.renRef.code;

      newPlan.elementRef := ENElementRef.Create;
      newPlan.elementRef.code := parentPlan.elementRef.code;

      newPlan.typeRef := ENPlanWorkTypeRef.Create;
      newPlan.typeRef.code := parentPlan.typeRef.code;

      newPlan.yearGen := parentPlan.yearGen;
      newPlan. monthGen := parentPlan.monthGen;
      newPlan.distanceTo := parentPlan.distanceTo;
      newPlan.status := ENPlanWorkStatus.Create;
      newPlan.status.code := ENPLANWORKSTATUS_GOOD;

      newPlan.kind := ENPlanWorkKind.Create;
      newPlan.kind.code := ENPLANWORKKIND_NPZ;

      if  parentPlan.dateStart <> nil then
      begin
          newPlan.dateStart := parentPlan.dateStart;
          newPlan.dateFinal := newPlan.dateStart; // на НПЗ - один день !!! parentPlan.dateFinal;
      end
      else
      begin
          newPlan.dateStart := TXSDate.Create;
          newPlan.dateFinal := TXSDate.Create;
          newPlan.dateStart.XSToNative(GetXSDate(SysUtils.Date + 1));
          newPlan.dateFinal.XSToNative(GetXSDate(SysUtils.Date + 1));
      end;
      pCode := TempENPlanWork.add(newPlan);

      //frmENPlanWorkEdit.edtDateGen.DateTime := SysUtils.Date;
      //frmENPlanWorkEdit.edtDateStart.DateTime := SysUtils.Date + 1;

      frmENPlanWorkEdit.DisableControls([frmENPlanWorkEdit.edtYearGen, frmENPlanWorkEdit.edtMonthGen]);
     try
       frmENPlanWorkEdit.ENPlanWorkObj := TempENPlanWork.getObject(pCode);
     except
     on EConvertError do Exit;
    end;

      if frmENPlanWorkEdit.ShowModal = mrOk then
      begin

        if frmENPlanWorkEdit.ENPlanWorkObj<>nil then
        begin
            // сохранить привязку .. к базовому планУУУУУ


        end;

            //TempENPlanWork.add(ENPlanWorkObj);

            //UpdateGrid(Sender);
            {
             Попытка сделать позиционирование ...

                if sgENPlanWork.RowCount > 100 then
                  sgENPlanWork.RowCount:=sgENPlanWork.RowCount-99
                else
                  sgENPlanWork.RowCount:= 2;

                  ColCount := ColCount - 99;

                  if selectedRow > 100 then
                    //CounterGridTopLeftChanged(Sender)
                    sgENPlanWorkTopLeftChanged(Sender)
                  else
                  begin
                    //SetGridHeaders(TMPCounterHeaders, CounterGrid.ColumnHeaders);
                    //btnSearchNomenclatureClick(Sender);
                    //FormShow(Sender);
                    UpdateGrid(Sender);
                  end;

                  sgENPlanWork.Row :=  sgENPlanWork.RowCount - 1;

                  }
      end
      else
      begin
          // нажали отмена ... удалим только что созданный план ..
          TempENPlanWork.remove(pCode);
      end;

      //if  sgENPlanWork.RowCount > selectedRow then
      //     sgENPlanWork.Row := selectedRow + 1
      //  else
      //sgENPlanWork.Row :=  sgENPlanWork.RowCount - 1;


    finally
      frmENPlanWorkEdit.Free;
      frmENPlanWorkEdit:=nil;
    end;
  finally
    //ENPlanWorkObj.Free;
  end;
end;

procedure TfrmENCargoObjectPlanShow.PopupMenu1Popup(Sender: TObject);
var
  plan : ENPlanWork;
  ObjCode : Integer;

  ///// 05.08.10 ВРЕМЕННО !!!
  // TempUser: UserControllerSoapPort;
  // UserObj: User;
  /////
begin

  // DisableActions([actPreConfirm, actConfirm, actUndoConfirm]);

   try
     ObjCode := StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]);
   except
     on EConvertError do Exit;
   end;

  plan := DMReports.getPlanByCode(ObjCode);
  if plan = nil then
  begin
    Exit;
  end;


  actMakeNPZ.Visible := false;

  miClosePlan.Caption := 'Затвердити План';

  if plan.kind.code = ENPLANWORKKIND_CURRENT then
     miClosePlan.Caption := 'Скласти Завдання ПЛАН'
  else
  if plan.kind.code = ENPLANWORKKIND_NPZ then
     miClosePlan.Caption := 'Скласти Завдання ФАКТ'
  else
  if plan.kind.code = ENPLANWORKKIND_FACT then
     miClosePlan.Caption := 'Затвердити Факт, для якого не потрібно формувати Акт ...';//'Затвердити ФАКТ';

  actClosePlan.Enabled := //(plan.kind.code <> ENPLANWORKKIND_FACT) and
                          (
                             ( plan.status.code = ENPLANWORKSTATUS_GOOD) or ( plan.kind.code = ENPLANWORKKIND_CURRENT)
                             // для статусов на корректировке - ограничим на сервере ... and (plan.status.code <> ENPLANWORKSTATUS_PRECONFIRMED)
                           );

  actClosePlan.Visible := actClosePlan.Enabled;
  

  // planUnclose ...
  actUnClose.Enabled := (
                          (plan.kind.code = ENPLANWORKKIND_NPZ) or (plan.kind.code = ENPLANWORKKIND_FACT)
                        // для 2011 года можно удалять .. ПОКА .. до создания ЗАЯВКИ!!!!
                         or ((plan.kind.code = ENPLANWORKKIND_CURRENT) and (plan.yearGen = 2011))

                         )
                        and (plan.status.code = ENPLANWORKSTATUS_GOOD) ;

// полуУтверждение .. Утверждение .. Отмена Утверждения ....
  actPreConfirm.Enabled := (plan.kind.code = ENPLANWORKKIND_CURRENT) and (plan.status.code = ENPLANWORKSTATUS_GOOD);

  actConfirm.Enabled := (plan.kind.code = ENPLANWORKKIND_CURRENT) and
                         (
                           (plan.status.code = ENPLANWORKSTATUS_PRECONFIRMED)
                           //or (plan.status.code = ENPLANWORKSTATUS_GOOD)
                          );

   actUndoConfirm.Enabled := (plan.kind.code = ENPLANWORKKIND_CURRENT) and
                         (
                           (plan.status.code = ENPLANWORKSTATUS_PRECONFIRMED)

                           ///// 11.08.10

                           // надо прикрыть такое, потому что Олег Василенко
                           // сегодня спокойно попатчил свой уже утвержденный
                           // текущий план, воспользовавшись данной фишкой ;-)
                           // (а этот план уже запретил редактировать ОМТС)

                           // or
                           // (plan.status.code = ENPLANWORKSTATUS_LOCKED)

                           /////
                          );

// ---------------------------------------------------

  //if plan.kind.code = ENPLANWORKKIND_CURRENT then
  //begin
  //act
  //end

{
  actPreConfirm.Enabled := (plan.kind.code = ENPLANWORKKIND_NPZ) and
                           (plan.status.code = ENPLANWORKSTATUS_GOOD);
  actPreConfirm.Visible := actPreConfirm.Enabled;

  actConfirm.Enabled :=  (plan.kind.code = ENPLANWORKKIND_NPZ) and
                         (plan.status.code = ENPLANWORKSTATUS_PRECONFIRMED);
  actConfirm.Visible := actConfirm.Enabled;

  actUndoConfirm.Enabled := actConfirm.Enabled;
  actUndoConfirm.Visible := actUndoConfirm.Enabled;
}


  // перенос сроков залочим ;)
  actMovePlan.Enabled :=   (plan.kind.code = ENPLANWORKKIND_CURRENT) and
                           (plan.status.code = ENPLANWORKSTATUS_GOOD);


  // изменение дат и исполнителя !!!
  actSaveAddInfo.Enabled := (plan.kind.code in [ ENPLANWORKKIND_CURRENT, ENPLANWORKKIND_NPZ] ) and
                            (plan.status.code <> ENPLANWORKSTATUS_GOOD);

  ///// 05.08.10 ВРЕМЕННО !!!
  {
  if (plan.departmentRef.code = 15) or (plan.departmentRef.code = 16) then
  begin
    TempUser := HTTPRIOAuth as UserControllerSoapPort;
    UserObj := TempUser.getCurrent;
    if ((plan.departmentRef.code = 15) and (UserObj.domain = 'root.gor')) or
       ((plan.departmentRef.code = 16) and (UserObj.domain = 'root.kal')) then
      actSaveAddInfo.Enabled := (plan.kind.code in [ENPLANWORKKIND_CURRENT, ENPLANWORKKIND_NPZ, ENPLANWORKKIND_FACT]) and
                                (plan.status.code <> ENPLANWORKSTATUS_GOOD);
  end;
  }
  /////

  //actMovePlan.Visible := actMovePlan.Enabled;


  //inherited;
  {
  actPreConfirm.Enabled := (DialogState = dsEdit) and
                                (pcPlanWork.ActivePage = tsEstimateItems) and
                                (Integer(sgENEstimateItem.Objects[0, sgENEstimateItem.Row]) = ENESTIMATEITEMTYPE_MANUAL_BY_PLAN);

  actMaterialBinding.Visible := actMaterialBinding.Enabled;

  // тож самое и с развязкой с ФИННН
  actMaterialBindingToFIN.Enabled := (DialogState = dsEdit) and
                                     (pcPlanWork.ActivePage = tsEstimateItems) and
                                     ( (ENPlanWorkObj.kind.code = ENPLANWORKKIND_NPZ) or  (ENPlanWorkObj.kind.code = ENPLANWORKKIND_FACT))
                                     // and статус бы еще пробить ....
                                     ;

  actMaterialBindingToFIN.Visible := actMaterialBindingToFIN.Enabled;
  }
end;

procedure TfrmENCargoObjectPlanShow.actPreConfirmExecute(Sender: TObject);
Var TempENPlanWork: ENPlanWorkControllerSoapPort;
ObjCode : Integer;
begin

   try
     ObjCode := StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]);
   except
     on EConvertError do Exit;
   end;


  if Application.MessageBox(PChar('Ви дійсно бажаєте відправити план на ЗАТВЕРДЖЕННЯ ?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

    TempENPlanWork.preConfirm(ObjCode);

    Application.MessageBox(PChar('План відправлено ...'), PChar('Повідомлення'), MB_ICONINFORMATION);
    UpdateGrid(Sender);
  end;

end;

procedure TfrmENCargoObjectPlanShow.actConfirmExecute(Sender: TObject);
Var TempENPlanWork: ENPlanWorkControllerSoapPort;
ObjCode : Integer;
begin

   try
     ObjCode := StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]);
   except
     on EConvertError do Exit;
   end;


  if Application.MessageBox(PChar('Ви дійсно бажаєте ЗАТВЕРДИТИ НПЗ ?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

    TempENPlanWork.confirm(ObjCode);

    Application.MessageBox(PChar('План затверджено ...'), PChar('Повідомлення'), MB_ICONINFORMATION);
    UpdateGrid(Sender);
  end;
end;

procedure TfrmENCargoObjectPlanShow.actUndoConfirmExecute(Sender: TObject);
Var TempENPlanWork: ENPlanWorkControllerSoapPort;
ObjCode : Integer;
begin

   try
     ObjCode := StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]);
   except
     on EConvertError do Exit;
   end;


  if Application.MessageBox(PChar('Ви дійсно бажаєте повернути План на доопрацювання ?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

    TempENPlanWork.undoConfirm(ObjCode);

    Application.MessageBox(PChar('План повернено ...'), PChar('Повідомлення'), MB_ICONINFORMATION);
    UpdateGrid(Sender);
  end;
end;

procedure TfrmENCargoObjectPlanShow.actCreatePackExecute(Sender: TObject);
Var
//TempENPlanWork: ENPlanWorkControllerSoapPort;
TempCNPack2PlanWork: CNPack2PlanWorkControllerSoapPort;
ObjCode : Integer;
frm : TfrmCNPack2PlanWorkEdit ;

begin

   try
     ObjCode := StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]);
   except
     on EConvertError do Exit;
   end;


  if Application.MessageBox(PChar('Ви дійсно бажаєте сформувати заявку  ?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin

    frm := TfrmCNPack2PlanWorkEdit.Create(Application, dsInsert);
    try

     CNPack2PlanWorkObj :=  CNPack2PlanWork.Create;
     SetNullIntProps(CNPack2PlanWorkObj);
     SetNullXSProps(CNPack2PlanWorkObj);
     CNPack2PlanWorkObj.planRef := ENPlanWorkRef.Create;
     CNPack2PlanWorkObj.planRef.code := ObjCode;

     if frm.ShowModal = mrOK then
     begin

        //TempCNPack2PlanWork := HTTPRIOCNPack2PlanWork as CNPack2PlanWorkControllerSoapPort;

        //TempCNPack2PlanWork.createPack(CNPack2PlanWorkObj);
        
        Application.MessageBox(PChar('План повернено ...'), PChar('Повідомлення'), MB_ICONINFORMATION);
        UpdateGrid(Sender);
     end;

    finally
     frm.Free;
    end;

  end;
end;

procedure TfrmENCargoObjectPlanShow.actUnCloseExecute(Sender: TObject);
Var TempENPlanWork: ENPlanWorkControllerSoapPort;
ObjCode : Integer;
begin

   try
     ObjCode := StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]);
   except
     on EConvertError do Exit;
   end;


  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити и Відминити затвердження попереднього плану ?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

    TempENPlanWork.openPlanWork(ObjCode);

    Application.MessageBox(PChar('Видалено ...'), PChar('Повідомлення'), MB_ICONINFORMATION);
    UpdateGrid(Sender);
  end;
  
end;

procedure TfrmENCargoObjectPlanShow.actSaveAddInfoExecute(Sender: TObject);
Var TempENPlanWork: ENPlanWorkControllerSoapPort;
tPlan : ENPlanWork;

  ///// 05.08.10 ВРЕМЕННО !!!
  TempUser: UserControllerSoapPort;
  UserObj: User;
  allowEdit: Boolean;
  /////

begin

  tPlan := DMReports.getPlanByCode( StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]));

  if tPlan = nil then
  begin
      exit;
  end;


  //ShowMessage( ENPlanWorkShort(sgENPlanWork.Objects[0,sgENPlanWork.Row]).statusName );
  //if  Integer(sgENPlanWork.Objects[0,sgENPlanWork.Row]) <> ENPLANWORKSTATUS_GOOD then


  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;



  selectedRow := sgENPlanWork.Row;

  frmENPlanWorkAddInfoEdit:=TfrmENPlanWorkAddInfoEdit.Create(Application, dsEdit);
  try
    ///// 05.08.10 ВРЕМЕННО !!!
    allowEdit := false;
    
    if (tPlan.departmentRef.code = 15) or (tPlan.departmentRef.code = 16) then
    begin
      TempUser := HTTPRIOAuth as UserControllerSoapPort;
      UserObj := TempUser.getCurrent;
      if ((tPlan.departmentRef.code = 15) and (UserObj.domain = 'root.gor')) or
         ((tPlan.departmentRef.code = 16) and (UserObj.domain = 'root.kal')) then
        allowEdit := true;
    end;
    /////


     if tPlan.kind.code = ENPLANWORKKIND_NPZ then
     begin
        ///// 05.08.10 ВРЕМЕННО !!!
        if not allowEdit then
        begin
        /////
          if (tPlan.finExecutor <> nil) then
          begin
              if (tPlan.finExecutor.code > LOW_INT) then
              begin
                  ShowMessage('На цьому плані вже є виконавець ...');
                  exit;
              end;
          end
          else
          begin
                  ShowMessage('На цьому плані вже є виконавець ...');
                  exit;
          end;
        /////
        end;
        /////
        frmENPlanWorkAddInfoEdit.DisableControls( [frmENPlanWorkAddInfoEdit.edtDateStart, frmENPlanWorkAddInfoEdit.edtDateFinal]);
     end;

    ///// 05.08.10 ВРЕМЕННО !!!
    {
    if allowEdit then
    begin
      if //(tPlan.kind.code = ENPLANWORKKIND_NPZ) or
        (tPlan.kind.code = ENPLANWORKKIND_FACT) then
        frmENPlanWorkAddInfoEdit.DisableControls([frmENPlanWorkAddInfoEdit.edtDateStart,
                                                  frmENPlanWorkAddInfoEdit.edtDateFinal,
                                                  frmENPlanWorkAddInfoEdit.edtYearGen,
                                                  frmENPlanWorkAddInfoEdit.edtMonthGen,
                                                  frmENPlanWorkAddInfoEdit.gbPlanMOL]);
    end;
    }
    /////


     try
       frmENPlanWorkAddInfoEdit.planObj := TempENPlanWork.getObject(StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]));
     except
     on EConvertError do Exit;
    end;

    if frmENPlanWorkAddInfoEdit.ShowModal= mrOk then
      begin
        //TempENPlanWork.save(ENPlanWorkObj);
        //UpdateGrid(Sender);

          if sgENPlanWork.RowCount > 100 then
            sgENPlanWork.RowCount:=sgENPlanWork.RowCount-99
          else
            sgENPlanWork.RowCount:= 2;

            ColCount := ColCount - 99;

            if selectedRow > 100 then
              //CounterGridTopLeftChanged(Sender)
              sgENPlanWorkTopLeftChanged(Sender)
            else
            begin
              //SetGridHeaders(TMPCounterHeaders, CounterGrid.ColumnHeaders);
              //btnSearchNomenclatureClick(Sender);
              //FormShow(Sender);
              UpdateGrid(Sender);
            end;
      end;

        if  sgENPlanWork.RowCount > selectedRow then
           sgENPlanWork.Row := selectedRow
        else
           sgENPlanWork.Row :=  sgENPlanWork.RowCount-1;

  finally
    frmENPlanWorkAddInfoEdit.Free;
    frmENPlanWorkAddInfoEdit := nil;
  end;

end;

end.
