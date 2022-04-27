
unit ShowFINExecutor2Plan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  FINExecutor2PlanController ;


type
  TfrmFINExecutor2PlanShow = class(TChildForm)  
  HTTPRIOFINExecutor2Plan: THTTPRIO;
    ImageList1: TImageList;
    sgFINExecutor2Plan: TAdvStringGrid;
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

procedure FormShow(Sender: TObject);
procedure FormClose(Sender: TObject; var Action: TCloseAction);
procedure sgFINExecutor2PlanTopLeftChanged(Sender: TObject);
procedure sgFINExecutor2PlanDblClick(Sender: TObject);
procedure actViewExecute(Sender: TObject);
procedure actEditExecute(Sender: TObject);
procedure actDeleteExecute(Sender: TObject);
procedure actInsertExecute(Sender: TObject);
procedure actUpdateExecute(Sender: TObject);
procedure actFilterExecute(Sender: TObject);
procedure actNoFilterExecute(Sender: TObject);

  private
   { Private declarations }
 public
   { Public declarations }
   procedure UpdateGrid(Sender: TObject);
 end;

//var
 // FINExecutor2PlanObj: FINExecutor2Plan;
 // FINExecutor2PlanFilterObj: FINExecutor2PlanFilter;
  
  
implementation

uses Main, EditFINExecutor2Plan, EditFINExecutor2PlanFilter;


{$R *.dfm}

var
  //frmFINExecutor2PlanShow : TfrmFINExecutor2PlanShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  FINExecutor2PlanHeaders: array [1..8] of String =
        ( 'Код'
          ,'Відсоток зайнятості'
          ,'Дата початку виконання робіт'
          ,'Дата закінчення виконання робіт'
          ,'Загальний час виконання робіт(години)'
          ,'Загальний час виконання робіт(дні)'
          ,'Користувач, який вніс зміни'
          ,'Дата зміни'
        );
   

procedure TfrmFINExecutor2PlanShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmFINExecutor2PlanShow:=nil;
    inherited;
  end;


procedure TfrmFINExecutor2PlanShow.FormShow(Sender: TObject);
var
  TempFINExecutor2Plan: FINExecutor2PlanControllerSoapPort;
  i: Integer;
  FINExecutor2PlanList: FINExecutor2PlanShortList;
  begin
  SetGridHeaders(FINExecutor2PlanHeaders, sgFINExecutor2Plan.ColumnHeaders);
  ColCount:=100;
  TempFINExecutor2Plan :=  HTTPRIOFINExecutor2Plan as FINExecutor2PlanControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := FINExecutor2PlanFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  FINExecutor2PlanList := TempFINExecutor2Plan.getScrollableFilteredList(FINExecutor2PlanFilter(FilterObject),0,ColCount);


  LastCount:=High(FINExecutor2PlanList.list);

  if LastCount > -1 then
     sgFINExecutor2Plan.RowCount:=LastCount+2
  else
     sgFINExecutor2Plan.RowCount:=2;

   with sgFINExecutor2Plan do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if FINExecutor2PlanList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(FINExecutor2PlanList.list[i].code)
        else
        Cells[0,i+1] := '';
        if FINExecutor2PlanList.list[i].percentLoad = nil then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := FINExecutor2PlanList.list[i].percentLoad.DecimalString;
        if FINExecutor2PlanList.list[i].dateStart = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDate2String(FINExecutor2PlanList.list[i].dateStart);
        if FINExecutor2PlanList.list[i].dateFinal = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := XSDate2String(FINExecutor2PlanList.list[i].dateFinal);
        if FINExecutor2PlanList.list[i].totalTimeHours = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := FINExecutor2PlanList.list[i].totalTimeHours.DecimalString;
        if FINExecutor2PlanList.list[i].totalTimeDays = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := FINExecutor2PlanList.list[i].totalTimeDays.DecimalString;
        Cells[6,i+1] := FINExecutor2PlanList.list[i].userGen;
        if FINExecutor2PlanList.list[i].dateEdit = nil then
          Cells[7,i+1] := ''
        else
          Cells[7,i+1] := XSDateTimeWithDate2String(FINExecutor2PlanList.list[i].dateEdit);
        LastRow:=i+1;
        sgFINExecutor2Plan.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgFINExecutor2Plan.Row:=1;
