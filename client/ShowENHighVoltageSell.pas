
unit ShowENHighVoltageSell;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENHighVoltageSellController, AdvObj ;


type
  TfrmENHighVoltageSellShow = class(TChildForm)  
  HTTPRIOENHighVoltageSell: THTTPRIO;
    ImageList1: TImageList;
    sgENHighVoltageSell: TAdvStringGrid;
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
procedure sgENHighVoltageSellTopLeftChanged(Sender: TObject);
procedure sgENHighVoltageSellDblClick(Sender: TObject);
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
 // ENHighVoltageSellObj: ENHighVoltageSell;
 // ENHighVoltageSellFilterObj: ENHighVoltageSellFilter;
  
  
implementation

uses Main, EditENHighVoltageSell, EditENHighVoltageSellFilter;


{$R *.dfm}

var
  frmENHighVoltageSellShow : TfrmENHighVoltageSellShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENHighVoltageSellHeaders: array [1..3] of String =
        ( 'Код'
          ,'Наименование'
          ,'Номер'
        );
   

procedure TfrmENHighVoltageSellShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENHighVoltageSellShow:=nil;
    inherited;
  end;


procedure TfrmENHighVoltageSellShow.FormShow(Sender: TObject);
var
  TempENHighVoltageSell: ENHighVoltageSellControllerSoapPort;
  i: Integer;
  ENHighVoltageSellList: ENHighVoltageSellShortList;
  begin
  SetGridHeaders(ENHighVoltageSellHeaders, sgENHighVoltageSell.ColumnHeaders);
  ColCount:=100;
  TempENHighVoltageSell :=  HTTPRIOENHighVoltageSell as ENHighVoltageSellControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENHighVoltageSellFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENHighVoltageSellList := TempENHighVoltageSell.getScrollableFilteredList(ENHighVoltageSellFilter(FilterObject),0,ColCount);


  LastCount:=High(ENHighVoltageSellList.list);

  if LastCount > -1 then
     sgENHighVoltageSell.RowCount:=LastCount+2
  else
     sgENHighVoltageSell.RowCount:=2;

   with sgENHighVoltageSell do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENHighVoltageSellList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENHighVoltageSellList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENHighVoltageSellList.list[i].name;
        Cells[2,i+1] := ENHighVoltageSellList.list[i].numberGen;
        LastRow:=i+1;
        sgENHighVoltageSell.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENHighVoltageSell.Row:=1;
end;

procedure TfrmENHighVoltageSellShow.sgENHighVoltageSellTopLeftChanged(Sender: TObject);
var
  TempENHighVoltageSell: ENHighVoltageSellControllerSoapPort;
  i,CurrentRow: Integer;
  ENHighVoltageSellList: ENHighVoltageSellShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENHighVoltageSell.TopRow + sgENHighVoltageSell.VisibleRowCount) = ColCount
  then
    begin
      TempENHighVoltageSell :=  HTTPRIOENHighVoltageSell as ENHighVoltageSellControllerSoapPort;
      CurrentRow:=sgENHighVoltageSell.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENHighVoltageSellFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENHighVoltageSellList := TempENHighVoltageSell.getScrollableFilteredList(ENHighVoltageSellFilter(FilterObject),ColCount-1, 100);



  sgENHighVoltageSell.RowCount:=sgENHighVoltageSell.RowCount+100;
  LastCount:=High(ENHighVoltageSellList.list);
  with sgENHighVoltageSell do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENHighVoltageSellList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENHighVoltageSellList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENHighVoltageSellList.list[i].name;
        Cells[2,i+CurrentRow] := ENHighVoltageSellList.list[i].numberGen;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENHighVoltageSell.Row:=CurrentRow-5;
   sgENHighVoltageSell.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENHighVoltageSellShow.sgENHighVoltageSellDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENHighVoltageSell,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENHighVoltageSellShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENHighVoltageSell.RowCount-1 do
   for j:=0 to sgENHighVoltageSell.ColCount-1 do
     sgENHighVoltageSell.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENHighVoltageSellShow.actViewExecute(Sender: TObject);
