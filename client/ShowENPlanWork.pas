
unit ShowENPlanWork;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENPlanWorkController, AdvObj, IniTools , SetupFormUnit,CCOutageNoticeController,
  ENActController, ShowENPlanWorkForm, tmsAdvGridExcel
  //,XSBuiltIns
  ;

type
  TDisableType = (dtOther, dtMetrology, dtEnergozbyt);


type
  TfrmENPlanWorkShow = class(TChildForm)
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
    N10: TMenuItem;
    miConfirm: TMenuItem;
    N15: TMenuItem;
    actUndoConfirm: TAction;
    actCreatePack: TAction;
    actUnClose: TAction;
    miUnClose: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    miPreConfirm: TMenuItem;
    N18: TMenuItem;
    miUndoConfirm: TMenuItem;
    actSaveAddInfo: TAction;
    N20: TMenuItem;
    HTTPRIOAuth: THTTPRIO;
    actFinishPlanWork: TAction;
    actUndoFinishPlanWork: TAction;
    N14: TMenuItem;
    miFinishPlanWork: TMenuItem;
    miUndoFinishPlanWork: TMenuItem;
    miClosePlanBilling: TMenuItem;
    actClosePlanBilling: TAction;
    HTTPRIOENElement: THTTPRIO;
    HTTPRIOENPlanWorkItem: THTTPRIO;
    actCopyPlan: TAction;
    ToolButton5: TToolButton;
    N22: TMenuItem;
    miCopyPlan: TMenuItem;
    actCreateOrderByPlan: TAction;
    HTTPRIORQOrder: THTTPRIO;
    ToolButton9: TToolButton;
    actSaveFinexecutDepartment: TAction;
    N21: TMenuItem;
    miBufet: TMenuItem;
    actImportBufet: TAction;
    miExportBufet: TMenuItem;
    actExportBufet: TAction;
    actChangeGroupNumberIP: TAction;
    miChangeGroupNumberIP: TMenuItem;
    miChangeObjectForPlan: TMenuItem;
    actChangeObjectForPlan: TAction;
    N19: TMenuItem;
    miCauseDisconnectionOff: TMenuItem;
    HTTPRIOCCOutageNotice: THTTPRIO;
    actChangePlanWorkState: TAction;
    miChangePlanWorkState: TMenuItem;
    actChangePlanWorkForm: TAction;
    miChangePlanWorkForm: TMenuItem;
    actSaveAttributes: TAction;
    miSaveAttributes: TMenuItem;
    N24: TMenuItem;
    actChangePlanReason: TAction;
    actSetSMSInform: TAction;
    actSetSMSInform1: TMenuItem;
    HTTPRIOENPlanInformCustomer: THTTPRIO;
    ImportOrderMaterial: TMenuItem;
    actSetXqtnPercent: TAction;
    N23: TMenuItem;
    aeExcel: TAdvGridExcelIO;
    actExcell: TAction;
    exportExcel: TMenuItem;

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
    procedure actCopyPlanExecute(Sender: TObject);
    procedure actCreateOrderByPlanExecute(Sender: TObject);
    procedure actSaveFinexecutDepartmentExecute(Sender: TObject);
    procedure actImportBufetExecute(Sender: TObject);
    procedure actExportBufetExecute(Sender: TObject);
    procedure actChangeGroupNumberIPExecute(Sender: TObject);
    procedure actChangeObjectForPlanExecute(Sender: TObject);
    procedure miCauseDisconnectionOffClick(Sender: TObject);
    procedure actChangePlanWorkStateExecute(Sender: TObject);
    procedure actChangePlanWorkFormExecute(Sender: TObject);
    procedure actSaveAttributesExecute(Sender: TObject);
    procedure actSetSMSInformExecute(Sender: TObject);
    procedure actChangePlanReasonExecute(Sender: TObject);
    procedure ImportOrderMaterialClick(Sender: TObject);
    procedure actSetXqtnPercentExecute(Sender: TObject);
    procedure actExcellExecute(Sender: TObject);



  private
   { Private declarations }
 public
   { Public declarations }
   viewPlanWork : Integer;
   isFiltered : boolean;
   outerCondition: String;
   disableControlsType : TDisableType;
   elementCode: Integer;
   elementName: String;

   procedure UpdateGrid(Sender: TObject);

 end;

var
 frmENPlanWorkShow : TfrmENPlanWorkShow;
 // ENPlanWorkObj: ENPlanWork;
 // ENPlanWorkFilterObj: ENPlanWorkFilter;
  
  
implementation

uses Main, EditENPlanWork, EditENPlanWorkFilter, ENConsts,
  ENPlanWorkMoveHistoryController, EditENPlanWorkMoveHistory,
  ENPlanWorkMoveReasonController, EditENPlanCorrectHistory,
  ENPlanCorrectHistoryController, DMReportsUnit, ENDepartmentController,
  ENElementController, ENPlanWorkTypeController,
  ENPlanWorkStatusController, ENPlanWorkKindController,ENPlanWorkItemController
  //, EditENFact
  , EditCNPack2PlanWork, CNPack2PlanWorkController, EditENPlanWorkAddInfo,
  AuthorizationController, EditENPlanTransPort, EditENPlanWorkCopy,
  RQOrderController,EditBufetRealization, ChangeGroupNumberIP,
  EditChangeObjectForPlan, EditMakePlanWorkItem, EditENPlanWorkAttributes,
  EditENPlanInformCustomer, ENPlanInformCustomerController,
  EditChangePlanReason, ENPlanWorkClose,EditOrderBufet, EditENPlanXqtnHistory,
  ENPlanXqtnHistoryController, Globals , ShellAPI ;


{$R *.dfm}

var
  //frmENPlanWorkShow : TfrmENPlanWorkShow;

  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENPlanWorkHeaders: array [1..24] of String =
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
          ,'Людино-години'
          ,'Сумма запланированных материалов'
          ,'Початк. місяць та рік плану (до перенесення)'
          //,'Дата складання плану'
          ,'Номер наряда'
          ,'Користувач, що вніс зміни'
          ,'Дата останньої зміни'
          ,'Дата створення'
          ,'Комплект. обов`яз. матеріалами%/інвест%'
          ,'Забезпечення транспортом %'
          ,'Акт'
        );

  selectedRow : Integer;


procedure TfrmENPlanWorkShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENPlanWorkShow:=nil;
    inherited;
  end;


procedure TfrmENPlanWorkShow.FormShow(Sender: TObject);
var
  TempENPlanWork: ENPlanWorkControllerSoapPort;
  i, n : Integer;
  ENPlanWorkList: ENPlanWorkShortList;
  statusName : string;
