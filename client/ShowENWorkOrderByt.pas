
unit ShowENWorkOrderByt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENWorkOrderBytController, AdvObj ;


type
  TfrmENWorkOrderBytShow = class(TChildForm)  
  HTTPRIOENWorkOrderByt: THTTPRIO;
    ImageList1: TImageList;
    sgENWorkOrderByt: TAdvStringGrid;
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
    actMakeFormed: TAction;
    actUndoMakeFormed: TAction;
    actMakeApproved: TAction;
    actUndoMakeApproved: TAction;
    actMakeCompleted: TAction;
    actUndoMakeCompleted: TAction;
    actMakeClosed: TAction;
    actUndoMakeClosed: TAction;
    N5: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    actRemoveBadRaid: TAction;
    ToolButton4: TToolButton;

procedure FormShow(Sender: TObject);
procedure FormClose(Sender: TObject; var Action: TCloseAction);
procedure sgENWorkOrderBytTopLeftChanged(Sender: TObject);
procedure sgENWorkOrderBytDblClick(Sender: TObject);
procedure actViewExecute(Sender: TObject);
procedure actEditExecute(Sender: TObject);
procedure actDeleteExecute(Sender: TObject);
procedure actInsertExecute(Sender: TObject);
procedure actUpdateExecute(Sender: TObject);
procedure actFilterExecute(Sender: TObject);
procedure actNoFilterExecute(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure actMakeFormedExecute(Sender: TObject);
    procedure actUndoMakeFormedExecute(Sender: TObject);
    procedure actMakeApprovedExecute(Sender: TObject);
    procedure actUndoMakeApprovedExecute(Sender: TObject);
    procedure actMakeCompletedExecute(Sender: TObject);
    procedure actUndoMakeCompletedExecute(Sender: TObject);
    procedure actMakeClosedExecute(Sender: TObject);
    procedure actUndoMakeClosedExecute(Sender: TObject);
    procedure actRemoveBadRaidExecute(Sender: TObject);

  private
   { Private declarations }
   var typeCode: Integer;
 public
   { Public declarations }
   ColCount, LastCount: Integer;
   LastRow: Integer;
   procedure UpdateGrid(Sender: TObject);
 end;

 // ENWorkOrderBytObj: ENWorkOrderByt;
 // ENWorkOrderBytFilterObj: ENWorkOrderBytFilter;


implementation

uses Main, EditENWorkOrderByt, EditENWorkOrderBytFilter, ENConsts,
  ENWorkOrderBytTypeController;


{$R *.dfm}

var
  //frmENWorkOrderBytShow : TfrmENWorkOrderBytShow;


//  ColCount, LastCount: Integer;
//  LastRow: Integer = 1;
  ENWorkOrderBytHeaders: array [1..9] of String =
        ( 'Код'
          ,'Номер'
          ,'Дата'
          //,'Примітка'
          ,'Підрозділ'
          ,'Статус'
          ,'Користувач, який створив запис'
          ,'Дата створення'
          ,'Користувач, який вніс зміни'
          ,'Дата зміни'
        );
   

procedure TfrmENWorkOrderBytShow.FormClose(Sender: TObject; var Action: TCloseAction);
//var typeCode: Integer;
begin
{
  if FormMode = fmChild then
    frmENWorkOrderBytShow:=nil;
  inherited;
}

  if (FormMode = fmChild) {and (FilterObject <> nil)} then
  begin
    //typeCode := ENWorkOrderBytFilter(FilterObject).typeRef.code;

    if typeCode = ENWORKORDERBYTTYPE_BY_ENERGYNET then
      frmENWorkOrderBytShow := nil
    else if typeCode = ENWORKORDERBYTTYPE_RAID_BY_BILLING then
      frmENWorkOrderBytRaidShow := nil
    else if typeCode = ENWORKORDERBYTTYPE_CONTROL then
      frmENWorkOrderBytControlShow := nil;
  end;
  EditENWorkOrderByt.vENWorkOrderBytItemSQL := '';
  inherited;
end;


procedure TfrmENWorkOrderBytShow.FormShow(Sender: TObject);
var
  TempENWorkOrderByt: ENWorkOrderBytControllerSoapPort;
  i: Integer;
  ENWorkOrderBytList: ENWorkOrderBytShortList;
begin
  SetGridHeaders(ENWorkOrderBytHeaders, sgENWorkOrderByt.ColumnHeaders);

  LastRow := 1;
  ColCount := 100;

  TempENWorkOrderByt := HTTPRIOENWorkOrderByt as ENWorkOrderBytControllerSoapPort;

  DisableActions([actRemoveBadRaid]);
  HideActions([actRemoveBadRaid]);

  /////
  typeCode := LOW_INT;

  if FilterObject <> nil then
    if ENWorkOrderBytFilter(FilterObject).typeRef <> nil then
      typeCode := ENWorkOrderBytFilter(FilterObject).typeRef.code;
  /////

  if (typeCode = ENWORKORDERBYTTYPE_RAID_BY_BILLING) or
     (typeCode = ENWORKORDERBYTTYPE_CONTROL) then
  begin
    DisableActions([actInsert, actDelete]);
    HideActions([actInsert, actDelete]);
  end;

  if (typeCode = ENWORKORDERBYTTYPE_RAID_BY_BILLING) then
  begin
    DisableActions([actRemoveBadRaid], false);
    HideActions([actRemoveBadRaid], false);
  end;

  if FilterObject = nil then
  begin
     FilterObject := ENWorkOrderBytFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ///// 27.01.15 Для сменных заданий по рейдовым бригадам выделяем права на просмотр в отдельную группу
  if typeCode = ENWORKORDERBYTTYPE_RAID_BY_BILLING then
    ENWorkOrderBytList := TempENWorkOrderByt.getScrollableFilteredListForRaid(ENWorkOrderBytFilter(FilterObject), 0, ColCount)
  else
    ENWorkOrderBytList := TempENWorkOrderByt.getScrollableFilteredList(ENWorkOrderBytFilter(FilterObject), 0, ColCount);
  /////

  LastCount := High(ENWorkOrderBytList.list);

  if LastCount > -1 then
     sgENWorkOrderByt.RowCount := LastCount + 2
  else
     sgENWorkOrderByt.RowCount := 2;

{
        ( 'Код'
          ,'Номер'
          ,'Дата'
          //,'Примітка'
          ,'Підрозділ'
          ,'Статус'
          ,'Користувач, який створив запис'
          ,'Дата створення'
          ,'Користувач, який вніс зміни'
          ,'Дата зміни'
        );
}

  with sgENWorkOrderByt do
    for i := 0 to LastCount do
    begin
      Application.ProcessMessages;

      if ENWorkOrderBytList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENWorkOrderBytList.list[i].code)
      else
        Cells[0,i+1] := '';
      Cells[1,i+1] := ENWorkOrderBytList.list[i].numberGen;
      if ENWorkOrderBytList.list[i].dateGen = nil then
        Cells[2,i+1] := ''
      else
        Cells[2,i+1] := XSDate2String(ENWorkOrderBytList.list[i].dateGen);
      //Cells[3,i+1] := ENWorkOrderBytList.list[i].commentGen;

      Cells[3,i+1] := ENWorkOrderBytList.list[i].departmentRefShortName;

      Cells[4,i+1] := ENWorkOrderBytList.list[i].statusRefName;

      Cells[5,i+1] := ENWorkOrderBytList.list[i].userAdd;
      if ENWorkOrderBytList.list[i].dateAdd = nil then
        Cells[6,i+1] := ''
      else
        Cells[6,i+1] := XSDateTimeWithDate2String(ENWorkOrderBytList.list[i].dateAdd);

      Cells[7,i+1] := ENWorkOrderBytList.list[i].userEdit;
      if ENWorkOrderBytList.list[i].dateEdit = nil then
        Cells[8,i+1] := ''
      else
        Cells[8,i+1] := XSDateTimeWithDate2String(ENWorkOrderBytList.list[i].dateEdit);

      Objects[0,i+1] := TObject(ENWorkOrderBytList.list[i].statusRefCode);

      LastRow := i + 1;
      sgENWorkOrderByt.RowCount := LastRow + 1;
    end;

  ColCount := ColCount + 1;
  sgENWorkOrderByt.Row := 1;
