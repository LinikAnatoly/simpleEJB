
unit ShowENSafetyPrecautions;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENSafetyPrecautionsController ;


type
  TfrmENSafetyPrecautionsShow = class(TChildForm)  
  HTTPRIOENSafetyPrecautions: THTTPRIO;
    ImageList1: TImageList;
    sgENSafetyPrecautions: TAdvStringGrid;
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
procedure sgENSafetyPrecautionsTopLeftChanged(Sender: TObject);
procedure sgENSafetyPrecautionsDblClick(Sender: TObject);
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
 // ENSafetyPrecautionsObj: ENSafetyPrecautions;
 // ENSafetyPrecautionsFilterObj: ENSafetyPrecautionsFilter;
  
  
implementation

uses Main, EditENSafetyPrecautions, EditENSafetyPrecautionsFilter;


{$R *.dfm}

var
  //frmENSafetyPrecautionsShow : TfrmENSafetyPrecautionsShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENSafetyPrecautionsHeaders: array [1..2] of String =
        ( 'Код'
          ,'Оценка соблюдения мер безопасности'
        );
   

procedure TfrmENSafetyPrecautionsShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENSafetyPrecautionsShow:=nil;
    inherited;
  end;


procedure TfrmENSafetyPrecautionsShow.FormShow(Sender: TObject);
var
  TempENSafetyPrecautions: ENSafetyPrecautionsControllerSoapPort;
  i: Integer;
  ENSafetyPrecautionsList: ENSafetyPrecautionsShortList;
  begin
  SetGridHeaders(ENSafetyPrecautionsHeaders, sgENSafetyPrecautions.ColumnHeaders);
  ColCount:=100;
  TempENSafetyPrecautions :=  HTTPRIOENSafetyPrecautions as ENSafetyPrecautionsControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENSafetyPrecautionsFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSafetyPrecautionsList := TempENSafetyPrecautions.getScrollableFilteredList(ENSafetyPrecautionsFilter(FilterObject),0,ColCount);


  LastCount:=High(ENSafetyPrecautionsList.list);

  if LastCount > -1 then
     sgENSafetyPrecautions.RowCount:=LastCount+2
  else
     sgENSafetyPrecautions.RowCount:=2;

   with sgENSafetyPrecautions do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSafetyPrecautionsList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENSafetyPrecautionsList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENSafetyPrecautionsList.list[i].name;
        LastRow:=i+1;
        sgENSafetyPrecautions.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENSafetyPrecautions.Row:=1;
end;

procedure TfrmENSafetyPrecautionsShow.sgENSafetyPrecautionsTopLeftChanged(Sender: TObject);
var
  TempENSafetyPrecautions: ENSafetyPrecautionsControllerSoapPort;
  i,CurrentRow: Integer;
  ENSafetyPrecautionsList: ENSafetyPrecautionsShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENSafetyPrecautions.TopRow + sgENSafetyPrecautions.VisibleRowCount) = ColCount
  then
    begin
      TempENSafetyPrecautions :=  HTTPRIOENSafetyPrecautions as ENSafetyPrecautionsControllerSoapPort;
      CurrentRow:=sgENSafetyPrecautions.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENSafetyPrecautionsFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSafetyPrecautionsList := TempENSafetyPrecautions.getScrollableFilteredList(ENSafetyPrecautionsFilter(FilterObject),ColCount-1, 100);



  sgENSafetyPrecautions.RowCount:=sgENSafetyPrecautions.RowCount+100;
  LastCount:=High(ENSafetyPrecautionsList.list);
  with sgENSafetyPrecautions do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSafetyPrecautionsList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENSafetyPrecautionsList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENSafetyPrecautionsList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENSafetyPrecautions.Row:=CurrentRow-5;
   sgENSafetyPrecautions.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENSafetyPrecautionsShow.sgENSafetyPrecautionsDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENSafetyPrecautions,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENSafetyPrecautionsShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENSafetyPrecautions.RowCount-1 do
   for j:=0 to sgENSafetyPrecautions.ColCount-1 do
     sgENSafetyPrecautions.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENSafetyPrecautionsShow.actViewExecute(Sender: TObject);
