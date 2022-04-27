
unit ShowENDeliveryKind;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENDeliveryKindController, AdvObj ;


type
  TfrmENDeliveryKindShow = class(TChildForm)  
  HTTPRIOENDeliveryKind: THTTPRIO;
    ImageList1: TImageList;
    sgENDeliveryKind: TAdvStringGrid;
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
procedure sgENDeliveryKindTopLeftChanged(Sender: TObject);
procedure sgENDeliveryKindDblClick(Sender: TObject);
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
 frmENDeliveryKindShow : TfrmENDeliveryKindShow;
 // ENDeliveryKindObj: ENDeliveryKind;
 // ENDeliveryKindFilterObj: ENDeliveryKindFilter;
  
  
implementation

uses Main, EditENDeliveryKind, EditENDeliveryKindFilter;


{$R *.dfm}

var
  //frmENDeliveryKindShow : TfrmENDeliveryKindShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENDeliveryKindHeaders: array [1..2] of String =
        ( 'Код'
          ,'Назва виду транспорта'
        );
   

procedure TfrmENDeliveryKindShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENDeliveryKindShow:=nil;
    inherited;
  end;


procedure TfrmENDeliveryKindShow.FormShow(Sender: TObject);
var
  TempENDeliveryKind: ENDeliveryKindControllerSoapPort;
  i: Integer;
  ENDeliveryKindList: ENDeliveryKindShortList;
  begin
  SetGridHeaders(ENDeliveryKindHeaders, sgENDeliveryKind.ColumnHeaders);
  ColCount:=100;
  TempENDeliveryKind :=  HTTPRIOENDeliveryKind as ENDeliveryKindControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENDeliveryKindFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENDeliveryKindList := TempENDeliveryKind.getScrollableFilteredList(ENDeliveryKindFilter(FilterObject),0,ColCount);


  LastCount:=High(ENDeliveryKindList.list);

  if LastCount > -1 then
     sgENDeliveryKind.RowCount:=LastCount+2
  else
     sgENDeliveryKind.RowCount:=2;

   with sgENDeliveryKind do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENDeliveryKindList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENDeliveryKindList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENDeliveryKindList.list[i].name;
        LastRow:=i+1;
        sgENDeliveryKind.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENDeliveryKind.Row:=1;
end;

procedure TfrmENDeliveryKindShow.sgENDeliveryKindTopLeftChanged(Sender: TObject);
var
  TempENDeliveryKind: ENDeliveryKindControllerSoapPort;
  i,CurrentRow: Integer;
  ENDeliveryKindList: ENDeliveryKindShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENDeliveryKind.TopRow + sgENDeliveryKind.VisibleRowCount) = ColCount
  then
    begin
      TempENDeliveryKind :=  HTTPRIOENDeliveryKind as ENDeliveryKindControllerSoapPort;
      CurrentRow:=sgENDeliveryKind.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENDeliveryKindFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENDeliveryKindList := TempENDeliveryKind.getScrollableFilteredList(ENDeliveryKindFilter(FilterObject),ColCount-1, 100);



  sgENDeliveryKind.RowCount:=sgENDeliveryKind.RowCount+100;
  LastCount:=High(ENDeliveryKindList.list);
  with sgENDeliveryKind do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENDeliveryKindList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENDeliveryKindList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENDeliveryKindList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENDeliveryKind.Row:=CurrentRow-5;
   sgENDeliveryKind.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENDeliveryKindShow.sgENDeliveryKindDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENDeliveryKind,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENDeliveryKindShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENDeliveryKind.RowCount-1 do
   for j:=0 to sgENDeliveryKind.ColCount-1 do
     sgENDeliveryKind.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENDeliveryKindShow.actViewExecute(Sender: TObject);
Var TempENDeliveryKind: ENDeliveryKindControllerSoapPort;
begin
 TempENDeliveryKind := HTTPRIOENDeliveryKind as ENDeliveryKindControllerSoapPort;
   try
     ENDeliveryKindObj := TempENDeliveryKind.getObject(StrToInt(sgENDeliveryKind.Cells[0,sgENDeliveryKind.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENDeliveryKindEdit:=TfrmENDeliveryKindEdit.Create(Application, dsView);
  try
    frmENDeliveryKindEdit.ShowModal;
  finally
    frmENDeliveryKindEdit.Free;
    frmENDeliveryKindEdit:=nil;
  end;
end;

procedure TfrmENDeliveryKindShow.actEditExecute(Sender: TObject);
Var TempENDeliveryKind: ENDeliveryKindControllerSoapPort;
begin
 TempENDeliveryKind := HTTPRIOENDeliveryKind as ENDeliveryKindControllerSoapPort;
   try
     ENDeliveryKindObj := TempENDeliveryKind.getObject(StrToInt(sgENDeliveryKind.Cells[0,sgENDeliveryKind.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENDeliveryKindEdit:=TfrmENDeliveryKindEdit.Create(Application, dsEdit);
  try
    if frmENDeliveryKindEdit.ShowModal= mrOk then
      begin
        //TempENDeliveryKind.save(ENDeliveryKindObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENDeliveryKindEdit.Free;
    frmENDeliveryKindEdit:=nil;
  end;
end;

procedure TfrmENDeliveryKindShow.actDeleteExecute(Sender: TObject);
Var TempENDeliveryKind: ENDeliveryKindControllerSoapPort;
  ObjCode: Integer;
begin
 TempENDeliveryKind := HTTPRIOENDeliveryKind as ENDeliveryKindControllerSoapPort;
   try
     ObjCode := StrToInt(sgENDeliveryKind.Cells[0,sgENDeliveryKind.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Вид транспорту на доставку персонала) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENDeliveryKind.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENDeliveryKindShow.actInsertExecute(Sender: TObject);
Var TempENDeliveryKind: ENDeliveryKindControllerSoapPort;
begin
  TempENDeliveryKind := HTTPRIOENDeliveryKind as ENDeliveryKindControllerSoapPort;
  ENDeliveryKindObj:=ENDeliveryKind.Create;



  try
    frmENDeliveryKindEdit:=TfrmENDeliveryKindEdit.Create(Application, dsInsert);
    try
      if frmENDeliveryKindEdit.ShowModal = mrOk then
      begin
        if ENDeliveryKindObj<>nil then
            //TempENDeliveryKind.add(ENDeliveryKindObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENDeliveryKindEdit.Free;
      frmENDeliveryKindEdit:=nil;
    end;
  finally
    ENDeliveryKindObj.Free;
  end;
end;

procedure TfrmENDeliveryKindShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENDeliveryKindShow.actFilterExecute(Sender: TObject);
begin
{frmENDeliveryKindFilterEdit:=TfrmENDeliveryKindFilterEdit.Create(Application, dsEdit);
  try
    ENDeliveryKindFilterObj := ENDeliveryKindFilter.Create;
    SetNullIntProps(ENDeliveryKindFilterObj);
    SetNullXSProps(ENDeliveryKindFilterObj);

    if frmENDeliveryKindFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENDeliveryKindFilter.Create;
      FilterObject := ENDeliveryKindFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENDeliveryKindFilterEdit.Free;
    frmENDeliveryKindFilterEdit:=nil;
  end;}
end;

procedure TfrmENDeliveryKindShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.