
unit ShowENTravers;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENTraversController ;


type
  TfrmENTraversShow = class(TChildForm)  
  HTTPRIOENTravers: THTTPRIO;
    ImageList1: TImageList;
    sgENTravers: TAdvStringGrid;
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
procedure sgENTraversTopLeftChanged(Sender: TObject);
procedure sgENTraversDblClick(Sender: TObject);
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
 // ENTraversObj: ENTravers;
 // ENTraversFilterObj: ENTraversFilter;
  
  
implementation

uses Main, EditENTravers, EditENTraversFilter;


{$R *.dfm}

var
  //frmENTraversShow : TfrmENTraversShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENTraversHeaders: array [1..2] of String =
        ( 'Код'
          ,'Назва траверсу'
        );
   

procedure TfrmENTraversShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENTraversShow:=nil;
    inherited;
  end;


procedure TfrmENTraversShow.FormShow(Sender: TObject);
var
  TempENTravers: ENTraversControllerSoapPort;
  i: Integer;
  ENTraversList: ENTraversShortList;
  begin
  SetGridHeaders(ENTraversHeaders, sgENTravers.ColumnHeaders);
  ColCount:=100;
  TempENTravers :=  HTTPRIOENTravers as ENTraversControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENTraversFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENTraversList := TempENTravers.getScrollableFilteredList(ENTraversFilter(FilterObject),0,ColCount);


  LastCount:=High(ENTraversList.list);

  if LastCount > -1 then
     sgENTravers.RowCount:=LastCount+2
  else
     sgENTravers.RowCount:=2;

   with sgENTravers do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENTraversList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENTraversList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENTraversList.list[i].name;
        LastRow:=i+1;
        sgENTravers.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENTravers.Row:=1;
end;

procedure TfrmENTraversShow.sgENTraversTopLeftChanged(Sender: TObject);
var
  TempENTravers: ENTraversControllerSoapPort;
  i,CurrentRow: Integer;
  ENTraversList: ENTraversShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENTravers.TopRow + sgENTravers.VisibleRowCount) = ColCount
  then
    begin
      TempENTravers :=  HTTPRIOENTravers as ENTraversControllerSoapPort;
      CurrentRow:=sgENTravers.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENTraversFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENTraversList := TempENTravers.getScrollableFilteredList(ENTraversFilter(FilterObject),ColCount-1, 100);



  sgENTravers.RowCount:=sgENTravers.RowCount+100;
  LastCount:=High(ENTraversList.list);
  with sgENTravers do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENTraversList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENTraversList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENTraversList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENTravers.Row:=CurrentRow-5;
   sgENTravers.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENTraversShow.sgENTraversDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENTravers,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENTraversShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENTravers.RowCount-1 do
   for j:=0 to sgENTravers.ColCount-1 do
     sgENTravers.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENTraversShow.actViewExecute(Sender: TObject);
Var TempENTravers: ENTraversControllerSoapPort;
begin
 TempENTravers := HTTPRIOENTravers as ENTraversControllerSoapPort;
   try
     ENTraversObj := TempENTravers.getObject(StrToInt(sgENTravers.Cells[0,sgENTravers.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENTraversEdit:=TfrmENTraversEdit.Create(Application, dsView);
  try
    frmENTraversEdit.ShowModal;
  finally
    frmENTraversEdit.Free;
    frmENTraversEdit:=nil;
  end;
end;

procedure TfrmENTraversShow.actEditExecute(Sender: TObject);
Var TempENTravers: ENTraversControllerSoapPort;
begin
 TempENTravers := HTTPRIOENTravers as ENTraversControllerSoapPort;
   try
     ENTraversObj := TempENTravers.getObject(StrToInt(sgENTravers.Cells[0,sgENTravers.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENTraversEdit:=TfrmENTraversEdit.Create(Application, dsEdit);
  try
    if frmENTraversEdit.ShowModal= mrOk then
      begin
        //TempENTravers.save(ENTraversObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENTraversEdit.Free;
    frmENTraversEdit:=nil;
  end;
end;

procedure TfrmENTraversShow.actDeleteExecute(Sender: TObject);
Var TempENTravers: ENTraversControllerSoapPort;
  ObjCode: Integer;
begin
 TempENTravers := HTTPRIOENTravers as ENTraversControllerSoapPort;
   try
     ObjCode := StrToInt(sgENTravers.Cells[0,sgENTravers.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Траверси на опорі) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENTravers.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENTraversShow.actInsertExecute(Sender: TObject);
// Var TempENTravers: ENTraversControllerSoapPort; 
begin
  // TempENTravers := HTTPRIOENTravers as ENTraversControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENTraversObj:=ENTravers.Create;



  try
    frmENTraversEdit:=TfrmENTraversEdit.Create(Application, dsInsert);
    try
      if frmENTraversEdit.ShowModal = mrOk then
      begin
        if ENTraversObj<>nil then
            //TempENTravers.add(ENTraversObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENTraversEdit.Free;
      frmENTraversEdit:=nil;
    end;
  finally
    ENTraversObj.Free;
  end;
end;

procedure TfrmENTraversShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENTraversShow.actFilterExecute(Sender: TObject);
begin
{frmENTraversFilterEdit:=TfrmENTraversFilterEdit.Create(Application, dsInsert);
  try
    ENTraversFilterObj := ENTraversFilter.Create;
    SetNullIntProps(ENTraversFilterObj);
    SetNullXSProps(ENTraversFilterObj);

    if frmENTraversFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENTraversFilter.Create;
      FilterObject := ENTraversFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENTraversFilterEdit.Free;
    frmENTraversFilterEdit:=nil;
  end;}
end;

procedure TfrmENTraversShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.