unit ShowENConnectionKind;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENConnectionKindController;


type
  TfrmENConnectionKindShow = class(TChildForm)  
  HTTPRIOENConnectionKind: THTTPRIO;
    ImageList1: TImageList;
    sgENConnectionKind: TAdvStringGrid;
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
procedure sgENConnectionKindTopLeftChanged(Sender: TObject);
procedure sgENConnectionKindDblClick(Sender: TObject);
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

var vENConnectionKind: Integer;
 // ENConnectionKindObj: ENConnectionKind;
 // ENConnectionKindFilterObj: ENConnectionKindFilter;

implementation

uses Main, EditENConnectionKind, EditENConnectionKindFilter;


{$R *.dfm}

var
  //frmENConnectionKindShow : TfrmENConnectionKindShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENConnectionKindHeaders: array [1..2] of String =
        ( 'Код'
          ,'Назва'
        );
   

procedure TfrmENConnectionKindShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENConnectionKindShow:=nil;
    inherited;
  end;


procedure TfrmENConnectionKindShow.FormShow(Sender: TObject);
var
  TempENConnectionKind: ENConnectionKindControllerSoapPort;
  i: Integer;
  ENConnectionKindList: ENConnectionKindShortList;
  begin
  SetGridHeaders(ENConnectionKindHeaders, sgENConnectionKind.ColumnHeaders);
  ColCount:=100;
  TempENConnectionKind :=  HTTPRIOENConnectionKind as ENConnectionKindControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENConnectionKindFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENConnectionKindList := TempENConnectionKind.getScrollableFilteredList(ENConnectionKindFilter(FilterObject),0,ColCount);


  LastCount:=High(ENConnectionKindList.list);

  if LastCount > -1 then
     sgENConnectionKind.RowCount:=LastCount+2
  else
     sgENConnectionKind.RowCount:=2;

   with sgENConnectionKind do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENConnectionKindList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENConnectionKindList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENConnectionKindList.list[i].name;
        LastRow:=i+1;
        sgENConnectionKind.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENConnectionKind.Row:=1;
end;

procedure TfrmENConnectionKindShow.sgENConnectionKindTopLeftChanged(Sender: TObject);
var
  TempENConnectionKind: ENConnectionKindControllerSoapPort;
  i,CurrentRow: Integer;
  ENConnectionKindList: ENConnectionKindShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENConnectionKind.TopRow + sgENConnectionKind.VisibleRowCount) = ColCount
  then
    begin
      TempENConnectionKind :=  HTTPRIOENConnectionKind as ENConnectionKindControllerSoapPort;
      CurrentRow:=sgENConnectionKind.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENConnectionKindFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENConnectionKindList := TempENConnectionKind.getScrollableFilteredList(ENConnectionKindFilter(FilterObject),ColCount-1, 100);



  sgENConnectionKind.RowCount:=sgENConnectionKind.RowCount+100;
  LastCount:=High(ENConnectionKindList.list);
  with sgENConnectionKind do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENConnectionKindList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENConnectionKindList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENConnectionKindList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENConnectionKind.Row:=CurrentRow-5;
   sgENConnectionKind.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENConnectionKindShow.sgENConnectionKindDblClick(Sender: TObject);
begin
  if FormMode = fmNormal then
  begin
    try
      vENConnectionKind:=StrToInt(GetReturnValue(sgENConnectionKind,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENConnectionKindShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENConnectionKind.RowCount-1 do
   for j:=0 to sgENConnectionKind.ColCount-1 do
     sgENConnectionKind.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENConnectionKindShow.actViewExecute(Sender: TObject);
Var TempENConnectionKind: ENConnectionKindControllerSoapPort;
begin
 TempENConnectionKind := HTTPRIOENConnectionKind as ENConnectionKindControllerSoapPort;
   try
     ENConnectionKindObj := TempENConnectionKind.getObject(StrToInt(sgENConnectionKind.Cells[0,sgENConnectionKind.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENConnectionKindEdit:=TfrmENConnectionKindEdit.Create(Application, dsView);
  try
    frmENConnectionKindEdit.ShowModal;
  finally
    frmENConnectionKindEdit.Free;
    frmENConnectionKindEdit:=nil;
  end;
end;

procedure TfrmENConnectionKindShow.actEditExecute(Sender: TObject);
Var TempENConnectionKind: ENConnectionKindControllerSoapPort;
begin
 TempENConnectionKind := HTTPRIOENConnectionKind as ENConnectionKindControllerSoapPort;
   try
     ENConnectionKindObj := TempENConnectionKind.getObject(StrToInt(sgENConnectionKind.Cells[0,sgENConnectionKind.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENConnectionKindEdit:=TfrmENConnectionKindEdit.Create(Application, dsEdit);
  try
    if frmENConnectionKindEdit.ShowModal= mrOk then
      begin
        //TempENConnectionKind.save(ENConnectionKindObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENConnectionKindEdit.Free;
    frmENConnectionKindEdit:=nil;
  end;
end;

procedure TfrmENConnectionKindShow.actDeleteExecute(Sender: TObject);
Var TempENConnectionKind: ENConnectionKindControllerSoapPort;
  ObjCode: Integer;
begin
 TempENConnectionKind := HTTPRIOENConnectionKind as ENConnectionKindControllerSoapPort;
   try
     ObjCode := StrToInt(sgENConnectionKind.Cells[0,sgENConnectionKind.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Тип приєднання (стандартне/нестандартне)) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENConnectionKind.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENConnectionKindShow.actInsertExecute(Sender: TObject);
// Var TempENConnectionKind: ENConnectionKindControllerSoapPort; 
begin
  // TempENConnectionKind := HTTPRIOENConnectionKind as ENConnectionKindControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENConnectionKindObj:=ENConnectionKind.Create;



  try
    frmENConnectionKindEdit:=TfrmENConnectionKindEdit.Create(Application, dsInsert);
    try
      if frmENConnectionKindEdit.ShowModal = mrOk then
      begin
        if ENConnectionKindObj<>nil then
            //TempENConnectionKind.add(ENConnectionKindObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENConnectionKindEdit.Free;
      frmENConnectionKindEdit:=nil;
    end;
  finally
    ENConnectionKindObj.Free;
  end;
end;

procedure TfrmENConnectionKindShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENConnectionKindShow.actFilterExecute(Sender: TObject);
begin
{frmENConnectionKindFilterEdit:=TfrmENConnectionKindFilterEdit.Create(Application, dsInsert);
  try
    ENConnectionKindFilterObj := ENConnectionKindFilter.Create;
    SetNullIntProps(ENConnectionKindFilterObj);
    SetNullXSProps(ENConnectionKindFilterObj);

    if frmENConnectionKindFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENConnectionKindFilter.Create;
      FilterObject := ENConnectionKindFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENConnectionKindFilterEdit.Free;
    frmENConnectionKindFilterEdit:=nil;
  end;}
end;

procedure TfrmENConnectionKindShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.