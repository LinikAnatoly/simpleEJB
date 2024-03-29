unit ShowENPlanWorkBilling;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns,
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  EnergyProController, EnergyProController2,
  ENPlanWorkController, AdvObj,IniTools , SetupFormUnit,CCOutageNoticeController
  //,XSBuiltIns
  ;

type
  TDisableType = (dtOther, dtMetrology, dtEnergozbyt);


type
  TfrmENPlanWorkBillingShow = class(TChildForm)
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
    miUnClose: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N10: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    actSaveAddInfo: TAction;
    N20: TMenuItem;
    HTTPRIOAuth: THTTPRIO;
    actFinishPlanWork: TAction;
    actUndoFinishPlanWork: TAction;
    N14: TMenuItem;
    miFinishPlanWork: TMenuItem;
    miUndoFinishPlanWork: TMenuItem;
    N21: TMenuItem;
    actClosePlanBilling: TAction;
    HTTPRIOENElement: THTTPRIO;
    HTTPRIOENPlanWorkItem: THTTPRIO;
    HTTPRIOCCOutageNotice: THTTPRIO;
    miSaveFinexecutDepartment: TMenuItem;
    actSaveFinexecutDepartment: TAction;

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
    procedure FormCreate(Sender: TObject);
    procedure actFinishPlanWorkExecute(Sender: TObject);
    procedure actUndoFinishPlanWorkExecute(Sender: TObject);
    procedure actClosePlanBillingExecute(Sender: TObject);
    procedure actSaveFinexecutDepartmentExecute(Sender: TObject);



  private
   { Private declarations }
 public
   { Public declarations }
   isFiltered : boolean;
   outerCondition: String;
   disableControlsType : TDisableType;

   procedure UpdateGrid(Sender: TObject);

 end;

//var
 // ENPlanWorkObj: ENPlanWork;
 // ENPlanWorkFilterObj: ENPlanWorkFilter;


  
implementation

uses Main, EditENPlanWork, EditENPlanWorkBillingFilter, ENConsts,
  ENPlanWorkMoveHistoryController, EditENPlanWorkMoveHistory,
  ENPlanWorkMoveReasonController, EditENPlanCorrectHistory,
  ENPlanCorrectHistoryController, DMReportsUnit, ENDepartmentController,
  ENElementController, ENPlanWorkTypeController,ENPlanWorkItemController,
  ENPlanWorkStatusController, ENPlanWorkKindController
  //, EditENFact
  , EditCNPack2PlanWork, CNPack2PlanWorkController, EditENPlanWorkAddInfo,
  AuthorizationController, EditENPlanTransPort, ENPlanWorkClose;


{$R *.dfm}

var
  //frmENPlanWorkShow : TfrmENPlanWorkShow;

  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENPlanWorkHeaders: array [1..18] of String =
        ( '���'
          ,'��''��� ����������'
          ,'���. �'
          ,'��� �� ��'
          ,'г� �����'
          ,'̳���� �����'
          ,'���� ������� ����'
          ,'ϳ���� ����'
          ,'��� ����'
          ,'��� �����'
          ,'������'
          ,'���� ������������ ���������'
          ,'���� ���.�������� ���������'
          ,'��� ���������'
          ,'������. ����� �� �� ����� (�� �����������)'
          ,'����� ������'
          ,'����������, �� ���� ����'
          ,'���� �������� ����'
        );

  selectedRow : Integer;


procedure TfrmENPlanWorkBillingShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENPlanWorkBillingShow:=nil;
    inherited;
  end;


procedure TfrmENPlanWorkBillingShow.FormShow(Sender: TObject);
var
  TempENPlanWork: ENPlanWorkControllerSoapPort;
  i, n : Integer;
  ENPlanWorkList: ENPlanWorkBillingShortList;
begin
  SetGridHeaders(ENPlanWorkHeaders, sgENPlanWork.ColumnHeaders);
  ColCount:=100;

  ///
  DisableActions([actFinishPlanWork, actUndoFinishPlanWork]);
  HideActions([actFinishPlanWork, actUndoFinishPlanWork]);
  ///

  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENPlanWorkFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
     ENPlanWorkFilter(FilterObject).conditionSQL := ' enplanwork.statuscode <> ' + IntToStr(ENPLANWORKSTATUS_OLDER)
        + ' enplanwork.and kindcode <> ' + IntToStr(ENPLANWORKKIND_CALCULATION_SINGLE) ;
     isFiltered := false;
  end;

  if not isFiltered then
  begin
     //isFiltered := true;
     actFilterExecute(Sender);
     exit;
  end;

  ENPlanWorkList := TempENPlanWork.getScrollableBillingFilteredList(ENPlanWorkFilter(FilterObject),0,ColCount);

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

        /////
        {
        if ENPlanWorkList.list[i].yearOriginal <> Low(Integer) then
          Cells[n,i+1] := IntToStr(ENPlanWorkList.list[i].yearOriginal)
        else
          Cells[n,i+1] := '';
        inc(n);

        if ENPlanWorkList.list[i].monthOriginal <> Low(Integer) then
          //Cells[n,i+1] := IntToStr(ENPlanWorkList.list[i].monthOriginal)
          Cells[n,i+1] := MonthesNames[ENPlanWorkList.list[i].monthOriginal]
        else
          Cells[n,i+1] := '';
        inc(n);
        }

        Cells[n,i+1] := ENPlanWorkList.list[i].typeRefName;
        inc(n);

        Cells[n,i+1] := ENPlanWorkList.list[i].stateRefShortName;
        inc(n);


        Cells[n,i+1] := ENPlanWorkList.list[i].kindName ;
        inc(n);

        Cells[n,i+1] := ENPlanWorkList.list[i].statusName;
        inc(n);

        if ENPlanWorkList.list[i].dateCounterInst = nil then
          Cells[n,i+1] :=''
        else
          Cells[n,i+1] := XSDate2String(ENPlanWorkList.list[i].dateCounterInst);
        inc(n);

        if ENPlanWorkList.list[i].dateCounterCheck = nil then
          Cells[n,i+1] :=''
        else
          Cells[n,i+1] :=XSDate2String(ENPlanWorkList.list[i].dateCounterCheck);
        inc(n);

        Cells[n,i+1] := ENPlanWorkList.list[i].counterType;
        inc(n);

        Cells[n,i+1] := '';

        //if ENPlanWorkList.list[i].yearOriginal <> Low(Integer) then
        if ENPlanWorkList.list[i].yearOriginal > 0 then
        begin
          //if ENPlanWorkList.list[i].monthOriginal <> Low(Integer) then
          if ENPlanWorkList.list[i].monthOriginal > 0 then
            Cells[n,i+1] := MonthesNames[ENPlanWorkList.list[i].monthOriginal] + ' ' +
                            IntToStr(ENPlanWorkList.list[i].yearOriginal);
        end
        else
          Cells[n,i+1] := '';
        inc(n);
        /////
                
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