begin

  ////  f.typeRef.code := TMenuItem(Sender).Tag  ////
  ////  TMenuItem.Tag   1 - обычный вид          ////
  ////  TMenuItem.Tag   2 - упрощенный вид       ////

  if (viewPlanWork = 0) then
  begin
    if (ENPlanWorkFilter(FilterObject).typeRef <> nil) then
        if (FilterObject <> nil) then
            viewPlanWork := ENPlanWorkFilter(FilterObject).typeRef.code;
    FilterObject := ENPlanWorkFilter.Create;
    SetNullIntProps(FilterObject);
    SetNullXSProps(FilterObject);
  end;

  SetGridHeaders(ENPlanWorkHeaders, sgENPlanWork.ColumnHeaders);

  if (viewPlanWork = PLANWORKSHOW_LIGHT) then
  begin
    sgENPlanWork.ColWidths[9] := 0;
    sgENPlanWork.ColWidths[10] := 160;
  end;

  ColCount:=100;

  ///
  DisableActions([actFinishPlanWork, actUndoFinishPlanWork]);
  HideActions([actFinishPlanWork, actUndoFinishPlanWork]);
  ///

  // Пока даем копировать только при вызове списка планов из главной формы, а не во всяких диалоговых формах
  if FormMode <> fmChild then
    DisableActions([actCopyPlan]);

  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENPlanWorkFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
     ENPlanWorkFilter(FilterObject).conditionSQL := ' enplanwork.statuscode <> ' + IntToStr(ENPLANWORKSTATUS_OLDER)
      + ' and enplanwork.kindcode <> ' + IntToStr(ENPLANWORKKIND_CALCULATION_SINGLE) ;
     isFiltered := false;
  end;

  if not isFiltered then
  begin
     //isFiltered := true;
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


        if (viewPlanWork = PLANWORKSHOW_LIGHT) then
        begin
          inc(n);

          if (ENPlanWorkList.list[i].kindCode = ENPLANWORKKIND_YEAR) then
            statusName := 'Попередній'
          else
          if ((ENPlanWorkList.list[i].kindCode = ENPLANWORKKIND_CURRENT)
              and (ENPlanWorkList.list[i].statusCode = ENPLANWORKSTATUS_GOOD) ) then
            statusName := 'Затверджений'
          else

          if ((ENPlanWorkList.list[i].kindCode = ENPLANWORKKIND_CURRENT)
              and (ENPlanWorkList.list[i].statusCode = ENPLANWORKSTATUS_PRECONFIRMED) ) then
            statusName := 'Затверджений'
          else

          if ((ENPlanWorkList.list[i].kindCode = ENPLANWORKKIND_CURRENT)
              and (ENPlanWorkList.list[i].statusCode = ENPLANWORKSTATUS_LOCKED) ) then
            statusName := 'Роботи виконуються'

          else
            statusName := ENPlanWorkList.list[i].statusName;

          Cells[n,i+1] := statusName;
          inc(n);
        end else
        begin
          Cells[n,i+1] := ENPlanWorkList.list[i].kindName ;
          inc(n);
          Cells[n,i+1] := ENPlanWorkList.list[i].statusName;
          inc(n);
        end;


        Cells[n,i+1] := ENPlanWorkList.list[i].departmentRefShortName;
        inc(n);

        Cells[n,i+1] := ENPlanWorkList.list[i].budgetRefShortName;
        inc(n);

        Cells[n,i+1] := ENPlanWorkList.list[i].responsibilityRefShortName;
        inc(n);

        if ENPlanWorkList.list[i].humanHours = nil then
          Cells[n,i+1] := ''
        else
          Cells[n,i+1] := ENPlanWorkList.list[i].humanHours.DecimalString;
        inc(n);

        if ENPlanWorkList.list[i].planedSum = nil then
          Cells[n,i+1] := ''
        else
        Cells[n,i+1] := ENPlanWorkList.list[i].planedSum.DecimalString;
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
         
        if ENPlanWorkList.list[i].dateGen = nil then
          Cells[n,i+1] := ''
        else
          Cells[n,i+1] := XSDateTimeWithDate2String(ENPlanWorkList.list[i].dateGen);


        inc(n);

        Cells[n,i+1] := ENPlanWorkList.list[i].percentManningWithMaterials;
        inc(n);

        Cells[n,i+1] := ENPlanWorkList.list[i].percentManningWithTransport;
        inc(n);

        Cells[n,i+1] := ENPlanWorkList.list[i].actInfo;
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

procedure TfrmENPlanWorkShow.miCauseDisconnectionOffClick(Sender: TObject);
var
  TempENPlanWork: ENPlanWorkControllerSoapPort;
  ObjCode: Integer;
begin
  if Application.MessageBox(PChar('Ви дійсно бажаєте '+ miCauseDisconnectionOff.Caption +' ?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    try
      ObjCode := StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]);
    except
      on EConvertError do Exit;
    end;

    TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;
    TempENPlanWork.setCauseDisconnectionOff(ObjCode);

  end;

end;

procedure TfrmENPlanWorkShow.ImportOrderMaterialClick(Sender: TObject);
 var
  TempENPlanWork: ENPlanWorkControllerSoapPort;
  plan:ENPlanWork;
begin

   TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;
   try

    plan:=TempENPlanWork.getObject(StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]));

    frmBufetOrder:=TfrmBufetOrder.Create(Application, dsView);
    frmBufetOrder.aDate:=TXSDate.Create;
    frmBufetOrder.aDate:=plan.dateStart;

    frmBufetOrder.ShowModal;

     if frmBufetOrder.numberDoc<>'' then
     begin
       TempENPlanWork.importOrderBufet(StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]),frmBufetOrder.numberDoc);
       Application.MessageBox(PChar('Операція пройшла успішно!'),PChar('Увага!'), MB_ICONINFORMATION);
     end;
   except
   on EConvertError do Exit;
  end;


end;

procedure TfrmENPlanWorkShow.sgENPlanWorkTopLeftChanged(Sender: TObject);
var
  TempENPlanWork: ENPlanWorkControllerSoapPort;
  i, n, CurrentRow: Integer;
  ENPlanWorkList: ENPlanWorkShortList;
  statusName : string;
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
        

        if (viewPlanWork = PLANWORKSHOW_LIGHT) then
        begin
          inc(n);

          if (ENPlanWorkList.list[i].kindCode = ENPLANWORKKIND_YEAR) then
            statusName := 'Попередній'
          else
          if ((ENPlanWorkList.list[i].kindCode = ENPLANWORKKIND_CURRENT)
              and (ENPlanWorkList.list[i].statusCode = ENPLANWORKSTATUS_GOOD) ) then
            statusName := 'Затверджений'
          else

          if ((ENPlanWorkList.list[i].kindCode = ENPLANWORKKIND_CURRENT)
              and (ENPlanWorkList.list[i].statusCode = ENPLANWORKSTATUS_PRECONFIRMED) ) then
            statusName := 'Затверджений'
          else

          if ((ENPlanWorkList.list[i].kindCode = ENPLANWORKKIND_CURRENT)
              and (ENPlanWorkList.list[i].statusCode = ENPLANWORKSTATUS_LOCKED) ) then
            statusName := 'Роботи виконуються'

          else
            statusName := ENPlanWorkList.list[i].statusName;

          Cells[n,i+CurrentRow] := statusName;
          inc(n);
        end else
        begin
          Cells[n,i+CurrentRow] := ENPlanWorkList.list[i].kindName;
          inc(n);
          Cells[n,i+CurrentRow] := ENPlanWorkList.list[i].statusName;
          inc(n);
        end;


        Cells[n,i+CurrentRow] := ENPlanWorkList.list[i].departmentRefShortName;
        inc(n);
        Cells[n,i+CurrentRow] := ENPlanWorkList.list[i].budgetRefShortName;
        inc(n);
        Cells[n,i+CurrentRow] := ENPlanWorkList.list[i].responsibilityRefShortName;
        inc(n);

        if ENPlanWorkList.list[i].humanHours = nil then
          Cells[n,i+CurrentRow] := ''
        else
          Cells[n,i+CurrentRow] := ENPlanWorkList.list[i].humanHours.DecimalString;
        inc(n);

        if ENPlanWorkList.list[i].planedSum = nil then
          Cells[n,i+CurrentRow] := ''
        else
        Cells[n,i+CurrentRow] := ENPlanWorkList.list[i].planedSum.DecimalString;
        inc(n);

        Cells[n,i+CurrentRow] := '';
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
        
        if ENPlanWorkList.list[i].dateGen = nil then
          Cells[n,i+CurrentRow] := ''
        else
          Cells[n,i+CurrentRow] := XSDateTimeWithDate2String(ENPlanWorkList.list[i].dateGen);

        inc(n);

        Cells[n,i+CurrentRow] := ENPlanWorkList.list[i].percentManningWithMaterials;
        inc(n);

        Cells[n,i+CurrentRow] := ENPlanWorkList.list[i].percentManningWithTransport;
        inc(n);

        Cells[n,i+CurrentRow] := ENPlanWorkList.list[i].actInfo;
        inc(n);
        //Objects[0,i+CurrentRow] := ENPlanWorkList.list[i]; //TObject(ENPlanWorkList.list[i].statusCode);

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