end;

procedure TfrmENWorkOrderBytShow.PopupMenu1Popup(Sender: TObject);
var
  TempENWorkOrderByt: ENWorkOrderBytControllerSoapPort;
  workOrderBytCode: Integer;
  workOrderByt: ENWorkOrderByt;
begin
  DisableActions([actMakeFormed, actUndoMakeFormed, actMakeApproved, actUndoMakeApproved,
                  actMakeCompleted, actUndoMakeCompleted, actMakeClosed, actUndoMakeClosed]);
  HideActions([actMakeFormed, actUndoMakeFormed, actMakeApproved, actUndoMakeApproved,
               actMakeCompleted, actUndoMakeCompleted, actMakeClosed, actUndoMakeClosed]);

  try
    workOrderBytCode := StrToInt(sgENWorkOrderByt.Cells[0, sgENWorkOrderByt.Row]);
  except
    on EConvertError do Exit;
  end;

  TempENWorkOrderByt := HTTPRIOENWorkOrderByt as ENWorkOrderBytControllerSoapPort;
  workOrderByt := TempENWorkOrderByt.getObject(workOrderBytCode);

  actMakeFormed.Enabled := (workOrderByt.statusRef.code = ENWORKORDERBYTSTATUS_DRAFT);
  actMakeFormed.Visible := (workOrderByt.statusRef.code = ENWORKORDERBYTSTATUS_DRAFT);
  actUndoMakeFormed.Enabled := (workOrderByt.statusRef.code = ENWORKORDERBYTSTATUS_FORMED);
  actUndoMakeFormed.Visible := (workOrderByt.statusRef.code = ENWORKORDERBYTSTATUS_FORMED);

  actMakeApproved.Enabled := (workOrderByt.statusRef.code = ENWORKORDERBYTSTATUS_FORMED);
  actMakeApproved.Visible := (workOrderByt.statusRef.code = ENWORKORDERBYTSTATUS_FORMED);
  actUndoMakeApproved.Enabled := (workOrderByt.statusRef.code = ENWORKORDERBYTSTATUS_APPROVED);
  actUndoMakeApproved.Visible := (workOrderByt.statusRef.code = ENWORKORDERBYTSTATUS_APPROVED);

  actMakeCompleted.Enabled := (workOrderByt.statusRef.code = ENWORKORDERBYTSTATUS_APPROVED);
  actMakeCompleted.Visible := (workOrderByt.statusRef.code = ENWORKORDERBYTSTATUS_APPROVED);
  actUndoMakeCompleted.Enabled := (workOrderByt.statusRef.code = ENWORKORDERBYTSTATUS_COMPLETED);
  actUndoMakeCompleted.Visible := (workOrderByt.statusRef.code = ENWORKORDERBYTSTATUS_COMPLETED);

  actMakeClosed.Enabled := (workOrderByt.statusRef.code = ENWORKORDERBYTSTATUS_COMPLETED);
  actMakeClosed.Visible := (workOrderByt.statusRef.code = ENWORKORDERBYTSTATUS_COMPLETED);
  actUndoMakeClosed.Enabled := (workOrderByt.statusRef.code = ENWORKORDERBYTSTATUS_CLOSED);
  actUndoMakeClosed.Visible := (workOrderByt.statusRef.code = ENWORKORDERBYTSTATUS_CLOSED);