procedure TfrmENPlanWorkBillingShow.sgENPlanWorkTopLeftChanged(Sender: TObject);
var
  TempENPlanWork: ENPlanWorkControllerSoapPort;
  i, n, CurrentRow: Integer;
  ENPlanWorkList: ENPlanWorkBillingShortList;
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
     ENPlanWorkFilter(FilterObject).conditionSQL := ' enplanwork.statuscode <> ' + IntToStr(ENPLANWORKSTATUS_OLDER);
  end;

  ENPlanWorkList := TempENPlanWork.getScrollableBillingFilteredList(ENPlanWorkFilter(FilterObject),ColCount-1, 100);

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

        /////
        {
        if ENPlanWorkList.list[i].yearOriginal <> Low(Integer) then
          Cells[n,i+CurrentRow] := IntToStr(ENPlanWorkList.list[i].yearOriginal)
        else
          Cells[n,i+CurrentRow] := '';
        inc(n);

        if ENPlanWorkList.list[i].monthOriginal <> Low(Integer) then
          //Cells[n,i+CurrentRow] := IntToStr(ENPlanWorkList.list[i].monthOriginal)
          Cells[n,i+CurrentRow] := MonthesNames[ENPlanWorkList.list[i].monthOriginal]
        else
          Cells[n,i+CurrentRow] := '';
        inc(n);
        }

        Cells[n,i+CurrentRow] := ENPlanWorkList.list[i].typeRefName;
        inc(n);
        Cells[n,i+CurrentRow] := ENPlanWorkList.list[i].stateRefShortName;
        inc(n);
        
        Cells[n,i+CurrentRow] := ENPlanWorkList.list[i].kindName;
        inc(n);
        Cells[n,i+CurrentRow] := ENPlanWorkList.list[i].statusName;
        inc(n);

        if ENPlanWorkList.list[i].dateCounterInst = nil then
          Cells[n,i+CurrentRow] :=''
        else
          Cells[n,i+CurrentRow] := XSDate2String(ENPlanWorkList.list[i].dateCounterInst);
        inc(n);

        if ENPlanWorkList.list[i].dateCounterCheck = nil then
          Cells[n,i+CurrentRow] :=''
        else
          Cells[n,i+CurrentRow] :=XSDate2String(ENPlanWorkList.list[i].dateCounterCheck);
        inc(n);

        Cells[n,i+CurrentRow] := ENPlanWorkList.list[i].counterType;
        inc(n);



{
         if ENPlanWorkList.list[i].dateGen = nil then
          Cells[n,i+CurrentRow] := ''
        else
          Cells[n,i+CurrentRow] := XSDate2String(ENPlanWorkList.list[i].dateGen);
}

        Cells[n,i+CurrentRow] := '';

        //if ENPlanWorkList.list[i].yearOriginal <> Low(Integer) then
        if ENPlanWorkList.list[i].yearOriginal > 0 then
        begin
          //if ENPlanWorkList.list[i].monthOriginal <> Low(Integer) then
          if ENPlanWorkList.list[i].monthOriginal > 0 then
            Cells[n,i+CurrentRow] := MonthesNames[ENPlanWorkList.list[i].monthOriginal] + ' ' +
                                     IntToStr(ENPlanWorkList.list[i].yearOriginal);
        end
        else
          Cells[n,i+CurrentRow] := '';
        inc(n);
        /////

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

   sgENPlanWork.RowCount:=LastRow+1;
   
   if (sgENPlanWork.RowCount > 5) then
     sgENPlanWork.Row:=CurrentRow-5;

finally
ENPlanWorkList.Free;
end;
   
  end;


end;



procedure TfrmENPlanWorkBillingShow.sgENPlanWorkDblClick(Sender: TObject);
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

procedure TfrmENPlanWorkBillingShow.UpdateGrid(Sender: TObject);
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

procedure TfrmENPlanWorkBillingShow.actViewExecute(Sender: TObject);
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
      Application.MessageBox(PChar('���� ������������ ��� ��������� !'), PChar('�����'), MB_ICONWARNING);
      exit;
  end;}


   TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

   selectedRow := sgENPlanWork.Row;

   frmENPlanWorkEdit:=TfrmENPlanWorkEdit.Create(Application, dsView);

   if (tPlan.typeRef.code = ENPLANWORKTYPE_TRANSPORT) and (tPlan.stateRef.code = ENPLANWORKSTATE_GSM) then
    frmENPlanWorkEdit.isTransport := true;

   if (tPlan.typeRef.code = ENPLANWORKTYPE_SIZ) then
    frmENPlanWorkEdit.isSiz := true;

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

procedure TfrmENPlanWorkBillingShow.actEditExecute(Sender: TObject);
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
      Application.MessageBox(PChar('��� ���� ������ ���������� ����� � ��� !'), PChar('�����'), MB_ICONWARNING);
      exit;
  end;