procedure TfrmENPlanWorkShow.sgENPlanWorkDblClick(Sender: TObject);
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

procedure TfrmENPlanWorkShow.UpdateGrid(Sender: TObject);
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

procedure TfrmENPlanWorkShow.actViewExecute(Sender: TObject);
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
   frmENPlanWorkEdit.viewPlanWork := viewPlanWork;

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

procedure TfrmENPlanWorkShow.actEditExecute(Sender: TObject);
var
  ObjCode : Integer;
  TempENPlanWork : ENPlanWorkControllerSoapPort;
  tPlan : ENPlanWork;
  act : ENAct;
begin
  try
    ObjCode := StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]);
  except
    on EConvertError do Exit;
  end;

  tPlan := DMReports.getPlanByCode(ObjCode);

  if tPlan = nil then
    Exit;

  if (tPlan.kind.code = ENPLANWORKKIND_FACT) then
    begin
      act := DMReports.getActByPlan(ObjCode);
      if (act.code <> LOW_INT) then
        begin
          Application.MessageBox(PChar('Цей факт включено до Акту!'),
            PChar('Увага!'), MB_ICONWARNING);
          Exit;
        end;
    end;

  //ShowMessage(ENPlanWorkShort(sgENPlanWork.Objects[0,sgENPlanWork.Row]).statusName);
  //if Integer(sgENPlanWork.Objects[0,sgENPlanWork.Row]) <> ENPLANWORKSTATUS_GOOD then

  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

  if (tPlan.status.code = ENPLANWORKSTATUS_PRECONFIRMED)  then
    begin
      try
        TempENPlanWork.editPreConfirm(tPlan.code);
      except
        Application.MessageBox(
          PChar('Цей план можуть коригувати тільки у ХОЕ!'),
          PChar('Увага'), MB_ICONWARNING);
        Exit;
      end;
    end;

  if not (tPlan.status.code in [ENPLANWORKSTATUS_GOOD,
    ENPLANWORKSTATUS_INCORRECTION, ENPLANWORKSTATUS_PRECONFIRMED])
  //and not (tPlan.kind.code in [ENPLANWORKKIND_CURRENT])
  then
    begin
      Application.MessageBox(PChar('План затверджений !'),
        PChar('Увага'), MB_ICONWARNING);
      Exit;
    end;

  selectedRow := sgENPlanWork.Row;

  frmENPlanWorkEdit:=TfrmENPlanWorkEdit.Create(Application, dsEdit);

  try
    frmENPlanWorkEdit.viewPlanWork := viewPlanWork;

    if (tPlan.typeRef.code = ENPLANWORKTYPE_TRANSPORT)
    and (tPlan.stateRef.code = ENPLANWORKSTATE_GSM) then
      frmENPlanWorkEdit.isTransport := true;

    if (tPlan.typeRef.code = ENPLANWORKTYPE_SIZ) then
      frmENPlanWorkEdit.isSiz := true;

    try
      frmENPlanWorkEdit.ENPlanWorkObj := TempENPlanWork.getObject(
        StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]));
    except
      on EConvertError do Exit;
    end;

    //12.04.2012 NET-1622 Для копирования плана сетим isForCopy в true, чтобы
    //можно было после открытия формы на редактирование поменять объект
    if Sender = actCopyPlan then
      frmENPlanWorkEdit.isForCopy := true;

    if frmENPlanWorkEdit.ShowModal = mrOk then
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
        sgENPlanWork.Row := sgENPlanWork.RowCount - 1;
  finally
    frmENPlanWorkEdit.Free;
    frmENPlanWorkEdit := nil;
  end;
end;

procedure TfrmENPlanWorkShow.actDeleteExecute(Sender: TObject);
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

procedure TfrmENPlanWorkShow.actInsertExecute(Sender: TObject);
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


procedure TfrmENPlanWorkShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := sgENPlanWork.Row;
  UpdateGrid(Sender);

  if sgENPlanWork.RowCount > selectedRow then
    sgENPlanWork.Row := selectedRow
  else
    sgENPlanWork.Row :=  sgENPlanWork.RowCount-1;
end;


procedure TfrmENPlanWorkShow.actFilterExecute(Sender: TObject);
var condition: String;
begin

  frmENPlanWorkFilterEdit:=TfrmENPlanWorkFilterEdit.Create(Application, dsInsert);
  try
    ENPlanWorkFilterObj := ENPlanWorkFilter.Create;
    SetNullIntProps(ENPlanWorkFilterObj);
    SetNullXSProps(ENPlanWorkFilterObj);

    frmENPlanWorkFilterEdit.disableControlsType := disableControlsType;
    frmENPlanWorkFilterEdit.viewPlanWork := viewPlanWork;
    if elementCode > 0 then
    begin
      frmENPlanWorkFilterEdit.elementCode := elementCode;
      frmENPlanWorkFilterEdit.elementName := elementName;
    end;
    {
    if disableControlsType = dtMetrology then
    begin

       ENPlanWorkFilterObj.kind := ENPlanWorkKind.Create;
       ENPlanWorkFilterObj.kind.code := ENPLANWORKKIND_CURRENT;
       frmENPlanWorkFilterEdit.cbPlanWorkKind.ItemIndex := ENPLANWORKKIND_CURRENT - 1;

       frmENPlanWorkFilterEdit.cbElementType

       frmENPlanWorkFilterEdit.DisableControls([frmENPlanWorkFilterEdit.cbPlanWorkKind]);

    end;
    }


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
      isFiltered := True;
      actUpdateExecute(Sender);
    end;


    //else
    // isFiltered := False;

    ENPlanWorkFilterObj := nil;
  finally
    frmENPlanWorkFilterEdit.Free;
    frmENPlanWorkFilterEdit:=nil;
  end;
end;

procedure TfrmENPlanWorkShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

procedure TfrmENPlanWorkShow.actEstimateExecute(Sender: TObject);
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

procedure TfrmENPlanWorkShow.actCancelEstimateExecute(Sender: TObject);
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

procedure TfrmENPlanWorkShow.actChangeGroupNumberIPExecute(Sender: TObject);
var objCode: Integer;
begin

  try
    objCode := StrToInt(sgENPlanWork.Cells[0, sgENPlanWork.Row]);
  except
    on EConvertError do Exit;
  end;

  frmChangeGroupNumberIP := TfrmChangeGroupNumberIP.Create(Application, dsInsert);
  try
    frmChangeGroupNumberIP.enplanworkcode := objCode;

    if frmChangeGroupNumberIP.ShowModal = mrOk then
    begin
      actUpdateExecute(Sender);
    end;

  finally
    frmChangeGroupNumberIP.Free;
    frmChangeGroupNumberIP := nil;
  end;

end;


procedure TfrmENPlanWorkShow.actChangeObjectForPlanExecute(Sender: TObject);
var objCode: Integer;
begin
  try
    objCode := StrToInt(sgENPlanWork.Cells[0, sgENPlanWork.Row]);
  except
    on EConvertError do Exit;
  end;

  frmChangeObjectForPlanEdit := TfrmChangeObjectForPlanEdit.Create(Application, dsEdit);
  try
    frmChangeObjectForPlanEdit.planCode := objCode;

    if frmChangeObjectForPlanEdit.ShowModal = mrOk then
    begin
      actUpdateExecute(Sender);
    end;
  finally
    frmChangeObjectForPlanEdit.Free;
    frmChangeObjectForPlanEdit := nil;
  end;
end;


procedure TfrmENPlanWorkShow.actChangePlanReasonExecute(Sender: TObject);
var frmChangePlanReasonEdit : TfrmChangePlanReasonEdit;
  planCode : Integer;
begin
  try
    planCode := StrToInt(sgENPlanWork.Cells[0, sgENPlanWork.Row]);
  except
    on EConvertError do Exit;
  end;

 frmChangePlanReasonEdit := TfrmChangePlanReasonEdit.Create(Application, dsEdit);
  try
    frmChangePlanReasonEdit.planCode := planCode;

    if frmChangePlanReasonEdit.ShowModal = mrOk then
    begin
      actUpdateExecute(Sender);
    end;
  finally
    frmChangePlanReasonEdit.Free;
    frmChangePlanReasonEdit := nil;
  end;
