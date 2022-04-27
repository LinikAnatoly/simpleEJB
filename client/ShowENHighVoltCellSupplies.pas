
unit ShowENHighVoltCellSupplies;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENHighVoltCellSuppliesController ;


type
  TfrmENHighVoltCellSuppliesShow = class(TChildForm)  
  HTTPRIOENHighVoltCellSupplies: THTTPRIO;
    ImageList1: TImageList;
    sgENHighVoltCellSupplies: TAdvStringGrid;
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
procedure sgENHighVoltCellSuppliesTopLeftChanged(Sender: TObject);
procedure sgENHighVoltCellSuppliesDblClick(Sender: TObject);
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
 // ENHighVoltCellSuppliesObj: ENHighVoltCellSupplies;
 // ENHighVoltCellSuppliesFilterObj: ENHighVoltCellSuppliesFilter;
  
  
implementation

uses Main, EditENHighVoltCellSupplies, EditENHighVoltCellSuppliesFilter;


{$R *.dfm}

var
  //frmENHighVoltCellSuppliesShow : TfrmENHighVoltCellSuppliesShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENHighVoltCellSuppliesHeaders: array [1..2] of String =
        ( 'Код'
          ,'Характеристика питания ячейки'
        );
   

procedure TfrmENHighVoltCellSuppliesShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENHighVoltCellSuppliesShow:=nil;
    inherited;
  end;


procedure TfrmENHighVoltCellSuppliesShow.FormShow(Sender: TObject);
var
  TempENHighVoltCellSupplies: ENHighVoltCellSuppliesControllerSoapPort;
  i: Integer;
  ENHighVoltCellSuppliesList: ENHighVoltCellSuppliesShortList;
  begin
  SetGridHeaders(ENHighVoltCellSuppliesHeaders, sgENHighVoltCellSupplies.ColumnHeaders);
  ColCount:=100;
  TempENHighVoltCellSupplies :=  HTTPRIOENHighVoltCellSupplies as ENHighVoltCellSuppliesControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENHighVoltCellSuppliesFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENHighVoltCellSuppliesList := TempENHighVoltCellSupplies.getScrollableFilteredList(ENHighVoltCellSuppliesFilter(FilterObject),0,ColCount);


  LastCount:=High(ENHighVoltCellSuppliesList.list);

  if LastCount > -1 then
     sgENHighVoltCellSupplies.RowCount:=LastCount+2
  else
     sgENHighVoltCellSupplies.RowCount:=2;

   with sgENHighVoltCellSupplies do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENHighVoltCellSuppliesList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENHighVoltCellSuppliesList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENHighVoltCellSuppliesList.list[i].name;
        LastRow:=i+1;
        sgENHighVoltCellSupplies.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENHighVoltCellSupplies.Row:=1;
end;

procedure TfrmENHighVoltCellSuppliesShow.sgENHighVoltCellSuppliesTopLeftChanged(Sender: TObject);
var
  TempENHighVoltCellSupplies: ENHighVoltCellSuppliesControllerSoapPort;
  i,CurrentRow: Integer;
  ENHighVoltCellSuppliesList: ENHighVoltCellSuppliesShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENHighVoltCellSupplies.TopRow + sgENHighVoltCellSupplies.VisibleRowCount) = ColCount
  then
    begin
      TempENHighVoltCellSupplies :=  HTTPRIOENHighVoltCellSupplies as ENHighVoltCellSuppliesControllerSoapPort;
      CurrentRow:=sgENHighVoltCellSupplies.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENHighVoltCellSuppliesFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENHighVoltCellSuppliesList := TempENHighVoltCellSupplies.getScrollableFilteredList(ENHighVoltCellSuppliesFilter(FilterObject),ColCount-1, 100);



  sgENHighVoltCellSupplies.RowCount:=sgENHighVoltCellSupplies.RowCount+100;
  LastCount:=High(ENHighVoltCellSuppliesList.list);
  with sgENHighVoltCellSupplies do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENHighVoltCellSuppliesList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENHighVoltCellSuppliesList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENHighVoltCellSuppliesList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENHighVoltCellSupplies.Row:=CurrentRow-5;
   sgENHighVoltCellSupplies.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENHighVoltCellSuppliesShow.sgENHighVoltCellSuppliesDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENHighVoltCellSupplies,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENHighVoltCellSuppliesShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENHighVoltCellSupplies.RowCount-1 do
   for j:=0 to sgENHighVoltCellSupplies.ColCount-1 do
     sgENHighVoltCellSupplies.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENHighVoltCellSuppliesShow.actViewExecute(Sender: TObject);