end;

  if not (tPlan.status.code in [ENPLANWORKSTATUS_GOOD, ENPLANWORKSTATUS_INCORRECTION, ENPLANWORKSTATUS_PRECONFIRMED])

      //and
      //not ( tPlan.kind.code in [ENPLANWORKKIND_CURRENT ])
  then
  begin
      Application.MessageBox(PChar('���� ������������ !'), PChar('�����'), MB_ICONWARNING);
      exit;
  end;

  selectedRow := sgENPlanWork.Row;

  frmENPlanWorkEdit:=TfrmENPlanWorkEdit.Create(Application, dsEdit);

  if (tPlan.typeRef.code = ENPLANWORKTYPE_TRANSPORT) and (tPlan.stateRef.code = ENPLANWORKSTATE_GSM) then
    frmENPlanWorkEdit.isTransport := true;

  if (tPlan.typeRef.code = ENPLANWORKTYPE_SIZ) then
    frmENPlanWorkEdit.isSiz := true;

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

procedure TfrmENPlanWorkBillingShow.actDeleteExecute(Sender: TObject);
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
      Application.MessageBox(PChar('���� ������������ !'), PChar('�����'), MB_ICONWARNING);
      exit;
  end;

  selectedRow := sgENPlanWork.Row;

  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

  if Application.MessageBox(PChar('�� ������������� ������ ������� (���� ����) ?'),
                    PChar('�������� !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
           {
            eType := DMReports.getElementTypeByPlan(ObjCode);
            case eType of
              1,2,3 : TempENPlanWork.removeBySRS(ObjCode);
              5 : TempENPlanWork.removeBySVES(ObjCode);
              6 : TempENPlanWork.removeBySPS(ObjCode);
              else
              begin
                Application.MessageBox(PChar('�������� ��� ��"���� !!!'), PChar('�������'), MB_ICONERROR);
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

procedure TfrmENPlanWorkBillingShow.actInsertExecute(Sender: TObject);
Var TempENPlanWork: ENPlanWorkControllerSoapPort;
begin
  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

  selectedRow := sgENPlanWork.Row;

  try
    frmENPlanWorkEdit:=TfrmENPlanWorkEdit.Create(Application, dsInsert);
    try

      frmENPlanWorkEdit.ENPlanWorkObj:=ENPlanWork.Create;
      SetNullIntProps(frmENPlanWorkEdit.ENPlanWorkObj);
      SetNullXSProps(frmENPlanWorkEdit.ENPlanWorkObj);
      //frmENPlanWorkEdit.ENPlanWorkObj.dateGen:= TXSDate.Create;
      //frmENPlanWorkEdit.ENPlanWorkObj.dateEdit:= TXSDate.Create;

      //frmENPlanWorkEdit.ENPlanWorkObj.kind := ENPlanWorkKind.Create;
      //frmENPlanWorkEdit.ENPlanWorkObj.kind.code := ENPLANWORKKIND_YEAR;
      frmENPlanWorkEdit.cbPlanWorkKind.ItemIndex := ENPLANWORKKIND_YEAR - 1;

      if frmENPlanWorkEdit.ShowModal = mrOk then
      begin
        if frmENPlanWorkEdit.ENPlanWorkObj<>nil then
        begin
            //TempENPlanWork.add(ENPlanWorkObj);

            //UpdateGrid(Sender);

          /////
          //if FilterObject = nil then
          //if not isFiltered then
          if (sgENPlanWork.RowCount = 2) and (sgENPlanWork.Cells[0, 1] = '') then
          begin
            FilterObject := ENPlanWorkFilter.Create;
            SetNullIntProps(FilterObject);
            SetNullXSProps(FilterObject);
            ENPlanWorkFilter(FilterObject).code := frmENPlanWorkEdit.ENPlanWorkObj.code;
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

procedure TfrmENPlanWorkBillingShow.actUpdateExecute(Sender: TObject);
  begin
  selectedRow := sgENPlanWork.Row;
  UpdateGrid(Sender);
  
          if  sgENPlanWork.RowCount > selectedRow then
           sgENPlanWork.Row := selectedRow
        else
           sgENPlanWork.Row :=  sgENPlanWork.RowCount-1;
end;


procedure TfrmENPlanWorkBillingShow.actFilterExecute(Sender: TObject);
var condition: String;
begin

  frmENPlanWorkBillingFilterEdit:=TfrmENPlanWorkBillingFilterEdit.Create(Application, dsInsert);
  try
    ENPlanWorkFilterObj := ENPlanWorkFilter.Create;
    SetNullIntProps(ENPlanWorkFilterObj);
    SetNullXSProps(ENPlanWorkFilterObj);

    frmENPlanWorkBillingFilterEdit.disableControlsType := disableControlsType;

    {
    if disableControlsType = dtMetrology then
    begin

       ENPlanWorkFilterObj.kind := ENPlanWorkKind.Create;
       ENPlanWorkFilterObj.kind.code := ENPLANWORKKIND_CURRENT;
       frmENPlanWorkFilterBillingEdit.cbPlanWorkKind.ItemIndex := ENPLANWORKKIND_CURRENT - 1;

       frmENPlanWorkFilterBillingEdit.cbElementType

       frmENPlanWorkFilterBillingEdit.DisableControls([frmENPlanWorkFilterBillingEdit.cbPlanWorkKind]);

    end;
    }

    if frmENPlanWorkBillingFilterEdit.ShowModal = mrOk then
    begin
      FilterObject := ENPlanWorkFilter.Create;
      if outerCondition <> '' then
      begin
        condition := ENPlanWorkFilterObj.conditionSQL;
        AddCondition(condition, outerCondition);
        ENPlanWorkFilterObj.conditionSQL := condition;
      end;
      FilterObject := ENPlanWorkFilterObj;
      isFiltered := True;
      actUpdateExecute(Sender);
    end;


    //else
    // isFiltered := False;

    ENPlanWorkFilterObj := nil;
  finally
    frmENPlanWorkBillingFilterEdit.Free;
    frmENPlanWorkBillingFilterEdit:=nil;
  end;
end;

procedure TfrmENPlanWorkBillingShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

procedure TfrmENPlanWorkBillingShow.actEstimateExecute(Sender: TObject);
Var TempENPlanWork: ENPlanWorkControllerSoapPort;
begin

  //if  Integer(sgENPlanWork.Objects[0,sgENPlanWork.Row]) <> ENPLANWORKSTATUS_GOOD then
  if not (Integer(sgENPlanWork.Objects[0,sgENPlanWork.Row]) in [ENPLANWORKSTATUS_GOOD, ENPLANWORKSTATUS_INCORRECTION]) then
  begin
      Application.MessageBox(PChar('���� ������������ ��� ��������� !'), PChar('�����'), MB_ICONWARNING);
      exit;
  end;

  if Application.MessageBox(PChar('���������� �������� ?'),
                    PChar('����� !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON1)=IDOK then
  begin
    TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;
    TempENPlanWork.generateEsentialByPlan(StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]));

    Application.MessageBox(PChar('�������� ����������!'), PChar('�����������'), MB_ICONINFORMATION);
  end;
end;

procedure TfrmENPlanWorkBillingShow.actCancelEstimateExecute(Sender: TObject);
Var TempENPlanWork: ENPlanWorkControllerSoapPort;
begin

  //if  Integer(sgENPlanWork.Objects[0,sgENPlanWork.Row]) <> ENPLANWORKSTATUS_GOOD then
  if not (Integer(sgENPlanWork.Objects[0,sgENPlanWork.Row]) in [ENPLANWORKSTATUS_GOOD, ENPLANWORKSTATUS_INCORRECTION]) then
  begin
      Application.MessageBox(PChar('���� ������������ ��� ��������� !'), PChar('�����'), MB_ICONWARNING);
      exit;
  end;

  
  if Application.MessageBox(PChar('�� ����� ������ ��������� �������� ?'),
                    PChar('����� !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;
    TempENPlanWork.cancelEsentialByPlan(StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]));

    Application.MessageBox(PChar('�������� ���������!'), PChar('�����������'), MB_ICONINFORMATION);
  end;
end;

procedure TfrmENPlanWorkBillingShow.actClosePlanExecute(Sender: TObject);
Var TempENPlanWork: ENPlanWorkControllerSoapPort;
    ENPlanWorkList: ENPlanWorkShortList;
    ENPlanWorkFilterObj: ENPlanWorkFilter;
    ObjCode: Integer;
    ENPlanWorkObj: ENPlanWork;
    tPlan : ENPlanWork;
    TempENElement: ENElementControllerSoapPort;
    tEObj:ENElement;
    TempENPlanWorkItem: ENPlanWorkItemControllerSoapPort;
    ENPlanWorkItemList: ENPlanWorkItemShortList;
    ENPlanWorkItemFilterObj: ENPlanWorkItemFilter;
    isMove:Integer;
    TempCCOutageNotice : CCOutageNoticeControllerSoapPort;
    isExistsOutages:Boolean;
begin

  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

  //if not (Integer(sgENPlanWork.Objects[0,sgENPlanWork.Row]) in [ ENPLANWORKSTATUS_GOOD, ENPLANWORKSTATUS_INCORRECTION]) then
  tPlan := DMReports.getPlanByCode(StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]));
  if tPlan = nil then
  begin
     Application.MessageBox(PChar('���� not found !'), PChar('�����'), MB_ICONWARNING);
      exit;
  end;

   TempENElement := HTTPRIOENElement as ENElementControllerSoapPort;
   tEObj:=TempENElement.getObject(tPlan.elementRef.code);


  if
    (
      not (tPlan.status.code in [ENPLANWORKSTATUS_GOOD, ENPLANWORKSTATUS_INCORRECTION])
    )
    and ( tPlan.kind.code <> ENPLANWORKKIND_CURRENT )
    then
  begin
      Application.MessageBox(PChar('���� ��� ������������ ��� ��������� !'), PChar('�����'), MB_ICONWARNING);
      exit;
  end;

  isMove:=0;
  if (
  (tEObj.typeRef.code=7)
  and ((tPlan.typeRef.code=102)or (tPlan.typeRef.code=103) or (tPlan.typeRef.code=104))
  and (tPlan.formRef.code=ENPLANWORKFORM_NOPLANNED)
  ) then begin

  TempENPlanWorkItem := HTTPRIOENPlanWorkItem as ENPlanWorkItemControllerSoapPort;
  ENPlanWorkItemFilterObj:= ENPlanWorkItemFilter.Create;
  SetNullIntProps(ENPlanWorkItemFilterObj);
  SetNullXSProps(ENPlanWorkItemFilterObj);

  ENPlanWorkItemFilterObj.planRef:=ENPlanWorkRef.Create;
  ENPlanWorkItemFilterObj.planRef.code:=tPlan.code;

  ENPlanWorkItemFilterObj.conditionSQL := 'enplanworkitem.countgen<>0 and enplanworkitem.kartarefcode in  (select tki.code from tktechcard tki where (tki.name like '+''''+'%�������%'+''''+' or tki.name like '+''''+'%������%'+''''+'))'+
  //' and enplanworkitem.planrefcode IN (SELECT planrefcode from enplanworkmovehistory where planrefcode='+IntToStr(tPlan.code)+')';
  ' and enplanworkitem.planrefcode = ' + IntToStr(tPlan.code) ;



  ENPlanWorkItemList:=TempENPlanWorkItem.getScrollableFilteredList(ENPlanWorkItemFilterObj,0,1);

  if (HIGH(ENPlanWorkItemList.list)>=0)
   then isMove:=1;

  end;


  if
 (
  (tEObj.typeRef.code=7)
  and ((tPlan.typeRef.code=102) or (tPlan.typeRef.code=103) or (tPlan.typeRef.code=104))
  and (tPlan.formRef.code=ENPLANWORKFORM_NOPLANNED)
  and (isMove=0)
  )


    then
  begin
      Application.MessageBox(PChar('����� ������� - ���������� ����(�����) ��� ���������� ���� � ������ !'), PChar('�����'), MB_ICONWARNING);
      exit;
  end;

  if ((tEObj.typeRef.code=7)and(tPlan.typeRef.code=101))
   then
  begin
      Application.MessageBox(PChar('�����  ���������� ���� � ������ !'), PChar('�����'), MB_ICONWARNING);
      exit;
  end;


  TempCCOutageNotice := HTTPRIOCCOutageNotice as CCOutageNoticeControllerSoapPort;
       isExistsOutages:=TempCCOutageNotice.isExistsNoAgreedOutages(StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]));
       if (isExistsOutages=True) then
       begin
       Application.MessageBox(PChar('������� ����������� ���������� ������������!'),
                           PChar('�����!'), MB_ICONWARNING);
       Exit;
       end;


    if (tPlan.kind.code = ENPLANWORKKIND_CURRENT) then
    begin

      frmPlanWorkClose := TfrmPlanWorkClose.Create(Application, dsEdit);
      frmPlanWorkClose.plan  := tPlan;

      try
        if frmPlanWorkClose.ShowModal = mrOk then
        begin
          Application.MessageBox(PChar('���� �����������!'), PChar('�����������'), MB_ICONINFORMATION);
          UpdateGrid(Sender);
        end;

      finally
        frmPlanWorkClose.Free;
        frmPlanWorkClose := nil;
      end;

    end
    else
    begin
      if Application.MessageBox(PChar('�� ����� ������ '+ miClosePlan.Caption +' ?'),
                        PChar('����� !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
      begin
        try
          TempENPlanWork.closePlanWork(StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]));
        except
          on EConvertError do Exit;
        end;

        Application.MessageBox(PChar('���� �����������!'), PChar('�����������'), MB_ICONINFORMATION);
        UpdateGrid(Sender);
      end;
    end;

