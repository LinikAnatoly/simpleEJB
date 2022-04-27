
unit ShowENConnectionPhasity;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENConnectionPhasityController, AdvObj ;


type
  TfrmENConnectionPhasityShow = class(TChildForm)  
  HTTPRIOENConnectionPhasity: THTTPRIO;
    ImageList1: TImageList;
    sgENConnectionPhasity: TAdvStringGrid;
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
procedure sgENConnectionPhasityTopLeftChanged(Sender: TObject);
procedure sgENConnectionPhasityDblClick(Sender: TObject);
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
 frmENConnectionPhasityShow : TfrmENConnectionPhasityShow;
 // ENConnectionPhasityObj: ENConnectionPhasity;
 // ENConnectionPhasityFilterObj: ENConnectionPhasityFilter;
  
  
implementation

uses Main, EditENConnectionPhasity, EditENConnectionPhasityFilter;


{$R *.dfm}

var
  //frmENConnectionPhasityShow : TfrmENConnectionPhasityShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENConnectionPhasityHeaders: array [1..2] of String =
        ( 'Код'
          ,'Тип фазності приєднання'
        );
   

procedure TfrmENConnectionPhasityShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENConnectionPhasityShow:=nil;
    inherited;
  end;


procedure TfrmENConnectionPhasityShow.FormShow(Sender: TObject);
var
  TempENConnectionPhasity: ENConnectionPhasityControllerSoapPort;
  i: Integer;
  ENConnectionPhasityList: ENConnectionPhasityShortList;
  begin
  SetGridHeaders(ENConnectionPhasityHeaders, sgENConnectionPhasity.ColumnHeaders);
  ColCount:=100;
  TempENConnectionPhasity :=  HTTPRIOENConnectionPhasity as ENConnectionPhasityControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENConnectionPhasityFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENConnectionPhasityList := TempENConnectionPhasity.getScrollableFilteredList(ENConnectionPhasityFilter(FilterObject),0,ColCount);


  LastCount:=High(ENConnectionPhasityList.list);

  if LastCount > -1 then
     sgENConnectionPhasity.RowCount:=LastCount+2
  else
     sgENConnectionPhasity.RowCount:=2;

   with sgENConnectionPhasity do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENConnectionPhasityList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENConnectionPhasityList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENConnectionPhasityList.list[i].name;
        LastRow:=i+1;
        sgENConnectionPhasity.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENConnectionPhasity.Row:=1;
end;

procedure TfrmENConnectionPhasityShow.sgENConnectionPhasityTopLeftChanged(Sender: TObject);
var
  TempENConnectionPhasity: ENConnectionPhasityControllerSoapPort;
  i,CurrentRow: Integer;
  ENConnectionPhasityList: ENConnectionPhasityShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENConnectionPhasity.TopRow + sgENConnectionPhasity.VisibleRowCount) = ColCount
  then
    begin
      TempENConnectionPhasity :=  HTTPRIOENConnectionPhasity as ENConnectionPhasityControllerSoapPort;
      CurrentRow:=sgENConnectionPhasity.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENConnectionPhasityFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENConnectionPhasityList := TempENConnectionPhasity.getScrollableFilteredList(ENConnectionPhasityFilter(FilterObject),ColCount-1, 100);



  sgENConnectionPhasity.RowCount:=sgENConnectionPhasity.RowCount+100;
  LastCount:=High(ENConnectionPhasityList.list);
  with sgENConnectionPhasity do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENConnectionPhasityList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENConnectionPhasityList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENConnectionPhasityList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENConnectionPhasity.Row:=CurrentRow-5;
   sgENConnectionPhasity.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENConnectionPhasityShow.sgENConnectionPhasityDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENConnectionPhasity,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENConnectionPhasityShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENConnectionPhasity.RowCount-1 do
   for j:=0 to sgENConnectionPhasity.ColCount-1 do
     sgENConnectionPhasity.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENConnectionPhasityShow.actViewExecute(Sender: TObject);
Var TempENConnectionPhasity: ENConnectionPhasityControllerSoapPort;
begin
 TempENConnectionPhasity := HTTPRIOENConnectionPhasity as ENConnectionPhasityControllerSoapPort;
   try
     ENConnectionPhasityObj := TempENConnectionPhasity.getObject(StrToInt(sgENConnectionPhasity.Cells[0,sgENConnectionPhasity.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENConnectionPhasityEdit:=TfrmENConnectionPhasityEdit.Create(Application, dsView);
  try
    frmENConnectionPhasityEdit.ShowModal;
  finally
    frmENConnectionPhasityEdit.Free;
    frmENConnectionPhasityEdit:=nil;
  end;
end;

procedure TfrmENConnectionPhasityShow.actEditExecute(Sender: TObject);
Var TempENConnectionPhasity: ENConnectionPhasityControllerSoapPort;
begin
 TempENConnectionPhasity := HTTPRIOENConnectionPhasity as ENConnectionPhasityControllerSoapPort;
   try
     ENConnectionPhasityObj := TempENConnectionPhasity.getObject(StrToInt(sgENConnectionPhasity.Cells[0,sgENConnectionPhasity.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENConnectionPhasityEdit:=TfrmENConnectionPhasityEdit.Create(Application, dsEdit);
  try
    if frmENConnectionPhasityEdit.ShowModal= mrOk then
      begin
        //TempENConnectionPhasity.save(ENConnectionPhasityObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENConnectionPhasityEdit.Free;
    frmENConnectionPhasityEdit:=nil;
  end;
end;

procedure TfrmENConnectionPhasityShow.actDeleteExecute(Sender: TObject);
Var TempENConnectionPhasity: ENConnectionPhasityControllerSoapPort;
  ObjCode: Integer;
begin
 TempENConnectionPhasity := HTTPRIOENConnectionPhasity as ENConnectionPhasityControllerSoapPort;
   try
     ObjCode := StrToInt(sgENConnectionPhasity.Cells[0,sgENConnectionPhasity.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Тип фазності приєднання) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENConnectionPhasity.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENConnectionPhasityShow.actInsertExecute(Sender: TObject);
// Var TempENConnectionPhasity: ENConnectionPhasityControllerSoapPort; 
begin
  // TempENConnectionPhasity := HTTPRIOENConnectionPhasity as ENConnectionPhasityControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENConnectionPhasityObj:=ENConnectionPhasity.Create;



  try
    frmENConnectionPhasityEdit:=TfrmENConnectionPhasityEdit.Create(Application, dsInsert);
    try
      if frmENConnectionPhasityEdit.ShowModal = mrOk then
      begin
        if ENConnectionPhasityObj<>nil then
            //TempENConnectionPhasity.add(ENConnectionPhasityObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENConnectionPhasityEdit.Free;
      frmENConnectionPhasityEdit:=nil;
    end;
  finally
    ENConnectionPhasityObj.Free;
  end;
end;

procedure TfrmENConnectionPhasityShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENConnectionPhasityShow.actFilterExecute(Sender: TObject);
begin
{frmENConnectionPhasityFilterEdit:=TfrmENConnectionPhasityFilterEdit.Create(Application, dsInsert);
  try
    ENConnectionPhasityFilterObj := ENConnectionPhasityFilter.Create;
    SetNullIntProps(ENConnectionPhasityFilterObj);
    SetNullXSProps(ENConnectionPhasityFilterObj);

    if frmENConnectionPhasityFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENConnectionPhasityFilter.Create;
      FilterObject := ENConnectionPhasityFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENConnectionPhasityFilterEdit.Free;
    frmENConnectionPhasityFilterEdit:=nil;
  end;}
end;

procedure TfrmENConnectionPhasityShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.