
unit ShowENWiresCut;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENWiresCutController ;


type
  TfrmENWiresCutShow = class(TChildForm)  
  HTTPRIOENWiresCut: THTTPRIO;
    ImageList1: TImageList;
    sgENWiresCut: TAdvStringGrid;
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
procedure sgENWiresCutTopLeftChanged(Sender: TObject);
procedure sgENWiresCutDblClick(Sender: TObject);
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
 // ENWiresCutObj: ENWiresCut;
 // ENWiresCutFilterObj: ENWiresCutFilter;
  
  
implementation

uses Main, EditENWiresCut, EditENWiresCutFilter;


{$R *.dfm}

var
  //frmENWiresCutShow : TfrmENWiresCutShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENWiresCutHeaders: array [1..2] of String =
        ( 'Код'
          ,'Переріз проводів, см'
        );
   

procedure TfrmENWiresCutShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENWiresCutShow:=nil;
    inherited;
  end;


procedure TfrmENWiresCutShow.FormShow(Sender: TObject);
var
  TempENWiresCut: ENWiresCutControllerSoapPort;
  i: Integer;
  ENWiresCutList: ENWiresCutShortList;
  begin
  SetGridHeaders(ENWiresCutHeaders, sgENWiresCut.ColumnHeaders);
  ColCount:=100;
  TempENWiresCut :=  HTTPRIOENWiresCut as ENWiresCutControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENWiresCutFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENWiresCutList := TempENWiresCut.getScrollableFilteredList(ENWiresCutFilter(FilterObject),0,ColCount);


  LastCount:=High(ENWiresCutList.list);

  if LastCount > -1 then
     sgENWiresCut.RowCount:=LastCount+2
  else
     sgENWiresCut.RowCount:=2;

   with sgENWiresCut do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENWiresCutList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENWiresCutList.list[i].code)
        else
        Cells[0,i+1] := '';
        if ENWiresCutList.list[i].wiresCut = nil then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := ENWiresCutList.list[i].wiresCut.DecimalString;
        LastRow:=i+1;
        sgENWiresCut.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENWiresCut.Row:=1;
end;

procedure TfrmENWiresCutShow.sgENWiresCutTopLeftChanged(Sender: TObject);
var
  TempENWiresCut: ENWiresCutControllerSoapPort;
  i,CurrentRow: Integer;
  ENWiresCutList: ENWiresCutShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENWiresCut.TopRow + sgENWiresCut.VisibleRowCount) = ColCount
  then
    begin
      TempENWiresCut :=  HTTPRIOENWiresCut as ENWiresCutControllerSoapPort;
      CurrentRow:=sgENWiresCut.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENWiresCutFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENWiresCutList := TempENWiresCut.getScrollableFilteredList(ENWiresCutFilter(FilterObject),ColCount-1, 100);



  sgENWiresCut.RowCount:=sgENWiresCut.RowCount+100;
  LastCount:=High(ENWiresCutList.list);
  with sgENWiresCut do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENWiresCutList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENWiresCutList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        if ENWiresCutList.list[i].wiresCut = nil then
          Cells[1,i+CurrentRow] := ''
        else
          Cells[1,i+CurrentRow] := ENWiresCutList.list[i].wiresCut.DecimalString;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENWiresCut.Row:=CurrentRow-5;
   sgENWiresCut.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENWiresCutShow.sgENWiresCutDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENWiresCut,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENWiresCutShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENWiresCut.RowCount-1 do
   for j:=0 to sgENWiresCut.ColCount-1 do
     sgENWiresCut.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENWiresCutShow.actViewExecute(Sender: TObject);
Var TempENWiresCut: ENWiresCutControllerSoapPort;
begin
 TempENWiresCut := HTTPRIOENWiresCut as ENWiresCutControllerSoapPort;
   try
     ENWiresCutObj := TempENWiresCut.getObject(StrToInt(sgENWiresCut.Cells[0,sgENWiresCut.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENWiresCutEdit:=TfrmENWiresCutEdit.Create(Application, dsView);
  try
    frmENWiresCutEdit.ShowModal;
  finally
    frmENWiresCutEdit.Free;
    frmENWiresCutEdit:=nil;
  end;
end;

procedure TfrmENWiresCutShow.actEditExecute(Sender: TObject);
Var TempENWiresCut: ENWiresCutControllerSoapPort;
begin
 TempENWiresCut := HTTPRIOENWiresCut as ENWiresCutControllerSoapPort;
   try
     ENWiresCutObj := TempENWiresCut.getObject(StrToInt(sgENWiresCut.Cells[0,sgENWiresCut.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENWiresCutEdit:=TfrmENWiresCutEdit.Create(Application, dsEdit);
  try
    if frmENWiresCutEdit.ShowModal= mrOk then
      begin
        //TempENWiresCut.save(ENWiresCutObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENWiresCutEdit.Free;
    frmENWiresCutEdit:=nil;
  end;
end;

procedure TfrmENWiresCutShow.actDeleteExecute(Sender: TObject);
Var TempENWiresCut: ENWiresCutControllerSoapPort;
  ObjCode: Integer;
begin
 TempENWiresCut := HTTPRIOENWiresCut as ENWiresCutControllerSoapPort;
   try
     ObjCode := StrToInt(sgENWiresCut.Cells[0,sgENWiresCut.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Переріз(перетин) проводу) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENWiresCut.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENWiresCutShow.actInsertExecute(Sender: TObject);
// Var TempENWiresCut: ENWiresCutControllerSoapPort; 
begin
  // TempENWiresCut := HTTPRIOENWiresCut as ENWiresCutControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENWiresCutObj:=ENWiresCut.Create;

   //ENWiresCutObj.wiresCut:= TXSDecimal.Create;


  try
    frmENWiresCutEdit:=TfrmENWiresCutEdit.Create(Application, dsInsert);
    try
      if frmENWiresCutEdit.ShowModal = mrOk then
      begin
        if ENWiresCutObj<>nil then
            //TempENWiresCut.add(ENWiresCutObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENWiresCutEdit.Free;
      frmENWiresCutEdit:=nil;
    end;
  finally
    ENWiresCutObj.Free;
  end;
end;

procedure TfrmENWiresCutShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENWiresCutShow.actFilterExecute(Sender: TObject);
begin
{frmENWiresCutFilterEdit:=TfrmENWiresCutFilterEdit.Create(Application, dsInsert);
  try
    ENWiresCutFilterObj := ENWiresCutFilter.Create;
    SetNullIntProps(ENWiresCutFilterObj);
    SetNullXSProps(ENWiresCutFilterObj);

    if frmENWiresCutFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENWiresCutFilter.Create;
      FilterObject := ENWiresCutFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENWiresCutFilterEdit.Free;
    frmENWiresCutFilterEdit:=nil;
  end;}
end;

procedure TfrmENWiresCutShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.