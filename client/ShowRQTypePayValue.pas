
unit ShowRQTypePayValue;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  RQTypePayValueController, AdvObj ;


type
  TfrmRQTypePayValueShow = class(TChildForm)  
  HTTPRIORQTypePayValue: THTTPRIO;
    ImageList1: TImageList;
    sgRQTypePayValue: TAdvStringGrid;
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
procedure sgRQTypePayValueTopLeftChanged(Sender: TObject);
procedure sgRQTypePayValueDblClick(Sender: TObject);
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
 frmRQTypePayValueShow : TfrmRQTypePayValueShow;
 // RQTypePayValueObj: RQTypePayValue;
 // RQTypePayValueFilterObj: RQTypePayValueFilter;
  
  
implementation

uses Main, EditRQTypePayValue, EditRQTypePayValueFilter;


{$R *.dfm}

var
  //frmRQTypePayValueShow : TfrmRQTypePayValueShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  RQTypePayValueHeaders: array [1..2] of String =
        ( 'Код'
          ,'Значение'
        );
   

procedure TfrmRQTypePayValueShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmRQTypePayValueShow:=nil;
    inherited;
  end;


procedure TfrmRQTypePayValueShow.FormShow(Sender: TObject);
var
  TempRQTypePayValue: RQTypePayValueControllerSoapPort;
  i: Integer;
  RQTypePayValueList: RQTypePayValueShortList;
  begin
  SetGridHeaders(RQTypePayValueHeaders, sgRQTypePayValue.ColumnHeaders);
  ColCount:=100;
  TempRQTypePayValue :=  HTTPRIORQTypePayValue as RQTypePayValueControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := RQTypePayValueFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQTypePayValueList := TempRQTypePayValue.getScrollableFilteredList(RQTypePayValueFilter(FilterObject),0,ColCount);


  LastCount:=High(RQTypePayValueList.list);

  if LastCount > -1 then
     sgRQTypePayValue.RowCount:=LastCount+2
  else
     sgRQTypePayValue.RowCount:=2;

   with sgRQTypePayValue do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQTypePayValueList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQTypePayValueList.list[i].code)
        else
        Cells[0,i+1] := '';
        if RQTypePayValueList.list[i].value = Low(Integer) then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := IntToStr(RQTypePayValueList.list[i].value);
        LastRow:=i+1;
        sgRQTypePayValue.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgRQTypePayValue.Row:=1;
end;