end;

procedure TfrmFINExecutor2PlanShow.sgFINExecutor2PlanTopLeftChanged(Sender: TObject);
var
  TempFINExecutor2Plan: FINExecutor2PlanControllerSoapPort;
  i,CurrentRow: Integer;
  FINExecutor2PlanList: FINExecutor2PlanShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgFINExecutor2Plan.TopRow + sgFINExecutor2Plan.VisibleRowCount) = ColCount
  then
    begin
      TempFINExecutor2Plan :=  HTTPRIOFINExecutor2Plan as FINExecutor2PlanControllerSoapPort;
      CurrentRow:=sgFINExecutor2Plan.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := FINExecutor2PlanFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  FINExecutor2PlanList := TempFINExecutor2Plan.getScrollableFilteredList(FINExecutor2PlanFilter(FilterObject),ColCount-1, 100);



  sgFINExecutor2Plan.RowCount:=sgFINExecutor2Plan.RowCount+100;
  LastCount:=High(FINExecutor2PlanList.list);
  with sgFINExecutor2Plan do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if FINExecutor2PlanList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(FINExecutor2PlanList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        if FINExecutor2PlanList.list[i].percentLoad = nil then
          Cells[1,i+CurrentRow] := ''
        else
          Cells[1,i+CurrentRow] := FINExecutor2PlanList.list[i].percentLoad.DecimalString;
        if FINExecutor2PlanList.list[i].dateStart = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := XSDate2String(FINExecutor2PlanList.list[i].dateStart);
        if FINExecutor2PlanList.list[i].dateFinal = nil then
          Cells[3,i+CurrentRow] := ''
        else
          Cells[3,i+CurrentRow] := XSDate2String(FINExecutor2PlanList.list[i].dateFinal);
        if FINExecutor2PlanList.list[i].totalTimeHours = nil then
          Cells[4,i+CurrentRow] := ''
        else
          Cells[4,i+CurrentRow] := FINExecutor2PlanList.list[i].totalTimeHours.DecimalString;
        if FINExecutor2PlanList.list[i].totalTimeDays = nil then
          Cells[5,i+CurrentRow] := ''
        else
          Cells[5,i+CurrentRow] := FINExecutor2PlanList.list[i].totalTimeDays.DecimalString;
        Cells[6,i+CurrentRow] := FINExecutor2PlanList.list[i].userGen;
        if FINExecutor2PlanList.list[i].dateEdit = nil then
          Cells[7,i+CurrentRow] := ''
        else
          Cells[7,i+CurrentRow] := XSDateTimeWithDate2String(FINExecutor2PlanList.list[i].dateEdit);		  
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgFINExecutor2Plan.Row:=CurrentRow-5;
   sgFINExecutor2Plan.RowCount:=LastRow+1;
  end;
end;

procedure TfrmFINExecutor2PlanShow.sgFINExecutor2PlanDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgFINExecutor2Plan,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmFINExecutor2PlanShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgFINExecutor2Plan.RowCount-1 do
   for j:=0 to sgFINExecutor2Plan.ColCount-1 do
     sgFINExecutor2Plan.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmFINExecutor2PlanShow.actViewExecute(Sender: TObject);
Var TempFINExecutor2Plan: FINExecutor2PlanControllerSoapPort;
begin
 TempFINExecutor2Plan := HTTPRIOFINExecutor2Plan as FINExecutor2PlanControllerSoapPort;
   try
     FINExecutor2PlanObj := TempFINExecutor2Plan.getObject(StrToInt(sgFINExecutor2Plan.Cells[0,sgFINExecutor2Plan.Row]));
   except
   on EConvertError do Exit;
  end;
  frmFINExecutor2PlanEdit:=TfrmFINExecutor2PlanEdit.Create(Application, dsView);
  try
    frmFINExecutor2PlanEdit.ShowModal;
  finally
    frmFINExecutor2PlanEdit.Free;
    frmFINExecutor2PlanEdit:=nil;
  end;
end;

procedure TfrmFINExecutor2PlanShow.actEditExecute(Sender: TObject);
Var TempFINExecutor2Plan: FINExecutor2PlanControllerSoapPort;
begin
 TempFINExecutor2Plan := HTTPRIOFINExecutor2Plan as FINExecutor2PlanControllerSoapPort;
   try
     FINExecutor2PlanObj := TempFINExecutor2Plan.getObject(StrToInt(sgFINExecutor2Plan.Cells[0,sgFINExecutor2Plan.Row]));
   except
   on EConvertError do Exit;
  end;
  frmFINExecutor2PlanEdit:=TfrmFINExecutor2PlanEdit.Create(Application, dsEdit);
  try
    if frmFINExecutor2PlanEdit.ShowModal= mrOk then
      begin
        //TempFINExecutor2Plan.save(FINExecutor2PlanObj);
        UpdateGrid(Sender);
      end;
  finally
    frmFINExecutor2PlanEdit.Free;
    frmFINExecutor2PlanEdit:=nil;
  end;
end;

procedure TfrmFINExecutor2PlanShow.actDeleteExecute(Sender: TObject);
Var TempFINExecutor2Plan: FINExecutor2PlanControllerSoapPort;
  ObjCode: Integer;
begin
 TempFINExecutor2Plan := HTTPRIOFINExecutor2Plan as FINExecutor2PlanControllerSoapPort;
   try
     ObjCode := StrToInt(sgFINExecutor2Plan.Cells[0,sgFINExecutor2Plan.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Додаткові виконавці плану) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempFINExecutor2Plan.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmFINExecutor2PlanShow.actInsertExecute(Sender: TObject);
// Var TempFINExecutor2Plan: FINExecutor2PlanControllerSoapPort; 
begin
  // TempFINExecutor2Plan := HTTPRIOFINExecutor2Plan as FINExecutor2PlanControllerSoapPort;  /// Это здесь уже лишнее!!!
  FINExecutor2PlanObj:=FINExecutor2Plan.Create;

   //FINExecutor2PlanObj.percentLoad:= TXSDecimal.Create;
   //FINExecutor2PlanObj.dateStart:= TXSDate.Create;
   //FINExecutor2PlanObj.dateFinal:= TXSDate.Create;
   //FINExecutor2PlanObj.totalTimeHours:= TXSDecimal.Create;
   //FINExecutor2PlanObj.totalTimeDays:= TXSDecimal.Create;
   //FINExecutor2PlanObj.dateEdit:= TXSDateTime.Create;
   


  try
    frmFINExecutor2PlanEdit:=TfrmFINExecutor2PlanEdit.Create(Application, dsInsert);
    try
      if frmFINExecutor2PlanEdit.ShowModal = mrOk then
      begin
        if FINExecutor2PlanObj<>nil then
            //TempFINExecutor2Plan.add(FINExecutor2PlanObj);
            UpdateGrid(Sender);
      end;
    finally
      frmFINExecutor2PlanEdit.Free;
      frmFINExecutor2PlanEdit:=nil;
    end;
  finally
    FINExecutor2PlanObj.Free;
  end;
end;

procedure TfrmFINExecutor2PlanShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmFINExecutor2PlanShow.actFilterExecute(Sender: TObject);
begin
{frmFINExecutor2PlanFilterEdit:=TfrmFINExecutor2PlanFilterEdit.Create(Application, dsInsert);
  try
    FINExecutor2PlanFilterObj := FINExecutor2PlanFilter.Create;
    SetNullIntProps(FINExecutor2PlanFilterObj);
    SetNullXSProps(FINExecutor2PlanFilterObj);

    if frmFINExecutor2PlanFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := FINExecutor2PlanFilter.Create;
      FilterObject := FINExecutor2PlanFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmFINExecutor2PlanFilterEdit.Free;
    frmFINExecutor2PlanFilterEdit:=nil;
  end;}
end;

procedure TfrmFINExecutor2PlanShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.