end;



procedure TfrmENPlanWorkBillingShow.actClosePlanBillingExecute(Sender: TObject);
Var TempENPlanWork: ENPlanWorkControllerSoapPort;
    ENPlanWorkList: ENPlanWorkShortList;
    ENPlanWorkFilterObj: ENPlanWorkFilter;
    ObjCode: Integer;
    ENPlanWorkObj: ENPlanWork;
    tPlan : ENPlanWork;
    TempENElement: ENElementControllerSoapPort;
    tEObj:ENElement;
    TempCCOutageNotice : CCOutageNoticeControllerSoapPort;
    isExistsOutages:boolean;

begin

  tPlan := DMReports.getPlanByCode(StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]));
  if tPlan = nil then
  begin
     Application.MessageBox(PChar('���� not found !'), PChar('�����'), MB_ICONWARNING);
      exit;
  end;

   TempENElement := HTTPRIOENElement as ENElementControllerSoapPort;
   tEObj:=TempENElement.getObject(tPlan.elementRef.code);


  if
    (
      not (tPlan.status.code in [ENPLANWORKSTATUS_GOOD, ENPLANWORKSTATUS_INCORRECTION])
    )
    and ( tPlan.kind.code <> ENPLANWORKKIND_CURRENT )
    then
  begin
      Application.MessageBox(PChar('���� ��� ������������ ��� ��������� !'), PChar('�����'), MB_ICONWARNING);
      exit;
  end;

   if
    (
      (tPlan.formRef.code=ENPLANWORKFORM_PLANNED)
      or ( tPlan.kind.code <> ENPLANWORKKIND_CURRENT )
      or not ((tEObj.typeRef.code=7)or(tEObj.typeRef.code=8))
    )
    then
  begin
      Application.MessageBox(PChar('����� ������������� ���� ������ �������� ����� ������ !'), PChar('�����'), MB_ICONWARNING);
      exit;
  end;


    TempCCOutageNotice := HTTPRIOCCOutageNotice as CCOutageNoticeControllerSoapPort;
       isExistsOutages:=TempCCOutageNotice.isExistsNoAgreedOutages(StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]));
       if (isExistsOutages=True) then
       begin
       Application.MessageBox(PChar('������� ����������� ���������� ������������!'),
                           PChar('�����!'), MB_ICONWARNING);
       Exit;
       end;

  if Application.MessageBox(PChar('�� ����� ������ '+ miClosePlan.Caption +' ?'),
                    PChar('����� !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

        TempENPlanWork.closePlanWorkBilling(StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]));
        Application.MessageBox(PChar('���� ����������� !'), PChar('�����������'), MB_ICONINFORMATION);
        UpdateGrid(Sender);

  end;

