
unit ShowRQBox;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  EnergyProController, EnergyProController2,
  RQBoxController, AdvObj ;


type
  TfrmRQBoxShow = class(TChildForm)  
  HTTPRIORQBox: THTTPRIO;
    ImageList1: TImageList;
    sgRQBox: TAdvStringGrid;
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
procedure sgRQBoxTopLeftChanged(Sender: TObject);
procedure actUpdateExecute(Sender: TObject);
procedure actNoFilterExecute(Sender: TObject);
    procedure sgRQBoxDblClick(Sender: TObject);

  private
   { Private declarations }
 public
   { Public declarations }
   procedure UpdateGrid(Sender: TObject);
 end;

//var
 // RQBoxObj: RQBox;
 // RQBoxFilterObj: RQBoxFilter;
  
  
implementation

uses Main {, EditRQBox, EditRQBoxFilter};


{$R *.dfm}

var
  //frmRQBoxShow : TfrmRQBoxShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  RQBoxHeaders: array [1..2] of String =
        ( 'Код'
          ,'Номер'
        );
   

procedure TfrmRQBoxShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      Self:=nil;
    inherited;
  end;


procedure TfrmRQBoxShow.FormShow(Sender: TObject);
var
  TempRQBox: RQBoxControllerSoapPort;
  i: Integer;
  RQBoxList: RQBoxShortList;
  begin
  SetGridHeaders(RQBoxHeaders, sgRQBox.ColumnHeaders);
  ColCount:=100;
  TempRQBox :=  HTTPRIORQBox as RQBoxControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := RQBoxFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQBoxList := TempRQBox.getScrollableFilteredList(RQBoxFilter(FilterObject),0,ColCount);


  LastCount:=High(RQBoxList.list);

  if LastCount > -1 then
     sgRQBox.RowCount:=LastCount+2
  else
     sgRQBox.RowCount:=2;

   with sgRQBox do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQBoxList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQBoxList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := RQBoxList.list[i].numberGen;
        LastRow:=i+1;
        sgRQBox.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgRQBox.Row:=1;
end;

procedure TfrmRQBoxShow.sgRQBoxDblClick(Sender: TObject);
var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgRQBox,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmRQBoxShow.sgRQBoxTopLeftChanged(Sender: TObject);
var
  TempRQBox: RQBoxControllerSoapPort;
  i,CurrentRow: Integer;
  RQBoxList: RQBoxShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgRQBox.TopRow + sgRQBox.VisibleRowCount) = ColCount
  then
    begin
      TempRQBox :=  HTTPRIORQBox as RQBoxControllerSoapPort;
      CurrentRow:=sgRQBox.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := RQBoxFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQBoxList := TempRQBox.getScrollableFilteredList(RQBoxFilter(FilterObject),ColCount-1, 100);

  sgRQBox.RowCount:=sgRQBox.RowCount+100;
  LastCount:=High(RQBoxList.list);
  with sgRQBox do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQBoxList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(RQBoxList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := RQBoxList.list[i].numberGen;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgRQBox.Row:=CurrentRow-5;
   sgRQBox.RowCount:=LastRow+1;
  end;
end;

procedure TfrmRQBoxShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgRQBox.RowCount-1 do
   for j:=0 to sgRQBox.ColCount-1 do
     sgRQBox.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmRQBoxShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmRQBoxShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.