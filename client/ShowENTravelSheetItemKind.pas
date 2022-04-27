
unit ShowENTravelSheetItemKind;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENTravelSheetItemKindController, AdvObj ;


type
  TfrmENTravelSheetItemKindShow = class(TChildForm)  
  HTTPRIOENTravelSheetItemKind: THTTPRIO;
    ImageList1: TImageList;
    sgENTravelSheetItemKind: TAdvStringGrid;
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
procedure sgENTravelSheetItemKindTopLeftChanged(Sender: TObject);
procedure sgENTravelSheetItemKindDblClick(Sender: TObject);
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
 // ENTravelSheetItemKindObj: ENTravelSheetItemKind;
 // ENTravelSheetItemKindFilterObj: ENTravelSheetItemKindFilter;
  
  
implementation

uses Main, EditENTravelSheetItemKind, EditENTravelSheetItemKindFilter;


{$R *.dfm}

var
  //frmENTravelSheetItemKindShow : TfrmENTravelSheetItemKindShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENTravelSheetItemKindHeaders: array [1..2] of String =
        ( 'Код'
          ,'Назва'
        );
   

procedure TfrmENTravelSheetItemKindShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENTravelSheetItemKindShow:=nil;
    inherited;
  end;


procedure TfrmENTravelSheetItemKindShow.FormShow(Sender: TObject);
var
  TempENTravelSheetItemKind: ENTravelSheetItemKindControllerSoapPort;
  i: Integer;
  ENTravelSheetItemKindList: ENTravelSheetItemKindShortList;
  begin
  SetGridHeaders(ENTravelSheetItemKindHeaders, sgENTravelSheetItemKind.ColumnHeaders);
  ColCount:=100;
  TempENTravelSheetItemKind :=  HTTPRIOENTravelSheetItemKind as ENTravelSheetItemKindControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENTravelSheetItemKindFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENTravelSheetItemKindList := TempENTravelSheetItemKind.getScrollableFilteredList(ENTravelSheetItemKindFilter(FilterObject),0,ColCount);


  LastCount:=High(ENTravelSheetItemKindList.list);

  if LastCount > -1 then
     sgENTravelSheetItemKind.RowCount:=LastCount+2
  else
     sgENTravelSheetItemKind.RowCount:=2;

   with sgENTravelSheetItemKind do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENTravelSheetItemKindList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENTravelSheetItemKindList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENTravelSheetItemKindList.list[i].name;
        LastRow:=i+1;
        sgENTravelSheetItemKind.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENTravelSheetItemKind.Row:=1;
end;

procedure TfrmENTravelSheetItemKindShow.sgENTravelSheetItemKindTopLeftChanged(Sender: TObject);
var
  TempENTravelSheetItemKind: ENTravelSheetItemKindControllerSoapPort;
  i,CurrentRow: Integer;
  ENTravelSheetItemKindList: ENTravelSheetItemKindShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENTravelSheetItemKind.TopRow + sgENTravelSheetItemKind.VisibleRowCount) = ColCount
  then
    begin
      TempENTravelSheetItemKind :=  HTTPRIOENTravelSheetItemKind as ENTravelSheetItemKindControllerSoapPort;
      CurrentRow:=sgENTravelSheetItemKind.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENTravelSheetItemKindFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENTravelSheetItemKindList := TempENTravelSheetItemKind.getScrollableFilteredList(ENTravelSheetItemKindFilter(FilterObject),ColCount-1, 100);



  sgENTravelSheetItemKind.RowCount:=sgENTravelSheetItemKind.RowCount+100;
  LastCount:=High(ENTravelSheetItemKindList.list);
  with sgENTravelSheetItemKind do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENTravelSheetItemKindList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENTravelSheetItemKindList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENTravelSheetItemKindList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENTravelSheetItemKind.Row:=CurrentRow-5;
   sgENTravelSheetItemKind.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENTravelSheetItemKindShow.sgENTravelSheetItemKindDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENTravelSheetItemKind,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENTravelSheetItemKindShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENTravelSheetItemKind.RowCount-1 do
   for j:=0 to sgENTravelSheetItemKind.ColCount-1 do
     sgENTravelSheetItemKind.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENTravelSheetItemKindShow.actViewExecute(Sender: TObject);