Var TempENSafetyPrecautions: ENSafetyPrecautionsControllerSoapPort;
begin
 TempENSafetyPrecautions := HTTPRIOENSafetyPrecautions as ENSafetyPrecautionsControllerSoapPort;
   try
     ENSafetyPrecautionsObj := TempENSafetyPrecautions.getObject(StrToInt(sgENSafetyPrecautions.Cells[0,sgENSafetyPrecautions.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENSafetyPrecautionsEdit:=TfrmENSafetyPrecautionsEdit.Create(Application, dsView);
  try
    frmENSafetyPrecautionsEdit.ShowModal;
  finally
    frmENSafetyPrecautionsEdit.Free;
    frmENSafetyPrecautionsEdit:=nil;
  end;
end;

procedure TfrmENSafetyPrecautionsShow.actEditExecute(Sender: TObject);
Var TempENSafetyPrecautions: ENSafetyPrecautionsControllerSoapPort;
begin
 TempENSafetyPrecautions := HTTPRIOENSafetyPrecautions as ENSafetyPrecautionsControllerSoapPort;
   try
     ENSafetyPrecautionsObj := TempENSafetyPrecautions.getObject(StrToInt(sgENSafetyPrecautions.Cells[0,sgENSafetyPrecautions.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENSafetyPrecautionsEdit:=TfrmENSafetyPrecautionsEdit.Create(Application, dsEdit);
  try
    if frmENSafetyPrecautionsEdit.ShowModal= mrOk then
      begin
        //TempENSafetyPrecautions.save(ENSafetyPrecautionsObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENSafetyPrecautionsEdit.Free;
    frmENSafetyPrecautionsEdit:=nil;
  end;
end;

procedure TfrmENSafetyPrecautionsShow.actDeleteExecute(Sender: TObject);
Var TempENSafetyPrecautions: ENSafetyPrecautionsControllerSoapPort;
  ObjCode: Integer;
begin
 TempENSafetyPrecautions := HTTPRIOENSafetyPrecautions as ENSafetyPrecautionsControllerSoapPort;
   try
     ObjCode := StrToInt(sgENSafetyPrecautions.Cells[0,sgENSafetyPrecautions.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Техника безопасности) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENSafetyPrecautions.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENSafetyPrecautionsShow.actInsertExecute(Sender: TObject);
Var TempENSafetyPrecautions: ENSafetyPrecautionsControllerSoapPort;
begin
  TempENSafetyPrecautions := HTTPRIOENSafetyPrecautions as ENSafetyPrecautionsControllerSoapPort;
  ENSafetyPrecautionsObj:=ENSafetyPrecautions.Create;



  try
    frmENSafetyPrecautionsEdit:=TfrmENSafetyPrecautionsEdit.Create(Application, dsInsert);
    try
      if frmENSafetyPrecautionsEdit.ShowModal = mrOk then
      begin
        if ENSafetyPrecautionsObj<>nil then
            //TempENSafetyPrecautions.add(ENSafetyPrecautionsObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENSafetyPrecautionsEdit.Free;
      frmENSafetyPrecautionsEdit:=nil;
    end;
  finally
    ENSafetyPrecautionsObj.Free;
  end;
end;

procedure TfrmENSafetyPrecautionsShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENSafetyPrecautionsShow.actFilterExecute(Sender: TObject);
begin
{frmENSafetyPrecautionsFilterEdit:=TfrmENSafetyPrecautionsFilterEdit.Create(Application, dsInsert);
  try
    ENSafetyPrecautionsFilterObj := ENSafetyPrecautionsFilter.Create;
    SetNullIntProps(ENSafetyPrecautionsFilterObj);
    SetNullXSProps(ENSafetyPrecautionsFilterObj);

    if frmENSafetyPrecautionsFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENSafetyPrecautionsFilter.Create;
      FilterObject := ENSafetyPrecautionsFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENSafetyPrecautionsFilterEdit.Free;
    frmENSafetyPrecautionsFilterEdit:=nil;
  end;}
end;

procedure TfrmENSafetyPrecautionsShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.