end;

procedure TfrmENWorkOrderBytShow.sgENWorkOrderBytTopLeftChanged(Sender: TObject);
var
  TempENWorkOrderByt: ENWorkOrderBytControllerSoapPort;
  i, CurrentRow: Integer;
  ENWorkOrderBytList: ENWorkOrderBytShortList;
begin
  if LastCount < 99 then Exit;

  if (sgENWorkOrderByt.TopRow + sgENWorkOrderByt.VisibleRowCount) = ColCount then
  begin
    TempENWorkOrderByt := HTTPRIOENWorkOrderByt as ENWorkOrderBytControllerSoapPort;
    CurrentRow:=sgENWorkOrderByt.RowCount;

    if FilterObject = nil then
    begin
      FilterObject := ENWorkOrderBytFilter.Create;
      SetNullIntProps(FilterObject);
      SetNullXSProps(FilterObject);
    end;

    ///// 27.01.15 Для сменных заданий по рейдовым бригадам выделяем права на просмотр в отдельную группу
    if typeCode = ENWORKORDERBYTTYPE_RAID_BY_BILLING then
      ENWorkOrderBytList := TempENWorkOrderByt.getScrollableFilteredListForRaid(ENWorkOrderBytFilter(FilterObject), ColCount - 1, 100)
    else
      ENWorkOrderBytList := TempENWorkOrderByt.getScrollableFilteredList(ENWorkOrderBytFilter(FilterObject), ColCount - 1, 100);
    /////

    sgENWorkOrderByt.RowCount := sgENWorkOrderByt.RowCount + 100;

    LastCount := High(ENWorkOrderBytList.list);

    with sgENWorkOrderByt do
      for i := 0 to LastCount do
      begin
        Application.ProcessMessages;

        if ENWorkOrderBytList.list[i].code <> Low(Integer) then
          Cells[0,i+CurrentRow] := IntToStr(ENWorkOrderBytList.list[i].code)
        else
          Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENWorkOrderBytList.list[i].numberGen;
        if ENWorkOrderBytList.list[i].dateGen = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := XSDate2String(ENWorkOrderBytList.list[i].dateGen);
        //Cells[3,i+CurrentRow] := ENWorkOrderBytList.list[i].commentGen;

        Cells[3,i+CurrentRow] := ENWorkOrderBytList.list[i].departmentRefShortName;

        Cells[4,i+CurrentRow] := ENWorkOrderBytList.list[i].statusRefName;

        Cells[5,i+CurrentRow] := ENWorkOrderBytList.list[i].userAdd;
        if ENWorkOrderBytList.list[i].dateAdd = nil then
          Cells[6,i+CurrentRow] := ''
        else
          Cells[6,i+CurrentRow] := XSDateTimeWithDate2String(ENWorkOrderBytList.list[i].dateAdd);

        Cells[7,i+CurrentRow] := ENWorkOrderBytList.list[i].userEdit;
        if ENWorkOrderBytList.list[i].dateEdit = nil then
          Cells[8,i+CurrentRow] := ''
        else
          Cells[8,i+CurrentRow] := XSDateTimeWithDate2String(ENWorkOrderBytList.list[i].dateEdit);

        Objects[0,i+CurrentRow] := TObject(ENWorkOrderBytList.list[i].statusRefCode);

        LastRow := i + CurrentRow;
      end;

    ColCount := ColCount + 100;
    sgENWorkOrderByt.Row := CurrentRow - 5;
    sgENWorkOrderByt.RowCount := LastRow + 1;
  end;