end;




procedure TfrmENPlanWorkBillingShow.actMovePlanExecute(Sender: TObject);
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

  // ���������� ����� ������ ������� �������������� (��� ���)
  if not ((plan.kind.code = ENPLANWORKKIND_CURRENT) and ((plan.status.code = ENPLANWORKSTATUS_GOOD) or (plan.status.code = ENPLANWORKSTATUS_LOCKED))) then
//  if  not ( plan.status.code in [ENPLANWORKSTATUS_LOCKED, ENPLANWORKSTATUS_CORRECTED]) then
  begin
      Application.MessageBox(PChar('���������� ����� ������ ������� ����� (��� ���) !'), PChar('�����'), MB_ICONWARNING);
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

procedure TfrmENPlanWorkBillingShow.actCorrectPlanExecute(Sender: TObject);
begin
{
  if not ( Integer(sgENPlanWork.Objects[0,sgENPlanWork.Row]) in [ ENPLANWORKSTATUS_LOCKED, ENPLANWORKSTATUS_CORRECTED ] ) then
  begin
      Application.MessageBox(PChar('���� �� �� ������������ !'), PChar('�����'), MB_ICONWARNING);
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

procedure TfrmENPlanWorkBillingShow.actAddPlanItemsExecute(Sender: TObject);
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
      Application.MessageBox(PChar('���� ������������ !'), PChar('�����'), MB_ICONWARNING);
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

procedure TfrmENPlanWorkBillingShow.actMakeNPZExecute(Sender: TObject);
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
      Application.MessageBox(PChar('���� ������������ ��� ��������� !'), PChar('�����'), MB_ICONWARNING);
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
      //newPlan.dateGen:= TXSDate.Create; NET-4213
      //newPlan.dateGen.XSToNative(GetXSDate(SysUtils.Date));


      newPlan.dateEdit:= TXSDate.Create;

      // �������� � �������� ������� ������� ...
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
          newPlan.dateFinal := newPlan.dateStart; // �� ��� - ���� ���� !!! parentPlan.dateFinal;
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
            // ��������� �������� .. � �������� ���������


        end;

            //TempENPlanWork.add(ENPlanWorkObj);

            //UpdateGrid(Sender);
            {
             ������� ������� ���������������� ...

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
          // ������ ������ ... ������ ������ ��� ��������� ���� ..
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

procedure TfrmENPlanWorkBillingShow.PopupMenu1Popup(Sender: TObject);
var
  plan : ENPlanWork;
  ObjCode : Integer;

  ///// 05.08.10 �������� !!!
  // TempUser: UserControllerSoapPort;
  // UserObj: User;
  /////
begin
  DisableActions([actClosePlan, actUnClose, actConfirm, actPreConfirm], False);
  HideActions([actClosePlan, actUnClose, actConfirm, actPreConfirm], False);

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

  miClosePlan.Caption := '���������� ����';

  if plan.kind.code = ENPLANWORKKIND_CURRENT then
     miClosePlan.Caption := '������� �������� ����'
  else
  if plan.kind.code = ENPLANWORKKIND_NPZ then
     miClosePlan.Caption := '������� �������� ����'
  else
  if plan.kind.code = ENPLANWORKKIND_FACT then
     miClosePlan.Caption := '���������� ����, ��� ����� �� ������� ��������� ��� ...';//'���������� ����';

  actClosePlan.Enabled := //(plan.kind.code <> ENPLANWORKKIND_FACT) and
                          (
                             ( plan.status.code = ENPLANWORKSTATUS_GOOD) or ( plan.kind.code = ENPLANWORKKIND_CURRENT)
                             // ��� �������� �� ������������� - ��������� �� ������� ... and (plan.status.code <> ENPLANWORKSTATUS_PRECONFIRMED)
                           );

  actClosePlan.Visible := actClosePlan.Enabled;
  

  // planUnclose ...
  actUnClose.Enabled := (
                          (plan.kind.code = ENPLANWORKKIND_NPZ) or (plan.kind.code = ENPLANWORKKIND_FACT)
                        // ��� 2011 ���� ����� ������� .. ���� .. �� �������� ������!!!!
                         or ((plan.kind.code = ENPLANWORKKIND_CURRENT) and (plan.yearGen = 2011))

                         )
                        and (plan.status.code = ENPLANWORKSTATUS_GOOD) ;

   // ������ ������������ ��� ����� .... �� ������� ������ ���� �� ��� ;)
   if  (plan.status.code = ENPLANWORKSTATUS_LOCKED) and (plan.kind.code = ENPLANWORKKIND_FACT) then
   begin
     actUnClose.Enabled :=  True;
     miUnClose.Caption := '³������ ������������ �����, ��� ����� �� ������� ��������� ��� ...'
   end
   else begin
     miUnClose.Caption := '�������� ��� ����������� ������������';
   end;


// ��������������� .. ����������� .. ������ ����������� ....
  actPreConfirm.Enabled := (plan.kind.code = ENPLANWORKKIND_CURRENT) and (plan.status.code = ENPLANWORKSTATUS_GOOD);

  actConfirm.Enabled := (plan.kind.code = ENPLANWORKKIND_CURRENT) and
                         (
                           (plan.status.code = ENPLANWORKSTATUS_PRECONFIRMED)
                           //or (plan.status.code = ENPLANWORKSTATUS_GOOD)
                          );

  if (plan.kind.code = ENPLANWORKKIND_CURRENT)  then
  begin
    actUndoConfirm.Enabled := (plan.kind.code = ENPLANWORKKIND_CURRENT) and
                         (
                           (plan.status.code = ENPLANWORKSTATUS_PRECONFIRMED)

                           ///// 11.08.10

                           // ���� �������� �����, ������ ��� ���� ���������
                           // ������� �������� �������� ���� ��� ������������
                           // ������� ����, ���������������� ������ ������ ;-)
                           // (� ���� ���� ��� �������� ������������� ����)

                            or
                            (plan.status.code = ENPLANWORKSTATUS_LOCKED)

                           /////
                          );
   end
   else
   begin
      actUndoConfirm.Enabled := ((plan.kind.code = ENPLANWORKKIND_YEAR) and (plan.yearGen = ENPLANWORK_YEAR_GOOD));
   end;

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


  // ������� ������ ������� ;)
  actMovePlan.Enabled :=   (plan.kind.code = ENPLANWORKKIND_CURRENT) and
                           ((plan.status.code = ENPLANWORKSTATUS_GOOD) or (plan.status.code = ENPLANWORKSTATUS_LOCKED));


  // ��������� ��� � ����������� !!!
  actSaveAddInfo.Enabled := (plan.kind.code in [ ENPLANWORKKIND_CURRENT, ENPLANWORKKIND_NPZ] ) and
                            (plan.status.code <> ENPLANWORKSTATUS_GOOD);

  ///// 05.08.10 �������� !!!
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

  // ��� ����� � � ��������� � �����
  actMaterialBindingToFIN.Enabled := (DialogState = dsEdit) and
                                     (pcPlanWork.ActivePage = tsEstimateItems) and
                                     ( (ENPlanWorkObj.kind.code = ENPLANWORKKIND_NPZ) or  (ENPlanWorkObj.kind.code = ENPLANWORKKIND_FACT))
                                     // and ������ �� ��� ������� ....
                                     ;

  actMaterialBindingToFIN.Visible := actMaterialBindingToFIN.Enabled;
  }

  ///// 03.11.11 NET-861
  if plan.kind.code = ENPLANWORKKIND_CURRENT then
  begin
    if plan.status.code <> ENPLANWORKSTATUS_WORKS_FINISHED then
    begin
      actUndoFinishPlanWork.Enabled := false;
      actUndoFinishPlanWork.Visible := false;
      actFinishPlanWork.Enabled := true;
      actFinishPlanWork.Visible := true;
    end
    else begin
      actFinishPlanWork.Enabled := false;
      actFinishPlanWork.Visible := false;
      actUndoFinishPlanWork.Enabled := true;
      actUndoFinishPlanWork.Visible := true;
    end;
  end
  else begin
    DisableActions([actFinishPlanWork, actUndoFinishPlanWork]);
    HideActions([actFinishPlanWork, actUndoFinishPlanWork]);
  end;
  /////

  if (plan.typeRef.code in [ENPLANWORKTYPE_SERVICES_FROM_SIDE, ENPLANWORKTYPE_SERVICES_FROM_SIDE_INVEST]) then
  begin
    DisableActions([actClosePlan, actUnClose, actConfirm, actPreConfirm]);
    HideActions([actClosePlan, actUnClose, actConfirm, actPreConfirm]);
  end;

  
  if not ((plan.kind.code = ENPLANWORKKIND_CURRENT)and(plan.formRef.code = ENPLANWORKFORM_NOPLANNED)) then
   begin
    DisableActions([actClosePlanBilling]);
    HideActions([actClosePlanBilling]);
  end
  else
  begin
    DisableActions([actClosePlanBilling],false);
    HideActions([actClosePlanBilling],false);
  end;

  // ��������� ����������� � �������������
  actSaveFinexecutDepartment.Enabled := (plan.kind.code in [ ENPLANWORKKIND_CURRENT, ENPLANWORKKIND_NPZ])
      and (plan.status.code <> ENPLANWORKSTATUS_GOOD);

end;

procedure TfrmENPlanWorkBillingShow.actPreConfirmExecute(Sender: TObject);
Var TempENPlanWork: ENPlanWorkControllerSoapPort;
ObjCode : Integer;
begin

   try
     ObjCode := StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]);
   except
     on EConvertError do Exit;
   end;


  if Application.MessageBox(PChar('�� ����� ������ ��������� ���� �� ������������ ?'),
                    PChar('����� !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

    TempENPlanWork.preConfirm(ObjCode);

    Application.MessageBox(PChar('���� ���������� ...'), PChar('�����������'), MB_ICONINFORMATION);
    UpdateGrid(Sender);
  end;

end;

procedure TfrmENPlanWorkBillingShow.actConfirmExecute(Sender: TObject);
Var TempENPlanWork: ENPlanWorkControllerSoapPort;
ObjCode : Integer;
begin

   try
     ObjCode := StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]);
   except
     on EConvertError do Exit;
   end;


  if Application.MessageBox(PChar('�� ����� ������ ���������� ��� ?'),
                    PChar('����� !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

    TempENPlanWork.confirm(ObjCode);

    Application.MessageBox(PChar('���� ����������� ...'), PChar('�����������'), MB_ICONINFORMATION);
    UpdateGrid(Sender);
  end;
end;

procedure TfrmENPlanWorkBillingShow.actUndoConfirmExecute(Sender: TObject);
Var TempENPlanWork: ENPlanWorkControllerSoapPort;
ObjCode : Integer;
begin

   try
     ObjCode := StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]);
   except
     on EConvertError do Exit;
   end;


  if Application.MessageBox(PChar('�� ����� ������ ��������� ���� �� ������������� ?'),
                    PChar('����� !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

    TempENPlanWork.undoConfirm(ObjCode);

    Application.MessageBox(PChar('���� ��������� ...'), PChar('�����������'), MB_ICONINFORMATION);
    UpdateGrid(Sender);
  end;
end;

procedure TfrmENPlanWorkBillingShow.actCreatePackExecute(Sender: TObject);
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


  if Application.MessageBox(PChar('�� ����� ������ ���������� ������  ?'),
                    PChar('����� !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
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
        
        Application.MessageBox(PChar('���� ��������� ...'), PChar('�����������'), MB_ICONINFORMATION);
        UpdateGrid(Sender);
     end;

    finally
     frm.Free;
    end;

  end;
end;

procedure TfrmENPlanWorkBillingShow.actUnCloseExecute(Sender: TObject);
Var TempENPlanWork: ENPlanWorkControllerSoapPort;
ObjCode : Integer;
begin

   try
     ObjCode := StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]);
   except
     on EConvertError do Exit;
   end;


  if Application.MessageBox(PChar('�� ����� ������ ³������� ������������ ... ?'),
                    PChar('����� !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

    TempENPlanWork.openPlanWork(ObjCode);

    Application.MessageBox(PChar('�������� ...'), PChar('�����������'), MB_ICONINFORMATION);
    UpdateGrid(Sender);
  end;
  
end;

procedure TfrmENPlanWorkBillingShow.actSaveAddInfoExecute(Sender: TObject);
Var TempENPlanWork: ENPlanWorkControllerSoapPort;
tPlan : ENPlanWork;

  ///// 05.08.10 �������� !!!
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
    ///// 05.08.10 �������� !!!
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
        ///// 05.08.10 �������� !!!
        if not allowEdit then
        begin
        /////
          if (tPlan.finExecutor <> nil) then
          begin
              if (tPlan.finExecutor.code > LOW_INT) then
              begin
                  ShowMessage('�� ����� ����� ��� � ���������� ...');
                  exit;
              end;
          end
          else
          begin
                  ShowMessage('�� ����� ����� ��� � ���������� ...');
                  exit;
          end;
        /////
        end;
        /////
        frmENPlanWorkAddInfoEdit.DisableControls( [frmENPlanWorkAddInfoEdit.edtDateStart, frmENPlanWorkAddInfoEdit.edtDateFinal]);
     end;

    ///// 05.08.10 �������� !!!
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


procedure TfrmENPlanWorkBillingShow.actSaveFinexecutDepartmentExecute(Sender: TObject);
var
  TempENPlanWork : ENPlanWorkControllerSoapPort;
  tPlan : ENPlanWork;
  ObjCode : Integer;
begin
  inherited;
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

  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

  selectedRow := sgENPlanWork.Row;

  frmENPlanWorkAddInfoEdit:=TfrmENPlanWorkAddInfoEdit.Create(Application, dsEdit);
  frmENPlanWorkAddInfoEdit.Caption := '���� ��������� ����';
  frmENPlanWorkAddInfoEdit.HideControls( [frmENPlanWorkAddInfoEdit.edtDateStart, frmENPlanWorkAddInfoEdit.edtDateFinal ,
                                             frmENPlanWorkAddInfoEdit.lblDateStart  , frmENPlanWorkAddInfoEdit.lblDateFinal , frmENPlanWorkAddInfoEdit.gbPlanMOL]);
  frmENPlanWorkAddInfoEdit.isChangeExecutorDepartment:= True;
  frmENPlanWorkAddInfoEdit.gbPlanMOL.Visible := False;

  try
    try
      frmENPlanWorkAddInfoEdit.planObj := TempENPlanWork.getObject(StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]));
    except
      on EConvertError do Exit;
    end;

    if frmENPlanWorkAddInfoEdit.ShowModal= mrOk then
    begin
      if sgENPlanWork.RowCount > 100 then
        sgENPlanWork.RowCount:=sgENPlanWork.RowCount-99
      else
        sgENPlanWork.RowCount:= 2;

      ColCount := ColCount - 99;

      if selectedRow > 100 then
        sgENPlanWorkTopLeftChanged(Sender)
      else
      begin
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


procedure TfrmENPlanWorkBillingShow.FormCreate(Sender: TObject);
var  IPCallCenter,PortCallCenter_:string;
IniPath:string;
begin
  inherited;
  disableControlsType := dtOther;

  HTTPRIOCCOutageNotice.HTTPWebNode.UserName:='callcenter';
  HTTPRIOCCOutageNotice.HTTPWebNode.Password:='callcenter_1';

  IniPath:=ExtractFilePath(Application.ExeName)+IniName;

  if IniValueExists(IniPath,'CallCenter','IP') then
    IPCallCenter:=IniReadString(IniPath,'CallCenter','IP')
   else
     IPCallCenter:='localhost';
    if IniValueExists(IniPath,'CallCenter','Port') then
     PortCallCenter_:=IniReadString(IniPath,'CallCenter','Port')
    else
     PortCallCenter_:='9080';
   HTTPRIOCCOutageNotice.URL:='http://'+IPCallCenter+':'+PortCallCenter_+'/soap/servlet/rpcrouter';

end;

procedure TfrmENPlanWorkBillingShow.actFinishPlanWorkExecute(Sender: TObject);
Var TempENPlanWork: ENPlanWorkControllerSoapPort;
    ENPlanWorkList: ENPlanWorkShortList;
    ENPlanWorkFilterObj: ENPlanWorkFilter;
    ObjCode: Integer;
    ENPlanWorkObj: ENPlanWork;
    tPlan: ENPlanWork;
begin
  tPlan := DMReports.getPlanByCode(StrToInt(sgENPlanWork.Cells[0, sgENPlanWork.Row]));
  if tPlan = nil then
  begin
    Application.MessageBox(PChar('���� �� �������� !'), PChar('�����'), MB_ICONWARNING);
    Exit;
  end;

  if tPlan.code <= 0 then
  begin
    Application.MessageBox(PChar('���� �� �������� !'), PChar('�����'), MB_ICONWARNING);
    Exit;
  end;

  if (tPlan.status.code = ENPLANWORKSTATUS_WORKS_FINISHED) then
  begin
    Application.MessageBox(PChar('��� ���� ��� ����������� � ������ "������ ���������"!'), PChar('�����'), MB_ICONWARNING);
    Exit;
  end;

  if Application.MessageBox(PChar('�� ����� ������ ��������� ���� � ������ "������ ���������" ?' + #13#10 +
                                  '�������� �����, �� ���� ������� � ����� ����� ���� ����������� ����������� � ����. �����!'),
                            PChar('����� !'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
  begin
    TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

    TempENPlanWork.finishPlanWork(tPlan.code);

    Application.MessageBox(PChar('���� ���������� � ������ "������ ���������"!'), PChar('�����������'), MB_ICONINFORMATION);
    UpdateGrid(Sender);
  end;
end;

procedure TfrmENPlanWorkBillingShow.actUndoFinishPlanWorkExecute(Sender: TObject);
Var TempENPlanWork: ENPlanWorkControllerSoapPort;
    ENPlanWorkList: ENPlanWorkShortList;
    ENPlanWorkFilterObj: ENPlanWorkFilter;
    ObjCode: Integer;
    ENPlanWorkObj: ENPlanWork;
    tPlan: ENPlanWork;
begin
  tPlan := DMReports.getPlanByCode(StrToInt(sgENPlanWork.Cells[0, sgENPlanWork.Row]));
  if tPlan = nil then
  begin
    Application.MessageBox(PChar('���� �� �������� !'), PChar('�����'), MB_ICONWARNING);
    Exit;
  end;

  if tPlan.code <= 0 then
  begin
    Application.MessageBox(PChar('���� �� �������� !'), PChar('�����'), MB_ICONWARNING);
    Exit;
  end;

  if (tPlan.status.code <> ENPLANWORKSTATUS_WORKS_FINISHED) then
  begin
    Application.MessageBox(PChar('��� ���� �� ����������� � ������ "������ ���������"!'), PChar('�����'), MB_ICONWARNING);
    Exit;
  end;

  if Application.MessageBox(PChar('�� ����� ������ ²�̲���� ����������� ����� � ������ "������ ���������" ?'),
                            PChar('����� !'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
  begin
    TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

    TempENPlanWork.undoFinishPlanWork(tPlan.code);

    Application.MessageBox(PChar('���� ��������� � ������ "������������"!'), PChar('�����������'), MB_ICONINFORMATION);
    UpdateGrid(Sender);
  end;
end;

end.
