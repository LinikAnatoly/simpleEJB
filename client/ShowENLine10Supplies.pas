
unit ShowENLine10Supplies;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENLine10SuppliesController ;


type
  TfrmENLine10SuppliesShow = class(TChildForm)  
  HTTPRIOENLine10Supplies: THTTPRIO;
    ImageList1: TImageList;
    sgENLine10Supplies: TAdvStringGrid;
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
procedure sgENLine10SuppliesTopLeftChanged(Sender: TObject);
procedure sgENLine10SuppliesDblClick(Sender: TObject);
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
 // ENLine10SuppliesObj: ENLine10Supplies;
 // ENLine10SuppliesFilterObj: ENLine10SuppliesFilter;
  
  
implementation

uses Main, EditENLine10Supplies, EditENLine10SuppliesFilter;


{$R *.dfm}

var
  //frmENLine10SuppliesShow : TfrmENLine10SuppliesShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENLine10SuppliesHeaders: array [1..2] of String =
        ( 'Код'
          ,'Назва живлення ПЛ 6-10 кВ'
        );
   

procedure TfrmENLine10SuppliesShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENLine10SuppliesShow:=nil;
    inherited;
  end;


procedure TfrmENLine10SuppliesShow.FormShow(Sender: TObject);
var
  TempENLine10Supplies: ENLine10SuppliesControllerSoapPort;
  i: Integer;
  ENLine10SuppliesList: ENLine10SuppliesShortList;
  begin
  SetGridHeaders(ENLine10SuppliesHeaders, sgENLine10Supplies.ColumnHeaders);
  ColCount:=100;
  TempENLine10Supplies :=  HTTPRIOENLine10Supplies as ENLine10SuppliesControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENLine10SuppliesFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENLine10SuppliesList := TempENLine10Supplies.getScrollableFilteredList(ENLine10SuppliesFilter(FilterObject),0,ColCount);


  LastCount:=High(ENLine10SuppliesList.list);

  if LastCount > -1 then
     sgENLine10Supplies.RowCount:=LastCount+2
  else
     sgENLine10Supplies.RowCount:=2;

   with sgENLine10Supplies do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENLine10SuppliesList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENLine10SuppliesList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENLine10SuppliesList.list[i].name;
        LastRow:=i+1;
        sgENLine10Supplies.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENLine10Supplies.Row:=1;
end;

procedure TfrmENLine10SuppliesShow.sgENLine10SuppliesTopLeftChanged(Sender: TObject);
var
  TempENLine10Supplies: ENLine10SuppliesControllerSoapPort;
  i,CurrentRow: Integer;
  ENLine10SuppliesList: ENLine10SuppliesShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENLine10Supplies.TopRow + sgENLine10Supplies.VisibleRowCount) = ColCount
  then
    begin
      TempENLine10Supplies :=  HTTPRIOENLine10Supplies as ENLine10SuppliesControllerSoapPort;
      CurrentRow:=sgENLine10Supplies.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENLine10SuppliesFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENLine10SuppliesList := TempENLine10Supplies.getScrollableFilteredList(ENLine10SuppliesFilter(FilterObject),ColCount-1, 100);



  sgENLine10Supplies.RowCount:=sgENLine10Supplies.RowCount+100;
  LastCount:=High(ENLine10SuppliesList.list);
  with sgENLine10Supplies do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENLine10SuppliesList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENLine10SuppliesList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENLine10SuppliesList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENLine10Supplies.Row:=CurrentRow-5;
   sgENLine10Supplies.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENLine10SuppliesShow.sgENLine10SuppliesDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENLine10Supplies,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENLine10SuppliesShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENLine10Supplies.RowCount-1 do
   for j:=0 to sgENLine10Supplies.ColCount-1 do
     sgENLine10Supplies.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENLine10SuppliesShow.actViewExecute(Sender: TObject);
Var TempENLine10Supplies: ENLine10SuppliesControllerSoapPort;
begin
 TempENLine10Supplies := HTTPRIOENLine10Supplies as ENLine10SuppliesControllerSoapPort;
   try
     ENLine10SuppliesObj := TempENLine10Supplies.getObject(StrToInt(sgENLine10Supplies.Cells[0,sgENLine10Supplies.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENLine10SuppliesEdit:=TfrmENLine10SuppliesEdit.Create(Application, dsView);
  try
    frmENLine10SuppliesEdit.ShowModal;
  finally
    frmENLine10SuppliesEdit.Free;
    frmENLine10SuppliesEdit:=nil;
  end;
end;

procedure TfrmENLine10SuppliesShow.actEditExecute(Sender: TObject);
Var TempENLine10Supplies: ENLine10SuppliesControllerSoapPort;
begin
 TempENLine10Supplies := HTTPRIOENLine10Supplies as ENLine10SuppliesControllerSoapPort;
   try
     ENLine10SuppliesObj := TempENLine10Supplies.getObject(StrToInt(sgENLine10Supplies.Cells[0,sgENLine10Supplies.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENLine10SuppliesEdit:=TfrmENLine10SuppliesEdit.Create(Application, dsEdit);
  try
    if frmENLine10SuppliesEdit.ShowModal= mrOk then
      begin
        //TempENLine10Supplies.save(ENLine10SuppliesObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENLine10SuppliesEdit.Free;
    frmENLine10SuppliesEdit:=nil;
  end;
end;

procedure TfrmENLine10SuppliesShow.actDeleteExecute(Sender: TObject);
Var TempENLine10Supplies: ENLine10SuppliesControllerSoapPort;
  ObjCode: Integer;
begin
 TempENLine10Supplies := HTTPRIOENLine10Supplies as ENLine10SuppliesControllerSoapPort;
   try
     ObjCode := StrToInt(sgENLine10Supplies.Cells[0,sgENLine10Supplies.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Живлення повітряних ліній 6-10 кВ) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENLine10Supplies.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENLine10SuppliesShow.actInsertExecute(Sender: TObject);
// Var TempENLine10Supplies: ENLine10SuppliesControllerSoapPort; 
begin
  // TempENLine10Supplies := HTTPRIOENLine10Supplies as ENLine10SuppliesControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENLine10SuppliesObj:=ENLine10Supplies.Create;



  try
    frmENLine10SuppliesEdit:=TfrmENLine10SuppliesEdit.Create(Application, dsInsert);
    try
      if frmENLine10SuppliesEdit.ShowModal = mrOk then
      begin
        if ENLine10SuppliesObj<>nil then
            //TempENLine10Supplies.add(ENLine10SuppliesObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENLine10SuppliesEdit.Free;
      frmENLine10SuppliesEdit:=nil;
    end;
  finally
    ENLine10SuppliesObj.Free;
  end;
end;

procedure TfrmENLine10SuppliesShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENLine10SuppliesShow.actFilterExecute(Sender: TObject);
begin
{frmENLine10SuppliesFilterEdit:=TfrmENLine10SuppliesFilterEdit.Create(Application, dsInsert);
  try
    ENLine10SuppliesFilterObj := ENLine10SuppliesFilter.Create;
    SetNullIntProps(ENLine10SuppliesFilterObj);
    SetNullXSProps(ENLine10SuppliesFilterObj);

    if frmENLine10SuppliesFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENLine10SuppliesFilter.Create;
      FilterObject := ENLine10SuppliesFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENLine10SuppliesFilterEdit.Free;
    frmENLine10SuppliesFilterEdit:=nil;
  end;}
end;

procedure TfrmENLine10SuppliesShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.