end;

procedure TfrmENWorkOrderBytShow.sgENWorkOrderBytDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENWorkOrderByt,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENWorkOrderBytShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENWorkOrderByt.RowCount-1 do
   for j:=0 to sgENWorkOrderByt.ColCount-1 do
     sgENWorkOrderByt.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENWorkOrderBytShow.actViewExecute(Sender: TObject);
Var TempENWorkOrderByt: ENWorkOrderBytControllerSoapPort;
begin
  TempENWorkOrderByt := HTTPRIOENWorkOrderByt as ENWorkOrderBytControllerSoapPort;


  frmENWorkOrderBytEdit := TfrmENWorkOrderBytEdit.Create(Application, dsView);
  try
    try
      ///// 27.01.15 Для сменных заданий по рейдовым бригадам выделяем права на просмотр в отдельную группу
      if typeCode = ENWORKORDERBYTTYPE_RAID_BY_BILLING then
        frmENWorkOrderBytEdit.ENWorkOrderBytObj := TempENWorkOrderByt.getObjectForRaid(StrToInt(sgENWorkOrderByt.Cells[0, sgENWorkOrderByt.Row]))
      else
        frmENWorkOrderBytEdit.ENWorkOrderBytObj := TempENWorkOrderByt.getObject(StrToInt(sgENWorkOrderByt.Cells[0, sgENWorkOrderByt.Row]));
      /////
    except
      on EConvertError do Exit;
    end;

    frmENWorkOrderBytEdit.ShowModal;
  finally
    frmENWorkOrderBytEdit.Free;
    frmENWorkOrderBytEdit := nil;
  end;
