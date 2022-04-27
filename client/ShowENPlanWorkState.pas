
unit ShowENPlanWorkState;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENPlanWorkStateController, AdvObj ;

 type
  TProcChooseENPlanWorkStateHandler = reference to procedure(selectedObj: ENPlanWorkStateShort);

type
  TfrmENPlanWorkStateShow = class(TChildForm)  
  HTTPRIOENPlanWorkState: THTTPRIO;
    ImageList1: TImageList;
    sgENPlanWorkState: TAdvStringGrid;
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
procedure sgENPlanWorkStateTopLeftChanged(Sender: TObject);
procedure sgENPlanWorkStateDblClick(Sender: TObject);
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
   class procedure chooseFromList(proc: TProcChooseENPlanWorkStateHandler); stdcall; static;
 end;

//var
 // ENPlanWorkStateObj: ENPlanWorkState;
 // ENPlanWorkStateFilterObj: ENPlanWorkStateFilter;
  
  
implementation

uses Main, EditENPlanWorkState, EditENPlanWorkStateFilter;


{$R *.dfm}

var
  //frmENPlanWorkStateShow : TfrmENPlanWorkStateShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENPlanWorkStateHeaders: array [1..3] of String =
        ( 'Код'
          ,'Тип робіт'
          ,'Тип робіт (скорочено)'
        );

class procedure TfrmENPlanWorkStateShow.chooseFromList(proc: TProcChooseENPlanWorkStateHandler);
var
  f1 : ENPlanWorkStateFilter;
  frmENPlanWorkStateShow : TfrmENPlanWorkStateShow;
  selected : ENPlanWorkStateShort;
begin
  inherited;
     f1 := ENPlanWorkStateFilter.Create;
     SetNullXSProps(f1);
     SetNullIntProps(f1);
     frmENPlanWorkStateShow:=TfrmENPlanWorkStateShow.Create(Application,fmNormal, f1);

       try
          with frmENPlanWorkStateShow do
          begin
            DisableActions([ actEdit, actInsert, actDelete ]);
            if ShowModal = mrOk then
            begin
                try
                  selected := ENPlanWorkStateShort(sgENPlanWorkState.Objects[0, sgENPlanWorkState.Row]);
                  proc(selected);
                except
                   on EConvertError do Exit;
                end;
            end;
          end;
       finally
          frmENPlanWorkStateShow.Free;
       end;

end;

procedure TfrmENPlanWorkStateShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
//    if FormMode = fmChild then
//      frmENPlanWorkStateShow:=nil;
    inherited;
  end;


procedure TfrmENPlanWorkStateShow.FormShow(Sender: TObject);
var
  TempENPlanWorkState: ENPlanWorkStateControllerSoapPort;
  i: Integer;
  ENPlanWorkStateList: ENPlanWorkStateShortList;
  begin
  SetGridHeaders(ENPlanWorkStateHeaders, sgENPlanWorkState.ColumnHeaders);
  ColCount:=100;
  TempENPlanWorkState :=  HTTPRIOENPlanWorkState as ENPlanWorkStateControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENPlanWorkStateFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENPlanWorkStateList := TempENPlanWorkState.getScrollableFilteredList(ENPlanWorkStateFilter(FilterObject),0,ColCount);


  LastCount:=High(ENPlanWorkStateList.list);

  if LastCount > -1 then
     sgENPlanWorkState.RowCount:=LastCount+2
  else
     sgENPlanWorkState.RowCount:=2;

   with sgENPlanWorkState do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENPlanWorkStateList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENPlanWorkStateList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENPlanWorkStateList.list[i].name;
        Cells[2,i+1] := ENPlanWorkStateList.list[i].shortName;
        LastRow:=i+1;
        sgENPlanWorkState.RowCount:=LastRow+1;

        Objects[0,i+1] := ENPlanWorkStateList.list[i];
      end;
   ColCount:=ColCount+1;
   sgENPlanWorkState.Row:=1;
end;