Var TempENHighVoltageSell: ENHighVoltageSellControllerSoapPort;
begin
 TempENHighVoltageSell := HTTPRIOENHighVoltageSell as ENHighVoltageSellControllerSoapPort;
   try
     ENHighVoltageSellObj := TempENHighVoltageSell.getObject(StrToInt(sgENHighVoltageSell.Cells[0,sgENHighVoltageSell.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENHighVoltageSellEdit:=TfrmENHighVoltageSellEdit.Create(Application, dsView);
  try
    frmENHighVoltageSellEdit.ShowModal;
  finally
    frmENHighVoltageSellEdit.Free;
    frmENHighVoltageSellEdit:=nil;
  end;
end;

procedure TfrmENHighVoltageSellShow.actEditExecute(Sender: TObject);
Var TempENHighVoltageSell: ENHighVoltageSellControllerSoapPort;
begin
 TempENHighVoltageSell := HTTPRIOENHighVoltageSell as ENHighVoltageSellControllerSoapPort;
   try
     ENHighVoltageSellObj := TempENHighVoltageSell.getObject(StrToInt(sgENHighVoltageSell.Cells[0,sgENHighVoltageSell.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENHighVoltageSellEdit:=TfrmENHighVoltageSellEdit.Create(Application, dsEdit);
  try
    if frmENHighVoltageSellEdit.ShowModal= mrOk then
      begin
        //TempENHighVoltageSell.save(ENHighVoltageSellObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENHighVoltageSellEdit.Free;
    frmENHighVoltageSellEdit:=nil;
  end;
end;

procedure TfrmENHighVoltageSellShow.actDeleteExecute(Sender: TObject);
Var TempENHighVoltageSell: ENHighVoltageSellControllerSoapPort;
  ObjCode: Integer;
begin
 TempENHighVoltageSell := HTTPRIOENHighVoltageSell as ENHighVoltageSellControllerSoapPort;
   try
     ObjCode := StrToInt(sgENHighVoltageSell.Cells[0,sgENHighVoltageSell.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Высоковольтная ячейка) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENHighVoltageSell.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENHighVoltageSellShow.actInsertExecute(Sender: TObject);
// Var TempENHighVoltageSell: ENHighVoltageSellControllerSoapPort; 
begin
  // TempENHighVoltageSell := HTTPRIOENHighVoltageSell as ENHighVoltageSellControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENHighVoltageSellObj:=ENHighVoltageSell.Create;



  try
    frmENHighVoltageSellEdit:=TfrmENHighVoltageSellEdit.Create(Application, dsInsert);
    try
      if frmENHighVoltageSellEdit.ShowModal = mrOk then
      begin
        if ENHighVoltageSellObj<>nil then
            //TempENHighVoltageSell.add(ENHighVoltageSellObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENHighVoltageSellEdit.Free;
      frmENHighVoltageSellEdit:=nil;
    end;
  finally
    ENHighVoltageSellObj.Free;
  end;
end;

procedure TfrmENHighVoltageSellShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENHighVoltageSellShow.actFilterExecute(Sender: TObject);
begin
{frmENHighVoltageSellFilterEdit:=TfrmENHighVoltageSellFilterEdit.Create(Application, dsInsert);
  try
    ENHighVoltageSellFilterObj := ENHighVoltageSellFilter.Create;
    SetNullIntProps(ENHighVoltageSellFilterObj);
    SetNullXSProps(ENHighVoltageSellFilterObj);

    if frmENHighVoltageSellFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENHighVoltageSellFilter.Create;
      FilterObject := ENHighVoltageSellFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENHighVoltageSellFilterEdit.Free;
    frmENHighVoltageSellFilterEdit:=nil;
  end;}
end;

procedure TfrmENHighVoltageSellShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.