end;

procedure TfrmENWorkOrderBytShow.actEditExecute(Sender: TObject);
Var TempENWorkOrderByt: ENWorkOrderBytControllerSoapPort;
    tmpENWorkOrderBytObj: ENWorkOrderByt;
begin
  TempENWorkOrderByt := HTTPRIOENWorkOrderByt as ENWorkOrderBytControllerSoapPort;
  try
    tmpENWorkOrderBytObj := TempENWorkOrderByt.getObject(StrToInt(sgENWorkOrderByt.Cells[0,sgENWorkOrderByt.Row]));
  except
    on EConvertError do Exit;
  end;

  if tmpENWorkOrderBytObj.statusRef.code <> ENWORKORDERBYTSTATUS_DRAFT then
  begin
    Application.MessageBox(PChar('Це Змінне завдання не є чорновим! Його буде відкрито на перегляд!'),
                           PChar('Увага !'), MB_ICONWARNING);
    frmENWorkOrderBytEdit := TfrmENWorkOrderBytEdit.Create(Application, dsView);
  end
  else
    frmENWorkOrderBytEdit := TfrmENWorkOrderBytEdit.Create(Application, dsEdit);

  try
    try
      frmENWorkOrderBytEdit.ENWorkOrderBytObj := TempENWorkOrderByt.getObject(StrToInt(sgENWorkOrderByt.Cells[0,sgENWorkOrderByt.Row]));
    except
      on EConvertError do Exit;
    end;

    if frmENWorkOrderBytEdit.ShowModal = mrOk then
    begin
      //TempENWorkOrderByt.save(ENWorkOrderBytObj);
      UpdateGrid(Sender);
    end;
  finally
    frmENWorkOrderBytEdit.Free;
    frmENWorkOrderBytEdit := nil;
  end;
end;

procedure TfrmENWorkOrderBytShow.actDeleteExecute(Sender: TObject);
Var TempENWorkOrderByt: ENWorkOrderBytControllerSoapPort;
  ObjCode: Integer;