end;

procedure TfrmENPlanWorkShow.actChangePlanWorkFormExecute(Sender: TObject);
var
  objCode: Integer;
  TempENPlanWork: ENPlanWorkControllerSoapPort;
  ENPlanWorkObj: ENPlanWork;
  frmENPlanWorkFormShow: TfrmENPlanWorkFormShow;
begin
  inherited;
  try
    objCode := StrToInt(sgENPlanWork.Cells[0, sgENPlanWork.Row]);
  except
    on EConvertError do Exit;
  end;

  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;
  ENPlanWorkObj := TempENPlanWork.getObject(objCode);

  frmENPlanWorkFormShow := TfrmENPlanWorkFormShow.Create(Application, fmNormal);
  DisableActions([frmENPlanWorkFormShow.actEdit, frmENPlanWorkFormShow.actInsert, frmENPlanWorkFormShow.actDelete]);
  try
    with frmENPlanWorkFormShow do
    begin
      if ShowModal = mrOk then
      begin
        try
          ENPlanWorkObj.formRef.code := StrToInt(sgENPlanWorkForm.Cells[0,sgENPlanWorkForm.Row]);
          TempENPlanWork.changePlanWorkForm(ENPlanWorkObj);
        except
          on EConvertError do Exit;
        end;
      end;
    end;
  finally
    frmENPlanWorkFormShow.Free;
  end;
end;


procedure TfrmENPlanWorkShow.actChangePlanWorkStateExecute(Sender: TObject);
var
  objCode: Integer;
begin
  inherited;
  try
    objCode := StrToInt(sgENPlanWork.Cells[0, sgENPlanWork.Row]);
  except
    on EConvertError do Exit;
  end;

  frmChangeObjectForPlanEdit := TfrmChangeObjectForPlanEdit.Create(Application, dsEdit);
  try
    frmChangeObjectForPlanEdit.planCode := objCode;
    frmChangeObjectForPlanEdit.changePlanWorkState := True;

    if frmChangeObjectForPlanEdit.ShowModal = mrOk then
    begin
      actUpdateExecute(Sender);
    end;
  finally
    frmChangeObjectForPlanEdit.Free;
    frmChangeObjectForPlanEdit := nil;
  end;
end;


procedure TfrmENPlanWorkShow.actClosePlanExecute(Sender: TObject);
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
    isExistsOutages:boolean;
begin
    try
      ObjCode := StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]);
    except
      on EConvertError do Exit;
    end;

    //if not (Integer(sgENPlanWork.Objects[0,sgENPlanWork.Row]) in [ ENPLANWORKSTATUS_GOOD, ENPLANWORKSTATUS_INCORRECTION]) then
    //tPlan := DMReports.getPlanByCode(StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]));
    tPlan := DMReports.getPlanByCode(ObjCode);
    if tPlan = nil then
    begin
      Application.MessageBox(PChar('План not found !'), PChar('Увага'), MB_ICONWARNING);
      Exit;
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
        Application.MessageBox(PChar('План ВЖЕ затверджений або видалений !'), PChar('Увага'), MB_ICONWARNING);
        exit;
    end;



    isMove := 0;
    if ((tEObj.typeRef.code=7)
          and ((tPlan.typeRef.code=102)or (tPlan.typeRef.code=103) or (tPlan.typeRef.code=104))
          and (tPlan.formRef.code=ENPLANWORKFORM_NOPLANNED)) then
    begin

      TempENPlanWorkItem := HTTPRIOENPlanWorkItem as ENPlanWorkItemControllerSoapPort;
      ENPlanWorkItemFilterObj:= ENPlanWorkItemFilter.Create;
      SetNullIntProps(ENPlanWorkItemFilterObj);
      SetNullXSProps(ENPlanWorkItemFilterObj);

      ENPlanWorkItemFilterObj.planRef:=ENPlanWorkRef.Create;
      ENPlanWorkItemFilterObj.planRef.code:=tPlan.code;

      ENPlanWorkItemFilterObj.conditionSQL := 'enplanworkitem.countgen<>0 and enplanworkitem.kartarefcode in  (select tki.code from tktechcard tki where (tki.name like '+''''+'%Планова%'+''''+' or tki.name like '+''''+'%трифаз%'+''''+'))'+
        ' and enplanworkitem.planrefcode IN (SELECT planrefcode from enplanworkmovehistory where planrefcode='+IntToStr(tPlan.code)+')';

      ENPlanWorkItemList:=TempENPlanWorkItem.getScrollableFilteredList(ENPlanWorkItemFilterObj,0,1);

      if (HIGH(ENPlanWorkItemList.list)>=0) then isMove:=1;

    end;


    if ( (tEObj.typeRef.code=7)
        and ((tPlan.typeRef.code=102) or (tPlan.typeRef.code=103) or (tPlan.typeRef.code=104))
        and (tPlan.formRef.code=ENPLANWORKFORM_NOPLANNED)
        and (isMove=0)
        and (tPlan.kind.code<>4) ) then
    begin
      // проверка плана на связь с Заявлением потребителя в DocFlow...
      if not DMReports.checkPlanConsumerServices(ObjCode) then
      begin
        Application.MessageBox(PChar('Треба вибрати - Затвердити план(біллінг) або затвердити план з біллінгу !'), PChar('Увага'), MB_ICONWARNING);
        Exit;
      end;
    end;

    if ((tEObj.typeRef.code=7)and(tPlan.typeRef.code=101)) then
    begin
      Application.MessageBox(PChar('Треба затвердити план з біллінгу!'), PChar('Увага'), MB_ICONWARNING);
      exit;
    end;

    if tPlan.causeDisconnection = 1 then
    begin
      TempCCOutageNotice := HTTPRIOCCOutageNotice as CCOutageNoticeControllerSoapPort;
      isExistsOutages:=TempCCOutageNotice.isExistsNoAgreedOutages(StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]));

      if (isExistsOutages=True) then
      begin
        Application.MessageBox(PChar('Їснують непогоджені споживачем попередження!'),
                         PChar('Увага!'), MB_ICONWARNING);
        Exit;
      end;
    end;

    TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;
    if ((tPlan.kind.code = ENPLANWORKKIND_CURRENT) and (tPlan.formRef.code = ENPLANWORKFORM_PLANNED)) then
    begin

      frmMakePlanWorkItemEdit := TfrmMakePlanWorkItemEdit.Create(Application, dsView);
      frmMakePlanWorkItemEdit.planCode := tPlan.code;

      try
        if frmMakePlanWorkItemEdit.ShowModal = mrOk then
        begin

          Application.MessageBox(PChar('План затверджено!'), PChar('Повідомлення'), MB_ICONINFORMATION);
          UpdateGrid(Sender);
        end;

      finally
        frmMakePlanWorkItemEdit.Free;
        frmMakePlanWorkItemEdit := nil;
      end;

    end else
    if ((tPlan.kind.code = ENPLANWORKKIND_CURRENT) and (tPlan.formRef.code <> ENPLANWORKFORM_PLANNED)) then
    begin

      frmPlanWorkClose := TfrmPlanWorkClose.Create(Application, dsEdit);
      frmPlanWorkClose.plan  := tPlan;

      try
        if frmPlanWorkClose.ShowModal = mrOk then
        begin
          Application.MessageBox(PChar('План затверджено!'), PChar('Повідомлення'), MB_ICONINFORMATION);
          UpdateGrid(Sender);
        end;

      finally
        frmPlanWorkClose.Free;
        frmPlanWorkClose := nil;
      end;

    end
    else
    begin
      if Application.MessageBox(PChar('Ви дійсно бажаєте '+ miClosePlan.Caption +' ?'),
                        PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
      begin
        TempENPlanWork.closePlanWork(StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]));

        Application.MessageBox(PChar('План затверджено!'), PChar('Повідомлення'), MB_ICONINFORMATION);
        UpdateGrid(Sender);
      end;
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