Var TempENHighVoltCellSupplies: ENHighVoltCellSuppliesControllerSoapPort;
begin
 TempENHighVoltCellSupplies := HTTPRIOENHighVoltCellSupplies as ENHighVoltCellSuppliesControllerSoapPort;
   try
     ENHighVoltCellSuppliesObj := TempENHighVoltCellSupplies.getObject(StrToInt(sgENHighVoltCellSupplies.Cells[0,sgENHighVoltCellSupplies.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENHighVoltCellSuppliesEdit:=TfrmENHighVoltCellSuppliesEdit.Create(Application, dsView);
  try
    frmENHighVoltCellSuppliesEdit.ShowModal;
  finally
    frmENHighVoltCellSuppliesEdit.Free;
    frmENHighVoltCellSuppliesEdit:=nil;
  end;
end;

procedure TfrmENHighVoltCellSuppliesShow.actEditExecute(Sender: TObject);
Var TempENHighVoltCellSupplies: ENHighVoltCellSuppliesControllerSoapPort;
begin
 TempENHighVoltCellSupplies := HTTPRIOENHighVoltCellSupplies as ENHighVoltCellSuppliesControllerSoapPort;
   try
     ENHighVoltCellSuppliesObj := TempENHighVoltCellSupplies.getObject(StrToInt(sgENHighVoltCellSupplies.Cells[0,sgENHighVoltCellSupplies.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENHighVoltCellSuppliesEdit:=TfrmENHighVoltCellSuppliesEdit.Create(Application, dsEdit);
  try
    if frmENHighVoltCellSuppliesEdit.ShowModal= mrOk then
      begin
        //TempENHighVoltCellSupplies.save(ENHighVoltCellSuppliesObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENHighVoltCellSuppliesEdit.Free;
    frmENHighVoltCellSuppliesEdit:=nil;
  end;
end;

procedure TfrmENHighVoltCellSuppliesShow.actDeleteExecute(Sender: TObject);
Var TempENHighVoltCellSupplies: ENHighVoltCellSuppliesControllerSoapPort;
  ObjCode: Integer;
begin
 TempENHighVoltCellSupplies := HTTPRIOENHighVoltCellSupplies as ENHighVoltCellSuppliesControllerSoapPort;
   try
     ObjCode := StrToInt(sgENHighVoltCellSupplies.Cells[0,sgENHighVoltCellSupplies.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Питание высоковольтных ячеек) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENHighVoltCellSupplies.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENHighVoltCellSuppliesShow.actInsertExecute(Sender: TObject);
// Var TempENHighVoltCellSupplies: ENHighVoltCellSuppliesControllerSoapPort; 
begin
  // TempENHighVoltCellSupplies := HTTPRIOENHighVoltCellSupplies as ENHighVoltCellSuppliesControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENHighVoltCellSuppliesObj:=ENHighVoltCellSupplies.Create;



  try
    frmENHighVoltCellSuppliesEdit:=TfrmENHighVoltCellSuppliesEdit.Create(Application, dsInsert);
    try
      if frmENHighVoltCellSuppliesEdit.ShowModal = mrOk then
      begin
        if ENHighVoltCellSuppliesObj<>nil then
            //TempENHighVoltCellSupplies.add(ENHighVoltCellSuppliesObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENHighVoltCellSuppliesEdit.Free;
      frmENHighVoltCellSuppliesEdit:=nil;
    end;
  finally
    ENHighVoltCellSuppliesObj.Free;
  end;
end;

procedure TfrmENHighVoltCellSuppliesShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENHighVoltCellSuppliesShow.actFilterExecute(Sender: TObject);
begin
{frmENHighVoltCellSuppliesFilterEdit:=TfrmENHighVoltCellSuppliesFilterEdit.Create(Application, dsInsert);
  try
    ENHighVoltCellSuppliesFilterObj := ENHighVoltCellSuppliesFilter.Create;
    SetNullIntProps(ENHighVoltCellSuppliesFilterObj);
    SetNullXSProps(ENHighVoltCellSuppliesFilterObj);

    if frmENHighVoltCellSuppliesFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENHighVoltCellSuppliesFilter.Create;
      FilterObject := ENHighVoltCellSuppliesFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENHighVoltCellSuppliesFilterEdit.Free;
    frmENHighVoltCellSuppliesFilterEdit:=nil;
  end;}
end;

procedure TfrmENHighVoltCellSuppliesShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.