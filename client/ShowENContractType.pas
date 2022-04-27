
unit ShowENContractType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENContractTypeController ;


type
  TfrmENContractTypeShow = class(TChildForm)  
  HTTPRIOENContractType: THTTPRIO;
    ImageList1: TImageList;
    sgENContractType: TAdvStringGrid;
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
procedure sgENContractTypeTopLeftChanged(Sender: TObject);
procedure sgENContractTypeDblClick(Sender: TObject);
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
 // ENContractTypeObj: ENContractType;
 // ENContractTypeFilterObj: ENContractTypeFilter;
  
  
implementation

uses Main, EditENContractType, EditENContractTypeFilter;


{$R *.dfm}

var
  //frmENContractTypeShow : TfrmENContractTypeShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENContractTypeHeaders: array [1..2] of String =
        ( 'Код'
          ,'Тип договора'
        );
   

procedure TfrmENContractTypeShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENContractTypeShow:=nil;
    inherited;
  end;


procedure TfrmENContractTypeShow.FormShow(Sender: TObject);
var
  TempENContractType: ENContractTypeControllerSoapPort;
  i: Integer;
  ENContractTypeList: ENContractTypeShortList;
  begin
  SetGridHeaders(ENContractTypeHeaders, sgENContractType.ColumnHeaders);
  ColCount:=100;
  TempENContractType :=  HTTPRIOENContractType as ENContractTypeControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENContractTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENContractTypeList := TempENContractType.getScrollableFilteredList(ENContractTypeFilter(FilterObject),0,ColCount);


  LastCount:=High(ENContractTypeList.list);

  if LastCount > -1 then
     sgENContractType.RowCount:=LastCount+2
  else
     sgENContractType.RowCount:=2;

   with sgENContractType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENContractTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENContractTypeList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENContractTypeList.list[i].name;
        LastRow:=i+1;
        sgENContractType.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENContractType.Row:=1;
end;

procedure TfrmENContractTypeShow.sgENContractTypeTopLeftChanged(Sender: TObject);
var
  TempENContractType: ENContractTypeControllerSoapPort;
  i,CurrentRow: Integer;
  ENContractTypeList: ENContractTypeShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENContractType.TopRow + sgENContractType.VisibleRowCount) = ColCount
  then
    begin
      TempENContractType :=  HTTPRIOENContractType as ENContractTypeControllerSoapPort;
      CurrentRow:=sgENContractType.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENContractTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENContractTypeList := TempENContractType.getScrollableFilteredList(ENContractTypeFilter(FilterObject),ColCount-1, 100);



  sgENContractType.RowCount:=sgENContractType.RowCount+100;
  LastCount:=High(ENContractTypeList.list);
  with sgENContractType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENContractTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENContractTypeList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENContractTypeList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENContractType.Row:=CurrentRow-5;
   sgENContractType.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENContractTypeShow.sgENContractTypeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENContractType,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENContractTypeShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENContractType.RowCount-1 do
   for j:=0 to sgENContractType.ColCount-1 do
     sgENContractType.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENContractTypeShow.actViewExecute(Sender: TObject);
Var TempENContractType: ENContractTypeControllerSoapPort;
begin
 TempENContractType := HTTPRIOENContractType as ENContractTypeControllerSoapPort;
   try
     ENContractTypeObj := TempENContractType.getObject(StrToInt(sgENContractType.Cells[0,sgENContractType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENContractTypeEdit:=TfrmENContractTypeEdit.Create(Application, dsView);
  try
    frmENContractTypeEdit.ShowModal;
  finally
    frmENContractTypeEdit.Free;
    frmENContractTypeEdit:=nil;
  end;
end;

procedure TfrmENContractTypeShow.actEditExecute(Sender: TObject);
Var TempENContractType: ENContractTypeControllerSoapPort;
begin
 TempENContractType := HTTPRIOENContractType as ENContractTypeControllerSoapPort;
   try
     ENContractTypeObj := TempENContractType.getObject(StrToInt(sgENContractType.Cells[0,sgENContractType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENContractTypeEdit:=TfrmENContractTypeEdit.Create(Application, dsEdit);
  try
    if frmENContractTypeEdit.ShowModal= mrOk then
      begin
        //TempENContractType.save(ENContractTypeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENContractTypeEdit.Free;
    frmENContractTypeEdit:=nil;
  end;
end;

procedure TfrmENContractTypeShow.actDeleteExecute(Sender: TObject);
Var TempENContractType: ENContractTypeControllerSoapPort;
  ObjCode: Integer;
begin
 TempENContractType := HTTPRIOENContractType as ENContractTypeControllerSoapPort;
   try
     ObjCode := StrToInt(sgENContractType.Cells[0,sgENContractType.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Тип договора(договор или проект договора)) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENContractType.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENContractTypeShow.actInsertExecute(Sender: TObject);
// Var TempENContractType: ENContractTypeControllerSoapPort; 
begin
  // TempENContractType := HTTPRIOENContractType as ENContractTypeControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENContractTypeObj:=ENContractType.Create;



  try
    frmENContractTypeEdit:=TfrmENContractTypeEdit.Create(Application, dsInsert);
    try
      if frmENContractTypeEdit.ShowModal = mrOk then
      begin
        if ENContractTypeObj<>nil then
            //TempENContractType.add(ENContractTypeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENContractTypeEdit.Free;
      frmENContractTypeEdit:=nil;
    end;
  finally
    ENContractTypeObj.Free;
  end;
end;

procedure TfrmENContractTypeShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENContractTypeShow.actFilterExecute(Sender: TObject);
begin
{frmENContractTypeFilterEdit:=TfrmENContractTypeFilterEdit.Create(Application, dsInsert);
  try
    ENContractTypeFilterObj := ENContractTypeFilter.Create;
    SetNullIntProps(ENContractTypeFilterObj);
    SetNullXSProps(ENContractTypeFilterObj);

    if frmENContractTypeFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENContractTypeFilter.Create;
      FilterObject := ENContractTypeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENContractTypeFilterEdit.Free;
    frmENContractTypeFilterEdit:=nil;
  end;}
end;

procedure TfrmENContractTypeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.