procedure TfrmENPlanWorkStateShow.sgENPlanWorkStateTopLeftChanged(Sender: TObject);
var
  TempENPlanWorkState: ENPlanWorkStateControllerSoapPort;
  i,CurrentRow: Integer;
  ENPlanWorkStateList: ENPlanWorkStateShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENPlanWorkState.TopRow + sgENPlanWorkState.VisibleRowCount) = ColCount
  then
    begin
      TempENPlanWorkState :=  HTTPRIOENPlanWorkState as ENPlanWorkStateControllerSoapPort;
      CurrentRow:=sgENPlanWorkState.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENPlanWorkStateFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENPlanWorkStateList := TempENPlanWorkState.getScrollableFilteredList(ENPlanWorkStateFilter(FilterObject),ColCount-1, 100);



  sgENPlanWorkState.RowCount:=sgENPlanWorkState.RowCount+100;
  LastCount:=High(ENPlanWorkStateList.list);
  with sgENPlanWorkState do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENPlanWorkStateList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENPlanWorkStateList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENPlanWorkStateList.list[i].name;
        Cells[2,i+CurrentRow] := ENPlanWorkStateList.list[i].shortName;
        LastRow:=i+CurrentRow;
        Objects[0,i+CurrentRow] := ENPlanWorkStateList.list[i];
      end;
   ColCount:=ColCount+100;
   sgENPlanWorkState.Row:=CurrentRow-5;
   sgENPlanWorkState.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENPlanWorkStateShow.sgENPlanWorkStateDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENPlanWorkState,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENPlanWorkStateShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENPlanWorkState.RowCount-1 do
   for j:=0 to sgENPlanWorkState.ColCount-1 do
     sgENPlanWorkState.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENPlanWorkStateShow.actViewExecute(Sender: TObject);
Var TempENPlanWorkState: ENPlanWorkStateControllerSoapPort;
begin
 TempENPlanWorkState := HTTPRIOENPlanWorkState as ENPlanWorkStateControllerSoapPort;
   try
     ENPlanWorkStateObj := TempENPlanWorkState.getObject(StrToInt(sgENPlanWorkState.Cells[0,sgENPlanWorkState.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENPlanWorkStateEdit:=TfrmENPlanWorkStateEdit.Create(Application, dsView);
  try
    frmENPlanWorkStateEdit.ShowModal;
  finally
    frmENPlanWorkStateEdit.Free;
    frmENPlanWorkStateEdit:=nil;
  end;
end;

procedure TfrmENPlanWorkStateShow.actEditExecute(Sender: TObject);
Var TempENPlanWorkState: ENPlanWorkStateControllerSoapPort;
begin
 TempENPlanWorkState := HTTPRIOENPlanWorkState as ENPlanWorkStateControllerSoapPort;
   try
     ENPlanWorkStateObj := TempENPlanWorkState.getObject(StrToInt(sgENPlanWorkState.Cells[0,sgENPlanWorkState.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENPlanWorkStateEdit:=TfrmENPlanWorkStateEdit.Create(Application, dsEdit);
  try
    if frmENPlanWorkStateEdit.ShowModal= mrOk then
      begin
        //TempENPlanWorkState.save(ENPlanWorkStateObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENPlanWorkStateEdit.Free;
    frmENPlanWorkStateEdit:=nil;
  end;
end;

procedure TfrmENPlanWorkStateShow.actDeleteExecute(Sender: TObject);
Var TempENPlanWorkState: ENPlanWorkStateControllerSoapPort;
  ObjCode: Integer;
begin
 TempENPlanWorkState := HTTPRIOENPlanWorkState as ENPlanWorkStateControllerSoapPort;
   try
     ObjCode := StrToInt(sgENPlanWorkState.Cells[0,sgENPlanWorkState.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Тип робіт) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENPlanWorkState.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENPlanWorkStateShow.actInsertExecute(Sender: TObject);
Var TempENPlanWorkState: ENPlanWorkStateControllerSoapPort;
begin
  TempENPlanWorkState := HTTPRIOENPlanWorkState as ENPlanWorkStateControllerSoapPort;
  ENPlanWorkStateObj:=ENPlanWorkState.Create;



  try
    frmENPlanWorkStateEdit:=TfrmENPlanWorkStateEdit.Create(Application, dsInsert);
    try
      if frmENPlanWorkStateEdit.ShowModal = mrOk then
      begin
        if ENPlanWorkStateObj<>nil then
            //TempENPlanWorkState.add(ENPlanWorkStateObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENPlanWorkStateEdit.Free;
      frmENPlanWorkStateEdit:=nil;
    end;
  finally
    ENPlanWorkStateObj.Free;
  end;
end;

procedure TfrmENPlanWorkStateShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENPlanWorkStateShow.actFilterExecute(Sender: TObject);
begin
{frmENPlanWorkStateFilterEdit:=TfrmENPlanWorkStateFilterEdit.Create(Application, dsEdit);
  try
    ENPlanWorkStateFilterObj := ENPlanWorkStateFilter.Create;
    SetNullIntProps(ENPlanWorkStateFilterObj);
    SetNullXSProps(ENPlanWorkStateFilterObj);

    if frmENPlanWorkStateFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENPlanWorkStateFilter.Create;
      FilterObject := ENPlanWorkStateFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENPlanWorkStateFilterEdit.Free;
    frmENPlanWorkStateFilterEdit:=nil;
  end;}
end;

procedure TfrmENPlanWorkStateShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.