procedure TfrmENPlanWorkShow.actClosePlanBillingExecute(Sender: TObject);
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
  try
    ObjCode := StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]);
  except
    on EConvertError do Exit;
  end;

  //tPlan := DMReports.getPlanByCode(StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]));
  tPlan := DMReports.getPlanByCode(ObjCode);
  if tPlan = nil then
  begin
     Application.MessageBox(PChar('План not found !'), PChar('Увага'), MB_ICONWARNING);
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
      Application.MessageBox(PChar('План ВЖЕ затверджений або видалений !'), PChar('Увага'), MB_ICONWARNING);
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
      Application.MessageBox(PChar('Можна затверджувати тількі місячні непланові плани біллінга !'), PChar('Увага'), MB_ICONWARNING);
      exit;
  end;

     if tPlan.causeDisconnection = 1 then
     begin
       TempCCOutageNotice := HTTPRIOCCOutageNotice as CCOutageNoticeControllerSoapPort;
       isExistsOutages:=TempCCOutageNotice.isExistsNoAgreedOutages(StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]));
       if (isExistsOutages=True) then
       begin
       Application.MessageBox(PChar('Їснують непогоджені споживачем попередження!'),
                           PChar('Увага!'), MB_ICONWARNING);
       Exit;
       end;
     end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте '+ miClosePlan.Caption +' ?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

        TempENPlanWork.closePlanWorkBilling(StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]));
        Application.MessageBox(PChar('План затверджено !'), PChar('Повідомлення'), MB_ICONINFORMATION);
        UpdateGrid(Sender);

  end;

end;




procedure TfrmENPlanWorkShow.actMovePlanExecute(Sender: TObject);
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
  if not ((plan.kind.code = ENPLANWORKKIND_CURRENT) and ((plan.status.code = ENPLANWORKSTATUS_GOOD) or (plan.status.code = ENPLANWORKSTATUS_LOCKED))) then
//  if  not ( plan.status.code in [ENPLANWORKSTATUS_LOCKED, ENPLANWORKSTATUS_CORRECTED]) then
  begin
      Application.MessageBox(PChar('переносить можно ТОЛЬКО текущие планы (без НПЗ) !'), PChar('Увага'), MB_ICONWARNING);
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

procedure TfrmENPlanWorkShow.actCorrectPlanExecute(Sender: TObject);
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

procedure TfrmENPlanWorkShow.actAddPlanItemsExecute(Sender: TObject);
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

procedure TfrmENPlanWorkShow.actMakeNPZExecute(Sender: TObject);
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
      //newPlan.dateGen:= TXSDate.Create; NET-4213
      //newPlan.dateGen.XSToNative(GetXSDate(SysUtils.Date));


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

procedure TfrmENPlanWorkShow.PopupMenu1Popup(Sender: TObject);
var
  plan : ENPlanWork;
  ObjCode, elementType : Integer;

  ///// 05.08.10 ВРЕМЕННО !!!
  // TempUser: UserControllerSoapPort;
  // UserObj: User;
  /////
begin
  DisableActions([actClosePlan, actUnClose, actConfirm, actPreConfirm], False);
  HideActions([actClosePlan, actUnClose, actConfirm, actPreConfirm], False);

  DisableActions([actChangeObjectForPlan]);
  HideActions([actChangeObjectForPlan]);

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



  ///// 01.03.14
  elementType := DMReports.getElementTypeByPlan(plan);
  if (elementType = EN_CALLCENTER_OBJECT) and
     (plan.kind.code = ENPLANWORKKIND_NPZ) and
     (plan.status.code = ENPLANWORKSTATUS_GOOD) then
  begin
    DisableActions([actChangeObjectForPlan], false);
    HideActions([actChangeObjectForPlan], false);
    DisableActions([actChangePlanWorkState]);
    HideActions([actChangePlanWorkState]);
    DisableActions([actChangePlanWorkForm]);
    HideActions([actChangePlanWorkForm]);
  end
  else begin
    if (elementType = EN_BYT) or (elementType = EN_PROM) then
    begin
      DisableActions([actChangeObjectForPlan]);
      HideActions([actChangeObjectForPlan]);
      DisableActions([actChangePlanWorkState], False);
      HideActions([actChangePlanWorkState], False);
      DisableActions([actChangePlanWorkForm]);
      HideActions([actChangePlanWorkForm]);
    end else
    begin
      DisableActions([actChangeObjectForPlan], False);
      HideActions([actChangeObjectForPlan], False);
      DisableActions([actChangePlanWorkState], False);
      HideActions([actChangePlanWorkState], False);
      DisableActions([actChangePlanWorkForm], (plan.kind.code = ENPLANWORKKIND_YEAR));
      HideActions([actChangePlanWorkForm], (plan.kind.code = ENPLANWORKKIND_YEAR));
    end;
  end;
  /////

  if  ((
      (plan.stateRef.code=ENPLANWORKSTATE_BUFET_REALIZATION)or
      (plan.stateRef.code=ENPLANWORKSTATE_BUFET_REALIZATION_BEZNAL)
      )
      and (plan.kind.code=ENPLANWORKKIND_FACT)
      and (plan.status.code=ENPLANWORKSTATUS_GOOD)
      )
      then begin
         miBufet.Visible:=true;
         actImportBufet.Enabled:=true;
      end
      else begin
        miBufet.Visible:=false;
        actImportBufet.Enabled:=false;
      end;


   if  ((
      (plan.stateRef.code=ENPLANWORKSTATE_BUFET_NONEREALIZATION)
      )
      and (plan.kind.code=ENPLANWORKKIND_FACT)
      and (plan.status.code=ENPLANWORKSTATUS_GOOD)
      )
      then begin
         miExportBufet.Visible:=true;
         actExportBufet.Enabled:=true;
      end
      else begin
        miExportBufet.Visible:=false;
        actExportBufet.Enabled:=false;
      end;

       if  ((
      (plan.stateRef.code=ENPLANWORKSTATE_TECHNICALSERVICE)
      )
      and (plan.kind.code=ENPLANWORKKIND_CURRENT)
      and (plan.status.code=ENPLANWORKSTATUS_GOOD)
      )
      then begin
         ImportOrderMaterial.Visible:=true;
      end
      else begin
        ImportOrderMaterial.Visible:=false;
      end;



  actMakeNPZ.Visible := false;

  if (viewPlanWork = PLANWORKSHOW_LIGHT) then
  begin
    miClosePlan.Caption := 'Розпочати формування Нового наряд-завдання';

    if plan.kind.code = ENPLANWORKKIND_CURRENT then
       miClosePlan.Caption := 'Розпочати формування Нового наряд-завдання'
    else
    if plan.kind.code = ENPLANWORKKIND_NPZ then
       miClosePlan.Caption := 'Скласти Завдання ФАКТ'
    else
    if plan.kind.code = ENPLANWORKKIND_FACT then
       miClosePlan.Caption := 'Затвердити Факт, для якого не потрібно формувати Акт ...';//'Затвердити ФАКТ';
  end else
  begin
    miClosePlan.Caption := 'Затвердити План';

    if plan.kind.code = ENPLANWORKKIND_CURRENT then
       miClosePlan.Caption := 'Скласти Завдання ПЛАН'
    else
    if plan.kind.code = ENPLANWORKKIND_NPZ then
       miClosePlan.Caption := 'Скласти Завдання ФАКТ'
    else
    if plan.kind.code = ENPLANWORKKIND_FACT then
       miClosePlan.Caption := 'Затвердити Факт, для якого не потрібно формувати Акт ...';//'Затвердити ФАКТ';
  end;

  actChangePlanReason.Visible := ((plan.kind.code = ENPLANWORKKIND_CURRENT) and (plan.formRef.code = ENPLANWORKFORM_NOPLANNED));
  actChangePlanReason.Enabled := ((plan.kind.code = ENPLANWORKKIND_CURRENT) and (plan.formRef.code = ENPLANWORKFORM_NOPLANNED));

  actSetSMSInform.Visible := (plan.kind.code = ENPLANWORKKIND_NPZ);
  actSetSMSInform.Enabled := (plan.kind.code = ENPLANWORKKIND_NPZ);


  actClosePlan.Enabled := //(plan.kind.code <> ENPLANWORKKIND_FACT) and
                          (
                             ( plan.status.code = ENPLANWORKSTATUS_GOOD) or ( plan.kind.code = ENPLANWORKKIND_CURRENT)
                             // для статусов на корректировке - ограничим на сервере ... and (plan.status.code <> ENPLANWORKSTATUS_PRECONFIRMED)
                           );

  actClosePlan.Visible := actClosePlan.Enabled;

  DisableActions([actClosePlan], (plan.kind.code = ENPLANWORKKIND_YEAR));
  HideActions([actClosePlan], (plan.kind.code = ENPLANWORKKIND_YEAR));

  // planUnclose ...
  actUnClose.Enabled := (
                          (plan.kind.code = ENPLANWORKKIND_NPZ) or (plan.kind.code = ENPLANWORKKIND_FACT)
                        // для 2011 года можно удалять .. ПОКА .. до создания ЗАЯВКИ!!!!
                        or ((plan.kind.code = ENPLANWORKKIND_CURRENT) and (plan.yearGen = 2015))

                         )
                        and (plan.status.code = ENPLANWORKSTATUS_GOOD) ;

   // отмена утвержденных без Актов .... на сервере чекним есть ли акт ;)
   if  (plan.status.code = ENPLANWORKSTATUS_LOCKED) and (plan.kind.code = ENPLANWORKKIND_FACT) then
   begin
     actUnClose.Enabled :=  True;
     miUnClose.Caption := 'Відмінити затвердження Факту, для якого не потрібно формувати Акт ...'
   end
   else begin
     miUnClose.Caption := 'Видалити для коригування попереднього';
   end;


