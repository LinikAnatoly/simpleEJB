
unit ShowENAntsapfPosition;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENAntsapfPositionController ;


type
  TfrmENAntsapfPositionShow = class(TChildForm)  
  HTTPRIOENAntsapfPosition: THTTPRIO;
    ImageList1: TImageList;
    sgENAntsapfPosition: TAdvStringGrid;
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
procedure sgENAntsapfPositionTopLeftChanged(Sender: TObject);
procedure sgENAntsapfPositionDblClick(Sender: TObject);
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
 // ENAntsapfPositionObj: ENAntsapfPosition;
 // ENAntsapfPositionFilterObj: ENAntsapfPositionFilter;
  
  
implementation

uses Main, EditENAntsapfPosition, EditENAntsapfPositionFilter;


{$R *.dfm}

var
  //frmENAntsapfPositionShow : TfrmENAntsapfPositionShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENAntsapfPositionHeaders: array [1..2] of String =
        ( 'Код'
          ,'Положення перемикача анцапфи'
        );
   

procedure TfrmENAntsapfPositionShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENAntsapfPositionShow:=nil;
    inherited;
  end;


procedure TfrmENAntsapfPositionShow.FormShow(Sender: TObject);
var
  TempENAntsapfPosition: ENAntsapfPositionControllerSoapPort;
  i: Integer;
  ENAntsapfPositionList: ENAntsapfPositionShortList;
  begin
  SetGridHeaders(ENAntsapfPositionHeaders, sgENAntsapfPosition.ColumnHeaders);
  ColCount:=100;
  TempENAntsapfPosition :=  HTTPRIOENAntsapfPosition as ENAntsapfPositionControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENAntsapfPositionFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENAntsapfPositionList := TempENAntsapfPosition.getScrollableFilteredList(ENAntsapfPositionFilter(FilterObject),0,ColCount);


  LastCount:=High(ENAntsapfPositionList.list);

  if LastCount > -1 then
     sgENAntsapfPosition.RowCount:=LastCount+2
  else
     sgENAntsapfPosition.RowCount:=2;

   with sgENAntsapfPosition do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENAntsapfPositionList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENAntsapfPositionList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENAntsapfPositionList.list[i].name;
        LastRow:=i+1;
        sgENAntsapfPosition.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENAntsapfPosition.Row:=1;
end;

procedure TfrmENAntsapfPositionShow.sgENAntsapfPositionTopLeftChanged(Sender: TObject);
var
  TempENAntsapfPosition: ENAntsapfPositionControllerSoapPort;
  i,CurrentRow: Integer;
  ENAntsapfPositionList: ENAntsapfPositionShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENAntsapfPosition.TopRow + sgENAntsapfPosition.VisibleRowCount) = ColCount
  then
    begin
      TempENAntsapfPosition :=  HTTPRIOENAntsapfPosition as ENAntsapfPositionControllerSoapPort;
      CurrentRow:=sgENAntsapfPosition.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENAntsapfPositionFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENAntsapfPositionList := TempENAntsapfPosition.getScrollableFilteredList(ENAntsapfPositionFilter(FilterObject),ColCount-1, 100);



  sgENAntsapfPosition.RowCount:=sgENAntsapfPosition.RowCount+100;
  LastCount:=High(ENAntsapfPositionList.list);
  with sgENAntsapfPosition do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENAntsapfPositionList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENAntsapfPositionList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENAntsapfPositionList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENAntsapfPosition.Row:=CurrentRow-5;
   sgENAntsapfPosition.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENAntsapfPositionShow.sgENAntsapfPositionDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENAntsapfPosition,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENAntsapfPositionShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENAntsapfPosition.RowCount-1 do
   for j:=0 to sgENAntsapfPosition.ColCount-1 do
     sgENAntsapfPosition.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENAntsapfPositionShow.actViewExecute(Sender: TObject);
Var TempENAntsapfPosition: ENAntsapfPositionControllerSoapPort;
begin
 TempENAntsapfPosition := HTTPRIOENAntsapfPosition as ENAntsapfPositionControllerSoapPort;
   try
     ENAntsapfPositionObj := TempENAntsapfPosition.getObject(StrToInt(sgENAntsapfPosition.Cells[0,sgENAntsapfPosition.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENAntsapfPositionEdit:=TfrmENAntsapfPositionEdit.Create(Application, dsView);
  try
    frmENAntsapfPositionEdit.ShowModal;
  finally
    frmENAntsapfPositionEdit.Free;
    frmENAntsapfPositionEdit:=nil;
  end;
end;

procedure TfrmENAntsapfPositionShow.actEditExecute(Sender: TObject);
Var TempENAntsapfPosition: ENAntsapfPositionControllerSoapPort;
begin
 TempENAntsapfPosition := HTTPRIOENAntsapfPosition as ENAntsapfPositionControllerSoapPort;
   try
     ENAntsapfPositionObj := TempENAntsapfPosition.getObject(StrToInt(sgENAntsapfPosition.Cells[0,sgENAntsapfPosition.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENAntsapfPositionEdit:=TfrmENAntsapfPositionEdit.Create(Application, dsEdit);
  try
    if frmENAntsapfPositionEdit.ShowModal= mrOk then
      begin
        //TempENAntsapfPosition.save(ENAntsapfPositionObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENAntsapfPositionEdit.Free;
    frmENAntsapfPositionEdit:=nil;
  end;
end;

procedure TfrmENAntsapfPositionShow.actDeleteExecute(Sender: TObject);
Var TempENAntsapfPosition: ENAntsapfPositionControllerSoapPort;
  ObjCode: Integer;
begin
 TempENAntsapfPosition := HTTPRIOENAntsapfPosition as ENAntsapfPositionControllerSoapPort;
   try
     ObjCode := StrToInt(sgENAntsapfPosition.Cells[0,sgENAntsapfPosition.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Положення перемикача анцапфи при замірюваннях пофідерного навантаження) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENAntsapfPosition.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENAntsapfPositionShow.actInsertExecute(Sender: TObject);
// Var TempENAntsapfPosition: ENAntsapfPositionControllerSoapPort; 
begin
  // TempENAntsapfPosition := HTTPRIOENAntsapfPosition as ENAntsapfPositionControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENAntsapfPositionObj:=ENAntsapfPosition.Create;



  try
    frmENAntsapfPositionEdit:=TfrmENAntsapfPositionEdit.Create(Application, dsInsert);
    try
      if frmENAntsapfPositionEdit.ShowModal = mrOk then
      begin
        if ENAntsapfPositionObj<>nil then
            //TempENAntsapfPosition.add(ENAntsapfPositionObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENAntsapfPositionEdit.Free;
      frmENAntsapfPositionEdit:=nil;
    end;
  finally
    ENAntsapfPositionObj.Free;
  end;
end;

procedure TfrmENAntsapfPositionShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENAntsapfPositionShow.actFilterExecute(Sender: TObject);
begin
{frmENAntsapfPositionFilterEdit:=TfrmENAntsapfPositionFilterEdit.Create(Application, dsInsert);
  try
    ENAntsapfPositionFilterObj := ENAntsapfPositionFilter.Create;
    SetNullIntProps(ENAntsapfPositionFilterObj);
    SetNullXSProps(ENAntsapfPositionFilterObj);

    if frmENAntsapfPositionFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENAntsapfPositionFilter.Create;
      FilterObject := ENAntsapfPositionFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENAntsapfPositionFilterEdit.Free;
    frmENAntsapfPositionFilterEdit:=nil;
  end;}
end;

procedure TfrmENAntsapfPositionShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.