Var TempENTravelSheetItemKind: ENTravelSheetItemKindControllerSoapPort;
begin
 TempENTravelSheetItemKind := HTTPRIOENTravelSheetItemKind as ENTravelSheetItemKindControllerSoapPort;
   try
     ENTravelSheetItemKindObj := TempENTravelSheetItemKind.getObject(StrToInt(sgENTravelSheetItemKind.Cells[0,sgENTravelSheetItemKind.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENTravelSheetItemKindEdit:=TfrmENTravelSheetItemKindEdit.Create(Application, dsView);
  try
    frmENTravelSheetItemKindEdit.ShowModal;
  finally
    frmENTravelSheetItemKindEdit.Free;
    frmENTravelSheetItemKindEdit:=nil;
  end;
end;

procedure TfrmENTravelSheetItemKindShow.actEditExecute(Sender: TObject);
Var TempENTravelSheetItemKind: ENTravelSheetItemKindControllerSoapPort;
begin
 TempENTravelSheetItemKind := HTTPRIOENTravelSheetItemKind as ENTravelSheetItemKindControllerSoapPort;
   try
     ENTravelSheetItemKindObj := TempENTravelSheetItemKind.getObject(StrToInt(sgENTravelSheetItemKind.Cells[0,sgENTravelSheetItemKind.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENTravelSheetItemKindEdit:=TfrmENTravelSheetItemKindEdit.Create(Application, dsEdit);
  try
    if frmENTravelSheetItemKindEdit.ShowModal= mrOk then
      begin
        //TempENTravelSheetItemKind.save(ENTravelSheetItemKindObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENTravelSheetItemKindEdit.Free;
    frmENTravelSheetItemKindEdit:=nil;
  end;
end;

procedure TfrmENTravelSheetItemKindShow.actDeleteExecute(Sender: TObject);
Var TempENTravelSheetItemKind: ENTravelSheetItemKindControllerSoapPort;
  ObjCode: Integer;
begin
 TempENTravelSheetItemKind := HTTPRIOENTravelSheetItemKind as ENTravelSheetItemKindControllerSoapPort;
   try
     ObjCode := StrToInt(sgENTravelSheetItemKind.Cells[0,sgENTravelSheetItemKind.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Типи строки маршрутного листа) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENTravelSheetItemKind.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENTravelSheetItemKindShow.actInsertExecute(Sender: TObject);
Var TempENTravelSheetItemKind: ENTravelSheetItemKindControllerSoapPort;
begin
  TempENTravelSheetItemKind := HTTPRIOENTravelSheetItemKind as ENTravelSheetItemKindControllerSoapPort;
  ENTravelSheetItemKindObj:=ENTravelSheetItemKind.Create;



  try
    frmENTravelSheetItemKindEdit:=TfrmENTravelSheetItemKindEdit.Create(Application, dsInsert);
    try
      if frmENTravelSheetItemKindEdit.ShowModal = mrOk then
      begin
        if ENTravelSheetItemKindObj<>nil then
            //TempENTravelSheetItemKind.add(ENTravelSheetItemKindObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENTravelSheetItemKindEdit.Free;
      frmENTravelSheetItemKindEdit:=nil;
    end;
  finally
    ENTravelSheetItemKindObj.Free;
  end;
end;

procedure TfrmENTravelSheetItemKindShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENTravelSheetItemKindShow.actFilterExecute(Sender: TObject);
begin
{frmENTravelSheetItemKindFilterEdit:=TfrmENTravelSheetItemKindFilterEdit.Create(Application, dsInsert);
  try
    ENTravelSheetItemKindFilterObj := ENTravelSheetItemKindFilter.Create;
    SetNullIntProps(ENTravelSheetItemKindFilterObj);
    SetNullXSProps(ENTravelSheetItemKindFilterObj);

    if frmENTravelSheetItemKindFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENTravelSheetItemKindFilter.Create;
      FilterObject := ENTravelSheetItemKindFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENTravelSheetItemKindFilterEdit.Free;
    frmENTravelSheetItemKindFilterEdit:=nil;
  end;}
end;

procedure TfrmENTravelSheetItemKindShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.