// полуУтверждение .. Утверждение .. Отмена Утверждения ....
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

                           // надо прикрыть такое, потому что Олег Василенко
                           // сегодня спокойно попатчил свой уже утвержденный
                           // текущий план, воспользовавшись данной фишкой ;-)
                           // (а этот план уже запретил редактировать ОМТС)

                            or
                            (plan.status.code = ENPLANWORKSTATUS_LOCKED)

                           /////
                          );
   end
   else
   begin
      actUndoConfirm.Enabled := ((plan.kind.code = ENPLANWORKKIND_YEAR) and (plan.yearGen = ENPLANWORK_YEAR_GOOD));
   end;


   if (plan.typeRef.code in [ENPLANWORKTYPE_INVEST,
                         ENPLANWORKTYPE_SERVICES_FROM_SIDE_INVEST,
                         ENPLANWORKTYPE_ESBYT_PZ,
                         ENPLANWORKTYPE_ESBYT_ZKO_106,
                         ENPLANWORKTYPE_ESBYT_ZKO_111,
                         ENPLANWORKTYPE_ESBYT_ZKO_112]) and
      (plan.kind.code = ENPLANWORKKIND_CURRENT) then
     actChangeGroupNumberIP.Enabled := True
   else
     actChangeGroupNumberIP.Enabled := False;

   actChangeGroupNumberIP.Visible := actChangeGroupNumberIP.Enabled;

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
                           ((plan.status.code = ENPLANWORKSTATUS_GOOD) or (plan.status.code = ENPLANWORKSTATUS_LOCKED));


  // изменение дат !!!
{03.01.2017   actSaveAddInfo.Enabled := (plan.kind.code in [ ENPLANWORKKIND_CURRENT, ENPLANWORKKIND_NPZ] ) and
                            (plan.status.code <> ENPLANWORKSTATUS_GOOD);
}

actSaveAddInfo.Enabled :=(((plan.kind.code = ENPLANWORKKIND_CURRENT) and (plan.status.code <> ENPLANWORKSTATUS_GOOD) )
                       or
                          ((plan.kind.code = ENPLANWORKKIND_NPZ) and (plan.status.code = ENPLANWORKSTATUS_GOOD) )
                          );


  // изменение исполнителя и подразделения
  actSaveFinexecutDepartment.Enabled := (plan.kind.code in [ENPLANWORKKIND_CURRENT, ENPLANWORKKIND_NPZ]);
  //   and (plan.status.code <> ENPLANWORKSTATUS_GOOD);

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

  if (elementType = EN_CALLCENTER_OBJECT) then
  begin
    DisableActions([actClosePlan, actUnClose, actConfirm, actPreConfirm]);
    HideActions([actClosePlan, actUnClose, actConfirm, actPreConfirm]);
  end;

  DisableActions([actSaveAttributes, actSetXqtnPercent], ((plan.kind.code <> ENPLANWORKKIND_CURRENT)
  and (not (plan.typeRef.code in [ENPLANWORKTYPE_SERVICES_FROM_SIDE
  , ENPLANWORKTYPE_SERVICES_FROM_SIDE_INVEST]))));
  HideActions([actSaveAttributes, actSetXqtnPercent], ((plan.kind.code <> ENPLANWORKKIND_CURRENT)
  and (not (plan.typeRef.code in [ENPLANWORKTYPE_SERVICES_FROM_SIDE
  , ENPLANWORKTYPE_SERVICES_FROM_SIDE_INVEST]))));


end;

procedure TfrmENPlanWorkShow.actPreConfirmExecute(Sender: TObject);
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

procedure TfrmENPlanWorkShow.actConfirmExecute(Sender: TObject);
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

procedure TfrmENPlanWorkShow.actUndoConfirmExecute(Sender: TObject);
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

procedure TfrmENPlanWorkShow.actCreatePackExecute(Sender: TObject);
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

procedure TfrmENPlanWorkShow.actUnCloseExecute(Sender: TObject);
Var TempENPlanWork: ENPlanWorkControllerSoapPort;
ObjCode : Integer;
begin

   try
     ObjCode := StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]);
   except
     on EConvertError do Exit;
   end;


  if Application.MessageBox(PChar('Ви дійсно бажаєте Відминити затвердження ... ?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

    TempENPlanWork.openPlanWork(ObjCode);

    Application.MessageBox(PChar('Видалено ...'), PChar('Повідомлення'), MB_ICONINFORMATION);
    UpdateGrid(Sender);
  end;
  
end;

procedure TfrmENPlanWorkShow.actSaveAddInfoExecute(Sender: TObject);
Var TempENPlanWork: ENPlanWorkControllerSoapPort;
tPlan : ENPlanWork;

  ObjCode: Integer;
  
  ///// 05.08.10 ВРЕМЕННО !!!
  TempUser: UserControllerSoapPort;
  UserObj: User;
  allowEdit: Boolean;
  /////

begin
  try
    ObjCode := StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]);
  except
    on EConvertError do Exit;
  end;

  //tPlan := DMReports.getPlanByCode( StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]));
  tPlan := DMReports.getPlanByCode(ObjCode);

  if tPlan = nil then
  begin
      exit;
  end;


  //ShowMessage( ENPlanWorkShort(sgENPlanWork.Objects[0,sgENPlanWork.Row]).statusName );
  //if  Integer(sgENPlanWork.Objects[0,sgENPlanWork.Row]) <> ENPLANWORKSTATUS_GOOD then


  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;



  selectedRow := sgENPlanWork.Row;

  frmENPlanWorkAddInfoEdit:=TfrmENPlanWorkAddInfoEdit.Create(Application, dsEdit);
  frmENPlanWorkAddInfoEdit.Caption := 'Зміна дат виконання';
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