begin
 TempENWorkOrderByt := HTTPRIOENWorkOrderByt as ENWorkOrderBytControllerSoapPort;
   try
     ObjCode := StrToInt(sgENWorkOrderByt.Cells[0,sgENWorkOrderByt.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити завдання ?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENWorkOrderByt.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENWorkOrderBytShow.actInsertExecute(Sender: TObject);
// Var TempENWorkOrderByt: ENWorkOrderBytControllerSoapPort; 
begin
  // TempENWorkOrderByt := HTTPRIOENWorkOrderByt as ENWorkOrderBytControllerSoapPort;  /// Это здесь уже лишнее!!!
  // ENWorkOrderBytObj:=ENWorkOrderByt.Create;

   //ENWorkOrderBytObj.dateGen:= TXSDate.Create;
   //ENWorkOrderBytObj.dateAdd:= TXSDateTime.Create;

   //ENWorkOrderBytObj.dateEdit:= TXSDateTime.Create;

  //try
    frmENWorkOrderBytEdit := TfrmENWorkOrderBytEdit.Create(Application, dsInsert);
    try
      frmENWorkOrderBytEdit.ENWorkOrderBytObj := ENWorkOrderByt.Create;

      if frmENWorkOrderBytEdit.ShowModal = mrOk then
      begin
        if frmENWorkOrderBytEdit.ENWorkOrderBytObj <> nil then
            //TempENWorkOrderByt.add(ENWorkOrderBytObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENWorkOrderBytEdit.Free;
      frmENWorkOrderBytEdit:=nil;
    end;
  //finally
    //frmENWorkOrderBytEdit.ENWorkOrderBytObj.Free;
  //end;
end;

procedure TfrmENWorkOrderBytShow.actMakeApprovedExecute(Sender: TObject);
var
  TempENWorkOrderByt: ENWorkOrderBytControllerSoapPort;
  workOrderBytCode: Integer;
begin
  try
    workOrderBytCode := StrToInt(sgENWorkOrderByt.Cells[0, sgENWorkOrderByt.Row]);
  except
    on EConvertError do Exit;
  end;

  TempENWorkOrderByt := HTTPRIOENWorkOrderByt as ENWorkOrderBytControllerSoapPort;
  TempENWorkOrderByt.makeApproved(workOrderBytCode);

  actUpdateExecute(Sender);
end;

procedure TfrmENWorkOrderBytShow.actMakeClosedExecute(Sender: TObject);
var
  TempENWorkOrderByt: ENWorkOrderBytControllerSoapPort;
  workOrderBytCode: Integer;
begin
  try
    workOrderBytCode := StrToInt(sgENWorkOrderByt.Cells[0, sgENWorkOrderByt.Row]);
  except
    on EConvertError do Exit;
  end;

  TempENWorkOrderByt := HTTPRIOENWorkOrderByt as ENWorkOrderBytControllerSoapPort;
  TempENWorkOrderByt.makeClosed(workOrderBytCode);

  actUpdateExecute(Sender);
end;

procedure TfrmENWorkOrderBytShow.actMakeCompletedExecute(Sender: TObject);
var
  TempENWorkOrderByt: ENWorkOrderBytControllerSoapPort;
  workOrderBytCode: Integer;
begin
  try
    workOrderBytCode := StrToInt(sgENWorkOrderByt.Cells[0, sgENWorkOrderByt.Row]);
  except
    on EConvertError do Exit;
  end;

  TempENWorkOrderByt := HTTPRIOENWorkOrderByt as ENWorkOrderBytControllerSoapPort;
  TempENWorkOrderByt.makeCompleted(workOrderBytCode);

  actUpdateExecute(Sender);
end;

procedure TfrmENWorkOrderBytShow.actMakeFormedExecute(Sender: TObject);
var
  TempENWorkOrderByt: ENWorkOrderBytControllerSoapPort;
  workOrderBytCode: Integer;
begin
  try
    workOrderBytCode := StrToInt(sgENWorkOrderByt.Cells[0, sgENWorkOrderByt.Row]);
  except
    on EConvertError do Exit;
  end;

  TempENWorkOrderByt := HTTPRIOENWorkOrderByt as ENWorkOrderBytControllerSoapPort;
  TempENWorkOrderByt.makeFormed(workOrderBytCode);

  actUpdateExecute(Sender);
end;
procedure TfrmENWorkOrderBytShow.actUndoMakeApprovedExecute(Sender: TObject);
var
  TempENWorkOrderByt: ENWorkOrderBytControllerSoapPort;
  workOrderBytCode: Integer;
begin
  try
    workOrderBytCode := StrToInt(sgENWorkOrderByt.Cells[0, sgENWorkOrderByt.Row]);
  except
    on EConvertError do Exit;
  end;

  TempENWorkOrderByt := HTTPRIOENWorkOrderByt as ENWorkOrderBytControllerSoapPort;
  TempENWorkOrderByt.undoMakeApproved(workOrderBytCode);

  actUpdateExecute(Sender);
end;


procedure TfrmENWorkOrderBytShow.actUndoMakeClosedExecute(Sender: TObject);
var
  TempENWorkOrderByt: ENWorkOrderBytControllerSoapPort;
  workOrderBytCode: Integer;
begin
  try
    workOrderBytCode := StrToInt(sgENWorkOrderByt.Cells[0, sgENWorkOrderByt.Row]);
  except
    on EConvertError do Exit;
  end;

  TempENWorkOrderByt := HTTPRIOENWorkOrderByt as ENWorkOrderBytControllerSoapPort;
  TempENWorkOrderByt.undoMakeClosed(workOrderBytCode);

  actUpdateExecute(Sender);
end;

procedure TfrmENWorkOrderBytShow.actUndoMakeCompletedExecute(Sender: TObject);
var
  TempENWorkOrderByt: ENWorkOrderBytControllerSoapPort;
  workOrderBytCode: Integer;
begin
  try
    workOrderBytCode := StrToInt(sgENWorkOrderByt.Cells[0, sgENWorkOrderByt.Row]);
  except
    on EConvertError do Exit;
  end;

  TempENWorkOrderByt := HTTPRIOENWorkOrderByt as ENWorkOrderBytControllerSoapPort;
  TempENWorkOrderByt.undoMakeCompleted(workOrderBytCode);

  actUpdateExecute(Sender);
end;

procedure TfrmENWorkOrderBytShow.actUndoMakeFormedExecute(Sender: TObject);
var
  TempENWorkOrderByt: ENWorkOrderBytControllerSoapPort;
  workOrderBytCode: Integer;
begin
  try
    workOrderBytCode := StrToInt(sgENWorkOrderByt.Cells[0, sgENWorkOrderByt.Row]);
  except
    on EConvertError do Exit;
  end;

  TempENWorkOrderByt := HTTPRIOENWorkOrderByt as ENWorkOrderBytControllerSoapPort;
  TempENWorkOrderByt.undoMakeFormed(workOrderBytCode);

  actUpdateExecute(Sender);
end;

procedure TfrmENWorkOrderBytShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENWorkOrderBytShow.actFilterExecute(Sender: TObject);
//var typeCode: Integer;
begin
  // typeCode := -1;

  frmENWorkOrderBytFilterEdit:=TfrmENWorkOrderBytFilterEdit.Create(Application, dsInsert);
  try
    ENWorkOrderBytFilterObj := ENWorkOrderBytFilter.Create;
    SetNullIntProps(ENWorkOrderBytFilterObj);
    SetNullXSProps(ENWorkOrderBytFilterObj);

    {
    if FilterObject <> nil then
      if ENWorkOrderBytFilter(FilterObject).typeRef <> nil then
        typeCode := ENWorkOrderBytFilter(FilterObject).typeRef.code;
    }

    ////////////////////////////
    if typeCode > 0 then
    begin
      frmENWorkOrderBytFilterEdit.DisableControls([frmENWorkOrderBytFilterEdit.spbType]);
      frmENWorkOrderBytFilterEdit.HideControls([frmENWorkOrderBytFilterEdit.lblType,
                                                frmENWorkOrderBytFilterEdit.edtType,
                                                frmENWorkOrderBytFilterEdit.spbType]);
    end;
    ////////////////////////////

    ENWorkOrderBytFilterObj.typeRef := ENWorkOrderBytTypeRef.Create;
    ENWorkOrderBytFilterObj.typeRef.code := typeCode;

    if frmENWorkOrderBytFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENWorkOrderBytFilter.Create;
      FilterObject := ENWorkOrderBytFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENWorkOrderBytFilterEdit.Free;
    frmENWorkOrderBytFilterEdit := nil;
  end;
end;

procedure TfrmENWorkOrderBytShow.actNoFilterExecute(Sender: TObject);
//var typeCode: Integer;
begin
  //typeCode := LOW_INT;

  {
  if FilterObject <> nil then
    if ENWorkOrderBytFilter(FilterObject).typeRef <> nil then
      typeCode := ENWorkOrderBytFilter(FilterObject).typeRef.code;
  }

  FilterObject.Free;
  FilterObject := nil;

  ///// Пересоздаем фильтр и возвращаем обратно тип
  FilterObject := ENWorkOrderBytFilter.Create;
  SetNullIntProps(FilterObject);
  SetNullXSProps(FilterObject);

  if typeCode <> LOW_INT then
  begin
    ENWorkOrderBytFilter(FilterObject).typeRef := ENWorkOrderBytTypeRef.Create();
    ENWorkOrderBytFilter(FilterObject).typeRef.code := typeCode;
  end;
  /////

  UpdateGrid(Sender);
end;

procedure TfrmENWorkOrderBytShow.actRemoveBadRaidExecute(Sender: TObject);
var
  TempENWorkOrderByt: ENWorkOrderBytControllerSoapPort;
  ObjCode: Integer;
begin
  TempENWorkOrderByt := HTTPRIOENWorkOrderByt as ENWorkOrderBytControllerSoapPort;
  try
    ObjCode := StrToInt(sgENWorkOrderByt.Cells[0, sgENWorkOrderByt.Row]);
  except
    on EConvertError do Exit;
  end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити завдання ?'),
                            PChar('Увага !'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
  begin
    TempENWorkOrderByt.removeBadRaid(ObjCode);
    UpdateGrid(Sender);
  end;
end;

end.