procedure TfrmRQTypePayValueShow.sgRQTypePayValueTopLeftChanged(Sender: TObject);
var
  TempRQTypePayValue: RQTypePayValueControllerSoapPort;
  i,CurrentRow: Integer;
  RQTypePayValueList: RQTypePayValueShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgRQTypePayValue.TopRow + sgRQTypePayValue.VisibleRowCount) = ColCount
  then
    begin
      TempRQTypePayValue :=  HTTPRIORQTypePayValue as RQTypePayValueControllerSoapPort;
      CurrentRow:=sgRQTypePayValue.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := RQTypePayValueFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQTypePayValueList := TempRQTypePayValue.getScrollableFilteredList(RQTypePayValueFilter(FilterObject),ColCount-1, 100);



  sgRQTypePayValue.RowCount:=sgRQTypePayValue.RowCount+100;
  LastCount:=High(RQTypePayValueList.list);
  with sgRQTypePayValue do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQTypePayValueList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(RQTypePayValueList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        if RQTypePayValueList.list[i].value = Low(Integer) then
          Cells[1,i+CurrentRow] := ''
        else
          Cells[1,i+CurrentRow] := IntToStr(RQTypePayValueList.list[i].value);
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgRQTypePayValue.Row:=CurrentRow-5;
   sgRQTypePayValue.RowCount:=LastRow+1;
  end;
end;

procedure TfrmRQTypePayValueShow.sgRQTypePayValueDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgRQTypePayValue,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmRQTypePayValueShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgRQTypePayValue.RowCount-1 do
   for j:=0 to sgRQTypePayValue.ColCount-1 do
     sgRQTypePayValue.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmRQTypePayValueShow.actViewExecute(Sender: TObject);
Var TempRQTypePayValue: RQTypePayValueControllerSoapPort;
begin
 TempRQTypePayValue := HTTPRIORQTypePayValue as RQTypePayValueControllerSoapPort;
   try
     RQTypePayValueObj := TempRQTypePayValue.getObject(StrToInt(sgRQTypePayValue.Cells[0,sgRQTypePayValue.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQTypePayValueEdit:=TfrmRQTypePayValueEdit.Create(Application, dsView);
  try
    frmRQTypePayValueEdit.ShowModal;
  finally
    frmRQTypePayValueEdit.Free;
    frmRQTypePayValueEdit:=nil;
  end;
end;

procedure TfrmRQTypePayValueShow.actEditExecute(Sender: TObject);
Var TempRQTypePayValue: RQTypePayValueControllerSoapPort;
begin
 TempRQTypePayValue := HTTPRIORQTypePayValue as RQTypePayValueControllerSoapPort;
   try
     RQTypePayValueObj := TempRQTypePayValue.getObject(StrToInt(sgRQTypePayValue.Cells[0,sgRQTypePayValue.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQTypePayValueEdit:=TfrmRQTypePayValueEdit.Create(Application, dsEdit);
  try
    if frmRQTypePayValueEdit.ShowModal= mrOk then
      begin
        //TempRQTypePayValue.save(RQTypePayValueObj);
        UpdateGrid(Sender);
      end;
  finally
    frmRQTypePayValueEdit.Free;
    frmRQTypePayValueEdit:=nil;
  end;
end;

procedure TfrmRQTypePayValueShow.actDeleteExecute(Sender: TObject);
Var TempRQTypePayValue: RQTypePayValueControllerSoapPort;
  ObjCode: Integer;
begin
 TempRQTypePayValue := HTTPRIORQTypePayValue as RQTypePayValueControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQTypePayValue.Cells[0,sgRQTypePayValue.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Спарвочник значений по видам оплат) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQTypePayValue.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmRQTypePayValueShow.actInsertExecute(Sender: TObject);
// Var TempRQTypePayValue: RQTypePayValueControllerSoapPort; 
begin
  // TempRQTypePayValue := HTTPRIORQTypePayValue as RQTypePayValueControllerSoapPort;  /// Это здесь уже лишнее!!!
  RQTypePayValueObj:=RQTypePayValue.Create;



  try
    frmRQTypePayValueEdit:=TfrmRQTypePayValueEdit.Create(Application, dsInsert);
    try
      if frmRQTypePayValueEdit.ShowModal = mrOk then
      begin
        if RQTypePayValueObj<>nil then
            //TempRQTypePayValue.add(RQTypePayValueObj);
            UpdateGrid(Sender);
      end;
    finally
      frmRQTypePayValueEdit.Free;
      frmRQTypePayValueEdit:=nil;
    end;
  finally
    RQTypePayValueObj.Free;
  end;
end;

procedure TfrmRQTypePayValueShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmRQTypePayValueShow.actFilterExecute(Sender: TObject);
begin
{frmRQTypePayValueFilterEdit:=TfrmRQTypePayValueFilterEdit.Create(Application, dsInsert);
  try
    RQTypePayValueFilterObj := RQTypePayValueFilter.Create;
    SetNullIntProps(RQTypePayValueFilterObj);
    SetNullXSProps(RQTypePayValueFilterObj);

    if frmRQTypePayValueFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := RQTypePayValueFilter.Create;
      FilterObject := RQTypePayValueFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmRQTypePayValueFilterEdit.Free;
    frmRQTypePayValueFilterEdit:=nil;
  end;}
end;

procedure TfrmRQTypePayValueShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.