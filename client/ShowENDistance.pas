
unit ShowENDistance;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENDistanceController, AdvObj ;


type
  TfrmENDistanceShow = class(TChildForm)  
  HTTPRIOENDistance: THTTPRIO;
    ImageList1: TImageList;
    sgENDistance: TAdvStringGrid;
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
procedure sgENDistanceTopLeftChanged(Sender: TObject);
procedure sgENDistanceDblClick(Sender: TObject);
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
 // ENDistanceObj: ENDistance;
 // ENDistanceFilterObj: ENDistanceFilter;
  
  
implementation

uses Main, EditENDistance, EditENDistanceFilter;


{$R *.dfm}

var
  //frmENDistanceShow : TfrmENDistanceShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENDistanceHeaders: array [1..2] of String =
        ( 'Код'
          ,'відстань (км)'
        );
   

procedure TfrmENDistanceShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENDistanceShow:=nil;
    inherited;
  end;


procedure TfrmENDistanceShow.FormShow(Sender: TObject);
var
  TempENDistance: ENDistanceControllerSoapPort;
  i: Integer;
  ENDistanceList: ENDistanceShortList;
  begin
  SetGridHeaders(ENDistanceHeaders, sgENDistance.ColumnHeaders);
  ColCount:=100;
  TempENDistance :=  HTTPRIOENDistance as ENDistanceControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENDistanceFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENDistanceList := TempENDistance.getScrollableFilteredList(ENDistanceFilter(FilterObject),0,ColCount);


  LastCount:=High(ENDistanceList.list);

  if LastCount > -1 then
     sgENDistance.RowCount:=LastCount+2
  else
     sgENDistance.RowCount:=2;

   with sgENDistance do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENDistanceList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENDistanceList.list[i].code)
        else
        Cells[0,i+1] := '';
        if ENDistanceList.list[i].distance = nil then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := ENDistanceList.list[i].distance.DecimalString;
        LastRow:=i+1;
        sgENDistance.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENDistance.Row:=1;
end;

procedure TfrmENDistanceShow.sgENDistanceTopLeftChanged(Sender: TObject);
var
  TempENDistance: ENDistanceControllerSoapPort;
  i,CurrentRow: Integer;
  ENDistanceList: ENDistanceShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENDistance.TopRow + sgENDistance.VisibleRowCount) = ColCount
  then
    begin
      TempENDistance :=  HTTPRIOENDistance as ENDistanceControllerSoapPort;
      CurrentRow:=sgENDistance.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENDistanceFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENDistanceList := TempENDistance.getScrollableFilteredList(ENDistanceFilter(FilterObject),ColCount-1, 100);



  sgENDistance.RowCount:=sgENDistance.RowCount+100;
  LastCount:=High(ENDistanceList.list);
  with sgENDistance do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENDistanceList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENDistanceList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        if ENDistanceList.list[i].distance = nil then
          Cells[1,i+CurrentRow] := ''
        else
          Cells[1,i+CurrentRow] := ENDistanceList.list[i].distance.DecimalString;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENDistance.Row:=CurrentRow-5;
   sgENDistance.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENDistanceShow.sgENDistanceDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENDistance,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENDistanceShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENDistance.RowCount-1 do
   for j:=0 to sgENDistance.ColCount-1 do
     sgENDistance.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENDistanceShow.actViewExecute(Sender: TObject);
Var TempENDistance: ENDistanceControllerSoapPort;
begin
 TempENDistance := HTTPRIOENDistance as ENDistanceControllerSoapPort;
   try
     ENDistanceObj := TempENDistance.getObject(StrToInt(sgENDistance.Cells[0,sgENDistance.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENDistanceEdit:=TfrmENDistanceEdit.Create(Application, dsView);
  try
    frmENDistanceEdit.ShowModal;
  finally
    frmENDistanceEdit.Free;
    frmENDistanceEdit:=nil;
  end;
end;

procedure TfrmENDistanceShow.actEditExecute(Sender: TObject);
Var TempENDistance: ENDistanceControllerSoapPort;
begin
 TempENDistance := HTTPRIOENDistance as ENDistanceControllerSoapPort;
   try
     ENDistanceObj := TempENDistance.getObject(StrToInt(sgENDistance.Cells[0,sgENDistance.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENDistanceEdit:=TfrmENDistanceEdit.Create(Application, dsEdit);
  try
    if frmENDistanceEdit.ShowModal= mrOk then
      begin
        //TempENDistance.save(ENDistanceObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENDistanceEdit.Free;
    frmENDistanceEdit:=nil;
  end;
end;

procedure TfrmENDistanceShow.actDeleteExecute(Sender: TObject);
Var TempENDistance: ENDistanceControllerSoapPort;
  ObjCode: Integer;
begin
 TempENDistance := HTTPRIOENDistance as ENDistanceControllerSoapPort;
   try
     ObjCode := StrToInt(sgENDistance.Cells[0,sgENDistance.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Відстані) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENDistance.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENDistanceShow.actInsertExecute(Sender: TObject);
Var TempENDistance: ENDistanceControllerSoapPort;
begin
  TempENDistance := HTTPRIOENDistance as ENDistanceControllerSoapPort;
  ENDistanceObj:=ENDistance.Create;

   ENDistanceObj.distance:= TXSDecimal.Create;


  try
    frmENDistanceEdit:=TfrmENDistanceEdit.Create(Application, dsInsert);
    try
      if frmENDistanceEdit.ShowModal = mrOk then
      begin
        if ENDistanceObj<>nil then
            //TempENDistance.add(ENDistanceObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENDistanceEdit.Free;
      frmENDistanceEdit:=nil;
    end;
  finally
    ENDistanceObj.Free;
  end;
end;

procedure TfrmENDistanceShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENDistanceShow.actFilterExecute(Sender: TObject);
begin
{frmENDistanceFilterEdit:=TfrmENDistanceFilterEdit.Create(Application, dsEdit);
  try
    ENDistanceFilterObj := ENDistanceFilter.Create;
    SetNullIntProps(ENDistanceFilterObj);
    SetNullXSProps(ENDistanceFilterObj);

    if frmENDistanceFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENDistanceFilter.Create;
      FilterObject := ENDistanceFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENDistanceFilterEdit.Free;
    frmENDistanceFilterEdit:=nil;
  end;}
end;

procedure TfrmENDistanceShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.