procedure TfrmENPlanWorkShow.actSaveAttributesExecute(Sender: TObject);
var
formAttributes : TfrmEditENPlanWorkAttributes;
TempENPlanWork : ENPlanWorkControllerSoapPort;
objCode : Integer;
begin
  inherited;
  try
    objCode := StrToInt(sgENPlanWork.Cells[0, sgENPlanWork.Row]);
  except
    on EConvertError do Exit;
  end;
  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;
  formAttributes := TfrmEditENPlanWorkAttributes.Create(Application, dsEdit);
  // NET-4572 13.12.2018 Здесь не нужно отображать подвид работ на форме редактирования аттрибутов
  formAttributes.gbENPlanWorkType.Visible := False;

  formAttributes.plan := TempENPlanWork.getObject(objCode);
  if formAttributes.ShowModal = mrOk then begin
    if Application.MessageBox(PChar('Ви дійсно бажаєте змінити аттрибути для обраного плану?'),
                    PChar('Увага!'),MB_ICONQUESTION+MB_YESNO+MB_DEFBUTTON2)=IDNO then begin
      Exit;
    end;
    TempENPlanWork.saveAttributes(formAttributes.plan);
    Application.MessageBox(PChar('Аттрибути для плану змінено!'), PChar('Повідомлення'), MB_ICONINFORMATION);
    actUpdateExecute(Sender);
  end;
  formAttributes.Free;
end;

procedure TfrmENPlanWorkShow.FormCreate(Sender: TObject);
begin
  inherited;
  disableControlsType := dtOther;
  elementCode := LOW_INT;
  elementName := '';
end;

procedure TfrmENPlanWorkShow.actFinishPlanWorkExecute(Sender: TObject);
Var TempENPlanWork: ENPlanWorkControllerSoapPort;
    ENPlanWorkList: ENPlanWorkShortList;
    ENPlanWorkFilterObj: ENPlanWorkFilter;
    ObjCode: Integer;
    ENPlanWorkObj: ENPlanWork;
    tPlan: ENPlanWork;
begin
  try
    ObjCode := StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]);
  except
    on EConvertError do Exit;
  end;

  //tPlan := DMReports.getPlanByCode(StrToInt(sgENPlanWork.Cells[0, sgENPlanWork.Row]));
  tPlan := DMReports.getPlanByCode(ObjCode);
  if tPlan = nil then
  begin
    Application.MessageBox(PChar('План не знайдено !'), PChar('Увага'), MB_ICONWARNING);
    Exit;
  end;

  if tPlan.code <= 0 then
  begin
    Application.MessageBox(PChar('План не знайдено !'), PChar('Увага'), MB_ICONWARNING);
    Exit;
  end;

  if (tPlan.status.code = ENPLANWORKSTATUS_WORKS_FINISHED) then
  begin
    Application.MessageBox(PChar('Цей план вже знаходиться в статусі "Роботи завершені"!'), PChar('Увага'), MB_ICONWARNING);
    Exit;
  end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте перевести план у статус "Роботи завершені" ?' + #13#10 +
                                  'Зверніть увагу, що весь Транзит з цього плану буде автоматично переведений в Опер. запас!'),
                            PChar('Увага !'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
  begin
    TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

    TempENPlanWork.finishPlanWork(tPlan.code);

    Application.MessageBox(PChar('План переведено у статус "Роботи завершені"!'), PChar('Повідомлення'), MB_ICONINFORMATION);
    UpdateGrid(Sender);
  end;
end;

procedure TfrmENPlanWorkShow.actUndoFinishPlanWorkExecute(Sender: TObject);
Var TempENPlanWork: ENPlanWorkControllerSoapPort;
    ENPlanWorkList: ENPlanWorkShortList;
    ENPlanWorkFilterObj: ENPlanWorkFilter;
    ObjCode: Integer;
    ENPlanWorkObj: ENPlanWork;
    tPlan: ENPlanWork;
begin
  try
    ObjCode := StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]);
  except
    on EConvertError do Exit;
  end;

  //tPlan := DMReports.getPlanByCode(StrToInt(sgENPlanWork.Cells[0, sgENPlanWork.Row]));
  tPlan := DMReports.getPlanByCode(ObjCode);
  if tPlan = nil then
  begin
    Application.MessageBox(PChar('План не знайдено !'), PChar('Увага'), MB_ICONWARNING);
    Exit;
  end;

  if tPlan.code <= 0 then
  begin
    Application.MessageBox(PChar('План не знайдено !'), PChar('Увага'), MB_ICONWARNING);
    Exit;
  end;

  if (tPlan.status.code <> ENPLANWORKSTATUS_WORKS_FINISHED) then
  begin
    Application.MessageBox(PChar('Цей план НЕ знаходиться в статусі "Роботи завершені"!'), PChar('Увага'), MB_ICONWARNING);
    Exit;
  end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте ВІДМІНИТИ переведення плану в статус "Роботи завершені" ?'),
                            PChar('Увага !'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
  begin
    TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

    TempENPlanWork.undoFinishPlanWork(tPlan.code);

    Application.MessageBox(PChar('План повернено у статус "Затверджений"!'), PChar('Повідомлення'), MB_ICONINFORMATION);
    UpdateGrid(Sender);
  end;
end;

procedure TfrmENPlanWorkShow.actCopyPlanExecute(Sender: TObject);
var objCode: Integer;
    condition: String;
begin
  // Пока даем копировать только при вызове списка планов из главной формы, а не во всяких диалоговых формах
  if FormMode <> fmChild then Exit;

  try
    objCode := StrToInt(sgENPlanWork.Cells[0, sgENPlanWork.Row]);
  except
    on EConvertError do Exit;
  end;

  frmENPlanWorkCopyEdit := TfrmENPlanWorkCopyEdit.Create(Application, dsInsert);
  try
    frmENPlanWorkCopyEdit.oldPlanCode := objCode;

    if frmENPlanWorkCopyEdit.ShowModal = mrOk then
    begin

      // Откроем только что добавленный план сразу на редактирование
      if frmENPlanWorkCopyEdit.newPlanCode <> LOW_INT then
      begin
        FilterObject.Free;
        FilterObject := nil;

        ENPlanWorkFilterObj := ENPlanWorkFilter.Create;
        SetNullIntProps(ENPlanWorkFilterObj);
        SetNullXSProps(ENPlanWorkFilterObj);

        ENPlanWorkFilterObj.code := frmENPlanWorkCopyEdit.newPlanCode;

        ///// А надо ли это?? Пока оставим
        FilterObject := ENPlanWorkFilter.Create;
        if outerCondition <> '' then
        begin
          condition := ENPlanWorkFilterObj.conditionSQL;
          AddCondition(condition, outerCondition);
          ENPlanWorkFilterObj.conditionSQL := condition;
        end;
        ////
        FilterObject := ENPlanWorkFilterObj;

        isFiltered := True;
        actUpdateExecute(Sender);

        ENPlanWorkFilterObj := nil;
        sgENPlanWork.Row := 1;

        //actEditExecute(Sender);
        actEditExecute(actCopyPlan);

        Exit;
      end; // if frmENPlanWorkCopyEdit.newPlanCode <> LOW_INT

      // UpdateGrid(Sender);
      actUpdateExecute(Sender);

    end; // if frmENPlanWorkCopyEdit.ShowModal = mrOk

  finally
    frmENPlanWorkCopyEdit.Free;
    frmENPlanWorkCopyEdit := nil;
  end;

end;

procedure TfrmENPlanWorkShow.actCreateOrderByPlanExecute(Sender: TObject);
var
  planCode, orderCode : Integer;
  order : RQOrder;
  TempRQOrder : RQOrderControllerSoapPort;
  mesg : String;
begin
 { if FormMode <> fmChild then Exit;

  try
    planCode := StrToInt(sgENPlanWork.Cells[0, sgENPlanWork.Row]);
  except
    on EConvertError do Exit;
  end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте скласти заявку з обраного плану?'),
                            PChar('Увага !'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
  begin
    TempRQOrder := HTTPRIORQOrder as RQOrderControllerSoapPort;
    //orderCode := TempRQOrder.createOrderByPlan(planCode);

    if (orderCode <> LOW_INT) then
    begin
      order := TempRQOrder.getObject(orderCode);
      mesg := 'Заявку №= ' + order.numberDoc + ' успішно сформовано!!!';
      Application.MessageBox(PChar(mesg), PChar('Повідомлення'), MB_ICONINFORMATION);
    end
    else
      Application.MessageBox(PChar('Матеріал у плані відсутній або вже замовлений!!!'), PChar('Повідомлення'), MB_ICONINFORMATION);

  end;     }

end;

procedure TfrmENPlanWorkShow.actSaveFinexecutDepartmentExecute(
  Sender: TObject);
Var TempENPlanWork: ENPlanWorkControllerSoapPort;
tPlan : ENPlanWork;

  ObjCode: Integer;
  
  ///// 05.08.10 ВРЕМЕННО !!!
  TempUser: UserControllerSoapPort;
  UserObj: User;
  allowEdit: Boolean;
  /////

begin


  try
    ObjCode := StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]);
  except
    on EConvertError do Exit;
  end;

  //tPlan := DMReports.getPlanByCode( StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]));
  tPlan := DMReports.getPlanByCode(ObjCode);

  if tPlan = nil then
  begin
      exit;
  end;

  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

  selectedRow := sgENPlanWork.Row;

  frmENPlanWorkAddInfoEdit:=TfrmENPlanWorkAddInfoEdit.Create(Application, dsEdit);
  frmENPlanWorkAddInfoEdit.Caption := 'Зміна виконавця робіт';
  frmENPlanWorkAddInfoEdit.HideControls( [frmENPlanWorkAddInfoEdit.edtDateStart, frmENPlanWorkAddInfoEdit.edtDateFinal ,
                                             frmENPlanWorkAddInfoEdit.lblDateStart  , frmENPlanWorkAddInfoEdit.lblDateFinal , frmENPlanWorkAddInfoEdit.gbPlanMOL]);
  frmENPlanWorkAddInfoEdit.isChangeExecutorDepartment:= True;
  frmENPlanWorkAddInfoEdit.gbPlanMOL.Visible := False;

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

