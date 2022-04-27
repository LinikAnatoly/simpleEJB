
unit ShowENLandscape;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENLandscapeController, AdvObj ;


type
  TfrmENLandscapeShow = class(TChildForm)  
  HTTPRIOENLandscape: THTTPRIO;
    ImageList1: TImageList;
    sgENLandscape: TAdvStringGrid;
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
procedure sgENLandscapeTopLeftChanged(Sender: TObject);
procedure sgENLandscapeDblClick(Sender: TObject);
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

var
 frmENLandscapeShow : TfrmENLandscapeShow;
 // ENLandscapeObj: ENLandscape;
 // ENLandscapeFilterObj: ENLandscapeFilter;
  
  
implementation

uses Main, EditENLandscape, EditENLandscapeFilter;


{$R *.dfm}

var
  //frmENLandscapeShow : TfrmENLandscapeShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENLandscapeHeaders: array [1..2] of String =
        ( 'Код'
          ,'Характеристика місцевості'
        );
   

procedure TfrmENLandscapeShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENLandscapeShow:=nil;
    inherited;
  end;


procedure TfrmENLandscapeShow.FormShow(Sender: TObject);
var
  TempENLandscape: ENLandscapeControllerSoapPort;
  i: Integer;
  ENLandscapeList: ENLandscapeShortList;
  begin
  SetGridHeaders(ENLandscapeHeaders, sgENLandscape.ColumnHeaders);
  ColCount:=100;
  TempENLandscape :=  HTTPRIOENLandscape as ENLandscapeControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENLandscapeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENLandscapeList := TempENLandscape.getScrollableFilteredList(ENLandscapeFilter(FilterObject),0,ColCount);


  LastCount:=High(ENLandscapeList.list);

  if LastCount > -1 then
     sgENLandscape.RowCount:=LastCount+2
  else
     sgENLandscape.RowCount:=2;

   with sgENLandscape do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENLandscapeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENLandscapeList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENLandscapeList.list[i].name;
        LastRow:=i+1;
        sgENLandscape.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENLandscape.Row:=1;
end;

procedure TfrmENLandscapeShow.sgENLandscapeTopLeftChanged(Sender: TObject);
var
  TempENLandscape: ENLandscapeControllerSoapPort;
  i,CurrentRow: Integer;
  ENLandscapeList: ENLandscapeShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENLandscape.TopRow + sgENLandscape.VisibleRowCount) = ColCount
  then
    begin
      TempENLandscape :=  HTTPRIOENLandscape as ENLandscapeControllerSoapPort;
      CurrentRow:=sgENLandscape.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENLandscapeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENLandscapeList := TempENLandscape.getScrollableFilteredList(ENLandscapeFilter(FilterObject),ColCount-1, 100);



  sgENLandscape.RowCount:=sgENLandscape.RowCount+100;
  LastCount:=High(ENLandscapeList.list);
  with sgENLandscape do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENLandscapeList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENLandscapeList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENLandscapeList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENLandscape.Row:=CurrentRow-5;
   sgENLandscape.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENLandscapeShow.sgENLandscapeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENLandscape,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENLandscapeShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENLandscape.RowCount-1 do
   for j:=0 to sgENLandscape.ColCount-1 do
     sgENLandscape.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENLandscapeShow.actViewExecute(Sender: TObject);
Var TempENLandscape: ENLandscapeControllerSoapPort;
begin
 TempENLandscape := HTTPRIOENLandscape as ENLandscapeControllerSoapPort;
   try
     ENLandscapeObj := TempENLandscape.getObject(StrToInt(sgENLandscape.Cells[0,sgENLandscape.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENLandscapeEdit:=TfrmENLandscapeEdit.Create(Application, dsView);
  try
    frmENLandscapeEdit.ShowModal;
  finally
    frmENLandscapeEdit.Free;
    frmENLandscapeEdit:=nil;
  end;
end;

procedure TfrmENLandscapeShow.actEditExecute(Sender: TObject);
Var TempENLandscape: ENLandscapeControllerSoapPort;
begin
 TempENLandscape := HTTPRIOENLandscape as ENLandscapeControllerSoapPort;
   try
     ENLandscapeObj := TempENLandscape.getObject(StrToInt(sgENLandscape.Cells[0,sgENLandscape.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENLandscapeEdit:=TfrmENLandscapeEdit.Create(Application, dsEdit);
  try
    if frmENLandscapeEdit.ShowModal= mrOk then
      begin
        //TempENLandscape.save(ENLandscapeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENLandscapeEdit.Free;
    frmENLandscapeEdit:=nil;
  end;
end;

procedure TfrmENLandscapeShow.actDeleteExecute(Sender: TObject);
Var TempENLandscape: ENLandscapeControllerSoapPort;
  ObjCode: Integer;
begin
 TempENLandscape := HTTPRIOENLandscape as ENLandscapeControllerSoapPort;
   try
     ObjCode := StrToInt(sgENLandscape.Cells[0,sgENLandscape.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Ландшафт) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENLandscape.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENLandscapeShow.actInsertExecute(Sender: TObject);
// Var TempENLandscape: ENLandscapeControllerSoapPort; 
begin
  // TempENLandscape := HTTPRIOENLandscape as ENLandscapeControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENLandscapeObj:=ENLandscape.Create;



  try
    frmENLandscapeEdit:=TfrmENLandscapeEdit.Create(Application, dsInsert);
    try
      if frmENLandscapeEdit.ShowModal = mrOk then
      begin
        if ENLandscapeObj<>nil then
            //TempENLandscape.add(ENLandscapeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENLandscapeEdit.Free;
      frmENLandscapeEdit:=nil;
    end;
  finally
    ENLandscapeObj.Free;
  end;
end;

procedure TfrmENLandscapeShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENLandscapeShow.actFilterExecute(Sender: TObject);
begin
{frmENLandscapeFilterEdit:=TfrmENLandscapeFilterEdit.Create(Application, dsInsert);
  try
    ENLandscapeFilterObj := ENLandscapeFilter.Create;
    SetNullIntProps(ENLandscapeFilterObj);
    SetNullXSProps(ENLandscapeFilterObj);

    if frmENLandscapeFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENLandscapeFilter.Create;
      FilterObject := ENLandscapeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENLandscapeFilterEdit.Free;
    frmENLandscapeFilterEdit:=nil;
  end;}
end;

procedure TfrmENLandscapeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.