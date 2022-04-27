
unit ShowENStand;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENStandController, AdvObj ;


type
  TfrmENStandShow = class(TChildForm)  
  HTTPRIOENStand: THTTPRIO;
    ImageList1: TImageList;
    sgENStand: TAdvStringGrid;
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
procedure sgENStandTopLeftChanged(Sender: TObject);
procedure sgENStandDblClick(Sender: TObject);
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
 frmENStandShow : TfrmENStandShow;
 // ENStandObj: ENStand;
 // ENStandFilterObj: ENStandFilter;
  
  
implementation

uses Main, EditENStand, EditENStandFilter;


{$R *.dfm}

var
  //frmENStandShow : TfrmENStandShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENStandHeaders: array [1..2] of String =
        ( 'Код'
          ,'Стойка опори'
        );
   

procedure TfrmENStandShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENStandShow:=nil;
    inherited;
  end;


procedure TfrmENStandShow.FormShow(Sender: TObject);
var
  TempENStand: ENStandControllerSoapPort;
  i: Integer;
  ENStandList: ENStandShortList;
  begin
  SetGridHeaders(ENStandHeaders, sgENStand.ColumnHeaders);
  ColCount:=100;
  TempENStand :=  HTTPRIOENStand as ENStandControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENStandFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENStandList := TempENStand.getScrollableFilteredList(ENStandFilter(FilterObject),0,ColCount);


  LastCount:=High(ENStandList.list);

  if LastCount > -1 then
     sgENStand.RowCount:=LastCount+2
  else
     sgENStand.RowCount:=2;

   with sgENStand do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENStandList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENStandList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENStandList.list[i].name;
        LastRow:=i+1;
        sgENStand.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENStand.Row:=1;
end;

procedure TfrmENStandShow.sgENStandTopLeftChanged(Sender: TObject);
var
  TempENStand: ENStandControllerSoapPort;
  i,CurrentRow: Integer;
  ENStandList: ENStandShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENStand.TopRow + sgENStand.VisibleRowCount) = ColCount
  then
    begin
      TempENStand :=  HTTPRIOENStand as ENStandControllerSoapPort;
      CurrentRow:=sgENStand.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENStandFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENStandList := TempENStand.getScrollableFilteredList(ENStandFilter(FilterObject),ColCount-1, 100);



  sgENStand.RowCount:=sgENStand.RowCount+100;
  LastCount:=High(ENStandList.list);
  with sgENStand do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENStandList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENStandList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENStandList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENStand.Row:=CurrentRow-5;
   sgENStand.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENStandShow.sgENStandDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENStand,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENStandShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENStand.RowCount-1 do
   for j:=0 to sgENStand.ColCount-1 do
     sgENStand.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENStandShow.actViewExecute(Sender: TObject);
Var TempENStand: ENStandControllerSoapPort;
begin
 TempENStand := HTTPRIOENStand as ENStandControllerSoapPort;
   try
     ENStandObj := TempENStand.getObject(StrToInt(sgENStand.Cells[0,sgENStand.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENStandEdit:=TfrmENStandEdit.Create(Application, dsView);
  try
    frmENStandEdit.ShowModal;
  finally
    frmENStandEdit.Free;
    frmENStandEdit:=nil;
  end;
end;

procedure TfrmENStandShow.actEditExecute(Sender: TObject);
Var TempENStand: ENStandControllerSoapPort;
begin
 TempENStand := HTTPRIOENStand as ENStandControllerSoapPort;
   try
     ENStandObj := TempENStand.getObject(StrToInt(sgENStand.Cells[0,sgENStand.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENStandEdit:=TfrmENStandEdit.Create(Application, dsEdit);
  try
    if frmENStandEdit.ShowModal= mrOk then
      begin
        //TempENStand.save(ENStandObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENStandEdit.Free;
    frmENStandEdit:=nil;
  end;
end;

procedure TfrmENStandShow.actDeleteExecute(Sender: TObject);
Var TempENStand: ENStandControllerSoapPort;
  ObjCode: Integer;
begin
 TempENStand := HTTPRIOENStand as ENStandControllerSoapPort;
   try
     ObjCode := StrToInt(sgENStand.Cells[0,sgENStand.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Стойки опор) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENStand.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENStandShow.actInsertExecute(Sender: TObject);
// Var TempENStand: ENStandControllerSoapPort; 
begin
  // TempENStand := HTTPRIOENStand as ENStandControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENStandObj:=ENStand.Create;



  try
    frmENStandEdit:=TfrmENStandEdit.Create(Application, dsInsert);
    try
      if frmENStandEdit.ShowModal = mrOk then
      begin
        if ENStandObj<>nil then
            //TempENStand.add(ENStandObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENStandEdit.Free;
      frmENStandEdit:=nil;
    end;
  finally
    ENStandObj.Free;
  end;
end;

procedure TfrmENStandShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENStandShow.actFilterExecute(Sender: TObject);
begin
{frmENStandFilterEdit:=TfrmENStandFilterEdit.Create(Application, dsInsert);
  try
    ENStandFilterObj := ENStandFilter.Create;
    SetNullIntProps(ENStandFilterObj);
    SetNullXSProps(ENStandFilterObj);

    if frmENStandFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENStandFilter.Create;
      FilterObject := ENStandFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENStandFilterEdit.Free;
    frmENStandFilterEdit:=nil;
  end;}
end;

procedure TfrmENStandShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.