procedure TfrmENPlanWorkShow.actSetSMSInformExecute(Sender: TObject);
Var
TempENPlanWork: ENPlanWorkControllerSoapPort;
TempENPlanInform : ENPlanInformCustomerControllerSoapPort;
tPlan : ENPlanWork;
informFilter : ENPlanInformCustomerFilter;
informList : ENPlanInformCustomerShortList;
dialSt : DialogFormUnit.TDialogState;
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
      exit;
  end;

  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;
  TempENPlanInform := HTTPRIOENPlanInformCustomer as ENPlanInformCustomerControllerSoapPort;

  selectedRow := sgENPlanWork.Row;

  informFilter := ENPlanInformCustomerFilter.Create;
  SetNullIntProps(informFilter);
  SetNullXSProps(informFilter);
  informFilter.planRef := ENPlanWorkRef.Create;
  informFilter.planRef.code := tPlan.code;
  informList := TempENPlanInform.getScrollableFilteredList(informFilter, 0, -1);

  if (informList.totalCount > 0) then
  begin
    ENPlanInformCustomerObj :=  TempENPlanInform.getObject(informList.list[0].code);
  end;

  if ((ENPlanInformCustomerObj = nil) or (ENPlanInformCustomerObj.code = LOW_INT)) then
  begin
    ENPlanInformCustomerObj:=ENPlanInformCustomer.Create;
    SetNullIntProps(ENPlanInformCustomerObj);
    SetNullXSProps(ENPlanInformCustomerObj);
    dialSt := dsInsert;
  end
  else
   dialSt := dsEdit;

  frmENPlanInformCustomerEdit :=TfrmENPlanInformCustomerEdit.Create(Application, dialSt);
  frmENPlanInformCustomerEdit.planCode := tPlan.code;

  try


    if frmENPlanInformCustomerEdit.ShowModal= mrOk then
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
    frmENPlanInformCustomerEdit.Free;
    frmENPlanInformCustomerEdit := nil;
  end;
end;

procedure TfrmENPlanWorkShow.actSetXqtnPercentExecute(Sender: TObject);
var planCode : Integer;
begin
  // TempENPlanXqtnHistory := HTTPRIOENPlanXqtnHistory as ENPlanXqtnHistoryControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENPlanXqtnHistoryObj:=ENPlanXqtnHistory.Create;
  SetNullIntProps(ENPlanXqtnHistoryObj);
  SetNullXSProps(ENPlanXqtnHistoryObj);

  planCode:=StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]);

  ENPlanXqtnHistoryObj.planRef := ENPlanWorkRef.Create;
  ENPlanXqtnHistoryObj.planRef.code := planCode;

  try
    frmENPlanXqtnHistoryEdit:=TfrmENPlanXqtnHistoryEdit.Create(Application, dsInsert);
    try
      if frmENPlanXqtnHistoryEdit.ShowModal = mrOk then
      begin
        if ENPlanXqtnHistoryObj<>nil then
            //TempENPlanXqtnHistory.add(ENPlanXqtnHistoryObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENPlanXqtnHistoryEdit.Free;
      frmENPlanXqtnHistoryEdit:=nil;
    end;
  finally
    ENPlanXqtnHistoryObj.Free;
  end;
end;

procedure TfrmENPlanWorkShow.actImportBufetExecute(Sender: TObject);
 var
  TempENPlanWork: ENPlanWorkControllerSoapPort;
  plan:ENPlanWork;
  typeCode:Integer;
begin

   TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;
   try

    plan:=TempENPlanWork.getObject(StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]));

    frmBufetRealization:=TfrmBufetRealization.Create(Application, dsView);
    frmBufetRealization.aDate:=TXSDate.Create;
    frmBufetRealization.aDate:=plan.dateStart;

    typeCode:=0;

    if plan.stateRef.code=ENPLANWORKSTATE_BUFET_REALIZATION then frmBufetRealization.aType:=1;
    if plan.stateRef.code=ENPLANWORKSTATE_BUFET_NONEREALIZATION then
    begin
      frmBufetRealization.aType:=2;
      typeCode:=1;
    end;

    if plan.stateRef.code=ENPLANWORKSTATE_BUFET_REALIZATION_BEZNAL then frmBufetRealization.aType:=3;

     frmBufetRealization.ShowModal;

     if frmBufetRealization.numberDoc<>'' then
     begin
       TempENPlanWork.import2Bufet(StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]),frmBufetRealization.numberDoc,typeCode);
       Application.MessageBox(PChar('Операція пройшла успішно!'),PChar('Увага!'), MB_ICONINFORMATION);
     end;
   except
   on EConvertError do Exit;
  end;

end;

procedure TfrmENPlanWorkShow.actExcellExecute(Sender: TObject);
var AppPath, FileName: String;
    OldCursor: TCursor;
begin
  OldCursor := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;

    AppPath := ExtractFilePath(Application.ExeName);
    if not DirectoryExists(AppPath + TempReportsPath) then
      CreateDir(AppPath + TempReportsPath);
    FileName := AppPath + TempReportsPath + GetFileName(Self.Caption + ' (фільтр) ') + '.xls';

    aeExcel.XLSExport(FileName);
    ShellExecute(0,
                 PChar('open'),
                 PChar('"' + FileName + '"'),
                 nil,
                 nil,
                 SW_SHOWMAXIMIZED);
  finally
    Screen.Cursor := OldCursor;
  end;
end;

procedure TfrmENPlanWorkShow.actExportBufetExecute(Sender: TObject);
 var
  TempENPlanWork: ENPlanWorkControllerSoapPort;
begin
   TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;
   try
       TempENPlanWork.export2BufetVtrati(StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]));
       Application.MessageBox(PChar('Операція пройшла успішно!'),PChar('Увага!'), MB_ICONINFORMATION);
   except
   on EConvertError do Exit;
  end;

end;

end.
