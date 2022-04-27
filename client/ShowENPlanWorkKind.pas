
unit ShowENPlanWorkKind;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENPlanWorkKindController, AdvObj ;


type
  TfrmENPlanWorkKindShow = class(TChildForm)  
  HTTPRIOENPlanWorkKind: THTTPRIO;
    ImageList1: TImageList;
    sgENPlanWorkKind: TAdvStringGrid;
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
procedure sgENPlanWorkKindTopLeftChanged(Sender: TObject);
procedure sgENPlanWorkKindDblClick(Sender: TObject);
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

var planWorkKindCode: Integer;
 // ENPlanWorkKindObj: ENPlanWorkKind;
 // ENPlanWorkKindFilterObj: ENPlanWorkKindFilter;

implementation

uses Main, EditENPlanWorkKind, EditENPlanWorkKindFilter;


{$R *.dfm}

var
  //frmENPlanWorkKindShow : TfrmENPlanWorkKindShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENPlanWorkKindHeaders: array [1..2] of String =
        ( 'Код'
          ,'Вид ремонту'
        );
   

procedure TfrmENPlanWorkKindShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENPlanWorkKindShow:=nil;
    inherited;
  end;


procedure TfrmENPlanWorkKindShow.FormShow(Sender: TObject);
var
  TempENPlanWorkKind: ENPlanWorkKindControllerSoapPort;
  i: Integer;
  ENPlanWorkKindList: ENPlanWorkKindShortList;
  begin
  SetGridHeaders(ENPlanWorkKindHeaders, sgENPlanWorkKind.ColumnHeaders);
  ColCount:=100;
  TempENPlanWorkKind :=  HTTPRIOENPlanWorkKind as ENPlanWorkKindControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENPlanWorkKindFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENPlanWorkKindList := TempENPlanWorkKind.getScrollableFilteredList(ENPlanWorkKindFilter(FilterObject),0,ColCount);


  LastCount:=High(ENPlanWorkKindList.list);

  if LastCount > -1 then
     sgENPlanWorkKind.RowCount:=LastCount+2
  else
     sgENPlanWorkKind.RowCount:=2;

   with sgENPlanWorkKind do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENPlanWorkKindList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENPlanWorkKindList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENPlanWorkKindList.list[i].name;
        LastRow:=i+1;
        sgENPlanWorkKind.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENPlanWorkKind.Row:=1;
end;

procedure TfrmENPlanWorkKindShow.sgENPlanWorkKindTopLeftChanged(Sender: TObject);
var
  TempENPlanWorkKind: ENPlanWorkKindControllerSoapPort;
  i,CurrentRow: Integer;
  ENPlanWorkKindList: ENPlanWorkKindShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENPlanWorkKind.TopRow + sgENPlanWorkKind.VisibleRowCount) = ColCount
  then
    begin
      TempENPlanWorkKind :=  HTTPRIOENPlanWorkKind as ENPlanWorkKindControllerSoapPort;
      CurrentRow:=sgENPlanWorkKind.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENPlanWorkKindFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENPlanWorkKindList := TempENPlanWorkKind.getScrollableFilteredList(ENPlanWorkKindFilter(FilterObject),ColCount-1, 100);



  sgENPlanWorkKind.RowCount:=sgENPlanWorkKind.RowCount+100;
  LastCount:=High(ENPlanWorkKindList.list);
  with sgENPlanWorkKind do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENPlanWorkKindList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENPlanWorkKindList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENPlanWorkKindList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENPlanWorkKind.Row:=CurrentRow-5;
   sgENPlanWorkKind.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENPlanWorkKindShow.sgENPlanWorkKindDblClick(Sender: TObject);
begin
  if FormMode = fmNormal then
    begin
      try
        planWorkKindCode := StrToInt(GetReturnValue(sgENPlanWorkKind, 0));
      except
        on EConvertError do Exit;
      end;
      ModalResult := mrOk;
    end
  else actViewExecute(Sender);
end;

procedure TfrmENPlanWorkKindShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENPlanWorkKind.RowCount-1 do
   for j:=0 to sgENPlanWorkKind.ColCount-1 do
     sgENPlanWorkKind.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENPlanWorkKindShow.actViewExecute(Sender: TObject);
Var TempENPlanWorkKind: ENPlanWorkKindControllerSoapPort;
begin
 TempENPlanWorkKind := HTTPRIOENPlanWorkKind as ENPlanWorkKindControllerSoapPort;
   try
     ENPlanWorkKindObj := TempENPlanWorkKind.getObject(StrToInt(sgENPlanWorkKind.Cells[0,sgENPlanWorkKind.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENPlanWorkKindEdit:=TfrmENPlanWorkKindEdit.Create(Application, dsView);
  try
    frmENPlanWorkKindEdit.ShowModal;
  finally
    frmENPlanWorkKindEdit.Free;
    frmENPlanWorkKindEdit:=nil;
  end;
end;

procedure TfrmENPlanWorkKindShow.actEditExecute(Sender: TObject);
Var TempENPlanWorkKind: ENPlanWorkKindControllerSoapPort;
begin
 TempENPlanWorkKind := HTTPRIOENPlanWorkKind as ENPlanWorkKindControllerSoapPort;
   try
     ENPlanWorkKindObj := TempENPlanWorkKind.getObject(StrToInt(sgENPlanWorkKind.Cells[0,sgENPlanWorkKind.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENPlanWorkKindEdit:=TfrmENPlanWorkKindEdit.Create(Application, dsEdit);
  try
    if frmENPlanWorkKindEdit.ShowModal= mrOk then
      begin
        //TempENPlanWorkKind.save(ENPlanWorkKindObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENPlanWorkKindEdit.Free;
    frmENPlanWorkKindEdit:=nil;
  end;
end;

procedure TfrmENPlanWorkKindShow.actDeleteExecute(Sender: TObject);
Var TempENPlanWorkKind: ENPlanWorkKindControllerSoapPort;
  ObjCode: Integer;
begin
 TempENPlanWorkKind := HTTPRIOENPlanWorkKind as ENPlanWorkKindControllerSoapPort;
   try
     ObjCode := StrToInt(sgENPlanWorkKind.Cells[0,sgENPlanWorkKind.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Тип плану (річний, місячний)) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENPlanWorkKind.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENPlanWorkKindShow.actInsertExecute(Sender: TObject);
Var TempENPlanWorkKind: ENPlanWorkKindControllerSoapPort;
begin
  TempENPlanWorkKind := HTTPRIOENPlanWorkKind as ENPlanWorkKindControllerSoapPort;
  ENPlanWorkKindObj:=ENPlanWorkKind.Create;



  try
    frmENPlanWorkKindEdit:=TfrmENPlanWorkKindEdit.Create(Application, dsInsert);
    try
      if frmENPlanWorkKindEdit.ShowModal = mrOk then
      begin
        if ENPlanWorkKindObj<>nil then
            //TempENPlanWorkKind.add(ENPlanWorkKindObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENPlanWorkKindEdit.Free;
      frmENPlanWorkKindEdit:=nil;
    end;
  finally
    ENPlanWorkKindObj.Free;
  end;
end;

procedure TfrmENPlanWorkKindShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENPlanWorkKindShow.actFilterExecute(Sender: TObject);
begin
{frmENPlanWorkKindFilterEdit:=TfrmENPlanWorkKindFilterEdit.Create(Application, dsEdit);
  try
    ENPlanWorkKindFilterObj := ENPlanWorkKindFilter.Create;
    SetNullIntProps(ENPlanWorkKindFilterObj);
    SetNullXSProps(ENPlanWorkKindFilterObj);

    if frmENPlanWorkKindFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENPlanWorkKindFilter.Create;
      FilterObject := ENPlanWorkKindFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENPlanWorkKindFilterEdit.Free;
    frmENPlanWorkKindFilterEdit:=nil;
  end;}
end;

procedure TfrmENPlanWorkKindShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.